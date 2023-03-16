import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import '../../components/setting/settings_ui.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  bool useNotificationDotOnAppIcon = true;

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
            title: const Text('选择主题'),
            tiles: [
              ThemeSettingsTile(
                title: const Text('浅色主题'),
                description: const Text('选中后可看到效果，部分内容可能不会变化，重启后可消除'),
              ),
              ThemeSettingsTile(
                title: const Text('深色主题'),
                type: "dark",
                description: const Text('选中后可看到效果，部分内容可能不会变化，重启后可消除'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
