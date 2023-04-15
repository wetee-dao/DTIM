import 'dart:io';
import 'package:asyou_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../utils/screen.dart';
import '../store/theme.dart';

class CloseBar extends StatefulWidget {
  /// The [child] contained by the CloseBar.
  final Widget? child;

  const CloseBar({Key? key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CloseBarState();
}

class _CloseBarState extends State<CloseBar> with WindowListener {
  bool _isMaximized = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowMaximize() {
    setState(() {
      _isMaximized = true;
    });
  }

  @override
  void onWindowUnmaximize() {
    setState(() {
      _isMaximized = false;
    });
  }

  @override
  void onWindowEnterFullScreen() {
    setState(() {
      _isFullScreen = true;
    });
  }

  @override
  void onWindowLeaveFullScreen() {
    setState(() {
      _isFullScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    if (!isPc() || Platform.isMacOS) {
      return widget.child ?? Container();
    }
    if (widget.child == null) return renderIcons(constTheme);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.w, top: 5.w, right: 5.w, bottom: 2.w),
          child: renderIcons(constTheme),
        ),
        SizedBox(height: 9.w),
        widget.child!
      ],
    );
  }

  renderIcons(constTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            windowManager.minimize();
          },
          child: Icon(
            Appicon.zuixiaohua,
            color: constTheme.centerChannelColor,
            size: 17.w,
          ),
        ),
        SizedBox(width: 15.w),
        if (_isMaximized)
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              windowManager.unmaximize();
            },
            child: Icon(
              Appicon.chuangkouhua,
              color: constTheme.centerChannelColor,
              size: 13.w,
            ),
          ),
        if (!_isMaximized)
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              windowManager.maximize();
            },
            child: Container(
              width: 12.w,
              height: 12.w,
              // margin: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                border: Border.all(color: constTheme.centerChannelColor, width: 2.w),
                borderRadius: BorderRadius.all(Radius.circular(2.w)),
              ),
            ),
          ),
        SizedBox(width: 13.w),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // windowManager.close();
            // windowManager.minimize();
            windowManager.hide();
          },
          child: Icon(
            Appicon.tuopanhua,
            color: constTheme.centerChannelColor,
            size: 17.w,
          ),
        ),
        SizedBox(width: 2.w),
      ],
    );
  }
}
