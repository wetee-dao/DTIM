import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../store/theme.dart';
import '../../utils/screen.dart';
import 'move_window.dart';

class LocalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _height;
  final String _title;
  final Widget? tools;
  final Function? onBack;
  final double windowButton = Platform.isMacOS ? 18.w : 0;
  LocalAppBar({Key? key, this.onBack, this.tools, String? title, double? height})
      : _height = height ?? 60.w,
        _title = title ?? "",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return moveWindow(
      Container(
        height: _height + windowButton,
        padding: EdgeInsets.only(top: windowButton),
        color: ConstTheme.sidebarHeaderBg,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Icon(
                  Icons.arrow_back,
                  color: ConstTheme.sidebarHeaderTextColor,
                  size: 25.w,
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
            Text(
              _title,
              style: TextStyle(color: ConstTheme.sidebarHeaderTextColor, fontSize: 14.w),
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
    return Size(100.sw, _height + windowButton);
  }
}
