import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/router/pop_router.dart';
import 'package:dtim/application/store/app/org.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:badges/badges.dart' as badges;

import 'package:dtim/router.dart';
import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import '../../components/hover_list_item.dart';
import '../../components/loading_dialog.dart';

class ChannelList extends StatefulWidget {
  const ChannelList({super.key});

  @override
  State<ChannelList> createState() => _ChannelListState();
}

class _ChannelListState extends State<ChannelList> {
  // 当前激活
  int hover = -1;
  late AppCubit im;

  @override
  void initState() {
    im = context.read<AppCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final org = context.watch<OrgCubit>();
    final app = context.watch<AppCubit>();
    final List<link.Room> channelsList =
        im.current != null ? im.current!.rooms.where((e) => !e.isDirectChat).toList() : [];
    final currentId = org.state.channelId;
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    printDebug("频道数据更新 => ${app.state.lastSyncTime}");
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: channelsList.length,
      itemBuilder: (context, index) {
        final chat = channelsList[index];
        return HoverListItem(
          key: Key(chat.id),
          subkey: "DirectChat${chat.id}",
          ishover: index == hover,
          color: currentId == chat.id ? constTheme.sidebarTextActiveBorder.withOpacity(0.09) : Colors.transparent,
          hoverColor: currentId == chat.id ? constTheme.sidebarTextActiveBorder.withOpacity(0.09):constTheme.centerChannelColor.withOpacity(0.08),
          radius: 5.w,
          margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.w),
          onPressed: () async {
            org.setChannelId(chat.id);
          },
          trailing: GestureDetector(
            onTapDown: (e) async {
              setState(() {
                hover = index;
              });
              final offset = e.globalPosition;
              final result = await showMenu(
                context: context,
                color: constTheme.sidebarBg,
                elevation: 0,
                shape: Border.all(color: constTheme.centerChannelColor.withOpacity(0.08)),
                position: RelativeRect.fromLTRB(
                  offset.dx,
                  offset.dy,
                  MediaQuery.of(context).size.width - offset.dx,
                  MediaQuery.of(context).size.height - offset.dy,
                ),
                constraints: const BoxConstraints(minHeight: 0),
                items: <PopupMenuItem<String>>[
                  renderItem("f1", Icons.star_border, chat.isFavourite ? "取消收藏" : "收藏"),
                  renderItem(
                    "f2",
                    Icons.notifications,
                    chat.pushRuleState == link.PushRuleState.notify ? "静音频道" : "取消静音",
                  ),
                  renderItem("f3", Icons.settings, "设置"),
                  renderItem("f4", Icons.add, "添加成员"),
                  renderItem("f5", Icons.time_to_leave_outlined, "离开频道", hideBorder: true),
                ],
              );
              if (result != null) {
                switch (result) {
                  case "f1":
                    await waitFutureLoading(
                      context: globalCtx(),
                      future: () async {
                        await chat.setFavourite(!chat.isFavourite);
                      },
                    );
                    break;
                  case "f2":
                    await waitFutureLoading(
                      context: globalCtx(),
                      future: () => chat.pushRuleState == link.PushRuleState.notify
                          ? chat.setPushRuleState(link.PushRuleState.dontNotify)
                          : chat.setPushRuleState(link.PushRuleState.notify),
                    );
                    break;
                  case "f3":
                    showModelOrPage(
                      globalCtx(),
                      "/channel_setting/${Uri.encodeComponent(chat.id)}/info",
                    );
                    break;
                  case "f4":
                    showModelOrPage(globalCtx(), "/invitation/${Uri.encodeComponent(chat.id)}");
                    break;
                  case "f5":
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
                          await chat.leave();
                          return true;
                        },
                      );
                    } else {}
                    break;
                }
              }
              setState(() {
                hover = -1;
              });
            },
            child: Container(
              height: 29.w,
              padding: EdgeInsets.only(right: 12.w, left: 12.w),
              child: Icon(
                Icons.adaptive.more,
                size: 17.w,
                color: constTheme.centerChannelColor.withAlpha(155),
              ),
            ),
          ),
          child: SizedBox(
            height: 45.w,
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10.w),
                Container(
                  width: 25.w,
                  height: 35.w,
                  padding: EdgeInsets.only(top: 2.w),
                  child: badges.Badge(
                    showBadge: chat.isUnread,
                    badgeStyle: badges.BadgeStyle(badgeColor: constTheme.sidebarUnreadText),
                    position: badges.BadgePosition.custom(top: -2.w, end: -5.w),
                    badgeContent: Text(
                      chat.notificationCount.toString(),
                      style: TextStyle(
                        fontSize: 6.w,
                        fontWeight: FontWeight.bold,
                        color: constTheme.centerChannelBg,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        chat.encrypted ? Icons.private_connectivity : Icons.all_inclusive_sharp,
                        size: chat.encrypted ? 24.w : 19.w,
                        color: chat.isUnreadOrInvited ? constTheme.sidebarUnreadText : constTheme.centerChannelColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    chat.getLocalizedDisplayname(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.w,
                      fontWeight: chat.isUnreadOrInvited ? FontWeight.bold : FontWeight.normal,
                      color: chat.isUnreadOrInvited ? constTheme.sidebarUnreadText : constTheme.centerChannelColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  PopupMenuItem<String> renderItem(value, icon, name, {hideBorder = false}) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return PopupMenuItem<String>(
      padding: EdgeInsets.zero,
      height: 25.w,
      value: value,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  !hideBorder ? BorderSide(color: constTheme.centerChannelColor.withOpacity(0.08)) : BorderSide.none),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10.w),
            Icon(icon, color: constTheme.centerChannelColor.withOpacity(0.7), size: 16.w),
            SizedBox(width: 6.w),
            Text(name,
                style: TextStyle(color: constTheme.centerChannelColor.withOpacity(0.7), fontSize: 12.w, height: 1)),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
