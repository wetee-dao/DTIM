import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:asyou_app/application/store/theme.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'iconfont.dart';
import 'move_window.dart';

class ModelBar extends StatelessWidget implements PreferredSizeWidget {
  final double _height;
  final String _title;
  final Widget? tools;
  final Function? onBack;
  ModelBar({Key? key, this.onBack, this.tools, String? title, double? height})
      : _height = (height ?? 50.w).toInt().toDouble(),
        _title = title ?? "",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final size = 30.w;
    return moveWindow(
      Container(
        height: _height,
        color: constTheme.sidebarHeaderBg,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 15.w),
            Text(
              _title,
              style: TextStyle(color: constTheme.sidebarHeaderTextColor, fontSize: 16.w),
            ),
            Expanded(child: Container()),
            tools != null
                ? tools!
                : SizedBox(
                    width: _height,
                    child: tools,
                  ),
            IconButton(
              onPressed: () {
                if (onBack != null) {
                  onBack!();
                  return;
                }
              },
              icon: Icon(AppIcons.tuopanhua, color: constTheme.sidebarHeaderTextColor, size: 17.w),
              iconSize: 17.w,
              constraints: BoxConstraints(minWidth: size, maxWidth: size, minHeight: size, maxHeight: size),
              padding: EdgeInsets.zero,
              tooltip: L10n.of(context)!.close,
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w),
                ),
                hoverColor: constTheme.errorTextColor.withOpacity(0.2),
              ),
            ),
            SizedBox(width: 10.w)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(100.sw, _height);
  }
}
