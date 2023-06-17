import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/application/store/app/org.dart';
import 'package:dtim/application/store/db.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/infra/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dtim/domain/utils/tray.dart';

import 'package:dtim/application/service/apis/apis.dart';
import 'application/store/app/webrtc.dart';
import 'router.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/domain/utils/screen/screen_util.dart';

final botToastBuilder = BotToastInit();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (isPc()) {
    await windowManager.ensureInitialized();
    await windowManager.hide();
  }
  AdaptiveDialog.instance.updateConfiguration(defaultStyle: AdaptiveStyle.material);

  // 数据库初始化
  await initDB();

  // 主题初始化
  final systemStore = await SystemApi.create();
  final winsystem = await systemStore.get();
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
      if (PlatformInfos.isMacOS || PlatformInfos.isWindows) {
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

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = AppCubit();
    final rootRouter = AppRouter(app);
    setGlobalKey(rootRouter.navigatorKey);
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: theme(),
      builder: (light, dark) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => app),
          BlocProvider(create: (_) => OrgCubit()),
          BlocProvider(create: (_) => WebRTCCubit()),
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
            ScreenUtil.setConText(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: 1),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
