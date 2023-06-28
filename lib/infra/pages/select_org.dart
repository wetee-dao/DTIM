import 'dart:async';
import 'package:dtim/domain/utils/functions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
// import 'package:chips_choice/chips_choice.dart';
import 'package:dtim/domain/utils/theme.dart';
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
  late AppCubit im;
  late AccountOrgApi accountOrgApi;

  @override
  void initState() {
    im = context.read<AppCubit>();
    final query = context.routeData.queryParams;
    AccountApi.create().then((v) async {
      accounts = await v.getUsers();
      accountOrgApi = await AccountOrgApi.create();
      userOrgs = await accountOrgApi.listByAccount(im.me!.address);
      final orgList = userOrgs.map((o) => o.orgHash).toList();
      selected = orgList;
      setState(() {});
      if (query.getString("auto", "") == "t") {
        Future.delayed(Duration.zero).then((value) async {
          await accountOrgApi.accountSyncOrgs(
            im.me!.address,
            selected,
            orgs,
          );
          await gotoOrg();
        });
      }
    });

    super.initState();
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
            InkWell(
              key: const Key("addChainNode"),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: constTheme.centerChannelColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "创建链上隐私组织节点",
                      style: TextStyle(
                        color: constTheme.centerChannelBg,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.w,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                context.router.pop();
                if (accounts.length >= 3) {
                  BotToast.showText(
                    text: L10n.of(context)!.tooManyUsers,
                    duration: const Duration(seconds: 2),
                  );
                  return;
                }
                await context.router.pushNamed("/sr25519key");
              },
            ),
            SizedBox(height: 15.w),
            InkWell(
              key: const Key("addCloudNode"),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: constTheme.centerChannelColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "创建云端的组织",
                      style: TextStyle(
                        color: constTheme.centerChannelBg,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.w,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                context.router.pop();
                if (accounts.length >= 3) {
                  BotToast.showText(
                    text: L10n.of(context)!.tooManyUsers,
                    duration: const Duration(seconds: 2),
                  );
                  return;
                }
                await context.router.pushNamed("/sr25519key");
              },
            ),
            SizedBox(height: 15.w),
            InkWell(
              key: const Key("addLocalNode"),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: constTheme.centerChannelColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "部署本地组织节点",
                      style: TextStyle(
                        color: constTheme.centerChannelBg,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.w,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                context.router.pop();
                if (accounts.length >= 3) {
                  BotToast.showText(
                    text: L10n.of(context)!.tooManyUsers,
                    duration: const Duration(seconds: 2),
                  );
                  return;
                }
                await context.router.pushNamed("/sr25519key");
              },
            ),
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
                if (selected.isEmpty) {
                  BotToast.showText(text: L10n.of(context)!.selectOrg, duration: const Duration(seconds: 2));
                  return;
                }

                await accountOrgApi.accountSyncOrgs(
                  im.me!.address,
                  selected,
                  orgs,
                );

                await gotoOrg();
              },
              child: Text(
                L10n.of(context)!.ok.toUpperCase(),
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
            child: Text("已加入组织", style: TextStyle(color: constTheme.centerChannelColor, fontSize: 18.w)),
          ),
          Row(
            children: [
              SizedBox(width: 20.w),
              for (var i = 0; i < userOrgs.length; i++)
                AnimatedContainer(
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
                          color: userOrgs[i].orgColor != null ? hexToColor(userOrgs[i].orgColor!) : Colors.transparent,
                        ),
                        child: Image.network(
                          userOrgs[i].orgImg ?? "",
                          width: 206.w,
                          fit: BoxFit.contain,
                          height: 150.w,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userOrgs[i].orgName ?? "",
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
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.w, bottom: 10.w),
            child: Text("组织列表", style: TextStyle(color: constTheme.centerChannelColor, fontSize: 18.w)),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              // child: ChipsChoice<String>.multiple(
              //   wrapped: true,
              //   value: selected,
              //   onChanged: (val) => setState(() => selected = val),
              //   choiceItems: C2Choice.listFrom<String, Org>(
              //     source: orgs,
              //     value: (i, v) => v.hash,
              //     label: (i, v) => v.hash,
              //   ),
              //   choiceBuilder: (item, i) {
              child: Wrap(
                runSpacing: 20.w,
                spacing: 20.w,
                alignment: WrapAlignment.start,
                children: [
                  for (var i = 0; i < orgs.where((o) => !selected.contains(o.hash)).length; i++)
                    OrgCard(org: orgs[i], onSelect: (v) {}),
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
              if (selected.isEmpty) {
                BotToast.showText(text: L10n.of(context)!.selectOrg, duration: const Duration(seconds: 2));
                return;
              }

              await accountOrgApi.accountSyncOrgs(
                im.me!.address,
                selected,
                orgs,
              );

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

List<Org> orgs = [
  Org(
    "asyoume",
    daoId: 5000,
    name: "WeteeDAO",
    desc: "we3 在线协作，分布式办公软件",
    chainUrl: "ws://chain-ws.tc.asyou.me:80",
    // chainUrl: "ws://127.0.0.1:3994",
    metaData: OrgMetaData(
      domain: "im.tc.asyou.me",
      color: "#000000",
      avater: "https://wetee.app/images/icon.png",
      img: "https://wetee.app/static/web3/img/logo.png",
      homeUrl: "www.asyou.me/",
    ),
    apps: [
      OrgApp(
        name: "dwork",
        // icon: "",
        desc: "dwork",
        meta: {"chainUrl": "ws://chain-ws.tc.asyou.me:80","workId":"5000"},
        hash: '',
        type: 0,
      )
    ],
  )
];
