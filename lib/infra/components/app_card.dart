import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';
import 'dao/text.dart';

class AppCard extends StatelessWidget {
  final String icon;
  final String? label;
  final String? amount;
  const AppCard({Key? key, required this.icon, required this.label, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      constraints: BoxConstraints(minWidth: 350.w, maxWidth: 350.w, minHeight: 110.w, maxHeight: 110.w),
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: constTheme.centerChannelColor.withOpacity(0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            icon,
            width: 75.w,
            height: 75.w,
            fit: BoxFit.contain,
            color: constTheme.centerChannelColor,
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: label!,
                  size: 15.w,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(height: 3.w),
                Expanded(
                  child: PrimaryText(
                    text: amount!,
                    size: 13.w,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
