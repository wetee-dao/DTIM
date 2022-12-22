import 'package:flutter/material.dart';
import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/move_window.dart';

class ChannelBar extends StatelessWidget implements PreferredSizeWidget {
  final double _height;
  final link.Room room;
  final Widget? tools;
  final Function? onBack;
  ChannelBar({Key? key, this.onBack, this.tools, required this.room, double? height})
      : _height = height ?? 60.w,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return moveWindow(Container(
      height: _height,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ConstTheme.sidebarText.withOpacity(0.08))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                      Text(
                        room.name,
                        style: TextStyle(
                          color: ConstTheme.centerChannelColor,
                          fontSize: 17.w,
                          height: 1,
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
          tools != null
              ? tools!
              : SizedBox(
                  width: _height,
                  child: tools,
                ),
        ],
      ),
    ));
  }

  @override
  Size get preferredSize {
    return Size(100.sw, _height);
  }
}
