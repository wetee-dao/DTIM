import 'package:asyou_app/components/dao/text.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
// import 'package:responsive_dashboard_ui/data.dart';
// import 'package:responsive_dashboard_ui/style/colors.dart';
// import 'package:responsive_dashboard_ui/style/style.dart';

class HistoryTable extends StatelessWidget {
  const HistoryTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
      child: SizedBox(
        width: Responsive.isDesktop(context) ? double.infinity : SizeConfig.screenWidth,
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(0.2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
            transactionHistory.length,
            (index) => TableRow(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10.w, bottom: 10.w, right: 10.w),
                  child: CircleAvatar(
                    radius: Responsive.isDesktop(context) ? 17 : 14,
                    backgroundImage: NetworkImage(transactionHistory[index]['avatar']!),
                  ),
                ),
                PrimaryText(
                  text: transactionHistory[index]['label']!,
                  size: Responsive.isDesktop(context) ? 16 : 12,
                ),
                PrimaryText(
                  text: transactionHistory[index]['time']!,
                  size: Responsive.isDesktop(context) ? 16 : 12,
                ),
                PrimaryText(
                  text: transactionHistory[index]['amount']!,
                  size: Responsive.isDesktop(context) ? 16 : 12,
                ),
                PrimaryText(
                  text: transactionHistory[index]['status']!,
                  size: Responsive.isDesktop(context) ? 16 : 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const transactionHistory = [
  {
    "avatar":
        'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
    "label": 'Car Insurance',
    "amount": "\$350",
    "time": "10:42:23 AM",
    "status": "Completed",
  },
  {
    "avatar":
        'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
    "label": 'Loan',
    "amount": "\$350",
    "time": "12:42:00 PM",
    "status": "Completed",
  },
  {
    "avatar":
        'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
    "label": 'Online Payment',
    "amount": "\$154",
    "time": "10:42:23 PM",
    "status": "Completed",
  },
];
