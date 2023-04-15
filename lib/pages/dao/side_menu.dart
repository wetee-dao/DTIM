import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../components/appicon.dart';
import '../../store/theme.dart';

class SideMenu extends StatelessWidget {
  final int id;
  final Function(int) onTap;
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
            isPc()
                ? Container(
                    height: 15.w,
                    alignment: Alignment.topCenter,
                  )
                : const SizedBox(
                    height: 50,
                  ),
            iconBuilder(
              assetName: Icons.apps_rounded,
              name: "Overview",
              color: constTheme,
              selected: id == 0,
              onTap: () => onTap(0),
            ),
            iconBuilder(
              assetName: Icons.integration_instructions_rounded,
              name: "RoadMap",
              color: constTheme,
              selected: id == 1,
              onTap: () => onTap(1),
            ),
            iconBuilder(
              assetName: Icons.how_to_vote_rounded,
              name: "Referendums",
              color: constTheme,
              selected: id == 2,
              onTap: () => onTap(2),
            ),
            iconBuilder(
              assetName: Icons.library_add_rounded,
              name: "Combind Boards",
              color: constTheme,
              selected: id == 3,
              onTap: () => onTap(3),
            ),
            Divider(color: constTheme.centerChannelDivider),
            iconBuilder(
              assetName: Appicon.zuzhiDataOrganization6,
              name: "Guilds & Projects",
              color: constTheme,
              selected: id == 4,
              onTap: () => onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}

iconBuilder({
  required IconData assetName,
  required String name,
  required ExtColors color,
  bool? selected,
  Function? onTap,
}) =>
    InkWell(
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
            Text(name, style: TextStyle(color: color.sidebarText, fontSize: 14.w, height: 1)),
          ],
        ),
      ),
      onTap: () => onTap?.call(),
    );
