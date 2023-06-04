import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import '../components/sider_bar.dart';
import '../store/im.dart';
import '../utils/screen/screen.dart';
import '../apis/apis.dart';
import '../models/models.dart';
import '../store/theme.dart';
import './dao/dao.dart';
import './org/org.dart';

@RoutePage(name: "pc")
class PCPage extends StatefulWidget {
  const PCPage({Key? key}) : super(key: key);

  @override
  State<PCPage> createState() => _PCPageState();
}

class _PCPageState extends State<PCPage> {
  final StreamController<int> currentId = StreamController<int>();
  List<AccountOrg>? aorgs;
  late AppCubit im;
  late PageController pageController;
  double rightWidth = 200.w;
  String rightUrl = "";

  final mainPages = [
    const OrgPage(),
    const DaoPage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    im = context.read<AppCubit>();
    currentId.add(0);
    getData();
  }

  getData() async {
    final os = await (await AccountOrgApi.create()).listByAccount(im.me!.address);
    setState(() {
      aorgs = os;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  onSelect(index) {
    pageController.jumpToPage(index);
    currentId.add(index);
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.sidebarHeaderBg,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          moveWindow(
            Container(
              width: 65.w,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: constTheme.sidebarHeaderBg,
                border: Border(right: BorderSide(color: constTheme.sidebarHeaderBg.lighter(0.08), width: 1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (Platform.isMacOS) SizedBox(height: 20.w),
                  SizedBox(height: 12.w),
                  // 用户
                  SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: UserAvatar(
                      key: Key(im.currentState!.user.id.toString()),
                      im.me!.address,
                      true,
                      40.w,
                      bg: constTheme.sidebarText.withOpacity(0.1),
                      color: constTheme.sidebarText,
                    ),
                  ),
                  Container(
                    width: 6.w,
                    height: 4.w,
                    margin: EdgeInsets.only(top: 12.w, bottom: 10.w),
                    decoration: BoxDecoration(color: constTheme.sidebarText, borderRadius: BorderRadius.circular(2.w)),
                  ),
                  Flexible(
                    child: StreamBuilder(
                      stream: currentId.stream,
                      builder: (BuildContext context, AsyncSnapshot<int> id) {
                        return Column(
                          children: [
                            SiderBarItem(AppIcons.we_chat, "Chat", key: const Key("MES"), selected: id.data == 0,
                                onTap: () {
                              onSelect(0);
                            }),
                            // DAO管理
                            SiderBarItem(AppIcons.chain, "DAO", key: const Key("DAO"), selected: id.data == 1,
                                onTap: () {
                              onSelect(1);
                            }),
                          ],
                        );
                      },
                    ),
                  ),
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
                        color: constTheme.sidebarHeaderTextColor.withOpacity(0.8),
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     context.go("/select_org");
                  //   },
                  //   child: Container(
                  //     width: 40.w,
                  //     height: 40.w,
                  //     margin: EdgeInsets.fromLTRB(0, 6.w, 0, 12.w),
                  //     child: Icon(
                  //       Icons.add,
                  //       size: 22.w,
                  //       color: constTheme.sidebarHeaderTextColor.withOpacity(0.8),
                  //     ),
                  //   ),
                  // ),
                  if(aorgs!=null)
                    for (var i = 0; i < aorgs!.length; i++)
                      Container(
                      width: 40.w,
                      height: 40.w,
                      padding: EdgeInsets.all(2.w),
                      margin: EdgeInsets.fromLTRB(0, 10.w, 0, 0),
                      decoration: BoxDecoration(
                        color: constTheme.sidebarHeaderTextColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.w),
                        border: Border.all(
                          color: constTheme.sidebarTextActiveBorder.withOpacity(0.7),
                          width: 2.w,
                        ),
                      ),
                      child: Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                          color: aorgs![i].orgColor != null
                              ? hexToColor(aorgs![i].orgColor!)
                              : constTheme.sidebarText.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: aorgs![i].orgAvater == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (aorgs![i].orgAvater == null)
                                    Text(
                                      aorgs![i].orgName ?? "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: constTheme.sidebarHeaderTextColor.withOpacity(0.8),
                                        fontSize: 14.w,
                                      ),
                                    ),
                                ],
                              )
                            : Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2.w),
                                  child: Image.network(
                                    fit: BoxFit.cover,
                                    aorgs![i].orgAvater!,
                                    width: 36.w,
                                    height: 36.w,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  SizedBox(height: 15.w),
                ],
              ),
            ),
          ),
          Flexible(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              // onPageChanged: onPageChanged,
              children: mainPages,
            ),
          ),
          // GestureDetector(
          //   child: MouseRegion(
          //     cursor: SystemMouseCursors.resizeColumn,
          //     child: SizedBox(
          //       width: 1.w,
          //       height: double.infinity,
          //       child: Container(color: constTheme.sidebarText.withOpacity(0.08)),
          //     ),
          //   ),
          //   onPanUpdate: (details) {
          //     setState(() {
          //       if (rightWidth - details.delta.dx < 180.w || rightWidth - details.delta.dx > 350.w) {
          //         return;
          //       }

          //       rightWidth = rightWidth - details.delta.dx;
          //     });
          //   },
          // ),
          // if (rightUrl != "") Container(width: rightWidth, height: double.maxFinite, color: Colors.red),
        ],
      ),
    );
  }
}
