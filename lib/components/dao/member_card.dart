import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';
import '../user_avatar.dart';
import 'text.dart';

class MemberCard extends StatelessWidget {
  final String? label;
  const MemberCard({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      width: 250.w,
      constraints: BoxConstraints(minWidth: isPc() ? 140.w : 100.w, maxWidth: double.maxFinite),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        color: constTheme.centerChannelColor.withOpacity(0.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(
            label ?? "",
            true,
            50.w,
            color: constTheme.centerChannelColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: PrimaryText(
              text: label!,
              size: 12.w,
            ),
          ),
        ],
      ),
    );
  }
}
