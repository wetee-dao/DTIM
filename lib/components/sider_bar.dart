// 写一个组件
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/screen.dart';
import '../store/theme.dart';

class SiderBarItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool selected;

  const SiderBarItem(this.icon, this.name, {super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return InkWell(
      onTap: () {
        context.push("/select_org");
      },
      child: Container(
        width: 52.w,
        height: 52.w,
        padding: EdgeInsets.only(top: 10.w),
        decoration: BoxDecoration(
          color: selected ? constTheme.sidebarText.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(4.w),
        ),
        margin: EdgeInsets.only(bottom: 5.w),
        child: Column(
          children: [
            Icon(
              icon,
              color: constTheme.sidebarHeaderTextColor,
              size: 20.w,
            ),
            SizedBox(height: 2.w),
            Text(
              name,
              style: TextStyle(
                color: constTheme.sidebarHeaderTextColor,
                fontSize: 10.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}