// 初始化一个页面
import 'package:asyou_app/components/appicon.dart';
import 'package:asyou_app/rust_wraper.io.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bridge_generated.dart';
import '../../components/dao/history_table.dart';
import '../../components/dao/info_card.dart';
import '../../components/dao/payments_detail_list.dart';
import '../../components/dao/text.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import '../../utils/responsive.dart';

class Overviewpage extends StatefulWidget {
  const Overviewpage({Key? key}) : super(key: key);

  @override
  State<Overviewpage> createState() => _OverviewpageState();
}

class _OverviewpageState extends State<Overviewpage> {
  late final IMProvider im;
  List<GuildInfo> guilds = [];
  List<ProjectInfo> projects = [];
  AssetAccountData? nativeAmount;
  AssetAccountData? share;
  String? ss58Address;

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    getData();
  }

  getData() async {
    guilds = await rustApi.daoGuilds(client: im.currentState!.chainClient, daoId: im.currentState!.org.daoId);
    projects = await rustApi.daoProjects(client: im.currentState!.chainClient, daoId: im.currentState!.org.daoId);
    share = await rustApi.daoBalance(
        client: im.currentState!.chainClient, daoId: im.currentState!.org.daoId, address: im.me!.address);
    nativeAmount = await rustApi.nativeBalance(client: im.currentState!.chainClient, address: im.me!.address);
    ss58Address = await rustApi.ss58(address: im.me!.address);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                      children: [
                        for (var guild in guilds)
                          InfoCard(
                            icon: Appicon.zuzhiDataOrganization6,
                            label: "工会: ${guild.name}",
                            amount: '\$1200',
                          ),
                        for (var project in projects)
                          InfoCard(
                            icon: Icons.access_alarm,
                            label: project.name,
                            amount: '\$1200',
                          ),
                        const InfoCard(
                          icon: Icons.library_add_rounded,
                          label: "点击创建",
                          amount: '工会/项目',
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
                    children: [
                      // Row(
                      //   children: [
                      PrimaryText(
                        text: 'Open Referendums',
                        size: 25.w,
                        fontWeight: FontWeight.bold,
                      ),
                      // SizedBox(width: 10.w),
                      // Icon(Icons.add_circle_outline_rounded, color: constTheme.centerChannelColor, size: 22.w),
                      //   ],
                      // ),
                      PrimaryText(
                        text: 'Transaction of past 6 months',
                        size: 14.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  const HistoryTable(),
                  // if (!Responsive.isDesktop(context)) const PaymentsDetailList()
                ],
              ),
            ),
          ),
          Container(
            height: double.maxFinite,
            width: 280.w,
            color: constTheme.centerChannelColor.withOpacity(0.05),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: share != null && nativeAmount != null
                  ? PaymentsDetailList(
                      address: ss58Address!,
                      share: share!,
                      nativeAmount: nativeAmount!,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
