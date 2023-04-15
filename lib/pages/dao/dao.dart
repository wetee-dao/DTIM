import 'dart:async';

import 'package:asyou_app/pages/dao/referendum.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/app_bar.dart';
import '../../components/appicon.dart';
import '../../components/close_bar.dart';
import '../../rust_wraper.io.dart';
import '../../store/dao_ctx.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import 'board.dart';
import 'guild.dart';
import 'overview.dart';
import 'roadmap.dart';
import 'side_menu.dart';

class DaoPage extends StatefulWidget {
  const DaoPage({Key? key}) : super(key: key);

  @override
  State<DaoPage> createState() => _DaoPageState();
}

class _DaoPageState extends State<DaoPage> {
  late PageController pageController = PageController();
  final StreamController<int> currentId = StreamController<int>.broadcast();
  late final IMProvider im;

  int? c;

  @override
  void initState() {
    super.initState();
    currentId.add(0);
    im = context.read<IMProvider>();
    daoCtx.connectChain(im.currentState!.org, im.me!, () {
      getData();
    });
  }

  getData() async {
    setState(() {});
  }

  final mainPages = [
    const Overviewpage(),
    const RoadMapPage(),
    const ReferendumPage(),
    Kanban(),
    const Guildpage(),
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
              tools: const CloseBar(),
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
                    pageController.animateToPage(id,
                        duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                    currentId.add(id);

                    if (c != null) {}
                  });
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
                      // onPageChanged: onPageChanged,
                      children: mainPages,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
