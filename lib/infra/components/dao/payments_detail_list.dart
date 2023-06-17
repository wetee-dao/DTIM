import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dtim/bridge_struct.dart';
import 'package:dtim/application/store/dao_ctx.dart';
import 'package:dtim/application/store/theme.dart';
import 'payment_list_tile.dart';
import 'text.dart';

class PaymentsDetailList extends StatelessWidget {
  final AssetAccountData nativeAmount;
  final AssetAccountData share;
  final String address;
  final int userPoint;
  final DaoInfo dao;
  const PaymentsDetailList({
    Key? key,
    required this.address,
    required this.nativeAmount,
    required this.share,
    required this.userPoint,
    required this.dao,
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
              SizedBox(height: 5.w),
              Text(address, style: TextStyle(color: constTheme.centerChannelColor, fontSize: 15.w)),
              SizedBox(height: 12.w),
              Text(
                "Share:  ${share.free}",
                key: const Key("myShare"),
                style: TextStyle(color: constTheme.centerChannelColor, fontSize: 13.w),
              ),
              SizedBox(height: 3.w),
              Text(
                "WTE:  ${(nativeAmount.free / dao.chainUnit).toStringAsFixed(2)} UNIT",
                style: TextStyle(color: constTheme.centerChannelColor, fontSize: 13.w),
              ),
              SizedBox(height: 3.w),
              Text(
                "Point:  ${userPoint.toString()}",
                style: TextStyle(color: constTheme.centerChannelColor, fontSize: 13.w),
              ),
              SizedBox(height: 5.w),
            ],
          ),
        ),
        SizedBox(height: 20.w),
        Consumer<DAOCTX>(builder: (_, dao, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                text: dao.votes.isNotEmpty ? 'My ongoing vote' : 'No ongoing vote',
                size: 18,
                fontWeight: FontWeight.w800,
              ),
            ],
          );
        }),
        Consumer<DAOCTX>(builder: (_, dao, child) {
          return Column(
            children: List.generate(
              dao.votes.length,
              (index) => PaymentListTile(
                icon: Icons.how_to_vote_rounded,
                amount: "Share ${dao.votes[index].pledge}",
                label: "Referendum #${dao.votes[index].referendumIndex}",
                action: Icon(
                  dao.votes[index].opinion == 1 ? Icons.check_circle_outline_rounded : Icons.cancel_outlined,
                  color: dao.votes[index].opinion == 1 ? constTheme.buttonBg : constTheme.errorTextColor,
                  size: 25.w,
                ),
              ),
            ),
          );
        }),
        // SizedBox(height: 15.w),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: const [
        //     PrimaryText(
        //       text: 'Upcoming Payments',
        //       size: 18,
        //       fontWeight: FontWeight.w800,
        //     ),
        //     PrimaryText(
        //       text: '12 May, 2022',
        //       size: 14,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ],
        // ),
        // SizedBox(height: 15.w),
        // Column(
        //   children: List.generate(
        //     upcomingPayments.length,
        //     (index) => PaymentListTile(
        //       icon: upcomingPayments[index].icon,
        //       amount: upcomingPayments[index].amount,
        //       label: upcomingPayments[index].label,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

const recentActivities = [
  AmontItem(icon: Icons.account_circle_rounded, label: 'Water Bill', amount: "\$120"),
];

const upcomingPayments = [
  AmontItem(icon: Icons.home, label: 'Home Rent', amount: "\$1500"),
];

// AmontItem
class AmontItem {
  final IconData icon;
  final String label;
  final String amount;

  const AmontItem({
    required this.icon,
    required this.label,
    required this.amount,
  });
}
