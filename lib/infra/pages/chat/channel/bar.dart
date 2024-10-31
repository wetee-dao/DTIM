import 'dart:async';
import 'package:dtim/infra/router/pop_router.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/popup.dart';
import 'package:dtim/router.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'bar_menu.dart';

class ChannelBar extends StatefulWidget implements PreferredSizeWidget {
  final double _height;
  final link.Room room;
  final Widget? tools;
  final Function? onBack;
  ChannelBar({super.key, this.onBack, this.tools, required this.room, double? height}) : _height = height ?? 60.w;

  @override
  State<ChannelBar> createState() => _ChannelBarState();

  @override
  Size get preferredSize {
    return Size(100.sw, _height);
  }
}

class _ChannelBarState extends State<ChannelBar> {
  final BasePopupMenuController menuController = BasePopupMenuController();
  final StreamController<bool> menuStreamController = StreamController<bool>();
  late String displayname;

  @override
  void initState() {
    menuController.addListener(() {
      menuStreamController.add(menuController.menuIsShowing);
    });
    displayname = widget.room.getLocalizedDisplayname();
    super.initState();
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actualMembersCount =
        (widget.room.summary.mInvitedMemberCount ?? 0) + (widget.room.summary.mJoinedMemberCount ?? 0);
    final constTheme = Theme.of(context).extension<ExtColors>()!;

    return moveWindow(
      Container(
        height: widget._height,
        decoration: BoxDecoration(
          color: constTheme.centerChannelBg,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(1.windowRadius), topRight: Radius.circular(1.windowRadius)),
          border: Border(
            bottom: BorderSide(color: constTheme.centerChannelDivider),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BasePopupMenu(
                      verticalMargin: -1.w,
                      horizontalMargin: 5.w,
                      showArrow: false,
                      controller: menuController,
                      position: PreferredPosition.bottomLeft,
                      pressType: PressType.singleClick,
                      child: StreamBuilder<bool>(
                        stream: menuStreamController.stream,
                        initialData: false,
                        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                          return Container(
                            padding: EdgeInsets.only(left: 6.w, right: 3.w, top: 2.w, bottom: 2.w),
                            decoration: BoxDecoration(
                              color: snapshot.data != null && snapshot.data!
                                  ? constTheme.centerChannelColor.withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(3.w)),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  getUserShortName(displayname).toUpperCase(),
                                  style: TextStyle(
                                    color: snapshot.data != null && snapshot.data!
                                        ? constTheme.centerChannelColor
                                        : constTheme.centerChannelColor,
                                    fontSize: 17.w,
                                    height: 1.4,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: snapshot.data != null && snapshot.data!
                                      ? constTheme.centerChannelColor
                                      : constTheme.centerChannelColor,
                                  size: 18.w,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      menuBuilder: () => menuRender(menuController, widget.room),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () async {
                        await waitFutureLoading(
                          context: globalCtx(),
                          future: () async {
                            await widget.room.setFavourite(!widget.room.isFavourite);
                          },
                        );
                      },
                      child: Icon(
                        widget.room.isFavourite ? Icons.star_half_rounded : Icons.star_border_rounded,
                        color: constTheme.centerChannelColor.withAlpha(155),
                        size: 18.w,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 2.w),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(3.w)),
                      onTap: () => showModelOrPage(
                        context,
                        "/channel_setting/${Uri.encodeComponent(widget.room.id)}/member",
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 3.w),
                          Icon(
                            Icons.group,
                            color: constTheme.centerChannelColor.withAlpha(155),
                            size: 18.w,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            actualMembersCount.toString(),
                            style: TextStyle(fontSize: 12.w, color: constTheme.centerChannelColor.withAlpha(155)),
                          ),
                          SizedBox(width: 4.w),
                        ],
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      widget.room.topic,
                      style: TextStyle(
                        color: constTheme.centerChannelColor.withAlpha(155),
                        fontSize: 13,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(child: moveWindow(Container())),
            widget.tools != null
                ? widget.tools!
                : SizedBox(
                    width: widget._height,
                    child: widget.tools,
                  ),
          ],
        ),
      ),
    );
  }
}
