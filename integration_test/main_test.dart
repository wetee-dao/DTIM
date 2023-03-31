import 'package:asyou_app/components/hover_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:asyou_app/router.dart';
import 'package:asyou_app/main.dart' as app;

import 'extensions/wait_for.dart';

void main() {
  // 初始化
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('signup', (WidgetTester tester) async {
    // 构建应用
    app.main(test: true);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 6));
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
    await tester.tap(find.byKey(const Key('selectAccountType')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 3));

    // 触发注册sr25519key
    await tester.tap(find.byKey(const Key('sr25519key')));
    await tester.pumpAndSettle();

    // 触发下一页
    await tester.tap(find.byKey(const Key('goNext')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 3));

    // 触发注册按钮点击
    var nick = find.byKey(const Key('nick'));
    await tester.tap(nick);
    await tester.enterText(nick, "auto_test");
    await tester.pumpAndSettle();

    var passwd = find.byKey(const Key('passwd'));
    await tester.tap(passwd);
    await tester.enterText(passwd, "test123456");
    await tester.pumpAndSettle();

    var passwd2 = find.byKey(const Key('passwd2'));
    await tester.tap(passwd2);
    await tester.enterText(passwd2, "test123456");
    await tester.pumpAndSettle();

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
    await tester.tap(find.byKey(const Key('topSearch')));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 10));
    await tester.pumpAndSettle();

    // 确认加入
    await tester.tap(find.byKey(const Key('!A252bk6ogxcyprah:im.tc.asyou.me_join')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 10));
    await tester.pumpAndSettle();

    // 输入
    var input = find.byKey(const Key('chatInput'));
    await tester.tap(input);
    await tester.enterText(input, "test message");
    await tester.pumpAndSettle();

    // 发送消息
    await tester.tap(find.byKey(const Key('chatSendIcon')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 6));
  });

  testWidgets('createChannel', (WidgetTester tester) async {
    await login(tester);
  });

  testWidgets('startDirectChat', (WidgetTester tester) async {
    await login(tester);

    await tester.tap(find.byKey(const Key('create_private')));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 10));
    await tester.pumpAndSettle();

    // 确认加入 balL   @0xe4b0110725b8b50510304c8c7958b5e539ba370c41a8fcd019b0586c4dfe3550
    var input1 = find.byKey(const Key('cratePrivateInput'));
    await tester.tap(input1);
    await tester.enterText(input1, "@0xe4b0110725b8b50510304c8c7958b5e539ba370c41a8fcd019b0586c4dfe3550");
    await tester.pumpAndSettle();

    //发送请求
    await tester.tap(find.byKey(const Key('cratePrivateSend')));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    // await tester.waitFor(
    //     find.byKey(const Key("@0xe4b0110725b8b50510304c8c7958b5e539ba370c41a8fcd019b0586c4dfe3550:im.tc.asyou.me")),
    //     timeout: const Duration(seconds: 20));
    await tester.tap(find.byKey(const Key("DirectChat0")));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    // 输入
    var input = find.byKey(const Key('chatInput'));
    await tester.tap(input);
    await tester.enterText(input, "test message");
    await tester.pumpAndSettle();

    // 发送消息
    await tester.tap(find.byKey(const Key('chatSendIcon')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 6));
  });
}

login(WidgetTester tester) async {
  // 构建应用
  app.main(test: true);
  await tester.pumpAndSettle();

  await Future.delayed(const Duration(seconds: 3));
  await tester.pumpAndSettle();

  // 触发注册按钮点击
  await tester.tap(find.byKey(const Key('auto_test')));
  await tester.pumpAndSettle();

  await Future.delayed(const Duration(seconds: 1));

  // 输入密码
  var passwd = find.byType(TextFormField);
  await tester.enterText(passwd, "test123456");
  await tester.pumpAndSettle();

  // 登陆
  await tester.tap(find.maybeUppercaseText('OK'));
  await tester.pumpAndSettle();

  await Future.delayed(const Duration(seconds: 2));

  try {
    await tester.tap(find.byKey(const Key('asyoumeCard')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));

    await tester.tap(find.byKey(const Key('orgOk')));
    await tester.pumpAndSettle();
    // ignore: empty_catches
  } catch (e) {}

  await Future.delayed(const Duration(seconds: 8));
}
