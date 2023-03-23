import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:themed/themed.dart';
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
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AdaptiveDialog.instance.updateConfiguration(defaultStyle: AdaptiveStyle.material);
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
          locale: const Locale('en'),
          supportedLocales: L10n.supportedLocales,
          theme: ConstTheme.dark.color.value == Colors.black.value
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
          // theme: ThemeData.light().copyWith(
          // primaryColor: ConstTheme.centerChannelBg,
          // colorScheme: const ColorScheme.light().copyWith(
          //   primary: ConstTheme.centerChannelColor,
          //   secondary: ConstTheme.centerChannelColor.withAlpha(155),
          //   error: ConstTheme.errorTextColor,
          // ),
          // dialogTheme: DialogTheme(
          //   backgroundColor: ConstTheme.sidebarBg,
          //   titleTextStyle: TextStyle(color: ConstTheme.sidebarText, fontSize: 16.w),
          //   contentTextStyle: TextStyle(color: ConstTheme.sidebarText, fontSize: 13.w),
          //   surfaceTintColor: Colors.transparent,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(3.w),
          //   ),
          //   actionsPadding: EdgeInsets.only(bottom: 20.w, right: 15.w),
          // ),
          // textTheme: TextTheme(
          //   titleMedium: TextStyle(color: ConstTheme.centerChannelColor),
          // ),
          // inputDecorationTheme: InputDecorationTheme(
          //   labelStyle: TextStyle(height: 1.5, color: ConstTheme.centerChannelColor),
          //   hintStyle: TextStyle(height: 1.5, color: ConstTheme.centerChannelColor),
          // ),
          // ),
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
