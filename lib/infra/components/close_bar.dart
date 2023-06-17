import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:window_manager/window_manager.dart';

import 'package:dtim/domain/utils/platform_infos.dart';
import 'components.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';

class CloseBar extends StatefulWidget {
  /// The [child] contained by the CloseBar.
  final Widget? child;
  final Color? color;

  const CloseBar({Key? key, this.child, this.color}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CloseBarState();
}

class _CloseBarState extends State<CloseBar> with WindowListener {
  bool _isMaximized = false;

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
    setState(() {});
  }

  @override
  void onWindowLeaveFullScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    if (!isPc() || PlatformInfos.isMacOS) {
      return widget.child ?? Container();
    }
    if (widget.child == null) return renderIcons(constTheme);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        renderIcons(constTheme),
        SizedBox(height: 6.w),
        widget.child!,
      ],
    );
  }

  renderIcons(constTheme) {
    var iconColor = widget.color ?? constTheme.centerChannelColor.withOpacity(0.5);
    var size = 25.w;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () => windowManager.minimize(),
          icon: Icon(AppIcons.zuixiaohua, color: iconColor, size: 17.w),
          iconSize: 17.w,
          constraints: BoxConstraints(minWidth: size, maxWidth: size, minHeight: size, maxHeight: size),
          padding: EdgeInsets.zero,
          tooltip: "minimize",
          style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(20),
              borderRadius: BorderRadius.zero, //Rectangular border
            ),
          ),
        ),
        if (_isMaximized)
          IconButton(
            onPressed: () => windowManager.unmaximize(),
            icon: Icon(AppIcons.chuangkouhua, color: iconColor, size: 12.w),
            iconSize: 17.w,
            constraints: BoxConstraints(minWidth: size, maxWidth: size, minHeight: size, maxHeight: size),
            padding: EdgeInsets.zero,
            tooltip: "unmaximize",
            style: IconButton.styleFrom(
              shape: const RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(20),
                borderRadius: BorderRadius.zero, //Rectangular border
              ),
            ),
          ),
        if (!_isMaximized)
          IconButton(
            onPressed: () => windowManager.maximize(),
            icon: Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                border: Border.all(color: iconColor, width: 2.w),
                borderRadius: BorderRadius.all(Radius.circular(2.w)),
              ),
            ),
            iconSize: 17.w,
            constraints: BoxConstraints(minWidth: size, maxWidth: size, minHeight: size, maxHeight: size),
            padding: EdgeInsets.zero,
            tooltip: "maximize",
            style: IconButton.styleFrom(
              shape: const RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(20),
                borderRadius: BorderRadius.zero, //Rectangular border
              ),
            ),
          ),
        IconButton(
          onPressed: () => windowManager.hide(),
          icon: Icon(AppIcons.tuopanhua, color: iconColor, size: 17.w),
          iconSize: 17.w,
          constraints: BoxConstraints(minWidth: size, maxWidth: size, minHeight: size, maxHeight: size),
          padding: EdgeInsets.zero,
          tooltip: L10n.of(context)!.close,
          style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(20),
              borderRadius: BorderRadius.zero, //Rectangular border
            ),
            hoverColor: constTheme.errorTextColor.withOpacity(0.5),
          ),
        ),
        if (widget.child != null) SizedBox(width: 8.w)
      ],
    );
  }
}
