// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:asyou_app/utils/functions.dart';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix/matrix.dart';
import 'package:matrix/encryption.dart';
import 'package:universal_html/html.dart' as html;

import '../models/models.dart';
import '../pages/channel/setting/key_verification_dialog.dart';
import '../router.dart';
import '../utils/platform_infos.dart';
import '../utils/local_notifications_extension.dart';
import '../utils/webrtc/webrtc_tool.dart';
import 'app/app.dart';

// class ImState
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
    Function() stateChange,
  ) {
    id = pid;
    user = puser;
    org = porg;
    client = pconnection;
    _registerSub();
    syncChannel();
    webrtcTool = WebrtcTool(client);
  }

  bool webHasFocus = true;
  String? activeRoomId = "";
  String? _cachedPassword;
  Timer? _cachedPasswordClearTimer;
  RequestTokenResponse? currentThreepidCreds;

  String? get cachedPassword => _cachedPassword;

  set cachedPassword(String? p) {
    print('Password cached');
    _cachedPasswordClearTimer?.cancel();
    _cachedPassword = p;
    _cachedPasswordClearTimer = Timer(const Duration(minutes: 10), () {
      _cachedPassword = null;
      print('Cached Password cleared');
    });
  }

  void _registerSub() {
    //获取密钥
    onRoomKeyRequestSub = client.onRoomKeyRequest.stream.listen((RoomKeyRequest request) async {
      print("===========================================onRoomKeyRequest");
    });

    // 交换密钥
    onKeyVerificationRequestSub = client.onKeyVerificationRequest.stream.listen((KeyVerification request) async {
      print("===========================================onKeyVerificationRequeston");
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
      if (["m.room.history_visibility", "m.room.join_rules", "m.room.power_levels"].contains(event.body)) {
        return;
      }
      syncChannel();
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
    final clist = client.rooms.toList();
    var channels = clist.where((c) => !c.isDirectChat).toList();
    var directChats = clist.where((c) => c.isDirectChat).toList();

    final app = globalCtx().read<AppCubit>();
    if (id == app.currentId) {
      app.setChannels(channels, directChats);
    }
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
