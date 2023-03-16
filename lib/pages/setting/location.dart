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
            title: const Text('浅色'),
            tiles: [
              ThemeSettingsTile(
                title: const Text('为账户启用通知'),
                description: const Text('关闭后在全部设备和会话上停用统治'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('深色'),
            tiles: [
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('私聊消息'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('私聊中加密消息'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('群聊中的消息'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('群聊中的加密消息'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
