import 'package:asyou_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/main.dart' as app;

import 'extensions/wait_for.dart';

login(WidgetTester tester) async {
  runInTest = true;
  // 构建应用
  await app.main();
  await tester.pumpAndSettle();
  await tester.waitFor(find.byKey(const Key("auto_test")), timeout: const Duration(seconds: 50));

  // 触发注册按钮点击
  await tester.tap(find.byKey(const Key('auto_test')));
  await tester.pumpAndSettle();

  await Future.delayed(const Duration(seconds: 1));

  // 输入密码
  await tester.waitFor(find.byType(TextFormField), timeout: const Duration(seconds: 50));
  var passwd = find.byType(TextFormField);
  await tester.enterText(passwd, "test123456");
  await tester.pumpAndSettle();

  // 登陆
  await tester.waitFor(find.maybeUppercaseText('OK'), timeout: const Duration(seconds: 50));
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

// ignore: constant_identifier_names
const DAO_ROOT_SEED = "gloom album notable jewel divorce never trouble lesson month neck sign harbor";
