import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import '../../components/setting/settings_ui.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  bool useNotificationDotOnAppIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !isPc()
          ? AppBar(
              title: Text('Notifications'),
            )
          : null,
      body: SettingsList(
        contentPadding: EdgeInsets.zero,
        sections: [
          SettingsSection(
            title: const Text('全局设置'),
            tiles: [
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('为账户启用通知'),
                description: const Text('关闭后在全部设备和会话上停用统治'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('为此设备启用通知'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('为此会话启用桌面通知'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('在桌面通知中显示消息'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('会话启用声音通知'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('频道消息'),
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
          SettingsSection(
            title: const Text('提及&关键字'),
            tiles: [
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('当消息包含我的显示名称时'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('当消息包含我的用户名时'),
              ),
              SettingsTile.switchtile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('当消息包含 @room 时'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
