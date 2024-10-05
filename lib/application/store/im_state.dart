// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:dtim/infra/pages/channel/setting/key_verification_dialog.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix/matrix.dart';
import 'package:matrix/encryption.dart';
import 'package:universal_html/html.dart' as html;

import 'package:dtim/domain/models/models.dart';
import 'package:dtim/router.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/domain/utils/local_notifications_extension.dart';
import 'package:dtim/domain/utils/webrtc/webrtc_tool.dart';
import 'app/app.dart';

// 组织的聊天状态树
class ImState {
  // 用户
  late String id;
  late Account user;
  late AccountOrg org;
  late String currentClientSecret;

  StreamSubscription? onRoomKeyRequestSub;
  StreamSubscription? onKeyVerificationRequestSub;
  StreamSubscription? onLoginStateChanged;
  StreamSubscription? onUiaRequest;
  StreamSubscription? onNotification;
  int? linuxNotificationId;
  final linuxNotifications = PlatformInfos.isLinux ? NotificationsClient() : null;

  // 服务器连接
  late Client client;

  // voip 插件
  WebrtcTool? webrtcTool;

  // 构建函数
  ImState(
    String pid,
    Client pconnection,
    AccountOrg porg,
    Account puser,
  ) {
    id = pid;
    user = puser;
    org = porg;
    client = pconnection;
    _registerSub();
    syncChannel();
    webrtcTool = WebrtcTool(client);
  }

  String? activeRoomId = "";
  String? _cachedPassword;
  Timer? _cachedPasswordClearTimer;
  RequestTokenResponse? currentThreepidCreds;

  String? get cachedPassword => _cachedPassword;

  set cachedPassword(String? p) {
    printDebug('Password cached');
    _cachedPasswordClearTimer?.cancel();
    _cachedPassword = p;
    _cachedPasswordClearTimer = Timer(const Duration(minutes: 10), () {
      _cachedPassword = null;
      printDebug('Cached Password cleared');
    });
  }

  void _registerSub() {
    //获取密钥
    onRoomKeyRequestSub = client.onRoomKeyRequest.stream.listen((RoomKeyRequest request) async {
      printDebug("===========================================onRoomKeyRequest");
    });

    // 交换密钥
    onKeyVerificationRequestSub = client.onKeyVerificationRequest.stream.listen((KeyVerification request) async {
      printDebug("===========================================onKeyVerificationRequeston");
      var hidPopup = false;
      request.onUpdate = () {
        if (!hidPopup && {KeyVerificationState.done, KeyVerificationState.error}.contains(request.state)) {
          Navigator.of(globalCtx()).pop('dialog');
        }
        hidPopup = true;
      };
      request.onUpdate = null;
      hidPopup = true;
      await KeyVerificationDialog(request: request).show(globalCtx());
    });

    // 登陆状态
    onLoginStateChanged = client.onLoginStateChanged.stream.listen((state) {
      printDebug("===========================================onLoginStateChanged");
      if (state != LoginState.loggedIn) {
        _cancelSub();
      }
    });

    // 频道消息，频道状态
    client.onRoomState.stream.listen((event) {
      var state = event.state;
      if (["m.room.history_visibility", "m.room.join_rules", "m.room.power_levels"].contains(state.type)) {
        return;
      }
      EasyDebounce.debounce(
        'syncChannel',
        const Duration(milliseconds: 800),
        () => syncChannel(),
      );
    });

    // 消息通知
    if (PlatformInfos.isWeb || PlatformInfos.isLinux) {
      client.onSync.stream.first.then((s) {
        html.Notification.requestPermission();
        onNotification = client.onEvent.stream.where((e) {
          printDebug("===========================================onNotification ==> ${e.type}");
          return e.type == EventUpdateType.timeline &&
              [
                EventTypes.Message,
                EventTypes.Sticker,
                EventTypes.Encrypted,
              ].contains(e.content['type']) &&
              e.content['sender'] != client.userID;
        }).listen(showLocalNotification);
      });
    }
  }

  syncChannel() {
    printWarning("syncChannel");
    final app = globalCtx().read<AppCubit>();
    if (id == app.currentId) {
      app.setChannels();
    }
    Timer(const Duration(milliseconds: 2000), () {
      if (id == app.currentId) {
        app.setChannels();
      }
    });
  }

  _cancelSub() async {
    printDebug("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<_cancelSubs");
    await onRoomKeyRequestSub?.cancel();
    await onKeyVerificationRequestSub?.cancel();
    await onLoginStateChanged?.cancel();
    await onUiaRequest?.cancel();
    await onNotification?.cancel();
  }

  dispose() async {
    await _cancelSub();
  }
}
