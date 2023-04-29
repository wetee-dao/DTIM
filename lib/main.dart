import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:asyou_app/utils/tray.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:bot_toast/bot_toast.dart';

import 'apis/apis.dart';
import 'router.dart';
import 'store/im.dart';
import 'store/db.dart';
import 'store/theme.dart';
import 'utils/screen.dart';

final botToastBuilder = BotToastInit();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 等待桌面初始化
  await windowManager.ensureInitialized();
  await windowManager.hide();

  AdaptiveDialog.instance.updateConfiguration(defaultStyle: AdaptiveStyle.material);
  // 数据库初始化
  await initDB();
  final winsystem = SystemApi.create().get();
  if (winsystem != null) {
    setThemeIndex(winsystem.theme);
  }

  // 初始化桌面窗口
  if (isPc()) {
    initScreen(1200);
    // 计算创建窗口大小
    var winSize = const Size(1150, 750);

    if (winsystem != null) {
      winSize = Size(winsystem.width, winsystem.height);
    }

    if (runInTest) {
      winSize = const Size(1250, 750);
    }

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
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden, windowButtonVisibility: true);
      await windowManager.setSize(winSize);
      await windowManager.show();
      await showtray();
      await windowManager.focus();
    });
  } else {
    initScreen(400);
  }

  // 构建IM全局对象
  IMProvider im = IMProvider();

  runApp(App(im: im));
}

class App extends StatelessWidget {
  final IMProvider im;
  App({Key? key, required this.im}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: theme(),
      builder: (light, dark) => MultiProvider(
        providers: [
          ChangeNotifierProvider<IMProvider>(create: (_) => im),
        ],
        child: MaterialApp.router(
          title: 'DAO',
          debugShowCheckedModeBanner: false,
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          localizationsDelegates: L10n.localizationsDelegates,
          locale: const Locale('en'),
          supportedLocales: L10n.supportedLocales,
          theme: light,
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            child = botToastBuilder(context, child);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: 1),
              child: child,
            );
          },
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: routers(),
    observers: [BotToastNavigatorObserver()],
  );
}
