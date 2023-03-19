import 'package:asyou_app/store/theme.dart';
import 'package:flutter/material.dart';

import '../components/drawer.dart';
import '../apis/navs.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WidgetDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: sideNavs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ConstTheme.sidebarTextActiveBorder,
        unselectedItemColor: ConstTheme.sidebarText,
        backgroundColor: ConstTheme.sidebarBg,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        onTap: navigationTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              size: 25,
            ),
            label: 'DMs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alternate_email_rounded,
              size: 25,
            ),
            label: 'Mentions',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face_unlock_sharp,
              size: 25,
            ),
            label: 'You',
          ),
        ],
      ),
    );
  }
}
