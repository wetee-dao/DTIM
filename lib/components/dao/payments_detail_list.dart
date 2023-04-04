import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';
import 'payment_list_tile.dart';
import 'text.dart';

class PaymentsDetailList extends StatelessWidget {
  const PaymentsDetailList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            color: constTheme.centerChannelColor.withOpacity(0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.wallet_rounded, color: constTheme.centerChannelColor.withOpacity(0.5), size: 30.w),
              SizedBox(height: 15.w),
              Text("4562 3325 5158 2385", style: TextStyle(color: constTheme.centerChannelColor, fontSize: 17.w)),
              SizedBox(height: 10.w),
              Text("share: 10000", style: TextStyle(color: constTheme.centerChannelColor, fontSize: 12.w)),
              SizedBox(height: 6.w),
              Text("wte: 10000", style: TextStyle(color: constTheme.centerChannelColor, fontSize: 12.w)),
              SizedBox(height: 5.w),
            ],
          ),
        ),
        SizedBox(height: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Recent Activities',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '27 Apr, 2022',
              size: 14,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        SizedBox(
          height: 15.w,
        ),
        Column(
          children: List.generate(
            recentActivities.length,
            (index) => PaymentListTile(
              icon: recentActivities[index]["icon"],
              amount: recentActivities[index]["amount"],
              label: recentActivities[index]["label"],
            ),
          ),
        ),
        SizedBox(height: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Upcoming Payments',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '12 May, 2022',
              size: 14,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        SizedBox(height: 15.w),
        Column(
          children: List.generate(
            upcomingPayments.length,
            (index) => PaymentListTile(
              icon: upcomingPayments[index]["icon"],
              amount: upcomingPayments[index]["amount"],
              label: upcomingPayments[index]["label"],
            ),
          ),
        ),
      ],
    );
  }
}

const recentActivities = [
  {"icon": 'assets/drop.svg', "label": 'Water Bill', "amount": "\$120"},
  {"icon": 'assets/salary.svg', "label": 'Income Salary', "amount": "\$4500"},
  {"icon": 'assets/electricity.svg', "label": 'Electric Bill', "amount": "\$150"},
  {"icon": 'assets/wifi.svg', "label": 'Internet Bill', "amount": "\$60"},
];

const upcomingPayments = [
  {"icon": 'assets/home.svg', "label": 'Home Rent', "amount": "\$1500"},
  {"icon": 'assets/salary.svg', "label": 'Car Insurance', "amount": "\$150"},
];
