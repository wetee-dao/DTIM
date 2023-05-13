import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/components.dart';
import '../../utils/screen/screen.dart';
import '../../router.dart';
import '../../store/theme.dart';

class ItemModel {
  String title;
  Function(link.Room room)? onTap;
  ItemModel(this.title, {this.onTap});
}

menuRender(controller, link.Room room) {
  List<List<ItemModel>> menuItems = [
    [
      ItemModel('查看详情', onTap: (link.Room room) {
        showModelOrPage(globalCtx(), "/channel_setting/${Uri.encodeComponent(room.id)}/info");
      })
    ],
    // [ItemModel('移动至...')], ItemModel('通知偏好'),
    [
      ItemModel(room.pushRuleState == link.PushRuleState.notify ? "静音频道" : "取消静音", onTap: (link.Room room) async {
        await waitFutureLoading(
          context: globalCtx(),
          future: () => room.pushRuleState == link.PushRuleState.notify
              ? room.setPushRuleState(link.PushRuleState.dontNotify)
              : room.setPushRuleState(link.PushRuleState.notify),
        );
      })
    ],
    [
      ItemModel('邀请成员', onTap: ((link.Room room) {
        showModelOrPage(globalCtx(), "/invitation/${Uri.encodeComponent(room.id)}");
      })),
      ItemModel('查看成员', onTap: ((link.Room room) {
        showModelOrPage(globalCtx(), "/channel_setting/${Uri.encodeComponent(room.id)}/member");
      }))
    ],
    [
      ItemModel('编辑频道标签', onTap: (link.Room room) {
        showModelOrPage(globalCtx(), "/channel_setting/${Uri.encodeComponent(room.id)}/info");
      }),
      ItemModel('重命名频道', onTap: (link.Room room) {
        // rootNavigatorKey.currentContext?.push("/rename_channel/${Uri.encodeComponent(room.id)}");
        showModelOrPage(globalCtx(), "/channel_setting/${Uri.encodeComponent(room.id)}/info");
      })
    ],
    [
      ItemModel('离开频道', onTap: (link.Room room) async {
        if (OkCancelResult.ok ==
            await showOkCancelAlertDialog(
              useRootNavigator: false,
              title: "提示",
              message: "确认离开频道",
              context: globalCtx(),
              okLabel: L10n.of(globalCtx())!.next,
              cancelLabel: L10n.of(globalCtx())!.cancel,
            )) {
          waitFutureLoading(
            context: globalCtx(),
            future: () async {
              await room.leave();
              return true;
            },
          );
        }
      })
    ]
  ];
  final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
  return Container(
    width: 200.w,
    margin: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      border: Border.all(color: constTheme.sidebarText.withOpacity(0.08)),
      borderRadius: BorderRadius.circular(3.w),
      color: constTheme.centerChannelBg,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 6.w,
        ),
      ],
    ),
    child: IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < menuItems.length; i++)
            for (var j = 0; j < menuItems[i].length; j++)
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  controller.hideMenu();
                  if (menuItems[i][j].onTap != null) {
                    menuItems[i][j].onTap!.call(room);
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    bottom: j == menuItems[i].length - 1 ? 15.w : 8.w,
                    top: j == 0 ? 15.w : 8.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: i != menuItems.length - 1 && j == menuItems[i].length - 1
                          ? BorderSide(color: constTheme.centerChannelColor.withOpacity(0.08))
                          : BorderSide.none,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          menuItems[i][j].title,
                          style: TextStyle(
                            color: constTheme.centerChannelColor,
                            fontSize: 13.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    ),
  );
}
