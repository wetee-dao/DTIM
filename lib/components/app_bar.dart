import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../store/theme.dart';
import '../../utils/screen.dart';
import 'move_window.dart';

class LocalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _height;
  final String _title;
  final Widget? leading;
  final Widget? tools;
  final Function? onBack;
  final bool _showMacosTop;
  final double macosTop = Platform.isMacOS ? 18.w : 0;
  LocalAppBar({Key? key, this.onBack, this.tools, String? title, double? height, bool? showMacosTop, this.leading})
      : _height = height ?? 60.w,
        _title = title ?? "",
        _showMacosTop = showMacosTop ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return moveWindow(
      Container(
        height: _height + (_showMacosTop ? macosTop : 0),
        padding: EdgeInsets.only(top: (_showMacosTop ? macosTop : 0)),
        decoration: BoxDecoration(
          color: constTheme.sidebarHeaderBg,
          // border: Border(bottom: BorderSide(color: constTheme.sidebarHeaderTextColor.withOpacity(0.15))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading ??
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w / 60.w * _height),
                    child: Icon(
                      Icons.arrow_back,
                      color: constTheme.sidebarHeaderTextColor,
                      size: 25.w / 60.w * _height,
                    ),
                  ),
                  onTap: () {
                    if (onBack != null) {
                      onBack!();
                      return;
                    }
                    context.pop();
                  },
                ),
            SizedBox(width: 10.w),
            Text(
              _title,
              style: TextStyle(color: constTheme.sidebarHeaderTextColor, fontSize: 14.w),
            ),
            Expanded(child: Container()),
            tools != null
                ? tools!
                : SizedBox(
                    width: _height,
                    child: tools,
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(100.sw, _height + (_showMacosTop ? macosTop : 0));
  }
}
