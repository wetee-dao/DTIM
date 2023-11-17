import 'package:dtim/domain/utils/screen/screen.dart';

import 'package:flutter/material.dart';

import 'package:dtim/infra/components/dao/text.dart';
import 'package:dtim/router.dart';
import 'package:dtim/application/store/theme.dart';

class TreasuryList extends StatelessWidget {
  final List<Treasury> datas;
  final Function toVote;
  const TreasuryList({Key? key, required this.datas, required this.toVote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        for (var index = datas.length - 1; index >= 0; index--)
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
                  width: 160.w,
                  child: Row(
                    children: [
                      Icon(Icons.bolt_rounded, color: constTheme.centerChannelColor, size: 20.w),
                      SizedBox(width: 10.w),
                      PrimaryText(
                        text: "#${datas[index].proposalIndex}",
                        size: 14.w,
                      ),
                      SizedBox(width: 5.w),
                      PrimaryText(
                        text: "Onging",
                        size: 14.w,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.account_box_rounded, color: constTheme.centerChannelColor, size: 15.w),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: PrimaryText(
                          text: "Beneficiary: ${datas[index].beneficiary}",
                          size: 14.w,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PrimaryText(
                        text: "${datas[index].value}  WTE",
                        size: 13.w,
                      ),
                      SizedBox(width: 20.w)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    toVote();
                  },
                  child: Container(
                    width: 80.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      color: constTheme.buttonBg.withOpacity(1),
                      borderRadius: BorderRadius.all(Radius.circular(5.w)),
                    ),
                    child: Center(
                      child: Text("Go to vote", style: TextStyle(color: constTheme.buttonColor, fontSize: 13.w)),
                    ),
                  ),
                ),
                SizedBox(width: 20.w)
              ],
            ),
          ),
        if (datas.isEmpty)
          Center(
            child: Text(
              "No proposals found",
              style: TextStyle(color: constTheme.centerChannelColor, fontSize: 13.w),
            ),
          )
      ],
    );
  }
}

const status = {
  0: "Onging",
  1: "Approval",
  3: "Approval",
};
