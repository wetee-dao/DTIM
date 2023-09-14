import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/infra/components/iconfont.dart';
import 'package:dtim/infra/router/pop_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dtim/infra/components/dao/text.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/application/store/theme.dart';

import '../../../x_bridge.dart';
import 'sub/treasury.dart';

class TreasuryPage extends StatefulWidget {
  // final PageController pageController;
  final Function(String) toVote;
  const TreasuryPage({Key? key, required this.toVote}) : super(key: key);

  @override
  State<TreasuryPage> createState() => _TreasuryPageState();
}

class _TreasuryPageState extends State<TreasuryPage> {
  late final WorkCTX dao;
  List<Treasury> list = [];

  @override
  void initState() {
    super.initState();
    dao = context.read<WorkCTX>();
    getData();
  }

  getData() async {
    // var ls = await XXXXdaoTreasuryProposals(client: dao.chainClient, orgId: dao.org.daoId);
    // print(ls);
    // if (mounted) {
    //   setState(() {
    //     list = ls;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      key: const Key("TreasuryView"),
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
                  children: [
                    Icon(
                      AppIcons.zichan,
                      size: 30.w,
                      color: constTheme.centerChannelColor,
                    ),
                    SizedBox(width: 10.w),
                    PrimaryText(
                      text: 'Treasurys',
                      size: 25.w,
                      fontWeight: FontWeight.w800,
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () async {
                        showModelOrPage(context, "/create_treasury", width: 500, height: 500);
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
                              Icons.bubble_chart_rounded,
                              size: 20.w,
                              color: constTheme.buttonColor,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "Proposal",
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
                  text: "Fund usage is determined through community proposals and voting.",
                  size: 14.w,
                ),
                SizedBox(height: 5.w),
              ],
            ),
          ),
          SizedBox(height: 15.w),
          Divider(
            height: 1,
            color: constTheme.centerChannelDivider,
          ),
          SizedBox(height: 15.w),
          Expanded(
            child: TreasuryList(
              datas: list,
              toVote: () {
                widget.toVote("Referenda");
              },
            ),
          ),
        ],
      ),
    );
  }
}
