import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:themed/themed.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'apis/apis.dart';
import 'router.dart';
import 'store/im.dart';
import 'store/db.dart';
import 'store/theme.dart';
import 'utils/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 数据库初始化
  await initDB();
  var winsystem = SystemApi.create().get();
  if (winsystem != null) {
    setThemeIndex(winsystem.theme);
  }

  // 初始化桌面窗口
  if (isPc()) {
    initScreen(1200);
    // 计算创建窗口大小
    var winSize = const Size(1050, 650);

    if (winsystem != null) {
      winSize = Size(winsystem.width, winsystem.height);
    }

    // 等待桌面初始化
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
      size: winSize,
      minimumSize: const Size(800, 550),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      if (Platform.isMacOS || Platform.isWindows) {
        await windowManager.setHasShadow(true);
      }
      windowManager.setTitleBarStyle(TitleBarStyle.hidden, windowButtonVisibility: true);
      if (Platform.isLinux) {
        await windowManager.setAsFrameless();
      }
      await windowManager.show();
      await windowManager.focus();
    });
  } else {
    initScreen(400);
  }

  // 构建IM全局对象
  IMProvider im = IMProvider();
  EasyLoading.init();

  runApp(App(im: im));
}

class App extends StatelessWidget {
  final IMProvider im;
  App({Key? key, required this.im}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IMProvider>(create: (_) => im),
      ],
      child: Themed(
        child: MaterialApp.router(
          title: '我门',
          debugShowCheckedModeBanner: false,
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          builder: ((context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: 1),
              child: child!,
            );
          }),
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: routers(),
  );
}
