import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dtim/infra/components/app_card.dart';
// import 'package:dtim/infra/components/dao/info_card.dart';
// import 'package:dtim/infra/components/dao/text.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/close_bar.dart';
import 'package:dtim/application/store/im.dart';
import 'package:dtim/application/store/theme.dart';

@RoutePage(name: "integrateRoute")
class IntegratePage extends StatefulWidget {
  const IntegratePage({Key? key}) : super(key: key);

  @override
  State<IntegratePage> createState() => _IntegratePageState();
}

class _IntegratePageState extends State<IntegratePage> {
  final mainPages = [];
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
  }

  getData() async {}

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
      appBar: SideBarAppBar(
        height: 45.w,
        title: "Integrate application",
        showMacosTop: false,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Icon(
            AppIcons.shujujicheng,
            color: constTheme.sidebarHeaderTextColor,
            size: 20.w,
          ),
        ),
        tools: CloseBar(color: constTheme.sidebarText),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.w,
              padding: EdgeInsets.only(bottom: 3.w),
              decoration: BoxDecoration(color: constTheme.sidebarHeaderBg, borderRadius: BorderRadius.circular(4.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10.w),
                  Icon(AppIcons.search, color: constTheme.sidebarHeaderTextColor, size: 18.w),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "按名称，类别搜索应用",
                        contentPadding: const EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1, color: constTheme.sidebarHeaderTextColor, fontSize: 14.w),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {},
                      style: TextStyle(color: constTheme.sidebarHeaderTextColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.w),
            SizedBox(
              width: double.maxFinite,
              child: Wrap(
                runSpacing: 20.w,
                spacing: 20.w,
                alignment: WrapAlignment.start,
                children: const [
                  AppCard(
                    icon: "https://wetee.app/icons/kanban.png",
                    background: Color.fromARGB(255, 48, 1, 57),
                    label: "Dwork",
                    amount: '区块链的去中心化特性与协作看板的实时思维映射功能,实现更可信、开放且智能的团队协作方式',
                  ),
                  AppCard(
                    icon: "https://wetee.app/icons/bifrost.png",
                    background: Colors.black,
                    label: "Bifrost",
                    amount: 'Provide LSD for 9+ blockchains and beyond, dedicated layer-1 built on Substrate with XCM for cross-chain staking',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
