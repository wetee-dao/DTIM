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

class Guildpage extends StatefulWidget {
  const Guildpage({Key? key}) : super(key: key);

  @override
  State<Guildpage> createState() => _GuildpageState();
}

class _GuildpageState extends State<Guildpage> {
  late final IMProvider im;
  List<GuildInfo> guilds = [];
  AssetAccountData? nativeAmount;
  AssetAccountData? share;

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    getData();
  }

  getData() async {
    guilds = await rustApi.daoGuilds(client: im.currentState!.chainClient, daoId: im.currentState!.org.daoId);
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
                        text: '工会',
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
                        const InfoCard(
                          icon: Icons.library_add_rounded,
                          label: "点击创建",
                          amount: '工会',
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
                  // if (!Responsive.isDesktop(context)) const PaymentsDetailList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
