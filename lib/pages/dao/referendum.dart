// 初始化一个页面
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
                      text: 'RoadMap',
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
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(0.45),
                  1: FlexColumnWidth(0.45),
                  2: FlexColumnWidth(0.1),
                },
                defaultColumnWidth: const FlexColumnWidth(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: List.generate(
                  notStarts.length,
                  (index) => TableRow(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 10.w, bottom: 10.w, right: 10.w),
                        child: Row(
                          children: [
                            Icon(Icons.task_rounded, color: constTheme.centerChannelColor, size: 20.w),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: PrimaryText(
                                text: "(${notStarts[index].index}) - ${notStarts[index].hash}",
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PrimaryText(
                        text: notStarts[index].runtimeCall.toString(),
                        size: 16,
                      ),
                      PrimaryText(
                        text: notStarts[index].memberGroup,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
