import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/application/store/dao_ctx.dart';
import 'package:dtim/application/store/theme.dart';

import '../../router/pop_router.dart';

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
              height: 20.w,
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
              key: const Key("RoadMap"),
              assetName: Icons.integration_instructions_rounded,
              name: "RoadMap",
              color: constTheme,
              selected: id == "RoadMap",
              onTap: () => onTap("RoadMap"),
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
            Divider(color: constTheme.sidebarText.withOpacity(0.18)),
            Consumer<DAOCTX>(builder: (_, dao, child) {
              return Column(
                children: [
                  ...dao.guilds.map((e) => iconBuilder(
                        key: Key("Guilds ${e.id.toString()}"),
                        assetName: AppIcons.zuzhi_data_organization_6,
                        name: e.name,
                        color: constTheme,
                        selected: id == "Guilds ${e.id.toString()}",
                        onTap: () => onTap("Guilds ${e.id.toString()}"),
                      )),
                  ...dao.projects.map((e) => iconBuilder(
                        key: Key("Projects ${e.id.toString()}"),
                        assetName: AppIcons.xiangmu,
                        name: e.name,
                        color: constTheme,
                        selected: id == "Projects ${e.id.toString()}",
                        onTap: () => onTap("Projects ${e.id.toString()}"),
                      )),
                ],
              );
            }),
            InkWell(
              key: const Key("createGuildProject"),
              child: Container(
                margin: EdgeInsets.all(10.w),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
                decoration: BoxDecoration(
                  // color: constTheme.buttonBg.withOpacity(0.1),
                  border: Border.all(color: constTheme.sidebarText.withOpacity(0.1), width: 2.w),
                  borderRadius: BorderRadius.all(Radius.circular(8.w)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_rounded, size: 32.w, color: constTheme.sidebarText),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        "Create guild or project",
                        style: TextStyle(color: constTheme.sidebarText, fontSize: 13.w, height: 1),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                showModelOrPage(context, "/create_dao_project");
              },
            )
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
