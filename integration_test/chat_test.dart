import 'package:asyou_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:asyou_app/main.dart' as app;

import 'base.dart';
import 'extensions/wait_for.dart';

void main() {
  // 初始化
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('signup', (WidgetTester tester) async {
    runInTest = true;
    // 构建应用
    await app.main();
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    try {
      var acount = find.byKey(const Key('auto_test_del'));
      await tester.tap(acount);
      await tester.pumpAndSettle();
      await tester.tap(find.maybeUppercaseText('NEXT'));
      await tester.pumpAndSettle();
      // ignore: empty_catches
    } catch (exception) {}

    await tester.pumpAndSettle();

    // 触发注册按钮点击
    await tester.waitFor(find.byKey(const Key('selectAccountType')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('selectAccountType')));
    await tester.pumpAndSettle();

    // 触发注册sr25519key
    await tester.waitFor(find.byKey(const Key('sr25519key')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('sr25519key')));
    await tester.pumpAndSettle();

    // 触发下一页
    await tester.waitFor(find.byKey(const Key('goNext')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('goNext')));
    await tester.pumpAndSettle();

    // 触发注册按钮点击
    await tester.waitFor(find.byKey(const Key('nick')), timeout: const Duration(seconds: 50));
    var nick = find.byKey(const Key('nick'));
    await tester.tap(nick);
    await tester.enterText(nick, "auto_test");
    await tester.pumpAndSettle();

    await tester.waitFor(find.byKey(const Key('passwd')), timeout: const Duration(seconds: 50));
    var passwd = find.byKey(const Key('passwd'));
    await tester.tap(passwd);
    await tester.enterText(passwd, "test123456");
    await tester.pumpAndSettle();

    await tester.waitFor(find.byKey(const Key('passwd2')), timeout: const Duration(seconds: 50));
    var passwd2 = find.byKey(const Key('passwd2'));
    await tester.tap(passwd2);
    await tester.enterText(passwd2, "test123456");
    await tester.pumpAndSettle();

    await tester.waitFor(find.byKey(const Key('keyDone')), timeout: const Duration(seconds: 50));
    var keyDone = find.byKey(const Key('keyDone'));
    await tester.tap(keyDone);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5));
  });

  // testWidgets('login', (WidgetTester tester) async {
  //   await login(tester);
  // });

  testWidgets('joinChannel', (WidgetTester tester) async {
    await login(tester);
    // 查看列表
    await tester.waitFor(find.byKey(const Key('topSearch')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('topSearch')));
    await tester.pumpAndSettle();

    // 确认加入
    await tester.waitFor(find.byKey(const Key('!A252bk6ogxcyprah:im.tc.asyou.me_join')),
        timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('!A252bk6ogxcyprah:im.tc.asyou.me_join')));
    await tester.pumpAndSettle();

    // 输入
    await tester.waitFor(find.byKey(const Key('chatInput')), timeout: const Duration(seconds: 50));
    var input = find.byKey(const Key('chatInput'));
    await tester.tap(input);
    await tester.enterText(input, "test message");
    await tester.pumpAndSettle();

    // 发送消息
    await tester.waitFor(find.byKey(const Key('chatSendIcon')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('chatSendIcon')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 6));
  });

  testWidgets('createChannel', (WidgetTester tester) async {
    await login(tester);
  });

  testWidgets('startDirectChat', (WidgetTester tester) async {
    await login(tester);

    await tester.waitFor(find.byKey(const Key('create_private')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('create_private')));
    await tester.pumpAndSettle();

    // 确认加入 balL   @0xe4b0110725b8b50510304c8c7958b5e539ba370c41a8fcd019b0586c4dfe3550
    await tester.waitFor(find.byKey(const Key('cratePrivateInput')), timeout: const Duration(seconds: 50));
    var input1 = find.byKey(const Key('cratePrivateInput'));
    await tester.tap(input1);
    await tester.enterText(input1, "@0xe4b0110725b8b50510304c8c7958b5e539ba370c41a8fcd019b0586c4dfe3550");
    await tester.pumpAndSettle();

    //发送请求
    await tester.waitFor(find.byKey(const Key('cratePrivateSend')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('cratePrivateSend')));
    await tester.pumpAndSettle();

    // 确认加入
    await tester.waitFor(find.byKey(const Key("DirectChat0")), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key("DirectChat0")));
    await tester.pumpAndSettle();

    // 输入
    await tester.waitFor(find.byKey(const Key("chatInput")), timeout: const Duration(seconds: 50));
    var input = find.byKey(const Key('chatInput'));
    await tester.enterText(input, "test message");
    await tester.pumpAndSettle();

    // 发送消息
    await tester.waitFor(find.byKey(const Key("chatSendIcon")), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('chatSendIcon')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 6));
  });
}
