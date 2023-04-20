// 初始化一个页面
import 'package:asyou_app/components/components.dart';
import 'package:asyou_app/router.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bridge_generated.dart';
import '../../components/dao/text.dart';
import '../../rust_wraper.io.dart';
import '../../store/dao_ctx.dart';
import '../../store/theme.dart';
import '../../utils/responsive.dart';

class ReferendumPage extends StatefulWidget {
  const ReferendumPage({Key? key}) : super(key: key);

  @override
  State<ReferendumPage> createState() => _ReferendumPageState();
}

class _ReferendumPageState extends State<ReferendumPage> {
  late final DAOCTX dao;
  List<GovProps> pending = [];
  List<GovReferendum> going = [];

  @override
  void initState() {
    super.initState();
    dao = context.read<DAOCTX>();
    getData();
  }

  getData() async {
    pending = await rustApi.daoGovPendingReferendumList(client: dao.chainClient, daoId: dao.org.daoId);
    going = await rustApi.daoGovReferendumList(client: dao.chainClient, daoId: dao.org.daoId);
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
                      Icons.integration_instructions_rounded,
                      size: 30.w,
                      color: constTheme.centerChannelColor,
                    ),
                    SizedBox(width: 10.w),
                    PrimaryText(
                      text: 'Referendums',
                      size: 25.w,
                      fontWeight: FontWeight.w800,
                    ),
                    Expanded(child: Container()),
                    if (dao.votes.isNotEmpty)
                      InkWell(
                        onTap: () {
                          rustApi.daoGovUnlock(from: dao.user.address, client: dao.chainClient, daoId: dao.org.daoId);
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
                                Icons.undo_rounded,
                                size: 20.w,
                                color: constTheme.buttonColor,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "unlock share",
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
                  text: '工会与项目',
                  size: 14.w,
                ),
                SizedBox(height: 5.w),
              ],
            ),
          ),
          SizedBox(height: 15.w),
          Divider(
            height: 20,
            color: constTheme.centerChannelDivider,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                children: [
                  if (pending.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 6.w, bottom: 6.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
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
                                from: dao.user.address,
                                client: dao.chainClient,
                                daoId: dao.org.daoId,
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
                  Container(
                    margin: EdgeInsets.only(top: 6.w, bottom: 6.w),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
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
            ),

            // child: ScrollableTableView(
            //   paginationController: _paginationController,
            //   columns: const [
            //     TableViewColumn(
            //       label: "投票id",
            //     ),
            //     TableViewColumn(
            //       label: "投票内容",
            //     ),
            //     TableViewColumn(
            //       label: "操作",
            //     )
            //   ],
            //   rows: pending.map((data) {
            //     return TableViewRow(height: 60, cells: [
            //       TableViewCell(
            //         child: Text("(${data.index}) - ${data.hash}"),
            //       ),
            //       TableViewCell(
            //         child: Text(data.runtimeCall),
            //       ),
            //       TableViewCell(
            //         child: Text("view"),
            //       ),
            //     ]);
            //   }).toList(),
            // ),
          ),
        ],
      ),
    );
  }

  renderAction(going) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final daos = Provider.of<DAOCTX>(context);
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
    if (going.end - dao.blockNumber > 0) {
      final cindex = daos.votes.indexWhere((v) => v.referendumIndex == going.id);
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
                  context,
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
    if (going.status == 0 && going.end - dao.blockNumber < 0 && going.end + going.delay - dao.blockNumber > 0) {
      return renderBox(
        PrimaryText(
          text: "冷静期",
          size: 13.w,
          color: constTheme.buttonColor,
        ),
      );
    }
    if (going.status == 0 && going.end - dao.blockNumber < 0) {
      return InkWell(
        onTap: () {
          rustApi.daoGovRunProposal(
            from: dao.user.address,
            client: dao.chainClient,
            daoId: dao.org.daoId,
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
    final constTheme = Theme.of(context).extension<ExtColors>()!;
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
}
