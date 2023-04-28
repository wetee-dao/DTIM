// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:matrix/encryption.dart';
import 'package:universal_html/html.dart' as html;

import '../models/models.dart';
import '../pages/channel/setting/key_verification_dialog.dart';
import '../router.dart';
import '../utils/platform_infos.dart';
import '../utils/uia_request_manager.dart';
import '../utils/local_notifications_extension.dart';

// class ImState implements xmpp.ConnectionStateChangedListener {
class ImState {
  // 用户
  late Account _user;
  late AccountOrg _org;
  Account get user => _user;
  AccountOrg get org => _org;
  int chainClient = -1;

  // 外部事件触发器
  late Function _onchange;

  // 服务器连接
  late link.Client client;

  StreamSubscription<String>? subscription;

  // 构建函数
  ImState(
    link.Client connection,
    AccountOrg org,
    Account user,
    Function onchange,
  ) {
    _user = user;
    _onchange = onchange;
    _org = org;
    client = connection;
    _registerImSub();
  }

  bool webHasFocus = true;
  String? activeRoomId = "";
  String? _cachedPassword;
  Timer? _cachedPasswordClearTimer;
  link.RequestTokenResponse? currentThreepidCreds;

  String? get cachedPassword => _cachedPassword;

  void _initWithStore() async {
    try {
      if (client.isLogged()) {
        // final statusMsg = await store.getItem(SettingKeys.ownStatusMessage);
        // if (statusMsg?.isNotEmpty ?? false) {
        //   print('Send cached status message: "$statusMsg"');
        //   await client.setPresence(
        //     client.userID!,
        //     link.PresenceType.online,
        //     statusMsg: statusMsg,
        //   );
        // }
      }
    } catch (e, s) {
      client.onLoginStateChanged.addError(e, s);
      rethrow;
    }
  }

  set cachedPassword(String? p) {
    print('Password cached');
    _cachedPasswordClearTimer?.cancel();
    _cachedPassword = p;
    _cachedPasswordClearTimer = Timer(const Duration(minutes: 10), () {
      _cachedPassword = null;
      print('Cached Password cleared');
    });
  }

  StreamSubscription? onRoomKeyRequestSub;
  StreamSubscription? onKeyVerificationRequestSub;
  StreamSubscription? onLoginStateChanged;
  StreamSubscription? onUiaRequest;
  StreamSubscription? onNotification;
  int? linuxNotificationId;
  late String currentClientSecret;
  final linuxNotifications = PlatformInfos.isLinux ? NotificationsClient() : null;

  void _registerImSub() {
    print("===========================================_registerImSub");
    onRoomKeyRequestSub = client.onRoomKeyRequest.stream.listen((RoomKeyRequest request) async {
      print("===========================================onRoomKeyRequest");
      // if (widget.clients.any(
      //   ((cl) =>
      //       cl.userID == request.requestingDevice.userId && cl.identityKey == request.requestingDevice.curve25519Key),
      // )) {
      //   print(
      //     '[Key Request] Request is from one of our own clients, forwarding the key...',
      //   );
      //   await request.forwardKey();
      // }
    });
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
    onLoginStateChanged = client.onLoginStateChanged.stream.listen((state) {
      print("===========================================onLoginStateChanged");
      if (state != link.LoginState.loggedIn) {
        _cancelSubs();
      }
    });
    onUiaRequest = client.onUiaRequest.stream.listen(uiaRequestHandler);
    if (PlatformInfos.isWeb || PlatformInfos.isLinux) {
      client.onSync.stream.first.then((s) {
        html.Notification.requestPermission();
        onNotification = client.onEvent.stream.where((e) {
          print("===========================================onNotification ==> ${e.type}");
          return e.type == link.EventUpdateType.timeline &&
              [
                link.EventTypes.Message,
                link.EventTypes.Sticker,
                link.EventTypes.Encrypted,
              ].contains(e.content['type']) &&
              e.content['sender'] != client.userID;
        }).listen(showLocalNotification);
      });
    }
  }

  _cancelSubs() async {
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<_cancelSubs");
    await onRoomKeyRequestSub?.cancel();
    await onKeyVerificationRequestSub?.cancel();
    await onLoginStateChanged?.cancel();
    await onUiaRequest?.cancel();
    await onNotification?.cancel();
  }

  dispose() async {
    await _cancelSubs();
  }
}
