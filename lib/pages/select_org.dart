import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import '../objectbox.g.dart';
import '../router.dart';
import '../utils/screen.dart';
import '../apis/apis.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../store/im.dart';
import '../store/theme.dart';

class SelectOrgPage extends StatefulWidget {
  final String auto;
  const SelectOrgPage({Key? key, required this.auto}) : super(key: key);

  @override
  State<SelectOrgPage> createState() => _SelectOrgPageState();
}

class _SelectOrgPageState extends State<SelectOrgPage> {
  StreamSubscription<Query<AccountOrg>>? subscription;
  List<String> selected = [];
  List<Account> accounts = [];
  // String currentAddress = "";
  late IMProvider im;

  @override
  void initState() {
    accounts = AccountApi.create().getUsers();
    // currentAddress = accounts[0].address;
    Future.delayed(Duration.zero).then((value) async {
      im = context.read<IMProvider>();
      if (widget.auto == "t") {
        await gotoOrg();
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
    final orgs = AccountOrgApi.create().listByAccount(im.me!.address);
    // 登录账户
    if (orgs.isNotEmpty) {
      waitFutureLoading(
        title: "连接中...",
        context: context,
        future: () async {
          await im.connect(orgs[0]);
          im.setCurrent(orgs[0]);
          BotToast.showText(text: L10n.of(globalCtx())!.selectOrgOk, duration: const Duration(seconds: 2));
          if (isPc()) {
            // ignore: use_build_context_synchronously
            globalCtx().go("/pc");
          } else {
            // ignore: use_build_context_synchronously
            globalCtx().go("/mobile");
          }
        },
      );
    }
  }

  Future<void> beforeLeave() async {
    if (subscription != null) {
      await subscription!.cancel();
    }
    im.removeListener(onImInit);
    return;
  }

  onImInit() {
    if (im.current == null || im.currentState == null) {
      if (isPc()) {
        context.go("/pc");
      } else {
        context.go("/mobile");
      }
      return;
    }
    // final queryStream = AccountOrgApi.create().storeBox.query(AccountOrg_.withAddr.equals(currentAddress)).watch();
    // subscription = queryStream.listen((query) {
    //   final qmsgs = query.find();
    //   print(qmsgs);
    // });
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

                AccountOrgApi.create().accountSyncOrgs(
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
          // Container(
          //   height: double.maxFinite,
          //   width: 260.w,
          //   color: constTheme.sidebarBg,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       for (final i = 0; i < accounts.length; i++)
          //         InkWell(
          //           onTap: () {
          //             setState(() {
          //               currentAddress = accounts[i].address;
          //             });
          //           },
          //           child: Container(
          //             padding: EdgeInsets.symmetric(
          //               vertical: 10.w,
          //               horizontal: 15.w,
          //             ),
          //             decoration: BoxDecoration(
          //               border: Border(
          //                 left: BorderSide(
          //                   width: 5.w,
          //                   color: accounts[i].address == currentAddress
          //                       ? constTheme.sidebarTextActiveBorder
          //                       : constTheme.sidebarBg,
          //                 ),
          //               ),
          //               color: accounts[i].address == currentAddress ? constTheme.centerChannelBg : null,
          //             ),
          //             child: Row(
          //               children: [
          //                 UserAvatar(accounts[i].address, true, 50.w),
          //                 SizedBox(width: 10.w),
          //                 Expanded(
          //                   child: accounts[i].name != null && accounts[i].name != ""
          //                       ? Text(
          //                           accounts[i].name!,
          //                           style: TextStyle(
          //                             color: constTheme.sidebarHeaderTextColor,
          //                             fontSize: 16.w,
          //                           ),
          //                         )
          //                       : Text(
          //                           accounts[i].address,
          //                           style: TextStyle(
          //                             color: constTheme.sidebarHeaderTextColor,
          //                             fontSize: 12.w,
          //                           ),
          //                         ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       InkWell(
          //         onTap: () => context.push("/sr25519key"),
          //         child: Container(
          //           height: 50.w,
          //           decoration: BoxDecoration(
          //             border: Border(
          //               top: BorderSide(
          //                 width: 1.w,
          //                 color: constTheme.sidebarText.withOpacity(0.05),
          //               ),
          //             ),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Icon(
          //                 Icons.add,
          //                 color: constTheme.sidebarHeaderTextColor,
          //               ),
          //               Text(
          //                 "添加帐号",
          //                 style: TextStyle(
          //                   color: constTheme.sidebarHeaderTextColor,
          //                   fontSize: 14.w,
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: ChipsChoice<String>.multiple(
                wrapped: true,
                value: selected,
                onChanged: (val) => setState(() => selected = val),
                choiceItems: C2Choice.listFrom<String, Org>(
                  source: orgs,
                  value: (i, v) => v.hash,
                  label: (i, v) => v.hash,
                ),
                choiceBuilder: (item, i) {
                  return OrgCard(
                    org: orgs[i],
                    selected: item.selected,
                    onSelect: item.select!,
                  );
                },
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

              AccountOrgApi.create().accountSyncOrgs(
                im.me!.address,
                selected,
                orgs,
              );

              await gotoOrg();
            },
            child: Text(
              "xxxxx",
              style: TextStyle(color: constTheme.centerChannelBg, fontSize: 16.w),
            ),
          ),
        ],
      ),
    );
  }
}
