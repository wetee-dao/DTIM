import 'package:flutter/material.dart';
import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/move_window.dart';
import '../../utils/popup.dart';

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

class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}

class _ChannelBarState extends State<ChannelBar> {
  BasePopupMenuController _controller = BasePopupMenuController();
  List<ItemModel> menuItems = [
    ItemModel('发起群聊', Icons.chat_bubble),
    ItemModel('添加朋友', Icons.group_add),
    ItemModel('扫一扫', Icons.settings_overscan),
  ];
  @override
  Widget build(BuildContext context) {
    return moveWindow(Container(
      height: widget._height,
      // padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ConstTheme.sidebarText.withOpacity(0.08))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 5.w),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      BasePopupMenu(
                        verticalMargin: 4.w,
                        horizontalMargin: -35.w,
                        showArrow: false,
                        controller: _controller,
                        pressType: PressType.singleClick,
                        child: Text(
                          widget.room.name,
                          style: TextStyle(
                            color: ConstTheme.centerChannelColor,
                            fontSize: 17.w,
                            height: 1,
                          ),
                        ),
                        menuBuilder: () => ClipRRect(
                          borderRadius: BorderRadius.circular(2.w),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ConstTheme.sidebarText.withOpacity(0.08)),
                              color: ConstTheme.centerChannelBg,
                            ),
                            child: IntrinsicWidth(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: menuItems
                                    .map(
                                      (item) => GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          print("onTap");
                                          _controller.hideMenu();
                                        },
                                        child: Container(
                                          height: 40,
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                item.icon,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 10),
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Text(
                                                    item.title,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: ConstTheme.centerChannelColor,
                          size: 18.w,
                        ),
                      ),
                    ],
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
              Text(
                '添加频道描述',
                style: TextStyle(
                  color: ConstTheme.centerChannelColor.withAlpha(155),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          //   ],
          // ),
          Expanded(child: moveWindow(Container())),
          widget.tools != null
              ? widget.tools!
              : SizedBox(
                  width: widget._height,
                  child: widget.tools,
                ),
        ],
      ),
    ));
  }
}
