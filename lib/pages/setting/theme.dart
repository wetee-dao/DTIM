import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../apis/system_api.dart';
import '../../components/setting/settings_ui.dart';
import '../../objectbox.g.dart';
import '../../store/theme.dart';
import '../../models/system.dart';
import '../../utils/screen.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  bool useNotificationDotOnAppIcon = true;
  String theme = "";
  late Query<System> query;
  late StreamSubscription<System> sub;

  @override
  void initState() {
    final store = SystemApi.create().store();
    Query<System> query = store.query(System_.id.equals(1)).build();
    final sys = query.findFirst();
    if (sys != null && sys.theme != "") {
      theme = sys.theme;
    }
    sub = query.stream().listen((s) {
      if (s.theme != "") {
        theme = s.theme;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !isPc()
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
                onToggle: (String v) {
                  AdaptiveTheme.of(context).setTheme(
                    light: setTheme(v),
                  );
                  setState(() {});
                },
              ),
              ThemeSettingsTile(
                title: const Text('深色主题'),
                initialValue: theme,
                type: "dark",
                description: const Text('选中后可看到效果，部分内容可能不会变化，重启后可消除'),
                onToggle: (String v) {
                  AdaptiveTheme.of(context).setTheme(
                    light: setTheme(v),
                  );
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
