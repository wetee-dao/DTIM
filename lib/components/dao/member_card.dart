import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';
import '../../utils/responsive.dart';
import '../avatar.dart';
import 'text.dart';

class MemberCard extends StatelessWidget {
  final String? label;
  const MemberCard({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      width: 300.w,
      constraints: BoxConstraints(minWidth: isPc() ? 140.w : 100.w, maxWidth: double.maxFinite),
      padding: EdgeInsets.fromLTRB(20.0, 20.0, isPc() ? 40 : 10, 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: constTheme.centerChannelColor.withOpacity(0.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(
            label ?? "",
            50.w,
            color: constTheme.centerChannelColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: PrimaryText(
              text: label!,
              size: isPc() ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
