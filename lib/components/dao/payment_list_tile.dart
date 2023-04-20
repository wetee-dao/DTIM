import 'package:asyou_app/components/dao/text.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';

class PaymentListTile extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final String? amount;
  final Widget? action;
  const PaymentListTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.amount,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 0.w),
      visualDensity: VisualDensity.standard,
      leading: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: constTheme.centerChannelColor.withOpacity(0.03),
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Icon(
          icon!,
          size: 15.w,
          color: constTheme.centerChannelColor,
        ),
      ),
      title: PrimaryText(
        text: label!,
        size: 14.w,
        fontWeight: FontWeight.w500,
      ),
      subtitle: PrimaryText(
        text: amount!,
        size: 12.w,
      ),
      trailing: action ?? Container(),
    );
  }
}
