import 'dart:async';

import 'package:asyou_app/pages/dao/referendum.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/app_bar.dart';
import '../../components/appicon.dart';
import '../../components/close_bar.dart';
import '../../store/dao_ctx.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import 'guild.dart';
import 'overview.dart';
import 'project.dart';
import 'roadmap.dart';
import 'side_menu.dart';

class DaoPage extends StatefulWidget {
  const DaoPage({Key? key}) : super(key: key);

  @override
  State<DaoPage> createState() => _DaoPageState();
}

class _DaoPageState extends State<DaoPage> {
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
  final StreamController<String> currentId = StreamController<String>.broadcast();
  String pageStr = "Overview";
  late final IMProvider im;
  Timer? _timer;
  int? c;

  @override
  void initState() {
    super.initState();
    currentId.add(pageStr);
    im = context.read<IMProvider>();
    daoCtx.connectChain(im.currentState!.org, im.me!, () {
      getData();
    });
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      daoCtx.timeTick();
    });
  }

  getData() async {
    setState(() {});
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
      appBar: !isPc()
          ? AppBar(
              elevation: 0,
              backgroundColor: constTheme.sidebarHeaderBg,
              leading: IconButton(
                onPressed: () {
                  drawerKey.currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: constTheme.sidebarHeaderTextColor,
                ),
              ),
              // actions: const [AppBarActionItem()],
            )
          : SideBarAppBar(
              height: 45.w,
              title: "Wetee DAO",
              showMacosTop: false,
              leading: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: IconButton(
                  onPressed: () {
                    drawerKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Appicon.organcode,
                    color: constTheme.sidebarHeaderTextColor,
                  ),
                ),
              ),
              tools: CloseBar(color: constTheme.sidebarText),
            ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPc())
            SizedBox(
              width: 170.w,
              child: StreamBuilder(
                stream: currentId.stream,
                builder: (BuildContext context, AsyncSnapshot<String> id) {
                  return ChangeNotifierProvider.value(
                    value: daoCtx,
                    child: SideMenu(id.data ?? pageStr, (id) {
                      final index = getPageIndex(id);

                      pageController
                          .animateToPage(
                        index,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      )
                          .then((v) {
                        pageHook();
                      });

                      currentId.add(id);
                      if (c != null) {}
                    }),
                  );
                },
              ),
            ),
          Expanded(
            child: daoCtx.chainClient > -1
                ? ChangeNotifierProvider.value(
                    value: daoCtx,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      onPageChanged: (page) {},
                      children: mainPages,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  pageHook() {
    if (pageStr.contains("Guilds")) {
      final ids = pageStr.split(" ");
      Timer(const Duration(milliseconds: 100), () {
        final guildState = guildKey.currentState as GuildpageState;
        final guild = daoCtx.guilds.firstWhere((element) => element.id.toString() == ids[1]);
        guildState.getData(guild);
      });
    }
    if (pageStr.contains("Projects")) {
      final ids = pageStr.split(" ");
      Timer(const Duration(milliseconds: 100), () {
        final projectState = projectKey.currentState as ProjectPageState;
        final project = daoCtx.projects.firstWhere((element) => element.id.toString() == ids[1]);
        // guildKey.currentState?.getData();
        projectState.getData(project);
      });
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
