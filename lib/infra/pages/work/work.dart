import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/infra/pages/work/referendum.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/close_bar.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/application/store/im.dart';
import 'package:dtim/application/store/theme.dart';

import 'guild.dart';
import 'overview.dart';
import 'project.dart';
import 'roadmap.dart';
import 'side_menu.dart';

@RoutePage(name: "daoRoute")
class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final mainPages = [
    const Overviewpage(),
    const RoadMapPage(),
    const ReferendumPage(),
    // const CombindBoardPage(),
    Container(),
    Guildpage(key: guildKey),
    ProjectPage(key: projectKey)
  ];
  late PageController pageController = PageController();
  late final AppCubit im;
  final StreamController<String> currentId = StreamController<String>.broadcast();
  String pageStr = "Overview";
  String title = "";
  Timer? _timer;
  int? c;

  @override
  void initState() {
    super.initState();
    currentId.add(pageStr);
    im = context.read<AppCubit>();
    workCtx.connectChain(im.currentState!.org, im.me!, () {
      getData();
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        // print("获取新的区块头");
        workCtx.timeTick();
      });
    });
  }

  getData() async {
    workCtx.getVoteData();
    if (mounted) {
      setState(() {
        title = workCtx.dao.name;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    workCtx.disconnectChain();
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
              child: StreamBuilder(
                stream: currentId.stream,
                builder: (BuildContext context, AsyncSnapshot<String> id) {
                  return SideMenu(id.data ?? pageStr, (id) {
                    pageController.jumpToPage(getPageIndex(id));
                    currentId.add(id);
                  });
                },
              ),
            ),
      appBar: isPc()
          ? SideBarAppBar(
              height: 45.w,
              title: "Dwork",
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
              key: const Key("daoView"),
              value: workCtx,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isPc() || PlatformInfos.isWeb)
                    SizedBox(
                      width: 170.w,
                      child: StreamBuilder(
                        stream: currentId.stream,
                        builder: (BuildContext context, AsyncSnapshot<String> id) {
                          return SideMenu(id.data ?? pageStr, (id) {
                            final index = getPageIndex(id);
                            pageController
                                .animateToPage(index,
                                    duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)
                                .then((v) {
                              pageHook();
                            });

                            currentId.add(id);
                            if (c != null) {}
                          });
                        },
                      ),
                    ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      onPageChanged: (page) {},
                      children: mainPages,
                    ),
                  )
                ],
              ),
            )
          : Center(child: CircularProgressIndicator.adaptive(strokeWidth: 4.w)),
    );
  }

  pageHook() {
    if (pageStr.contains("Guilds")) {
      final ids = pageStr.split(" ");
      final guildState = guildKey.currentState as GuildpageState;
      final guild = workCtx.guilds.firstWhere((element) => element.id.toString() == ids[1]);
      guildState.init(guild);
    }
    if (pageStr.contains("Projects")) {
      final ids = pageStr.split(" ");
      final projectState = projectKey.currentState as ProjectPageState;
      final project = workCtx.projects.firstWhere((element) => element.id.toString() == ids[1]);
      // guildKey.currentState?.getData();
      projectState.init(project);
    }
  }

  int getPageIndex(str) {
    pageStr = str;
    switch (str) {
      case "Overview":
        return 0;
      case "RoadMap":
        return 1;
      case "Referendums":
        return 2;
      // case "Combind Boards":
      //   return 3;
      default:
        if (str.contains("Guilds")) {
          return 4;
        }
        if (str.contains("Projects")) {
          return 5;
        }
    }
    return 0;
  }
}
