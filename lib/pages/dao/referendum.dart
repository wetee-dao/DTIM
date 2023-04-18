// 初始化一个页面
import 'package:asyou_app/utils/screen.dart';
import 'package:date_format/date_format.dart';
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
  List<GovProps> notStarts = [];

  @override
  void initState() {
    super.initState();
    dao = context.read<DAOCTX>();
    getData();
  }

  getData() async {
    notStarts = await rustApi.getDaoGovPublicProps(client: dao.chainClient, daoId: dao.org.daoId);
    setState(() {});
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
                              Icon(Icons.inbox, color: constTheme.centerChannelColor, size: 20.w),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: PrimaryText(
                                  text: "regerendum hash",
                                  size: 14.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: PrimaryText(
                            text: "runtime_call",
                            size: 13.w,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        PrimaryText(
                          text: "",
                          size: 13.w,
                        ),
                        SizedBox(width: 25.w),
                      ],
                    ),
                  ),
                  for (var index = 0; index < notStarts.length; index++)
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
                            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
                            width: 250.w,
                            child: Row(
                              children: [
                                Icon(Icons.task_rounded, color: constTheme.centerChannelColor, size: 20.w),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: PrimaryText(
                                    text: notStarts[index].hash,
                                    size: 14.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: PrimaryText(
                              text: notStarts[index].runtimeCall.toString(),
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
                                  index: notStarts[index].index);
                            },
                            child: PrimaryText(
                              text: "开始投票",
                              size: 13.w,
                            ),
                          ),
                          SizedBox(width: 25.w),
                        ],
                      ),
                    ),
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
            //   rows: notStarts.map((data) {
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
}
