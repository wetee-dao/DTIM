import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/close_bar.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/application/store/im.dart';
import 'package:dtim/application/store/theme.dart';

import 'member.dart';
import 'overview.dart';
import 'gov_menu.dart';
import 'referendum.dart';
import 'treasury.dart';

@RoutePage(name: "govRoute")
class GovPage extends StatefulWidget {
  const GovPage({Key? key}) : super(key: key);

  @override
  State<GovPage> createState() => _GovPageState();
}

class _GovPageState extends State<GovPage> {
  final PageController pageController = PageController();
  List<Widget> mainPages = [];
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
    workCtx.setOrg(im.currentState!.org, im.me!);
    mainPages = [
      const Overviewpage(),
      const MemberPage(),
      const ReferendumPage(),
      TreasuryPage(toVote: gotoPage),
    ];
    workCtx.connectChain(() {
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
  }

  gotoPage(id) {
    final index = getPageIndex(id);
    pageController
        .animateToPage(
          index,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        )
        .then((v) {});
    if (c != null) {}
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
                    gotoPage(id);
                  });
                },
              ),
            ),
      appBar: isPc()
          ? SideBarAppBar(
              height: 45.w,
              title: "OpenGov",
              showMacosTop: false,
              leading: InkWell(
                onTap: () {
                  drawerKey.currentState!.openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Icon(
                    AppIcons.sxgl,
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
                            gotoPage(id);
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

  int getPageIndex(str) {
    pageStr = str;
    currentId.add(str);
    switch (str) {
      case "Overview":
        return 0;
      case "Members":
        return 1;
      case "Referenda":
        return 2;
      case "Treasury":
        return 3;
    }
    return 0;
  }
}
