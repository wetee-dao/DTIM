import 'dart:io';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

import '../utils/screen/size_extension.dart';
import '../apis/apis.dart';
import '../models/models.dart';
import '../store/theme.dart';

class PCPage extends StatefulWidget {
  const PCPage({Key? key}) : super(key: key);

  @override
  State<PCPage> createState() => _PCPageState();
}

class _PCPageState extends State<PCPage> with WindowListener {
  int _page = 0;
  late List<AccountOrg> aorgs;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    if (isPc()) {
      windowManager.addListener(this);
    }
    aorgs = AccountOrgApi.create().listAll();
    pageController = PageController();
  }

  @override
  void dispose() {
    if (isPc()) {
      windowManager.removeListener(this);
    }
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
      backgroundColor: ConstTheme.sidebarHeaderBg,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (details) {
              windowManager.startDragging();
            },
            child: Container(
              width: 65.w,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: ConstTheme.sidebarHeaderBg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (Platform.isMacOS) SizedBox(height: 30.w),
                  SizedBox(height: 5.w),
                  for (var i = 0; i < aorgs.length; i++)
                    Container(
                      width: 46.w,
                      height: 46.w,
                      margin: EdgeInsets.fromLTRB(0, 12.w, 0, 0),
                      decoration: BoxDecoration(
                        color: ConstTheme.sidebarText.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(8.w),
                        border: Border.all(
                          color: ConstTheme.sidebarTextActiveBorder,
                          width: 3.w,
                        ),
                      ),
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: aorgs[i].orgColor != null
                              ? hexToColor(aorgs[i].orgColor!)
                              : ConstTheme.sidebarText.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(
                            color: ConstTheme.sidebarHeaderBg,
                            width: 3.w,
                          ),
                        ),
                        child: aorgs[i].orgAvater == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (aorgs[i].orgAvater == null)
                                    Text(
                                      aorgs[i].orgName ?? "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ConstTheme.sidebarHeaderTextColor,
                                        fontSize: 14.w,
                                      ),
                                    ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(3.w),
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  aorgs[i].orgAvater!,
                                  width: 34.w,
                                  height: 34.w,
                                ),
                              ),
                      ),
                    ),
                  InkWell(
                    onTap: () {
                      context.push("/select_org");
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      margin: EdgeInsets.fromLTRB(0, 12.w, 0, 0),
                      child: Icon(
                        Icons.add,
                        color: ConstTheme.sidebarText,
                      ),
                    ),
                  ),
                  Flexible(child: Container()),
                  InkWell(
                    onTap: () {
                      context.push("/select_org");
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      margin: EdgeInsets.fromLTRB(0, 12.w, 0, 12.w),
                      child: Icon(
                        Icons.settings,
                        color: ConstTheme.sidebarText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
              children: sideNavs,
            ),
          )
        ],
      ),
    );
  }
}
