import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dtim/infra/pages/opengov/sub/referendum.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/dao/text.dart';
import 'package:dtim/router.dart';
import 'package:dtim/application/store/theme.dart';
import 'sub/member.dart';

final GlobalKey guildKey = GlobalKey();

class Guildpage extends StatefulWidget {
  final GuildInfo guild;
  const Guildpage({Key? key, required this.guild}) : super(key: key);

  @override
  State<Guildpage> createState() => GuildpageState();
}

class GuildpageState extends State<Guildpage> with TickerProviderStateMixin {
  late final WorkCTX dao;
  List<String> members = [];
  late TabController _tabController;
  late PageController pageController = PageController();
  final titleList = <String>["Referendums", "Members"];
  List<GovProps> pending = [];
  List<GovReferendum> going = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: titleList.length, initialIndex: 0);
    dao = context.read<WorkCTX>();
    getData();
  }

  getData() async {
    members =
        await rustApi.daoGuildMemeberList(client: dao.chainClient, daoId: dao.org.daoId, guildId: widget.guild.id);
    if (mounted) setState(() {});

    await dao.getVoteData();
    pending = dao.pending.where((r) => r.memberGroup.scope == 2 && r.memberGroup.id == widget.guild.id).toList();
    going = dao.going.where((r) => r.memberGroup.scope == 2 && r.memberGroup.id == widget.guild.id).toList();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final info = widget.guild;
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.w),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      AppIcons.zuzhi_data_organization_6,
                      size: 30.w,
                      color: constTheme.centerChannelColor,
                    ),
                    SizedBox(width: 10.w),
                    PrimaryText(
                      text: "#${info.id} ${info.name}",
                      size: 25.w,
                      fontWeight: FontWeight.w800,
                    ),
                    // SizedBox(width: 20.w),
                    // PrimaryText(
                    //   text: info != null ? info.desc : "",
                    //   size: 14.w,
                    //   height: 1.9,
                    // ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () async {
                        if (OkCancelResult.ok ==
                            await showOkCancelAlertDialog(
                              useRootNavigator: false,
                              title: "Notice",
                              message: "Do you confirm to join? Your application will be reviewed by internal members",
                              context: globalCtx(),
                              okLabel: L10n.of(globalCtx())!.next,
                              cancelLabel: L10n.of(globalCtx())!.cancel,
                            )) {
                          if (!await workCtx.checkAfterTx()) return;
                          await waitFutureLoading(
                            context: globalCtx(),
                            future: () async {
                              await rustApi.daoGuildJoinRequest(
                                from: dao.user.address,
                                client: dao.chainClient,
                                daoId: dao.org.daoId,
                                guildId: info.id,
                                ext: WithGovPs(
                                  runType: 1,
                                  amount: 100,
                                  member: MemberGroup(
                                    scope: 2,
                                    id: info.id,
                                  ),
                                  // TODO
                                  periodIndex: 0,
                                ),
                              );
                              await workCtx.daoRefresh();
                              getData();
                            },
                          );
                        }
                      },
                      child: Container(
                        height: 30.w,
                        padding: EdgeInsets.all(5.w),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(
                              Icons.group_add_rounded,
                              size: 20.w,
                              color: constTheme.centerChannelColor,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "Join",
                              style: TextStyle(
                                fontSize: 14.w,
                                color: constTheme.centerChannelColor,
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
                  text: info.desc,
                  size: 14.w,
                ),
                SizedBox(height: 5.w),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: constTheme.centerChannelColor,
            unselectedLabelColor: constTheme.centerChannelColor.withOpacity(0.6),
            labelStyle: TextStyle(fontSize: 13.w),
            unselectedLabelStyle: TextStyle(fontSize: 13.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            labelPadding: EdgeInsets.only(left: 12.w, right: 12.w),
            tabs: titleList.map((e) => Tab(text: e)).toList(),
            dividerColor: Colors.transparent,
            indicator: MaterialIndicator(
              color: constTheme.sidebarTextActiveBorder,
              strokeWidth: 10,
            ),
            onTap: (i) => pageController.jumpToPage(i),
          ),
          Divider(
            height: 1,
            color: constTheme.centerChannelDivider,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (page) {},
              children: [
                Referendums(pending: pending, going: going),
                Members(members: members),
              ],
            ),
          ),
          SizedBox(height: 30.w),
        ],
      ),
    );
  }
}
