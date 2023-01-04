import 'dart:async';
import 'package:flutter/material.dart';

import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/move_window.dart';
import '../../components/popup.dart';
import './chat_menu.dart';

class ChannelBar extends StatefulWidget implements PreferredSizeWidget {
  final double _height;
  final link.Room room;
  final Widget? tools;
  final Function? onBack;
  ChannelBar({Key? key, this.onBack, this.tools, required this.room, double? height})
      : _height = height ?? 60.w,
        super(key: key);

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

  @override
  void initState() {
    menuController.addListener(() {
      menuStreamController.add(menuController.menuIsShowing);
    });
    super.initState();
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return moveWindow(
      Container(
        height: widget._height,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: ConstTheme.sidebarText.withOpacity(0.08))),
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
                SizedBox(height: 5.w),
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
                                  ? ConstTheme.sidebarTextActiveBorder.withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(3.w)),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  widget.room.name,
                                  style: TextStyle(
                                    color: snapshot.data != null && snapshot.data!
                                        ? ConstTheme.sidebarTextActiveBorder
                                        : ConstTheme.centerChannelColor,
                                    fontSize: 17.w,
                                    height: 1.4,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: snapshot.data != null && snapshot.data!
                                      ? ConstTheme.sidebarTextActiveBorder
                                      : ConstTheme.centerChannelColor,
                                  size: 18.w,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      menuBuilder: () => menuRender(menuController),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.star_border,
                        color: ConstTheme.centerChannelColor.withAlpha(155),
                        size: 18.w,
                      ),
                    ),
                  ],
                ),
                Container(height: 3.w),
                Row(
                  children: [
                    SizedBox(width: 5.w),
                    Text(
                      '添加频道描述',
                      style: TextStyle(
                        color: ConstTheme.centerChannelColor.withAlpha(155),
                        fontSize: 12,
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
