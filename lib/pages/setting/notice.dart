import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:collection/collection.dart' show IterableExtension;

import '../../components/components.dart';
import '../../components/setting/settings_ui.dart';
import '../../router.dart';
import '../../store/im.dart';
import '../../utils/screen/screen.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  bool useNotificationDotOnAppIcon = true;
  late Client client;
  List<Pusher> pushers = [];

  @override
  void initState() {
    super.initState();
    final im = context.read<IMProvider>();
    client = im.currentState!.client;

    Timer(const Duration(milliseconds: 100), () {
      client.onAccountData.stream.listen((event) {
        if (mounted) {
          setState(() {});
        }
      });
      client.getPushers().asStream().listen((pu) {
        if (mounted) {
          pushers = pu ?? [];
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool? getNotificationSetting(NoticeItem item) {
    final pushRules = client.globalPushRules;
    if (pushRules == null) return null;
    switch (item.type) {
      case PushRuleKind.content:
        return pushRules.content?.singleWhereOrNull((r) => r.ruleId == item.key)?.enabled;
      case PushRuleKind.override:
        return pushRules.override?.singleWhereOrNull((r) => r.ruleId == item.key)?.enabled;
      case PushRuleKind.room:
        return pushRules.room?.singleWhereOrNull((r) => r.ruleId == item.key)?.enabled;
      case PushRuleKind.sender:
        return pushRules.sender?.singleWhereOrNull((r) => r.ruleId == item.key)?.enabled;
      case PushRuleKind.underride:
        return pushRules.underride?.singleWhereOrNull((r) => r.ruleId == item.key)?.enabled;
    }
  }

  void setNotificationSetting(NoticeItem item, bool enabled) {
    waitFutureLoading(
      context: context,
      future: () => client.setPushRuleEnabled(
        'global',
        item.type,
        item.key,
        enabled,
      ),
    );
  }

  void onPusherTap(Pusher pusher) async {
    final delete = await showModalActionSheet<bool>(
      context: context,
      title: pusher.deviceDisplayName,
      message: '${pusher.appDisplayName} (${pusher.appId})',
      actions: [
        SheetAction(
          label: L10n.of(context)!.delete,
          isDestructiveAction: true,
          key: true,
        )
      ],
    );
    if (delete != true) return;

    final success = await waitFutureLoading(
      context: globalCtx(),
      future: () => client.deletePusher(
        PusherId(
          appId: pusher.appId,
          pushkey: pusher.pushkey,
        ),
      ),
    );

    if (success.error != null) return;

    setState(() {
      pusherFuture = null;
    });
  }

  Future<List<Pusher>?>? pusherFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !isPc()
          ? AppBar(
              title: const Text('Notifications'),
            )
          : null,
      body: SettingsList(
        contentPadding: EdgeInsets.zero,
        sections: [
          SettingsSection(
            title: const Text('全局设置'),
            tiles: [
              Switchtile(
                initialValue: !client.allPushNotificationsMuted,
                onToggle: (_) => waitFutureLoading(
                  context: context,
                  future: () => client.setMuteAllPushNotifications(
                    !client.allPushNotificationsMuted,
                  ),
                ),
                title: Text(L10n.of(context)!.notificationsEnabledForThisAccount),
                description: Text(L10n.of(context)!.notificationsEnabledForThisAccountDesc),
              ),
            ],
          ),
          SettingsSection(
            title: Text(L10n.of(context)!.pushRules),
            tiles: [
              if (!client.allPushNotificationsMuted) ...{
                for (final item in NoticeItem.items)
                  Switchtile(
                    initialValue: getNotificationSetting(item) ?? true,
                    title: Text(item.title(context)),
                    onToggle: (bool enabled) => setNotificationSetting(item, enabled),
                  ),
              },
            ],
          ),

          SettingsSection(
            title: Text(L10n.of(context)!.devices),
            tiles: [
              for (final pusher in pushers) ...{
                PusherTile(pusher, onToggle: (p) => onPusherTap(p)),
              }
            ],
          )

          // SettingsSection(
          //   title: Text(L10n.of(context)!.devices),
          //   tiles: [
          //     Switchtile(
          //       initialValue: false,
          //       onToggle: (_) {},
          //       title: const Text('私聊消息'),
          //     ),
          //     Switchtile(
          //       initialValue: false,
          //       onToggle: (_) {},
          //       title: const Text('私聊中加密消息'),
          //     ),
          //     Switchtile(
          //       initialValue: false,
          //       onToggle: (_) {},
          //       title: const Text('群聊中的消息'),
          //     ),
          //     Switchtile(
          //       initialValue: false,
          //       onToggle: (_) {},
          //       title: const Text('群聊中的加密消息'),
          //     ),
          //   ],
          // ),
          //   SettingsSection(
          //     title: const Text('提及&关键字'),
          //     tiles: [
          //       Switchtile(
          //         initialValue: false,
          //         onToggle: (_) {},
          //         title: const Text('当消息包含我的显示名称时'),
          //       ),
          //       Switchtile(
          //         initialValue: false,
          //         onToggle: (_) {},
          //         title: const Text('当消息包含我的用户名时'),
          //       ),
          //       Switchtile(
          //         initialValue: false,
          //         onToggle: (_) {},
          //         title: const Text('当消息包含 @room 时'),
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }
}

class PusherTile extends AbstractSettingsTile {
  final Function(Pusher value) onToggle;
  final Pusher pusher;
  const PusherTile(this.pusher, {super.key, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${pusher.appDisplayName} - ${pusher.appId}',
      ),
      subtitle: Text(pusher.data.url.toString()),
      onTap: () => onToggle(pusher),
    );
  }
}

class NoticeItem {
  final PushRuleKind type;
  final String key;
  final String Function(BuildContext) title;
  const NoticeItem(this.type, this.key, this.title);
  static List<NoticeItem> items = [
    NoticeItem(
      PushRuleKind.underride,
      '.m.rule.room_one_to_one',
      (c) => L10n.of(c)!.directChats,
    ),
    NoticeItem(
      PushRuleKind.override,
      '.m.rule.contains_display_name',
      (c) => L10n.of(c)!.containsDisplayName,
    ),
    NoticeItem(
      PushRuleKind.content,
      '.m.rule.contains_user_name',
      (c) => L10n.of(c)!.containsUserName,
    ),
    NoticeItem(
      PushRuleKind.override,
      '.m.rule.invite_for_me',
      (c) => L10n.of(c)!.inviteForMe,
    ),
    NoticeItem(
      PushRuleKind.override,
      '.m.rule.member_event',
      (c) => L10n.of(c)!.memberChanges,
    ),
    NoticeItem(
      PushRuleKind.override,
      '.m.rule.suppress_notices',
      (c) => L10n.of(c)!.botMessages,
    ),
  ];
}
