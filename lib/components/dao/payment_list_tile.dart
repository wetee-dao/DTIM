import 'package:asyou_app/components/dao/text.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../store/theme.dart';

class PaymentListTile extends StatelessWidget {
  final String? icon;
  final String? label;
  final String? amount;
  const PaymentListTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 20.w),
      visualDensity: VisualDensity.standard,
      leading: Container(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: constTheme.centerChannelColor,
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: SvgPicture.asset(
          icon!,
          width: 20.w,
        ),
      ),
      title: PrimaryText(
        text: label!,
        size: 15.w,
        fontWeight: FontWeight.w500,
      ),
      subtitle: PrimaryText(
        text: 'Successful',
        size: 12.w,
      ),
      trailing: PrimaryText(
        text: amount!,
        size: 14.w,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
