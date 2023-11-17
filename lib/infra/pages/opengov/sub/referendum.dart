import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dtim/application/store/app/org.dart';
import 'package:dtim/infra/router/pop_router.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';


import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/dao/text.dart';
import 'package:dtim/router.dart';

import 'package:dtim/application/store/theme.dart';

class Referendums extends StatelessWidget {
  final List<GovProps> pending;
  final List<GovReferendum> going;
  final bool showTitle;
  final bool wrap;
  const Referendums({Key? key, required this.pending, required this.going, this.showTitle = true, this.wrap = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (wrap == false) {
      return children();
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: children(),
    );
  }

  Widget children() {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    return Column(
      children: [
        if (pending.isNotEmpty)
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 0.w),
                width: 250.w,
                child: Row(
                  children: [
                    Icon(Icons.data_usage_rounded, color: constTheme.buttonBg, size: 18.w),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: PrimaryText(
                        text: showTitle ? "Pending regerendum" : "Regerendum",
                        size: 14.w,
                        color: constTheme.buttonBg,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        for (var index = 0; index < pending.length; index++)
          Container(
            margin: EdgeInsets.only(top: 6.w, bottom: 6.w),
            padding: EdgeInsets.only(top: 4.w, bottom: 4.w),
            decoration: BoxDecoration(
              color: constTheme.centerChannelColor.withOpacity(0.05),
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                  width: 100.w,
                  child: Row(
                    children: [
                      Icon(Icons.data_usage_rounded, color: constTheme.centerChannelColor, size: 20.w),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: PrimaryText(
                          text: "#${pending[index].index}",
                          size: 14.w,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PrimaryText(
                    text: pending[index].runtimeCall.toString(),
                    size: 13.w,
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  key: Key("referendumStart${pending[index].index}"),
                  onTap: () async {
                    if (!await workCtx.checkAfterTx()) return;

                    if (OkCancelResult.ok ==
                        await showOkCancelAlertDialog(
                          useRootNavigator: false,
                          title: "Notice",
                          message: "开启提案需要质押${pending[index].period.decisionDeposit} WET,投票失败会导致惩罚?",
                          context: globalCtx(),
                          okLabel: L10n.of(globalCtx())!.next,
                          cancelLabel: L10n.of(globalCtx())!.cancel,
                        )) {
                      await waitFutureLoading(
                        context: globalCtx(),
                        future: () async {
                          await rustApi.daoGovStartReferendum(
                            from: workCtx.user.address,
                            client: workCtx.chainClient,
                            daoId: workCtx.org.daoId,
                            index: pending[index].index,
                            deposit: pending[index].period.decisionDeposit,
                          );
                          await workCtx.daoRefresh();
                        },
                      );
                    }
                  },
                  child: renderBox(
                    PrimaryText(
                      text: "Start",
                      size: 13.w,
                      color: constTheme.buttonColor,
                    ),
                  ),
                ),
                SizedBox(width: 25.w),
              ],
            ),
          ),
        if (pending.isNotEmpty) SizedBox(height: 10.w),
        if (showTitle)
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 0.w),
                width: 250.w,
                child: Row(
                  children: [
                    Icon(AppIcons.youxianji, color: constTheme.buttonBg, size: 20.w),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: PrimaryText(
                        text: "Proposal",
                        size: 14.w,
                        color: constTheme.buttonBg,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        for (var index = going.length - 1; index >= 0; index--)
          Container(
            margin: EdgeInsets.only(top: 6.w, bottom: 6.w),
            padding: EdgeInsets.only(top: 4.w, bottom: 4.w),
            decoration: BoxDecoration(
              color: constTheme.centerChannelColor.withOpacity(0.05),
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                  width: 100.w,
                  child: Row(
                    children: [
                      Icon(Icons.bolt_rounded, color: constTheme.centerChannelColor, size: 20.w),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: PrimaryText(
                          text: "#${going[index].id}",
                          size: 14.w,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PrimaryText(
                    text: going[index].proposal.toString(),
                    size: 13.w,
                  ),
                ),
                renderTime(going[index], workCtx),
                Container(
                  width: 80.w,
                  height: 30.w,
                  margin: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(
                    color: constTheme.centerChannelColor.withOpacity(0.06),
                    borderRadius: BorderRadius.all(Radius.circular(5.w)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.w),
                            bottomLeft: Radius.circular(5.w),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            going[index].tally.yes.toString(),
                            // style: TextStyle(height: 30.w, color: constTheme.centerChannelColor),
                          ),
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.w),
                            bottomRight: Radius.circular(5.w),
                          ),
                        ),
                        child: Center(
                          child: Text(going[index].tally.no.toString()),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                renderAction(going[index]),
                SizedBox(width: 25.w),
              ],
            ),
          ),
        if (going.isEmpty)
          Center(
            child: Text(
              "No ongoing proposals found",
              style: TextStyle(color: constTheme.centerChannelColor, fontSize: 13.w),
            ),
          )
      ],
    );
  }

  renderAction(GovReferendum going) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    if (going.status > 0) {
      return renderBox(
        Text(
          going.status == 1 ? "Approved" : "Rejected",
          style: TextStyle(
            color: constTheme.centerChannelColor,
            fontSize: 13.w,
          ),
        ),
        disabled: true,
      );
    }

    return InkWell(
      key: Key("referendumDo${going.id}"),
      onTap: () {
        showModelOrPage(
          globalCtx(),
          "/referendum_vote/${going.id}",
          width: 450.w,
          height: 300.w,
        );
      },
      child: renderBox(
        PrimaryText(
          text: "Vote",
          size: 13.w,
          color: constTheme.buttonColor,
        ),
      ),
    );

    // if (going.end - workCtx.blockNumber > 0) {
    //   final cindex = workCtx.votes.indexWhere((v) => v.referendumIndex == going.id);
    //   return cindex > -1
    //       ? renderBox(
    //           PrimaryText(
    //             text: "Voted",
    //             size: 13.w,
    //             color: constTheme.centerChannelColor,
    //           ),
    //           disabled: true,
    //         )
    //       : InkWell(
    //           key: Key("referendumDo${going.id}"),
    //           onTap: () {
    //             showModelOrPage(
    //               globalCtx(),
    //               "/referendum_vote/${going.id}",
    //               width: 450.w,
    //               height: 300.w,
    //             );
    //           },
    //           child: renderBox(
    //             PrimaryText(
    //               text: "Vote",
    //               size: 13.w,
    //               color: constTheme.buttonColor,
    //             ),
    //           ),
    //         );
    // }
    // if (going.status == 0 &&
    //     going.end - workCtx.blockNumber <= 0 &&
    //     going.end + going.delay - workCtx.blockNumber > 0) {
    //   return renderBox(
    //     PrimaryText(
    //       text: "Delay time",
    //       size: 13.w,
    //       color: constTheme.buttonColor,
    //     ),
    //   );
    // }
    // if (going.status == 0 && going.end - workCtx.blockNumber < 0) {
    //   if (going.tally.yes > 0) {
    //     return InkWell(
    //       key: Key("referendumExecute${going.id}"),
    //       onTap: () async {
    //         if (!await workCtx.checkAfterTx()) return;
    //         await waitFutureLoading(
    //           context: globalCtx(),
    //           future: () async {
    //             await rustApi.daoGovRunProposal(
    //               from: workCtx.user.address,
    //               client: workCtx.chainClient,
    //               daoId: workCtx.org.daoId,
    //               index: going.id,
    //             );
    //             await workCtx.daoRefresh();
    //             if (going.proposal.toLowerCase().contains("integrate")) {
    //               final org = globalCtx().read<OrgCubit>();
    //               org.update();
    //             }
    //           },
    //         );
    //       },
    //       child: renderBox(
    //         PrimaryText(
    //           text: "Execute",
    //           size: 13.w,
    //           color: constTheme.buttonColor,
    //         ),
    //       ),
    //     );
    //   } else {
    //     return renderBox(
    //       disabled: true,
    //       PrimaryText(
    //         text: "Rejected",
    //         size: 13.w,
    //         color: constTheme.buttonColor,
    //       ),
    //     );
    //   }
    // }

    return Container(
      width: 20.w,
      height: 40.w,
      color: Colors.yellow,
    );
  }

  renderBox(box, {disabled = false}) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    return Container(
      width: 80.w,
      height: 30.w,
      decoration: BoxDecoration(
        color: constTheme.buttonBg.withOpacity(disabled ? 0.1 : 1),
        borderRadius: BorderRadius.all(Radius.circular(5.w)),
      ),
      child: Center(child: box),
    );
  }

  renderTime(GovReferendum going, dao) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    if (going.period.confirmPeriod - dao.blockNumber > 0) {
      return SizedBox(
        width: 100.w,
        child: Row(
          children: [
            SizedBox(width: 5.w),
            Expanded(
              child: PrimaryText(
                text: "${going.period.confirmPeriod - dao.blockNumber} block left until the end of voting",
                size: 13.w,
                color: constTheme.centerChannelColor,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 5.w),
          ],
        ),
      );
    }
    if (going.period.confirmPeriod - dao.blockNumber <= 0 &&
        going.period.confirmPeriod + going.period.confirmPeriod - dao.blockNumber > 0) {
      return SizedBox(
        width: 100.w,
        child: Row(
          children: [
            SizedBox(width: 5.w),
            Expanded(
              child: PrimaryText(
                text:
                    "${going.period.confirmPeriod + going.period.confirmPeriod - dao.blockNumber} block left until execution ",
                size: 13.w,
                color: constTheme.centerChannelColor,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 5.w),
          ],
        ),
      );
    }
    return const SizedBox(
      width: 0,
    );
  }
}
