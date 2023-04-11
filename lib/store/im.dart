import 'package:asyou_app/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:path_provider/path_provider.dart';

import '../models/models.dart';
import '../rust_wraper.io.dart';
import '../utils/functions.dart';
import '../utils/screen.dart';
import './im_state.dart';

class IMProvider with ChangeNotifier {
  // 当前账户
  String _currentId = "";
  String password = "";
  String signCtx = "";
  String sign = "";

  // 当前账户
  Account? me;

  // 多连接
  Map<String, link.Client> connections = {};

  // 连接状态
  Map<String, ImState> connectionStates = {};

  // 登陆账户
  Future<bool> login(Account user, String password) async {
    password = password;
    me = user;
    signCtx = "${"{\"t\":\"${DateTime.now().millisecondsSinceEpoch}"}\"}";
    try {
      await rustApi.addKeyring(keyringStr: user.chainData, password: password);
      sign = await rustApi.signFromAddress(address: user.address, ctx: signCtx);
    } catch (e) {
      print(e);
      throw "密码错误";
    }

    notifyListeners();
    return true;
  }

  logout() {
    password = "";
    me = null;
    _currentId = "";
    connections.forEach((key, value) async {
      await value.logout();
      await value.dispose();
    });
    connectionStates.forEach((key, value) async {
      await value.dispose();
    });
    connectionStates = {};
    connections = {};
    globalCtx().go("/");
  }

  // 连接账户
  Future<bool> connect(AccountOrg org) async {
    // 构建账户密码
    final userName = '${me!.address}@${org.domain}/${platformGet()}';

    printError("connect => $userName");

    // 已有的连接
    if (connections[userName] != null) {
      final client = connections[userName]!;
      if (!client.isLogged()) {
        try {
          await client.login(
            link.LoginType.mLoginPassword,
            identifier: link.AuthenticationUserIdentifier(user: me!.address),
            password: "$signCtx||$sign",
          );
        } catch (e) {
          print("注册出现错误 => $e");
        }
      }

      if (client.userID != null) {
        await client.setDisplayName(client.userID!, me!.name);
      }
      if (!client.isLogged()) {
        throw "连接错误";
      }
      return true;
    }

    final client = link.Client(
      userName,
      databaseBuilder: (_) async {
        final dir = await getApplicationSupportDirectory();
        print("hlive ===> ${dir.path} ${org.domain!.replaceAll(".", "_")}");
        final db = link.HiveCollectionsDatabase(
          org.domain!.replaceAll(".", "_"),
          "${dir.path}/${me!.address}",
        );
        await db.open();
        return db;
      },
    );

    // 链接节点
    await client.init();
    await client.checkHomeserver(Uri.http(org.domain!, ''));
    // await client.checkHomeserver(Uri.http("127.0.0.1:8008", ''));

    if (!client.isLogged()) {
      try {
        await client.uiaRequestBackground((auth) {
          return client.register(
            username: me!.address,
            password: "$signCtx||$sign",
            initialDeviceDisplayName: platformGet(),
            auth: auth,
          );
        });
      } catch (e) {
        print("注册出现错误 => $e");
      }
    }
    if (!client.isLogged()) {
      try {
        await client.login(
          link.LoginType.mLoginPassword,
          identifier: link.AuthenticationUserIdentifier(user: me!.address),
          password: "$signCtx||$sign",
        );
      } catch (e) {
        print("注册出现错误 => $e");
      }
    }

    if (client.userID != null) {
      await client.setDisplayName(client.userID!, me!.name);
    }
    if (!client.isLogged()) {
      throw "连接错误";
    }

    connections[userName] = client;
    connectionStates[userName] = ImState(client, org, me!, stateChange);

    return true;
  }

  // 设置当前账户
  setCurrent(AccountOrg org) {
    _currentId = '${me!.address}@${org.domain}/${platformGet()}';
    notifyListeners();
  }

  // 获取当前连接
  link.Client? get current => connections[_currentId];

  // 获取当前连接
  ImState? get currentState => connectionStates[_currentId];

  stateChange() {
    notifyListeners();
  }

  // // 通讯录
  // List<xmpp.Buddy> getAddresslist() {
  //   if (connections[_currentId] == null) {
  //     throw Exception('连接错误');
  //   }
  //   final rosterHandler = xmpp.RosterManager.getInstance(connections[_currentId]!);
  //   return rosterHandler.getRoster();
  // }
}
