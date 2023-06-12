import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

import 'package:asyou_app/infra/components/dao/member_card.dart';

class Members extends StatelessWidget {
  final List<String> members;
  const Members({Key? key, required this.members}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: Wrap(
        runSpacing: 20.w,
        spacing: 20.w,
        alignment: WrapAlignment.start,
        children: [
          for (var member in members)
            MemberCard(
              // icon: AppIcons.zuzhiDataOrganization6,
              label: member,
              // amount: '\$1200',
            ),
        ],
      ),
    );
  }
}
