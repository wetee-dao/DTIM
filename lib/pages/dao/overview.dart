// 初始化一个页面
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../components/dao/history_table.dart';
import '../../components/dao/info_card.dart';
import '../../components/dao/text.dart';
import '../../store/theme.dart';
import '../../utils/responsive.dart';

class Overviewpage extends StatefulWidget {
  const Overviewpage({Key? key}) : super(key: key);

  @override
  State<Overviewpage> createState() => _OverviewpageState();
}

class _OverviewpageState extends State<Overviewpage> {
  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isPc() ? 30 : 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Guilds',
                  size: 25.w,
                  fontWeight: FontWeight.w800,
                ),
                PrimaryText(
                  text: '工会与项目',
                  size: 14.w,
                ),
              ],
            ),
            SizedBox(height: 15.w),
            SizedBox(
              width: double.maxFinite,
              child: Wrap(
                runSpacing: 20.w,
                spacing: 20.w,
                alignment: WrapAlignment.start,
                children: const [
                  InfoCard(
                    icon: Icons.access_alarm,
                    label: 'Transfer via\nCard number',
                    amount: '\$1200',
                  ),
                  InfoCard(
                    icon: Icons.access_alarm,
                    label: 'Transfer via\nOnline banks',
                    amount: '\$2000',
                  ),
                  InfoCard(
                    icon: Icons.access_alarm,
                    label: 'Transfer via\nSame bank',
                    amount: '\$1500',
                  ),
                  InfoCard(
                    icon: Icons.access_alarm,
                    label: 'Transfer to\nOther bank',
                    amount: '\$800',
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height:
            //       Responsive.isDesktop(context) ? SizeConfig.blockSizeVertical! * 4 : SizeConfig.blockSizeVertical! * 2,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         PrimaryText(
            //           text: 'Balance',
            //           size: Responsive.isDesktop(context) ? 16 : 14,
            //         ),
            //         PrimaryText(
            //           text: '\$1500',
            //           size: Responsive.isDesktop(context) ? 30 : 22,
            //           fontWeight: FontWeight.w800,
            //         ),
            //       ],
            //     ),
            //     PrimaryText(
            //       text: 'Past 30 Days',
            //       size: Responsive.isDesktop(context) ? 16 : 14,
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: SizeConfig.blockSizeVertical! * 3,
            // ),
            // const SizedBox(
            //   height: 180,
            //   child: BarChartComponent(),
            // ),
            SizedBox(height: 30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                PrimaryText(
                  text: 'Open Tasks',
                  size: 30.0,
                  fontWeight: FontWeight.w800,
                ),
                PrimaryText(
                  text: 'Transaction of past 6 months',
                  size: 16,
                ),
              ],
            ),
            SizedBox(height: 15.w),
            const HistoryTable(),
            // if (!Responsive.isDesktop(context)) const PaymentsDetailList()
          ],
        ),
      ),
    );
  }
}
