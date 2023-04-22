// 初始化一个页面
import 'package:asyou_app/components/appicon.dart';
import 'package:asyou_app/rust_wraper.io.dart';
import 'package:asyou_app/store/dao_ctx.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bridge_generated.dart';
import '../../components/dao/member_card.dart';
import '../../components/dao/text.dart';
import '../../store/theme.dart';
import '../../utils/responsive.dart';

final GlobalKey guildKey = GlobalKey();

class Guildpage extends StatefulWidget {
  const Guildpage({Key? key}) : super(key: key);

  @override
  State<Guildpage> createState() => GuildpageState();
}

class GuildpageState extends State<Guildpage> {
  late final DAOCTX dao;
  GuildInfo? info;
  List<String> members = [];

  @override
  void initState() {
    super.initState();
    dao = context.read<DAOCTX>();
  }

  getData(GuildInfo guild) async {
    info = guild;
    members = await rustApi.daoGuildMemeberList(client: dao.chainClient, daoId: dao.org.daoId, guildId: guild.id);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.w),
                Row(
                  children: [
                    Icon(
                      Appicon.zuzhiDataOrganization6,
                      size: 30.w,
                      color: constTheme.centerChannelColor,
                    ),
                    SizedBox(width: 10.w),
                    PrimaryText(
                      text: info != null ? info!.name : "",
                      size: 25.w,
                      fontWeight: FontWeight.w800,
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        // showModelOrPage(context, "/create_roadmap");
                      },
                      child: Container(
                        height: 30.w,
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          color: constTheme.buttonBg,
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline_rounded,
                              size: 20.w,
                              color: constTheme.buttonColor,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "加入工会",
                              style: TextStyle(
                                fontSize: 14.w,
                                color: constTheme.buttonColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.w),
                PrimaryText(
                  text: info != null ? info!.desc : "",
                  size: 14.w,
                ),
                SizedBox(height: 15.w),
              ],
            ),
          ),
          Divider(
            height: 20,
            color: constTheme.centerChannelDivider,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              child: Wrap(
                runSpacing: 20.w,
                spacing: 20.w,
                alignment: WrapAlignment.start,
                children: [
                  for (var member in members)
                    MemberCard(
                      // icon: Appicon.zuzhiDataOrganization6,
                      label: member,
                      // amount: '\$1200',
                    ),
                  // const InfoCard(
                  //   icon: Icons.library_add_rounded,
                  //   label: "申请加入",
                  //   amount: '工会',
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.w),
        ],
      ),
    );
  }
}
