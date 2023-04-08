import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:badges/badges.dart' as badges;

import '../components/name_with_emoji.dart';
import '../components/user_avatar.dart';
import '../router.dart';
import '../store/theme.dart';
import '../utils/functions.dart';
import '../utils/screen.dart';
import 'hover_list_item.dart';
import 'loading.dart';

class DirectChats extends StatefulWidget {
  final List<link.Room> channelsList;
  final String currentId;
  final Function onSelect;

  const DirectChats(this.channelsList, this.currentId, this.onSelect, {Key? key}) : super(key: key);

  @override
  State<DirectChats> createState() => _DirectChatsState();
}

class _DirectChatsState extends State<DirectChats> {
  // 当前激活
  int hover = -1;

  @override
  void initState() {
    print("DirectChatsDirectChatsDirectChatsDirectChats");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final channelsList = widget.channelsList;
    final currentId = widget.currentId;
    final onSelect = widget.onSelect;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: channelsList.length,
      itemBuilder: (context, index) {
        final room = channelsList[index];
        final displayname = getUserShortName(room.getLocalizedDisplayname());
        return HoverListItem(
          key: Key(room.id),
          subkey: "DirectChat$index",
          ishover: index == hover,
          color: currentId == channelsList[index].id ? constTheme.sidebarText.withOpacity(0.08) : Colors.transparent,
          hoverColor: constTheme.sidebarText.withOpacity(0.08),
          onPressed: () async {
            onSelect(channelsList[index].id);
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
                shape: Border.all(color: constTheme.sidebarText.withOpacity(0.08)),
                position: RelativeRect.fromLTRB(
                  offset.dx,
                  offset.dy,
                  MediaQuery.of(context).size.width - offset.dx,
                  MediaQuery.of(context).size.height - offset.dy,
                ),
                constraints: const BoxConstraints(minHeight: 0),
                items: <PopupMenuItem<String>>[
                  renderItem("f1", Icons.star_border, room.isFavourite ? "取消收藏" : "收藏"),
                  renderItem(
                    "f2",
                    Icons.notifications,
                    room.pushRuleState == link.PushRuleState.notify ? "静音频道" : "取消静音",
                  ),
                  renderItem("f3", Icons.settings, "设置"),
                  renderItem("f4", Icons.settings, "离开聊天")
                ],
              );
              if (result != null) {
                switch (result) {
                  case "f1":
                    await waitFutureLoading(
                      context: globalCtx(),
                      future: () async {
                        await room.setFavourite(!room.isFavourite);
                      },
                    );
                    break;
                  case "f2":
                    await waitFutureLoading(
                      context: globalCtx(),
                      future: () => room.pushRuleState == link.PushRuleState.notify
                          ? room.setPushRuleState(link.PushRuleState.dontNotify)
                          : room.setPushRuleState(link.PushRuleState.notify),
                    );
                    break;
                  case "f3":
                    showModelOrPage(
                      globalCtx(),
                      "/channel_setting/${Uri.encodeComponent(channelsList[index].id)}/info",
                    );
                    break;
                  case "f4":
                    if (OkCancelResult.ok ==
                        await showOkCancelAlertDialog(
                          useRootNavigator: false,
                          title: "提示",
                          message: "确认离开",
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
              padding: EdgeInsets.only(right: 6.w, left: 12.w),
              child: Icon(Icons.adaptive.more, size: 17.w, color: constTheme.sidebarText.withAlpha(180)),
            ),
          ),
          // child: Container(
          //   margin: EdgeInsets.only(right: 12.w),
          //   child: Icon(Icons.adaptive.more, size: 17.w, color: constTheme.sidebarText.withAlpha(155)),
          // ),),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 2.w,
                  color: currentId == channelsList[index].id ? constTheme.sidebarTextActiveBorder : Colors.transparent,
                ),
              ),
            ),
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 12.w),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w, top: 2.w, bottom: 2.w),
                  child: badges.Badge(
                    showBadge: room.isUnread,
                    badgeStyle: badges.BadgeStyle(badgeColor: constTheme.sidebarUnreadText),
                    badgeContent: Text(
                      room.notificationCount.toString(),
                      style: TextStyle(
                        fontSize: 10.w,
                        fontWeight: FontWeight.bold,
                        color: constTheme.centerChannelBg,
                      ),
                    ),
                    child: UserAvatar(
                      key: Key(room.directChatMatrixID ?? ""),
                      room.directChatMatrixID ?? "-",
                      true,
                      28.w,
                      bg: constTheme.sidebarText.withOpacity(0.1),
                      color: constTheme.sidebarText,
                    ),
                  ),
                ),
                Expanded(
                  child: WidgetUserNameEmoji(displayname, null),
                )
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
              bottom: !hideBorder ? BorderSide(color: constTheme.sidebarText.withOpacity(0.08)) : BorderSide.none),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10.w),
            Icon(icon, color: constTheme.sidebarText.withOpacity(0.7), size: 16.w),
            SizedBox(width: 6.w),
            Text(name, style: TextStyle(color: constTheme.sidebarText.withOpacity(0.7), fontSize: 12.w, height: 1)),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
