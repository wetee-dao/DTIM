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
      backgroundColor: ConstTheme.centerChannelBg,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (details) {
              windowManager.startDragging();
            },
            child: Container(
              width: 68,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: ConstTheme.sidebarHeaderBg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (Platform.isMacOS) const SizedBox(height: 30),
                  if (Platform.isMacOS) const SizedBox(height: 12),
                  for (var i = 0; i < aorgs.length; i++)
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: ConstTheme.sidebarText.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: ConstTheme.sidebarTextActiveBorder,
                          width: 3,
                        ),
                      ),
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: aorgs[i].orgColor != null
                              ? hexToColor(aorgs[i].orgColor!)
                              : ConstTheme.sidebarText.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: ConstTheme.sidebarHeaderBg,
                            width: 3,
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
                                        fontSize: 14,
                                      ),
                                    ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  aorgs[i].orgAvater!,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                      ),
                    ),
                  InkWell(
                    onTap: () {
                      context.push("/select_org");
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Icon(
                        Icons.add,
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
