import 'dart:async';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
// import 'package:chips_choice/chips_choice.dart';
import 'package:dtim/domain/utils/theme.dart';
import 'package:dtim/native_wraper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:dtim/router.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/service/apis/apis.dart';
import 'package:dtim/infra/components/components.dart';
import 'package:dtim/domain/models/models.dart';
import 'package:dtim/application/store/im.dart';
import 'package:dtim/application/store/theme.dart';

@RoutePage(name: "selectOrg")
class SelectOrgPage extends StatefulWidget {
  const SelectOrgPage({Key? key}) : super(key: key);

  @override
  State<SelectOrgPage> createState() => _SelectOrgPageState();
}

class _SelectOrgPageState extends State<SelectOrgPage> {
  List<String> selected = [];
  List<Account?> accounts = [];
  List<AccountOrg> userOrgs = [];
  List<Org> orgs = [];
  WorkCTX? wctx;
  late AppCubit im;
  late AccountOrgApi accountOrgApi;

  @override
  void initState() {
    im = context.read<AppCubit>();
    super.initState();
    if (im.me == null) {
      context.router.replaceNamed("/");
    }

    getData().then((v) {
      final query = context.routeData.queryParams;
      if (query.getString("t", "") == "auto") {
        Future.delayed(Duration.zero).then((value) async {
          await gotoOrg();
        });
      }
    });
  }

