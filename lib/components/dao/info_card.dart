import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';
import '../../utils/responsive.dart';
import 'text.dart';

class InfoCard extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final String? amount;
  const InfoCard({Key? key, required this.icon, required this.label, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      constraints: BoxConstraints(minWidth: isPc() ? 140.w : 100.w, maxWidth: double.maxFinite),
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 40.w, 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: constTheme.centerChannelColor.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25.w,
            color: constTheme.centerChannelColor,
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 2,
          ),
          PrimaryText(
            text: label!,
            size: 13.w,
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 1,
          ),
          PrimaryText(
            text: amount!,
            size: 16.w,
            fontWeight: FontWeight.w800,
          )
        ],
      ),
    );
  }
}
