// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:matrix/matrix.dart' as link;
import 'package:asyou_app/apis/d_msg_api.dart';

import '../apis/apis.dart';
import '../models/models.dart';

// class ImState implements xmpp.ConnectionStateChangedListener {
class ImState {
  // 用户
  late Account _user;

  // 外部事件触发器
  late Function _onchange;

  // 服务器连接
  late link.Client client;

  // 消息监听
  // late xmpp.MessagesListener _messagesListener;

  // 好友数据
  // late xmpp.RosterManager rosterManager;
  List<User> rosters = [];
  final List<void Function(List<User>)> _rosterListener = [];

  // 频道消息
  List<link.Room> channels = [];

  StreamSubscription<String>? subscription;

  // 构建函数
  ImState(
    link.Client connection,
    Account user,
    Function onchange,
  ) {
    _user = user;
    _onchange = onchange;
    client = connection;
    client.onLoginStateChanged.stream.listen((link.LoginState loginState) {
      print("LoginState: ${loginState.toString()}");
    });

    client.onEvent.stream.listen((link.EventUpdate eventUpdate) {
      print(eventUpdate.type);
      print(eventUpdate.content);
      print("New event update!");
    });

    channels = connection.rooms;
  }

  Account get user {
    return _user;
  }

  // @override
  // void onConnectionStateChanged(xmpp.XmppConnectionState state) {
  //   currentState = state;
  //   print("链接状态 =》 " + currentState.toString());
  //   if (state == xmpp.XmppConnectionState.Ready) {
  //     var vCardManager = xmpp.VCardManager(_connection);
  //     vCardManager.getSelfVCard().then((vCard) {
  //       print('Your info' + vCard.buildXmlString());
  //     });

  //     // 消息监听
  //     var messageHandler = xmpp.MessageHandler.getInstance(_connection);
  //     messageHandler.messagesStream.listen(_messagesListener.onNewMessage);

  //     // 好友监听
  //     rosterManager = xmpp.RosterManager.getInstance(_connection);
  //     rosterManager.rosterStream.listen(onRosters);

  //     // var receiver = 'nemanja2@test';
  //     // var receiverJid = xmpp.Jid.fromFullJid(receiver);
  //     // rosterManager.addRosterItem(xmpp.Buddy(receiverJid)).then((result) {
  //     //   if (result.description != null) {
  //     //     print('add roster' + result.description!);
  //     //   }
  //     // });

  //     // sleep(const Duration(seconds: 1));
  //     // vCardManager.getVCardFor(receiverJid).then((vCard) {
  //     //   if (vCard != null) {
  //     //     print('Receiver info' + vCard.buildXmlString());
  //     //     if (vCard != null && vCard.image != null) {
  //     //       var file = File('test456789.jpg')..writeAsBytesSync(image.encodeJpg(vCard.image!));
  //     //       print('IMAGE SAVED TO: ${file.path}');
  //     //     }
  //     //   }
  //     // });

  //     _onchange();
  //   }
  // }

  // // 处理事务
  // void onPresence(xmpp.PresenceData event) {
  //   print(
  //     'presence Event from ${event.jid!.fullJid!} PRESENCE: ${event.showElement}',
  //   );
  // }

  // // 处理用户列表变化
  // void onRosters(List<xmpp.Buddy> users) {
  //   if (_connection.state != xmpp.XmppConnectionState.Ready) {
  //     return;
  //   }
  //   List<User> fs = users.map((u) {
  //     var f = User();
  //     f.address = u.jid!.local;
  //     f.name = u.name ?? "";
  //     f.avatar = "";
  //     f.domain = u.jid!.domain;
  //     f.status = -1;
  //     return f;
  //   }).toList();
  //   var nfs = AccountApi.create().userSyncFriend(_user, fs);
  //   rosters = nfs;
  //   for (var i = 0; i < _rosterListener.length; i++) {
  //     _rosterListener[i](nfs);
  //   }
  // }

  // 添加监听用户变化句柄
  rosterListen(void Function(List<User>) onData) {
    onData(rosters);
    _rosterListener.add(onData);
  }

  // 删除用户变化句柄
  removeRosterListen(void Function(List<User>) onData) {
    _rosterListener.remove(onData);
  }
}
