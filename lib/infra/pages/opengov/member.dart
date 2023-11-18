import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:convert/convert.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/dao/text.dart';
import 'package:dtim/router.dart';
import 'package:dtim/application/store/theme.dart';

import '../work/sub/member.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => MemberPageState();
}

class MemberPageState extends State<MemberPage> {
  late final WorkCTX dao;
  List<String> members = [];

  @override
  void initState() {
    super.initState();
    dao = context.read<WorkCTX>();
    getData();
  }

  getData() async {
    members = (await workCtx.client.query.weteeOrg.members(BigInt.from(dao.org.daoId))).map((e) => hex.encode(e)).toList();
    print(members);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
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
                      text: "Members",
                      size: 25.w,
                      fontWeight: FontWeight.w800,
                    ),
                    // SizedBox(width: 20.w),
                    // PrimaryText(
                    //   text: info != null ? info!.desc : "",
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
                              message: "Do you confirm to join?",
                              context: globalCtx(),
                              okLabel: L10n.of(globalCtx())!.next,
                              cancelLabel: L10n.of(globalCtx())!.cancel,
                            )) {
                          if (!await workCtx.checkAfterTx()) return;
                          await waitFutureLoading(
                            context: globalCtx(),
                            future: () async {
                              // await rustApi.daoGuildJoinRequest(
                              //   from: dao.user.address,
                              //   client: dao.chainClient,
                              //   daoId: dao.org.daoId,
                              //   guildId: info!.id,
                              //   ext: WithGovPs(
                              //     runType: 1,
                              //     amount: 100,
                              //     member: MemberGroup(
                              //       scope: 2,
                              //       id: info!.id,
                              //     ),
                              //   ),
                              // );
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
                // PrimaryText(
                //   text: info != null ? info!.desc : "",
                //   size: 14.w,
                // ),
                SizedBox(height: 5.w),
              ],
            ),
          ),
          Expanded(
            child: Members(members: members),
          ),
          SizedBox(height: 30.w),
        ],
      ),
    );
  }
}
