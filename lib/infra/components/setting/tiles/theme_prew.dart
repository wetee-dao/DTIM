import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';

class ThemePrew extends StatelessWidget {
  final Map<String, String> theme;
  final String selected;
  final Function(String) onTap;
  const ThemePrew({super.key, required this.theme, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return InkWell(
      onTap: () {
        onTap(theme["codeTheme"]!);
      },
      child: Container(
        width: 185.w,
        height: 145.w,
        decoration: BoxDecoration(
          color: constTheme.centerChannelBg,
          borderRadius: BorderRadius.circular(4.w),
          border: Border.all(color: constTheme.centerChannelColor.withAlpha(50), width: 1.w),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4.w), topRight: Radius.circular(4.w)),
              child: Container(
                height: 100.w,
                width: double.maxFinite,
                color: hexToColor(theme["centerChannelBg"]!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 16.w,
                      height: double.maxFinite,
                      color: hexToColor(theme["sidebarHeaderBg"]!),
                      child: Column(
                        children: [
                          SizedBox(height: 8.w),
                          Container(
                            decoration: BoxDecoration(
                              color: hexToColor(theme["sidebarTextActiveBorder"]!),
                              borderRadius: BorderRadius.circular(3.w),
                            ),
                            width: 10.w,
                            height: 10.w,
                          ),
                          SizedBox(height: 4.w),
                          Container(
                            decoration: BoxDecoration(
                              color: hexToColor(theme["sidebarText"]!).withOpacity(0.16),
                              borderRadius: BorderRadius.circular(3.w),
                            ),
                            width: 10.w,
                            height: 10.w,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 80.w,
                      height: double.maxFinite,
                      color: hexToColor(theme["sidebarBg"]!),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.w),
                          Container(
                            height: 4.w,
                            width: 45.w,
                            margin: EdgeInsets.only(left: 6.w),
                            decoration: BoxDecoration(
                              color: hexToColor(theme["sidebarText"]!),
                              borderRadius: BorderRadius.circular(4.w),
                            ),
                          ),
                          SizedBox(height: 5.w),
                          renderChannel(hexToColor(theme["sidebarBg"]!)),
                          renderChannel(hexToColor(theme["sidebarText"]!).withOpacity(0.08)),
                          renderChannel(hexToColor(theme["sidebarBg"]!)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: constTheme.centerChannelColor.withAlpha(50), width: 1.w)),
              ),
              padding: EdgeInsets.all(10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    selected == theme["codeTheme"]! ? Icons.check_circle : Icons.radio_button_unchecked,
                    size: 14.w,
                    color: selected == theme["codeTheme"]!
                        ? constTheme.mentionHighlightLink
                        : constTheme.centerChannelColor,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      theme["codeTheme"]!,
                      style: TextStyle(
                        color: constTheme.centerChannelColor,
                        fontSize: 14.w,
                        height: 1.2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  renderChannel(bg) {
    return Container(
      color: bg,
      padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 5.w),
      child: Row(
        children: [
          Text(
            "#",
            style: TextStyle(
              color: hexToColor(theme["sidebarText"]!),
              fontSize: 8.w,
            ),
          ),
          SizedBox(width: 3.w),
          Container(
            height: 4.w,
            width: 45.w,
            decoration: BoxDecoration(
              color: hexToColor(theme["sidebarText"]!),
              borderRadius: BorderRadius.circular(4.w),
            ),
          )
        ],
      ),
    );
  }
}
