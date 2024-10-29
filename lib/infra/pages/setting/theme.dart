import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dtim/application/service/apis/apis.dart';
import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/router.dart';
import 'package:flutter/material.dart';

import 'package:dtim/infra/components/setting/settings_ui.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/models/system.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  bool useNotificationDotOnAppIcon = true;
  String theme = "";
  late AppCubit im;
  late StreamSubscription<System> sub;

  @override
  void initState() {
    refresh();
    im = context.read<AppCubit>();
    super.initState();
  }

  refresh() async {
    final sys = await (await SystemApi.create()).get();
    if (sys != null && sys.theme != "") {
      theme = sys.theme;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformInfos.isMobile
          ? AppBar(
              title: const Text('theme'),
            )
          : null,
      body: SettingsList(
        contentPadding: EdgeInsets.zero,
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            title: const Text('当前已选主题'),
            margin: EdgeInsetsDirectional.only(top: 10.w),
            tiles: [
              if (theme != "") CurrThemeSettingsTile(theme: theme),
              ThemeSettingsTile(
                title: const Text('浅色主题'),
                initialValue: theme,
                description: const Text('选中后可看到效果，部分内容可能不会变化，重启后可消除'),
                onToggle: (String v) async {
                  final accountOrgApi = await AccountOrgApi.create();
                  await accountOrgApi.saveOrgTheme(im.me!.address + im.currentState!.org.nodeHash, v);
                  // 设置全局设置，方便加载
                  final t = await setTheme(v);
                  AdaptiveTheme.of(globalCtx()).setTheme(
                    light: t,
                  );
                  Timer(const Duration(milliseconds: 100), () {
                    refresh();
                  });
                },
              ),
              ThemeSettingsTile(
                title: const Text('深色主题'),
                initialValue: theme,
                type: "dark",
                description: const Text('选中后可看到效果，部分内容可能不会变化，重启后可消除'),
                onToggle: (String v) async {
                  final accountOrgApi = await AccountOrgApi.create();
                  await accountOrgApi.saveOrgTheme(im.me!.address + im.currentState!.org.nodeHash, v);
                  // 设置全局设置，方便加载
                  final t = await setTheme(v);
                  AdaptiveTheme.of(globalCtx()).setTheme(
                    light: t,
                  );
                  Timer(const Duration(milliseconds: 100), () {
                    refresh();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
