import 'dart:async';
import 'package:dtim/application/store/app/org.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dtim/infra/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/application/store/im.dart';
import 'package:dtim/application/service/apis/apis.dart';
import 'package:dtim/domain/models/models.dart';
import 'package:dtim/application/store/theme.dart';

@RoutePage(name: "mobileRoute")
class MobilePage extends StatefulWidget {
  const MobilePage({
    Key? key,
    // @pathParam required this.t,
  }) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

const url = ["im", "gov", "work", "integrate"];

class _MobilePageState extends State<MobilePage> {
  final StreamController<int> currentId = StreamController<int>();
  List<AccountOrg>? aorgs;
  late AppCubit im;
  double rightWidth = 200.w;
  String rightUrl = "";
  Uri? avatar;
  List<OrgApp> apps = [];

  final mainPages = [
    const OrgMobileRoute(),
    const GovRoute(),
    const DaoRoute(),
    const IntegrateRoute(),
    // const WebviewRoute(),
  ];

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    currentId.add(url.indexOf(context.router.currentPath.replaceAll("/app/", "")));
    getData();
    final org = context.read<OrgCubit>();
    org.stream.listen((event) async {
      await getData();
    });
  }

  getData() async {
    final accountOrgApi = await AccountOrgApi.create();
    final os = await (await AccountOrgApi.create()).listByAccount(im.me!.address);
    if (mounted) {
      setState(() {
        aorgs = os;
      });
    }
    if (im.currentState != null) {
      var u = await im.currentState!.client.getAvatarUrl(im.currentState!.client.userID ?? "");
      AccountOrg? org = accountOrgApi.getOrg(im.me!.address, im.currentState!.org.orgHash);
      if (org != null) {
        apps = org.apps ?? [];
      }
      if (mounted) {
        setState(() {
          avatar = u;
        });
      }

      workCtx.setOrg(im.currentState!.org, im.me!);
      workCtx.connectChain(() async {
        apps = trans(await workCtx.client.query.weteeOrg.orgApps(BigInt.from(im.currentState!.org.daoId)));
        await accountOrgApi.saveApp(im.me!.address, im.currentState!.org.orgHash, apps);
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    printDebug("MobilePage dispose");
    super.dispose();
  }

  onSelect(index) {
    currentId.add(index);
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return AutoTabsRouter(
      routes: mainPages,
      builder: (context, child) {
        if (im.currentState == null) {
          return Center(child: CircularProgressIndicator.adaptive(strokeWidth: 4.w));
        }
        final pageRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: constTheme.sidebarHeaderBg,
          body: child,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(
          //       width: 65.w,
          //       height: double.maxFinite,
          //       decoration: BoxDecoration(
          //         color: constTheme.sidebarHeaderBg,
          //         border: Border(right: BorderSide(color: constTheme.sidebarHeaderBg.lighter(0.08), width: 1)),
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           if (PlatformInfos.isMacOS) SizedBox(height: 20.w),
          //           SizedBox(height: 12.w),
          //           // 用户
          //           SizedBox(
          //             width: 40.w,
          //             height: 40.w,
          //             child: MePop(
          //               im.me!.address,
          //               im.me!.name ?? "-",
          //               mxContent: avatar,
          //               true,
          //               40.w,
          //               bg: constTheme.sidebarText.withOpacity(0.1),
          //               color: constTheme.sidebarText,
          //             ),
          //           ),
          //           Container(
          //             width: 6.w,
          //             height: 4.w,
          //             margin: EdgeInsets.only(top: 12.w, bottom: 10.w),
          //             decoration: BoxDecoration(
          //               color: constTheme.sidebarText,
          //               borderRadius: BorderRadius.circular(2.w),
          //             ),
          //           ),
          //           Flexible(
          //             child: StreamBuilder(
          //               stream: currentId.stream,
          //               builder: (BuildContext context, AsyncSnapshot<int> id) {
          //                 return Column(
          //                   children: [
          //                     SiderBarItem(
          //                       "Chat",
          //                       icon: AppIcons.chat,
          //                       key: const Key("Chat"),
          //                       selected: id.data == 0,
          //                       onTap: () {
          //                         pageRouter.setActiveIndex(0);
          //                         onSelect(0);
          //                       },
          //                     ),
          //                     for (var app in apps)
          //                       SiderBarItem(
          //                         app.name ?? "",
          //                         img: app.icon,
          //                         key: Key("app_${app.hash}"),
          //                         selected: id.data == app.appId! + 1,
          //                         onTap: () {
          //                           if (app.appId! < 2) {
          //                             pageRouter.setActiveIndex(app.appId! + 1);
          //                             onSelect(app.appId! + 1);
          //                           }
          //                         },
          //                       ),
          //                     // DAO管理
          //                     SiderBarItem(
          //                       "Apps",
          //                       icon: AppIcons.shujujicheng,
          //                       key: const Key("Integrate"),
          //                       selected: id.data == 3,
          //                       onTap: () {
          //                         pageRouter.setActiveIndex(3);
          //                         onSelect(3);
          //                       },
          //                     ),
          //                     // DAO管理
          //                     // SiderBarItem(
          //                     //   "Dapps",
          //                     //   icon: AppIcons.shujujicheng,
          //                     //   key: const Key("Dapps"),
          //                     //   selected: id.data == 4,
          //                     //   onTap: () {
          //                     //     pageRouter.setActiveIndex(4);
          //                     //     onSelect(4);
          //                     //   },
          //                     // ),
          //                   ],
          //                 );
          //               },
          //             ),
          //           ),
          //           IconButton(
          //             tooltip: "discover and join",
          //             onPressed: () {
          //               printDebug("discover and join");
          //               context.router.pushNamed("/select_org?t=back").then((value) {
          //                 getData();
          //               });
          //             },
          //             icon: SizedBox(
          //               width: 36.w,
          //               height: 36.w,
          //               child: Center(
          //                 child: Icon(
          //                   AppIcons.discoverfill,
          //                   size: 23.w,
          //                   color: constTheme.sidebarText,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             width: 6.w,
          //             height: 4.w,
          //             margin: EdgeInsets.only(top: 0.w, bottom: 5.w),
          //             decoration: BoxDecoration(
          //               color: constTheme.sidebarText,
          //               borderRadius: BorderRadius.circular(2.w),
          //             ),
          //           ),
          //           if (aorgs != null)
          //             for (var i = 0; i < aorgs!.length; i++)
          //               GestureDetector(
          //                 onTap: () async {
          //                   if (im.currentState!.org.daoId == aorgs![i].daoId) {
          //                     return;
          //                   }
          //                   if (im.sign == "") {
          //                     if (!await im.login(im.me!)) {
          //                       return;
          //                     }
          //                   }
          //                   // ignore: use_build_context_synchronously
          //                   final org = globalCtx().read<OrgCubit>();
          //                   org.setChannelId("");
          //                   await waitFutureLoading(
          //                     context: globalCtx(),
          //                     future: () async {
          //                       im.currentState!.client.dispose(closeDatabase: false);
          //                       await im.connect(aorgs![i]);
          //                       im.setCurrent(aorgs![i]);
          //                     },
          //                   );
          //                   await loadThemeFromOrg(aorgs![i]);
          //                   pageRouter.setActiveIndex(0);
          //                   onSelect(0);
          //                   await getData();
          //                 },
          //                 child: Container(
          //                   width: im.currentState!.org.daoId == aorgs![i].daoId ? 40.w : 42.w,
          //                   height: im.currentState!.org.daoId == aorgs![i].daoId ? 40.w : 42.w,
          //                   padding: im.currentState!.org.daoId == aorgs![i].daoId ? EdgeInsets.all(2.w) : null,
          //                   margin: EdgeInsets.fromLTRB(0, 10.w, 0, 0),
          //                   decoration: BoxDecoration(
          //                     color: constTheme.sidebarHeaderTextColor.withOpacity(0.1),
          //                     borderRadius: BorderRadius.circular(8.w),
          //                     border: Border.all(
          //                       color: im.currentState!.org.daoId == aorgs![i].daoId
          //                           ? constTheme.sidebarTextActiveBorder.withOpacity(0.7)
          //                           : constTheme.sidebarBg,
          //                       width: 2.w,
          //                     ),
          //                   ),
          //                   child: Container(
          //                     width: im.currentState!.org.daoId == aorgs![i].daoId ? 36.w : 42.w,
          //                     height: im.currentState!.org.daoId == aorgs![i].daoId ? 36.w : 42.w,
          //                     decoration: BoxDecoration(
          //                       color: aorgs![i].orgColor != null
          //                           ? hexToColor(aorgs![i].orgColor!)
          //                           : constTheme.sidebarText.withOpacity(0.02),
          //                       borderRadius: BorderRadius.circular(4.w),
          //                     ),
          //                     child: aorgs![i].orgAvater == null
          //                         ? Column(
          //                             mainAxisAlignment: MainAxisAlignment.center,
          //                             children: [
          //                               if (aorgs![i].orgAvater == null)
          //                                 Text(
          //                                   aorgs![i].orgName ?? "",
          //                                   textAlign: TextAlign.center,
          //                                   style: TextStyle(
          //                                     color: constTheme.sidebarHeaderTextColor.withOpacity(0.8),
          //                                     fontSize: 14.w,
          //                                   ),
          //                                 ),
          //                             ],
          //                           )
          //                         : Center(
          //                             child: ClipRRect(
          //                               borderRadius: BorderRadius.circular(6.w),
          //                               child: Image.network(
          //                                 fit: BoxFit.cover,
          //                                 aorgs![i].orgAvater!,
          //                                 width: im.currentState!.org.daoId == aorgs![i].daoId ? 36.w : 42.w,
          //                                 height: im.currentState!.org.daoId == aorgs![i].daoId ? 36.w : 42.w,
          //                                 loadingBuilder:
          //                                     (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          //                                   if (loadingProgress == null) return child;
          //                                   return Center(
          //                                     child: Text(
          //                                       aorgs![i].orgName != null ? aorgs![i].orgName![0] : "-",
          //                                       style: TextStyle(fontSize: 16.w, color: constTheme.sidebarText),
          //                                     ),
          //                                   );
          //                                 },
          //                                 errorBuilder:
          //                                     (BuildContext context, Object exception, StackTrace? stackTrace) {
          //                                   return Center(
          //                                     child: Text(
          //                                       aorgs![i].orgName != null ? aorgs![i].orgName![0] : "-",
          //                                       style: TextStyle(fontSize: 16.w, color: constTheme.sidebarText),
          //                                     ),
          //                                   );
          //                                 },
          //                               ),
          //                             ),
          //                           ),
          //                   ),
          //                 ),
          //               ),
          //           SizedBox(height: 15.w),
          //         ],
          //       ),
          //     ),
          //     Flexible(child: child),
          //   ],
          // ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: constTheme.sidebarBg,
            currentIndex: pageRouter.activeIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: constTheme.sidebarText,
            unselectedLabelStyle: TextStyle(color: constTheme.sidebarText),
            selectedLabelStyle: TextStyle(color: constTheme.sidebarText),
            onTap: pageRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(AppIcons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
