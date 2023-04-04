import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../components/app_bar.dart';
import '../../components/appicon.dart';
import '../../components/dao/payments_detail_list.dart';
import '../../store/theme.dart';
import 'board.dart';
import 'overview.dart';
import 'side_menu.dart';

class DaoPage extends StatefulWidget {
  const DaoPage({Key? key}) : super(key: key);

  @override
  State<DaoPage> createState() => _DaoPageState();
}

class _DaoPageState extends State<DaoPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      key: _drawerKey,
      backgroundColor: constTheme.centerChannelBg,
      drawer: SizedBox(
        width: 70.w,
        child: const SideMenu(),
      ),
      appBar: !isPc()
          ? AppBar(
              elevation: 0,
              backgroundColor: constTheme.sidebarHeaderBg,
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState!.openDrawer();
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
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState!.openDrawer();
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
              child: const SideMenu(),
            ),
          const Expanded(
            child: Overviewpage(),
          ),
          Container(
            height: double.maxFinite,
            width: 280.w,
            color: constTheme.centerChannelColor.withOpacity(0.05),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: const [
                  PaymentsDetailList(),
                ],
              ),
            ),
          ),
        ],
      ),
      // body: Kanban(),
    );
  }
}
