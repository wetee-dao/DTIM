import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';

class SideMenu extends StatelessWidget {
  final String id;
  final Function(String) onTap;
  const SideMenu(this.id, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: constTheme.sidebarBg,
        border: Border(
          right: BorderSide(
            color: constTheme.centerChannelColor.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 15.w,
              alignment: Alignment.topCenter,
            ),
            iconBuilder(
              key: const Key("Overview"),
              assetName: Icons.apps_rounded,
              name: "Overview",
              color: constTheme,
              selected: id == "Overview",
              onTap: () => onTap("Overview"),
            ),
            iconBuilder(
              key: const Key("Members"),
              assetName: Icons.perm_contact_calendar_rounded,
              name: "Members",
              color: constTheme,
              selected: id == "Members",
              onTap: () => onTap("Members"),
            ),
            iconBuilder(
              key: const Key("Referendums"),
              assetName: Icons.how_to_vote_rounded,
              name: "Referendums",
              color: constTheme,
              selected: id == "Referendums",
              onTap: () => onTap("Referendums"),
            ),
            // iconBuilder(
            //   assetName: Icons.library_add_rounded,
            //   name: "Combind Boards",
            //   color: constTheme,
            //   selected: id == "Combind Boards",
            //   onTap: () => onTap("Combind Boards"),
            // ),
          ],
        ),
      ),
    );
  }
}

iconBuilder({
  Key? key,
  required IconData assetName,
  required String name,
  required ExtColors color,
  bool? selected,
  Function? onTap,
}) =>
    InkWell(
      key: key,
      child: Container(
        padding: EdgeInsets.only(top: 10.w, bottom: 10.w, left: 12.w),
        decoration: BoxDecoration(
          color: selected != null && selected ? color.sidebarText.withOpacity(0.08) : null,
          border: Border(
            left: BorderSide(
              width: 2.w,
              color: selected != null && selected ? color.sidebarTextActiveBorder : Colors.transparent,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(assetName, size: 16.w, color: color.sidebarText),
            SizedBox(width: 10.w),
            Expanded(child: Text(name, style: TextStyle(color: color.sidebarText, fontSize: 14.w, height: 1))),
          ],
        ),
      ),
      onTap: () => onTap?.call(),
    );