  Future<void> getData() async {
    accountOrgApi = await AccountOrgApi.create();
    userOrgs = await accountOrgApi.listByAccount(im.me!.address);

    final vuser = await AccountApi.create();
    accounts = await vuser.getUsers();
    final orgList = userOrgs.map((o) => o.orgHash).toList();
    selected = orgList;
    setState(() {});

    workCtx.setOrg(AccountOrg(""), im.me!);
    workCtx.connectChain(() async {
      final v = await rustApi.orgs(client: workCtx.chainClient);
      orgs = v
          .map((o) => Org(
                o.id.toString(),
                daoId: o.id,
                name: o.name,
                desc: o.desc,
                logo: o.logo,
                img: o.img,
                imApi: o.imApi,
                homeUrl: o.homeUrl,
              ))
          .toList();

      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    beforeLeave();
  }

  Future<void> gotoOrg() async {
    // 登录账户
    if (userOrgs.isNotEmpty) {
      await loadThemeFromOrg(userOrgs[0]);
      waitFutureLoading(
        title: "连接中...",
        context: globalCtx(),
        future: () async {
          await im.connect(userOrgs[0]);
          im.setCurrent(userOrgs[0]);
          BotToast.showText(text: L10n.of(globalCtx())!.selectOrgOk, duration: const Duration(seconds: 2));
          if (isPc()) {
            globalCtx().router.root.back();
            printInfo("页面数量 ==> ${globalCtx().router.navigationHistory.length}");
            globalCtx().router.root.replaceNamed("/pc/im");
          } else if (PlatformInfos.isWeb) {
            globalCtx().router.root.replaceNamed("/pc/im");
            // globalCtx().router.root.replaceNamed("/mobile");
          }
        },
      );
    }
  }

  Future<void> beforeLeave() async {
    return;
  }

  selectCreateType() {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxWidth: 100.sw, minWidth: 100.sw),
      backgroundColor: constTheme.centerChannelBg,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 25.w),
            createOrg("addChainNode", "Creating a private consortium foundation", constTheme, () async {}, false),
            SizedBox(height: 15.w),
            createOrg("addSubNode", "Creating a subsidiary organization", constTheme, () async {}, false),
            SizedBox(height: 15.w),
            createOrg("addLocalNode", "Deploying an on-premise organization foundation", constTheme, () async {
              context.router.pop();
              await context.router.pushNamed("/create_org").then((value) {
                getData();
              });
            }, true),
            SizedBox(
              height: 25.w,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final unjoin = orgs.where((o) => !selected.contains(o.hash)).toList();
    return Scaffold(
      appBar: LocalAppBar(
        title: L10n.of(context)!.selectOrg,
        tools: Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  //设置按下时的背景颜色
                  if (states.contains(MaterialState.pressed)) {
                    return constTheme.buttonBg;
                  }
                  //默认不使用背景颜色
                  return constTheme.buttonBg.withOpacity(0.8);
                }),
                // backgroundColor: constTheme.mentionBg,
              ),
              onPressed: () async {
                if (userOrgs.isEmpty) {
                  BotToast.showText(text: L10n.of(context)!.selectOrg, duration: const Duration(seconds: 2));
                  return;
                }
                final query = context.routeData.queryParams;
                if (query.getString("t", "") == "back") {
                  context.router.pop();
                  return;
                }
                await gotoOrg();
              },
              child: Text(
                L10n.of(context)!.gotoApp.toUpperCase(),
                style: TextStyle(color: constTheme.buttonColor, fontSize: 16.w),
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
      backgroundColor: constTheme.centerChannelBg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.w),
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 10.w),
            child: Text("joined organization", style: TextStyle(color: constTheme.centerChannelColor, fontSize: 18.w)),
          ),
          Row(
            children: [
              SizedBox(width: 20.w),
              if (userOrgs.isEmpty)
                Text("暂无组织", style: TextStyle(color: constTheme.centerChannelColor.withOpacity(0.5), fontSize: 16.w)),
              for (var i = 0; i < userOrgs.length; i++)
                Container(
                  margin: EdgeInsets.only(right: 10.w),
                  child: InkWell(
                    onLongPress: () async {
                      if (OkCancelResult.ok ==
                          await showOkCancelAlertDialog(
                            useRootNavigator: false,
                            title: "Notice",
                            message: "Are you sure you want to quit this organization?",
                            context: globalCtx(),
                            okLabel: L10n.of(globalCtx())!.next,
                            cancelLabel: L10n.of(globalCtx())!.cancel,
                          )) {
                        await accountOrgApi.deleteOrg(im.me!.address, userOrgs[i].orgHash);
                        await getData();
                      }
                    },
                    child: AnimatedContainer(
                      width: 150.w,
                      height: 200.w,
                      duration: const Duration(milliseconds: 300),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: constTheme.centerChannelColor.withOpacity(0.1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 206.w,
                            height: 130.w,
                            decoration: BoxDecoration(
                              color:
                                  userOrgs[i].orgColor != null ? hexToColor(userOrgs[i].orgColor!) : Colors.transparent,
                            ),
                            child: Image.network(
                              userOrgs[i].orgImg ?? "",
                              width: 206.w,
                              fit: BoxFit.cover,
                              height: 130.w,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                            width: 206.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# ${userOrgs[i].orgName ?? ""}",
                                  style: TextStyle(
                                    color: constTheme.centerChannelColor,
                                    fontSize: 16.w,
                                  ),
                                ),
                                Text(
                                  userOrgs[i].orgDesc ?? "",
                                  style: TextStyle(
                                    color: constTheme.centerChannelColor,
                                    fontSize: 12.w,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.w, bottom: 10.w),
            child: Text("Existed organization", style: TextStyle(color: constTheme.centerChannelColor, fontSize: 18.w)),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Wrap(
                runSpacing: 20.w,
                spacing: 20.w,
                alignment: WrapAlignment.start,
                children: [
                  for (var i = 0; i < unjoin.length; i++)
                    OrgCard(
                      org: unjoin[i],
                      onSelect: (v) async {
                        if (OkCancelResult.ok ==
                            await showOkCancelAlertDialog(
                              useRootNavigator: false,
                              title: "Notice",
                              message: "Join organization",
                              context: globalCtx(),
                              okLabel: L10n.of(globalCtx())!.next,
                              cancelLabel: L10n.of(globalCtx())!.cancel,
                            )) {
                          await accountOrgApi.addOrg(im.me!.address, unjoin[i]);
                          await getData();
                        }
                      },
                    ),
                  InkWell(
                    onTap: selectCreateType,
                    child: AnimatedContainer(
                      width: 150.w,
                      height: 200.w,
                      duration: const Duration(milliseconds: 300),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: constTheme.centerChannelColor.withOpacity(0.1),
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(Icons.add_circle_outlined, color: constTheme.centerChannelColor, size: 30.w),
                        SizedBox(height: 10.w),
                        Text(
                          "创建组织",
                          style: TextStyle(
                            color: constTheme.centerChannelColor,
                            fontSize: 16.w,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            key: const Key("orgOk"),
            onTap: () async {
              if (userOrgs.isEmpty) {
                BotToast.showText(text: L10n.of(context)!.selectOrg, duration: const Duration(seconds: 2));
                return;
              }

              await gotoOrg();
            },
            child: Text(
              "hide",
              style: TextStyle(color: constTheme.centerChannelBg, fontSize: 10.w),
            ),
          ),
        ],
      ),
    );
  }
}

createOrg(key, title, constTheme, ontap, enable) {
  return InkWell(
    key: Key(key),
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      width: MediaQuery.of(globalCtx()).size.width * 0.8,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: constTheme.centerChannelColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: constTheme.centerChannelBg,
              fontWeight: FontWeight.bold,
              fontSize: 19.w,
            ),
          ),
          if (!enable) SizedBox(width: 15.w),
          if (!enable)
            Container(
              decoration: BoxDecoration(
                color: constTheme.buttonBg,
                borderRadius: BorderRadius.circular(5.w),
              ),
              padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 8.w),
              child: Text(
                "未开放",
                style: TextStyle(color: constTheme.buttonColor, fontSize: 13.w),
              ),
            ),
        ],
      ),
    ),
  );
}
