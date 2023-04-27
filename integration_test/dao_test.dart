import 'package:asyou_app/router.dart';
import 'package:asyou_app/rust_wraper.io.dart';
import 'package:asyou_app/store/dao_ctx.dart';
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

  testWidgets('joinDao', (WidgetTester tester) async {
    await login(tester);
    // 查看DAO
    await tester.waitFor(find.byKey(const Key('DAO')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('DAO')));

    await tester.waitFor(find.byKey(const Key('daoView')), timeout: const Duration(seconds: 50));

    await rustApi.daoInitFromPair(client: daoCtx.chainClient, address: daoCtx.user.address);
    await daoCtx.getData();
    await Future.delayed(const Duration(seconds: 6));

    await tester.waitFor(find.byKey(const Key('joinDao')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('joinDao')));

    await tester.waitFor(find.byKey(const Key('joinDaoSubmit')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('joinDaoSubmit')));

    for (var i = 0; i < 200; i++) {
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      var texts = find.byKey(const Key('myShare'));
      var myShare = texts.evaluate().single.widget as Text;
      if (myShare.data != 'SHARE:  0') {
        break;
      }
    }
  });

  testWidgets('createProject', (WidgetTester tester) async {
    await login(tester);
    // 查看DAO
    await tester.waitFor(find.byKey(const Key('DAO')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('DAO')));

    await tester.waitFor(find.byKey(const Key('daoView')), timeout: const Duration(seconds: 50));

    await tester.waitFor(find.byKey(const Key('createGuildProject')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('createGuildProject')));

    // 打开创建页面
    await tester.waitFor(find.byKey(const Key('createSpace')), timeout: const Duration(seconds: 50));

    await tester.waitFor(find.byKey(const Key('spaceName')), timeout: const Duration(seconds: 50));
    var name = find.byKey(const Key('spaceName'));
    await tester.tap(name);
    await tester.enterText(name, "test project");
    await tester.pumpAndSettle();

    await tester.waitFor(find.byKey(const Key('spaceDescription')), timeout: const Duration(seconds: 50));
    var desc = find.byKey(const Key('spaceDescription'));
    await tester.tap(desc);
    await tester.enterText(desc, "test project desc");
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('selectProject')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('createSpace')));
    await tester.pumpAndSettle();
  });

  testWidgets('createProject', (WidgetTester tester) async {
    await login(tester);
    // 查看DAO
    await tester.waitFor(find.byKey(const Key('DAO')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('DAO')));

    await tester.waitFor(find.byKey(const Key('daoView')), timeout: const Duration(seconds: 50));

    await tester.waitFor(find.byKey(const Key('createGuildProject')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('createGuildProject')));

    // 打开创建页面
    await tester.waitFor(find.byKey(const Key('createSpace')), timeout: const Duration(seconds: 50));

    await tester.waitFor(find.byKey(const Key('spaceName')), timeout: const Duration(seconds: 50));
    var name = find.byKey(const Key('spaceName'));
    await tester.tap(name);
    await tester.enterText(name, "test project");
    await tester.pumpAndSettle();

    await tester.waitFor(find.byKey(const Key('spaceDescription')), timeout: const Duration(seconds: 50));
    var desc = find.byKey(const Key('spaceDescription'));
    await tester.tap(desc);
    await tester.enterText(desc, "test project desc");
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('selectProject')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('createSpace')));
    await tester.pumpAndSettle();
  });

  testWidgets('start Regerendum', (WidgetTester tester) async {
    await login(tester);
    // 查看DAO
    await tester.waitFor(find.byKey(const Key('DAO')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('DAO')));
    await tester.waitFor(find.byKey(const Key('daoView')), timeout: const Duration(seconds: 50));

    // 点击进入公投页面
    await tester.tap(find.byKey(const Key('Referendums')));
    await tester.waitFor(find.byKey(const Key('ReferendumView')), timeout: const Duration(seconds: 50));

    if (daoCtx.pending.isNotEmpty) {
      var pending = daoCtx.pending[0];
      await tester.tap(find.byKey(Key('referendumStart${pending.index}')));
      await Future.delayed(const Duration(seconds: 10));
      await tester.pumpAndSettle();
    }

    var going = daoCtx.going.lastWhere((v) => v.status == 0);
    await tester.waitFor(find.byKey(Key('referendumExecute${going.id}')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(Key('referendumExecute${going.id}')));
  });

  testWidgets('join Project', (WidgetTester tester) async {
    await login(tester);

    // 查看DAO
    await tester.waitFor(find.byKey(const Key('DAO')), timeout: const Duration(seconds: 50));
    await tester.tap(find.byKey(const Key('DAO')));
    await tester.waitFor(find.byKey(const Key('daoView')), timeout: const Duration(seconds: 50));

    // 点击进入公投页面
    await tester.tap(find.byKey(const Key('Projects 1')));
    await tester.waitFor(find.byKey(const Key('projectView')), timeout: const Duration(seconds: 50));

    // 添加用户到项目
    var rootAddress = await rustApi.addSeed(seed: DAO_ROOT_SEED);
    await rustApi.daoProjectJoinRequestWithRoot(
      from: rootAddress,
      client: daoCtx.chainClient,
      daoId: daoCtx.org.daoId,
      projectId: 1,
      user: daoCtx.user.address,
    );
    await Future.delayed(const Duration(seconds: 5));

    await tester.tap(find.byKey(const Key('createTaskBtn')));
    await tester.waitFor(find.byKey(const Key('createTaskView')), timeout: const Duration(seconds: 50));

    await tester.waitFor(find.byKey(const Key('taskTitle')), timeout: const Duration(seconds: 50));
    var name = find.byKey(const Key('taskTitle'));
    await tester.tap(name);
    await tester.enterText(name, "test task");
    await tester.pumpAndSettle();

    await tester.waitFor(find.byKey(const Key('taskDesc')), timeout: const Duration(seconds: 50));
    var desc = find.byKey(const Key('taskDesc'));
    await tester.tap(desc);
    await tester.enterText(desc, "test desc");
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('createTask')));
    await tester.pumpAndSettle();
  });
}
