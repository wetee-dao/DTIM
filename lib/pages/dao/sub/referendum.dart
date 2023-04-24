import 'package:asyou_app/store/dao_ctx.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../../bridge_generated.dart';
import '../../../components/appicon.dart';
import '../../../components/dao/text.dart';
import '../../../router.dart';
import '../../../rust_wraper.io.dart';
import '../../../store/theme.dart';

class Referendums extends StatelessWidget {
  final List<GovProps> pending;
  final List<GovReferendum> going;
  final bool showTitle;
  const Referendums({Key? key, required this.pending, required this.going, this.showTitle = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Column(
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
                          text: "Pending regerendum",
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
              decoration: BoxDecoration(
                color: constTheme.centerChannelColor.withOpacity(0.05),
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
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
                    onTap: () {
                      rustApi.daoGovStartReferendum(
                        from: daoCtx.user.address,
                        client: daoCtx.chainClient,
                        daoId: daoCtx.org.daoId,
                        index: index,
                      );
                    },
                    child: renderBox(
                      PrimaryText(
                        text: "开始投票",
                        size: 13.w,
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
                      Icon(Appicon.youxianji, color: constTheme.buttonBg, size: 20.w),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: PrimaryText(
                          text: "Going regerendum",
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
              decoration: BoxDecoration(
                color: constTheme.centerChannelColor.withOpacity(0.05),
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
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
                  renderTime(going[index], daoCtx),
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
                "未找到正在进行中的提案",
                style: TextStyle(color: constTheme.centerChannelColor, fontSize: 13.w),
              ),
            )
        ],
      ),
    );
  }

  renderAction(going) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    if (going.status > 0) {
      return renderBox(
        Text(
          going.status == 1 ? "已通过" : "已拒绝",
          style: TextStyle(
            color: constTheme.centerChannelColor,
            fontSize: 13.w,
          ),
        ),
        disabled: true,
      );
    }
    if (going.end - daoCtx.blockNumber > 0) {
      final cindex = daoCtx.votes.indexWhere((v) => v.referendumIndex == going.id);
      return cindex > -1
          ? renderBox(
              PrimaryText(
                text: "已投票",
                size: 13.w,
                color: constTheme.centerChannelColor,
              ),
              disabled: true,
            )
          : InkWell(
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
                  text: "投票",
                  size: 13.w,
                  color: constTheme.buttonColor,
                ),
              ),
            );
    }
    if (going.status == 0 && going.end - daoCtx.blockNumber <= 0 && going.end + going.delay - daoCtx.blockNumber > 0) {
      return renderBox(
        PrimaryText(
          text: "冷静期",
          size: 13.w,
          color: constTheme.buttonColor,
        ),
      );
    }
    if (going.status == 0 && going.end - daoCtx.blockNumber < 0) {
      return InkWell(
        onTap: () {
          rustApi.daoGovRunProposal(
            from: daoCtx.user.address,
            client: daoCtx.chainClient,
            daoId: daoCtx.org.daoId,
            index: going.id,
          );
        },
        child: renderBox(
          PrimaryText(
            text: "执行",
            size: 13.w,
            color: constTheme.buttonColor,
          ),
        ),
      );
    }
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

  renderTime(going, dao) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    if (going.end - dao.blockNumber > 0) {
      return SizedBox(
        width: 100.w,
        child: Row(
          children: [
            SizedBox(width: 5.w),
            Expanded(
              child: PrimaryText(
                text: "投票结束剩余 ${going.end - dao.blockNumber} 区块",
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
    if (going.end - dao.blockNumber <= 0 && going.end + going.delay - dao.blockNumber > 0) {
      return SizedBox(
        width: 100.w,
        child: Row(
          children: [
            SizedBox(width: 5.w),
            Expanded(
              child: PrimaryText(
                text: "距离执行剩余 ${going.end + going.delay - dao.blockNumber} 区块",
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
