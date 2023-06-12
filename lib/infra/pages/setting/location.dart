import 'package:flutter/material.dart';
import 'package:asyou_app/infra/components/setting/settings_ui.dart';

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
      // appBar: !isPc()
      //     ? AppBar(
      //         title: const Text('theme'),
      //       )
      //     : null,
      body: SettingsList(
        contentPadding: EdgeInsets.zero,
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            title: const Text('深色'),
            tiles: [
              Switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('私聊消息'),
              ),
              Switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('私聊中加密消息'),
              ),
              Switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('群聊中的消息'),
              ),
              Switchtile(
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
