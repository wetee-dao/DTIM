import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Drawer(
      elevation: 2,
      child: Container(
        height: double.maxFinite,
        color: constTheme.sidebarBg,
        child: SingleChildScrollView(
          child: Column(
            children: [
              isPc()
                  ? Container(
                      height: 20.w,
                      alignment: Alignment.topCenter,
                    )
                  : const SizedBox(
                      height: 50,
                    ),
              iconBuilder(
                assetName: Icons.apps_rounded,
                name: "Overview",
                color: constTheme.sidebarText,
                selected: true,
              ),
              // iconBuilder(
              //   assetName: Icons.leaderboard_rounded,
              //   name: "Leaderboards",
              //   color: constTheme.sidebarText,
              // ),
              iconBuilder(
                assetName: Icons.integration_instructions_rounded,
                name: "RoadMap",
                color: constTheme.sidebarText,
              ),
              iconBuilder(
                assetName: Icons.library_add_rounded,
                name: "Combind Boards",
                color: constTheme.sidebarText,
              ),
              // iconBuilder(
              //   assetName: Icons.settings_applications_rounded,
              //   name: "Settings",
              //   color: constTheme.sidebarText,
              // ),
              iconBuilder(
                assetName: Icons.dynamic_form_rounded,
                name: "Guilds",
                color: constTheme.sidebarText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

iconBuilder({required IconData assetName, required String name, required Color color, bool? selected}) => Container(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.w),
      color: selected != null && selected ? color.withOpacity(0.08) : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // IconButton(
          //   onPressed: () {},
          //   icon: assetName,
          //   iconSize: 20,
          //   color: color,
          //   padding: const EdgeInsets.symmetric(vertical: 20.0),
          // )
          Icon(assetName, size: 16.w, color: color),
          SizedBox(width: 10.w),
          Text(name, style: TextStyle(color: color, fontSize: 15.w, height: 1)),
        ],
      ),
    );