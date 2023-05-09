import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:asyou_app/bloc/app/app.dart';
import 'package:asyou_app/utils/tray.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:bot_toast/bot_toast.dart';

import 'apis/apis.dart';
import 'router.dart';
import 'router/router.dart';
import 'store/im.dart';
import 'store/db.dart';
import 'store/theme.dart';
import 'utils/screen.dart';

final botToastBuilder = BotToastInit();

Future<void> main(args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var ctheme = extTheme();
  if (runWebViewTitleBarWidget(args,backgroundColor: ctheme.sidebarHeaderBg,color: ctheme.sidebarHeaderTextColor)) {
    debugPrint('webview args: $args');
    return;
  }

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

  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final rootRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    setGlobalKey(rootRouter.navigatorKey);
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: theme(),
      builder: (light, dark) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppCubit()),
        ],
        child: MaterialApp.router(
          title: 'DAO',
          debugShowCheckedModeBanner: false,
          routerConfig: rootRouter.config(),
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

  // final GoRouter _router = GoRouter(
  //   navigatorKey: rootNavigatorKey,
  //   routes: routers(),
  //   observers: [BotToastNavigatorObserver()],
  // );
}
