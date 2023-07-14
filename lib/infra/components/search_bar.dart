import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'iconfont.dart';
import 'move_window.dart';

class TopSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final double _height;
  final String _title;
  final Function? onBack;
  final Function? onInput;
  TopSearchBar({
    Key? key,
    this.onBack,
    this.onInput,
    String? title,
    double? height,
  })  : _height = (height ?? 50.w).toInt().toDouble(),
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
            SizedBox(width: 40.w),
            Icon(AppIcons.search, color: constTheme.sidebarHeaderTextColor, size: 18.w),
            SizedBox(width: 20.w),
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: _title,
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1.8, color: constTheme.sidebarHeaderTextColor, fontSize: 14.w),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  onInput?.call(value);
                },
                style: TextStyle(color: constTheme.sidebarHeaderTextColor),
              ),
            ),
            IconButton(
              onPressed: () {
                if (onBack != null) {
                  onBack!();
                  return;
                }
              },
              icon: Icon(AppIcons.tuopanhua, color: constTheme.sidebarHeaderTextColor, size: 17.w),
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
            SizedBox(width: 35.w)
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
