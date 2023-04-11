import 'dart:async';

import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../components/app_bar.dart';
import '../../components/appicon.dart';
import '../../rust_wraper.io.dart';
import '../../store/theme.dart';
import 'board.dart';
import 'overview.dart';
import 'road_map.dart';
import 'side_menu.dart';

class DaoPage extends StatefulWidget {
  const DaoPage({Key? key}) : super(key: key);

  @override
  State<DaoPage> createState() => _DaoPageState();
}

class _DaoPageState extends State<DaoPage> {
  late PageController pageController = PageController();
  final StreamController<int> currentId = StreamController<int>.broadcast();
  int? c;
  @override
  void initState() {
    super.initState();
    currentId.add(0);
    rustApi.connect(url: "ws://127.0.0.1:9944").then((value) {
      print(value);
      c = value;
    });
  }

  final mainPages = [
    Kanban(),
    const Overviewpage(),
    const RoadMapPage(),
  ];

  @override
  void dispose() {
    super.dispose();
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
                builder: (BuildContext context, AsyncSnapshot<int> id) {
                  return SideMenu(id.data ?? 0, (id) {
                    pageController.jumpToPage(id);
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
          : LocalAppBar(
              height: 50.w,
              title: "Wetee DAO",
              showMacosTop: false,
              leading: IconButton(
                onPressed: () {
                  drawerKey.currentState!.openDrawer();
                },
                icon: Icon(
                  Appicon.organcode,
                  color: constTheme.sidebarHeaderTextColor,
                ),
              ),
              // actions: const [AppBarActionItem()],
            ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPc())
            SizedBox(
              width: 170.w,
              child: StreamBuilder(
                stream: currentId.stream,
                builder: (BuildContext context, AsyncSnapshot<int> id) {
                  return SideMenu(id.data ?? 0, (id) {
                    pageController.jumpToPage(id);
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
              // onPageChanged: onPageChanged,
              children: mainPages,
            ),
            // child: Overviewpage(),
          ),
        ],
      ),
    );
  }
}
