import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/infra/pages/work/roadmap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/close_bar.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/application/store/im.dart';
import 'package:dtim/application/store/theme.dart';

import 'guild.dart';
import 'project.dart';
import 'side_menu.dart';

@RoutePage(name: "daoRoute")
class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  late final AppCubit im;
  String pageStr = "RoadMap";
  Timer? _timer;
  int? c;

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    workCtx.setOrg(im.currentState!.org, im.me!);
    workCtx.connectChain(() {
      getData();
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        workCtx.timeTick();
      });
    });
  }

  getData() async {
    workCtx.getVoteData();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> drawerKey = GlobalKey(debugLabel: "drawer");
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      key: drawerKey,
      backgroundColor: constTheme.centerChannelBg,
      drawer: isPc()
          ? null
          : SizedBox(
              width: 70.w,
              child: SideMenu(
                pageStr,
                (id) {
                  setState(() {
                    pageStr = id;
                  });
                },
              ),
            ),
      appBar: isPc()
          ? SideBarAppBar(
              height: 45.w,
              title: "Kanban",
              showMacosTop: false,
              leading: InkWell(
                onTap: () {
                  drawerKey.currentState!.openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Icon(
                    AppIcons.kanban,
                    color: constTheme.sidebarHeaderTextColor,
                    size: 22.w,
                  ),
                ),
              ),
              tools: CloseBar(color: constTheme.sidebarText),
            )
          : null,
      body: workCtx.chainClient > -1
          ? ChangeNotifierProvider.value(
              key: const Key("workView"),
              value: workCtx,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isPc() || PlatformInfos.isWeb)
                    SizedBox(
                      width: 170.w,
                      child: SideMenu(
                        pageStr,
                        (id) {
                          setState(() {
                            pageStr = id;
                          });
                        },
                      ),
                    ),
                  Expanded(
                    child: pageRender(pageStr),
                  )
                ],
              ),
            )
          : Center(child: CircularProgressIndicator.adaptive(strokeWidth: 4.w)),
    );
  }

  pageRender(id) {
    if (pageStr.contains("Guilds")) {
      final ids = pageStr.split(" ");
      final guild = workCtx.guilds.firstWhere((element) => element.id.toString() == ids[1]);
      return Guildpage(guild: guild);
    }
    if (pageStr.contains("Projects")) {
      final ids = pageStr.split(" ");
      final project = workCtx.projects.firstWhere((element) => element.id.toString() == ids[1]);
      return ProjectPage(info: project);
    }

    return const RoadMapPage();
  }

  int getPageIndex(str) {
    pageStr = str;
    switch (str) {
      case "RoadMap":
        return 0;
      // case "Combind Boards":
      //   return 3;
      default:
        if (str.contains("Guilds")) {
          return 1;
        }
        if (str.contains("Projects")) {
          return 2;
        }
    }
    return 0;
  }
}
