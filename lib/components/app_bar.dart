import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

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
  final double macosTop = Platform.isMacOS ? 20.w : 0;
  final Color? backgroundColor;
  LocalAppBar({
    Key? key,
    this.onBack,
    this.tools,
    String? title,
    double? height,
    bool? showMacosTop,
    this.leading,
    this.backgroundColor,
  })  : _height = height ?? 60.w,
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
          color: backgroundColor ?? constTheme.sidebarHeaderBg,
          // border: Border(bottom: BorderSide(color: constTheme.sidebarHeaderTextColor.withOpacity(0.15))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading ??
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
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
                    context.router.pop();
                    ;
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

class SideBarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _height;
  final String _title;
  final Widget? leading;
  final Widget? tools;
  final Function? onBack;
  final bool _showMacosTop;
  final double macosTop = Platform.isMacOS ? 18.w : 0;
  SideBarAppBar({Key? key, this.onBack, this.tools, String? title, double? height, bool? showMacosTop, this.leading})
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
          color: constTheme.sidebarBg,
          border: Border(bottom: BorderSide(color: constTheme.sidebarText.withOpacity(0.15), width: 1.w)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: constTheme.sidebarBg.withOpacity(0.2), blurRadius: 10.w),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading ??
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Icon(
                      Icons.arrow_back,
                      color: constTheme.sidebarText,
                      size: 25.w / 60.w * _height,
                    ),
                  ),
                  onTap: () {
                    if (onBack != null) {
                      onBack!();
                      return;
                    }
                    context.router.pop();
                    ;
                  },
                ),
            SizedBox(width: 2.w * _height / 60.w),
            Text(
              _title,
              style: TextStyle(color: constTheme.sidebarText, fontSize: 14.w),
            ),
            Expanded(child: Container()),
            tools != null
                ? tools!
                : SizedBox(
                    width: _height,
                    child: tools,
                  ),
            SizedBox(width: 10.w),
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
