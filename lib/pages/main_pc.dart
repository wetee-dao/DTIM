import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import '../router.dart';
import '../store/im.dart';
import '../utils/screen.dart';
import '../apis/apis.dart';
import '../models/models.dart';
import '../store/theme.dart';
import 'org.dart';

class PCPage extends StatefulWidget {
  const PCPage({Key? key}) : super(key: key);

  @override
  State<PCPage> createState() => _PCPageState();
}

class _PCPageState extends State<PCPage> with WindowListener {
  late List<AccountOrg> aorgs;
  late IMProvider im;
  double rightWidth = 200.w;
  String rightUrl = "";

  @override
  void initState() {
    super.initState();
    if (isPc()) {
      windowManager.addListener(this);
    }
    im = context.read<IMProvider>();
    aorgs = AccountOrgApi.create().listByAccount(im.me!.address);
  }

  @override
  void dispose() {
    if (isPc()) {
      windowManager.removeListener(this);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.sidebarHeaderBg,
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
                color: constTheme.sidebarHeaderBg,
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
                        color: constTheme.sidebarText.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(8.w),
                        border: Border.all(
                          color: constTheme.sidebarTextActiveBorder,
                          width: 3.w,
                        ),
                      ),
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: aorgs[i].orgColor != null
                              ? hexToColor(aorgs[i].orgColor!)
                              : constTheme.sidebarText.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(
                            color: constTheme.sidebarHeaderBg,
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
                                        color: constTheme.sidebarHeaderTextColor,
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
                      margin: EdgeInsets.fromLTRB(0, 6.w, 0, 0),
                      child: Icon(
                        Icons.add,
                        color: constTheme.sidebarText,
                        size: 25.w,
                      ),
                    ),
                  ),
                  Flexible(child: Container()),
                  InkWell(
                    onTap: () async {
                      const storage = FlutterSecureStorage();
                      await storage.delete(key: "login_state");
                      im.logout();
                    },
                    child: SizedBox(
                      width: 40.w,
                      height: 40.w,
                      child: Icon(
                        Icons.logout_rounded,
                        size: 22.w,
                        color: constTheme.sidebarText,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModelOrPage(context, "/setting", width: 0.7.sw, height: 0.8.sh);
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      margin: EdgeInsets.fromLTRB(0, 6.w, 0, 12.w),
                      child: Icon(
                        Icons.settings,
                        size: 22.w,
                        color: constTheme.sidebarText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Flexible(
            child: OrgPage(),
          ),
          GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeColumn,
              child: SizedBox(
                width: 1.w,
                height: double.infinity,
                child: Container(color: constTheme.sidebarText.withOpacity(0.08)),
              ),
            ),
            onPanUpdate: (details) {
              setState(() {
                if (rightWidth - details.delta.dx < 180.w || rightWidth - details.delta.dx > 350.w) {
                  return;
                }

                rightWidth = rightWidth - details.delta.dx;
              });
            },
          ),
          if (rightUrl != "") Container(width: rightWidth, height: double.maxFinite, color: Colors.red),
        ],
      ),
    );
  }
}
