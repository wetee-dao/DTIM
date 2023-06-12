import 'package:flutter/material.dart';

import 'package:asyou_app/application/store/theme.dart';
import 'package:asyou_app/domain/utils/functions.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import '../components.dart';
import '../dao/text.dart';

class DaoMemberList extends StatelessWidget {
  final InputDecoration decoration;
  final Widget prefixIcon;
  final List<String> members;
  const DaoMemberList({
    Key? key,
    required this.decoration,
    required this.prefixIcon,
    required this.members,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      decoration: BoxDecoration(color: decoration.fillColor, borderRadius: BorderRadius.all(Radius.circular(4.w))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 12.w, bottom: 5.w, right: 9.w),
                child: prefixIcon,
              ),
              Container(
                width: 59.w,
                margin: EdgeInsets.only(top: 11.w),
                child: Text(
                  decoration.hintText ?? "",
                  style: decoration.hintStyle,
                ),
              ),
            ],
          ),
          for (var i = 0; i < members.length; i++)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAvatar(
                    members[i],
                    true,
                    35.w,
                    color: constTheme.centerChannelColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: PrimaryText(
                      text: getUserShortName(members[i], len: 15),
                      size: 13.w,
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 8.w)
        ],
      ),
    );
  }
}
