import 'package:flutter/material.dart';

import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';

class SiderBarItem extends StatelessWidget {
  final IconData? icon;
  final String? img;
  final String name;
  final bool selected;
  final Function? onTap;

  const SiderBarItem(this.name, {super.key, this.icon, required this.selected, this.onTap, this.img});

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: 52.w,
        height: 52.w,
        padding: EdgeInsets.only(top: 4.w),
        decoration: BoxDecoration(
          color: selected ? constTheme.sidebarText.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(6.w),
        ),
        margin: EdgeInsets.only(bottom: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon!,
                    color: constTheme.sidebarText,
                    size: 20.w,
                  )
                : (img != null
                    ? Image.network(
                        img!,
                        width: 20.w,
                        height: 20.w,
                        fit: BoxFit.cover,
                        color: constTheme.sidebarText,
                      )
                    : SizedBox(
                        width: 20.w,
                        height: 20.w,
                      )),
            SizedBox(height: 3.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              height: 14.w,
              child: Text(
                name.split("&").first,
                style: TextStyle(
                  color: constTheme.sidebarText,
                  fontSize: 10.w,
                ),
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
