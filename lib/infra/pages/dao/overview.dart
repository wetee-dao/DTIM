import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:asyou_app/infra/components/components.dart';
import 'package:asyou_app/infra/components/dao/dao_is_joined.dart';
import 'package:asyou_app/infra/components/dao/info_card.dart';
import 'package:asyou_app/infra/components/dao/payments_detail_list.dart';
import 'package:asyou_app/infra/components/dao/text.dart';
import 'package:asyou_app/application/store/dao_ctx.dart';
import 'package:asyou_app/application/store/theme.dart';
import 'sub/referendum.dart';

class Overviewpage extends StatelessWidget {
  const Overviewpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.apps_rounded, size: 30.w, color: constTheme.centerChannelColor),
                          SizedBox(width: 10.w),
                          PrimaryText(text: 'Overview', size: 25.w, fontWeight: FontWeight.w800),
                        ],
                      ),
                      SizedBox(height: 5.w),
                      PrimaryText(
                        text: 'Data overview in DAO',
                        size: 14.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  Consumer<DAOCTX>(
                    builder: (_, dao, child) {
                      return SizedBox(
                        width: double.maxFinite,
                        child: Wrap(
                          runSpacing: 20.w,
                          spacing: 20.w,
                          alignment: WrapAlignment.start,
                          children: [
                            InfoCard(
                              icon: AppIcons.zichan,
                              label: "Treasury",
                              amount: 'WTE ${dao.daoAmount.free.toString()}',
                            ),
                            InfoCard(
                              icon: AppIcons.share,
                              label: "Issued SHARE",
                              amount: dao.totalIssuance.toString(),
                            ),
                            InfoCard(
                              icon: AppIcons.zuzhi_data_organization_6,
                              label: "Skilled Guild",
                              amount: '${dao.guilds.length}',
                            ),
                            InfoCard(
                              icon: AppIcons.xiangmu,
                              label: "Project",
                              amount: '${dao.projects.length}',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.how_to_vote_rounded, size: 30.w, color: constTheme.centerChannelColor),
                          SizedBox(width: 10.w),
                          PrimaryText(
                            text: 'Open Referendums',
                            size: 25.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.w),
                      PrimaryText(
                        text: 'Recent ongoing voting',
                        size: 14.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  Consumer<DAOCTX>(builder: (_, dao, child) {
                    return Referendums(
                      wrap: false,
                      showTitle: false,
                      pending: dao.pending.where((r) => r.memberGroup.scope == 1).toList(),
                      going: dao.going.where((r) => r.memberGroup.scope == 1).toList(),
                    );
                  })
                ],
              ),
            ),
          ),
          Container(
            height: double.maxFinite,
            width: 260.w,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: constTheme.centerChannelColor.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Consumer<DAOCTX>(builder: (_, dao, child) {
              return DaoIsJoined(
                isJoined: dao.members.contains(dao.user.address),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.w),
                  child: PaymentsDetailList(
                    dao: dao.dao,
                    address: dao.ss58Address,
                    share: dao.share,
                    nativeAmount: dao.nativeAmount,
                    userPoint: dao.userPoint,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
