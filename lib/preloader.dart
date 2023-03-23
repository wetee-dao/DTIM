import 'dart:async';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:asyou_app/router.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';

import 'components/avatar.dart';
import 'store/theme.dart';
import 'utils/screen.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import 'apis/account_api.dart';
import 'apis/apis.dart';
import 'components/move_window.dart';
import 'models/account.dart';
import 'store/im.dart';

class PreloaderPage extends StatefulWidget {
  const PreloaderPage({Key? key}) : super(key: key);

  @override
  State<PreloaderPage> createState() => _PreloaderPageState();
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class _PreloaderPageState extends State<PreloaderPage> with WindowListener {
  bool _loading = true;
  List<Account> accounts = [];
  late IMProvider im;

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    if (im.connections.keys.isEmpty) {
      Timer(const Duration(milliseconds: 2000), () {
        setState(() {
          _loading = false;
        });
      });
    }
    getList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  getList() {
    setState(() {
      accounts = AccountApi.create().getUsers();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  selectAccountType() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ConstTheme.centerChannelBg,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 25.w,
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ConstTheme.centerChannelColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      L10n.of(context)!.signUp,
                      style: TextStyle(
                        color: ConstTheme.centerChannelBg,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.w,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                context.pop();
                if (accounts.length >= 3) {
                  BotToast.showText(
                    text: L10n.of(context)!.tooManyUsers,
                    duration: const Duration(seconds: 2),
                  );
                  return;
                }
                context.push("/sr25519key");
                GoRouter.of(context).addListener(watchRouteChange);
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

  watchRouteChange() {
    getList();
    GoRouter.of(context).removeListener(watchRouteChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.centerChannelBg,
      body: Center(
        child: _loading
            ? moveWindow(
                SizedBox(
                  width: 150.w,
                  child: Opacity(
                    opacity: 0.6,
                    child: Lottie.asset(
                      'assets/app_loader.json',
                      repeat: true,
                    ),
                  ),
                ),
              )
            : Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        moveWindow(SizedBox(
                          height: 70.w,
                          width: MediaQuery.of(context).size.width * 0.4,
                        )),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  L10n.of(context)!.generate,
                                  style: TextStyle(
                                    fontSize: 32.w,
                                    color: ConstTheme.centerChannelColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  L10n.of(context)!.welcome,
                                  style: TextStyle(
                                    fontSize: 14.w,
                                    color: ConstTheme.centerChannelColor.withOpacity(0.7),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.w,
                                ),
                                if (accounts.isNotEmpty) ...{
                                  for (var i = 0; i < accounts.length; i++)
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                                      margin: EdgeInsets.only(bottom: 10.w),
                                      decoration: BoxDecoration(
                                        color: ConstTheme.centerChannelColor.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(5.w),
                                      ),
                                      child: Row(
                                        children: [
                                          Avatar(
                                            id: accounts[i].address,
                                            name: accounts[i].address,
                                            size: 50.w,
                                            fontSize: 36,
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  accounts[i].name!,
                                                  style: TextStyle(
                                                    color: ConstTheme.centerChannelColor,
                                                    fontSize: 16.w,
                                                  ),
                                                ),
                                                Text(
                                                  accounts[i].address,
                                                  style: TextStyle(
                                                    color: ConstTheme.centerChannelColor,
                                                    fontSize: 12.w,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10.w, height: 70.w),
                                          Container(
                                            height: 40.w,
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                              color: ConstTheme.linkColor.withOpacity(0.3),
                                              borderRadius: BorderRadius.circular(25.w),
                                            ),
                                            child: IconButton(
                                              onPressed: () async {
                                                // final client = im.currentState!.client;
                                                final input = await showTextInputDialog(
                                                  useRootNavigator: false,
                                                  context: context,
                                                  title: L10n.of(context)!.password,
                                                  okLabel: L10n.of(context)!.ok,
                                                  cancelLabel: L10n.of(context)!.cancel,
                                                  textFields: [
                                                    DialogTextField(
                                                      obscureText: true,
                                                      hintText: L10n.of(context)!.pleaseEnterYourPassword,
                                                      initialText: "",
                                                    )
                                                  ],
                                                );
                                                if (input == null) return;
                                                await showFutureLoadingDialog(
                                                  context: globalCtx(),
                                                  future: () async {
                                                    await im.login(accounts[i], input[0]);
                                                    // ignore: use_build_context_synchronously
                                                    globalCtx().push("/select_org?auto=t");
                                                  },
                                                );
                                              },
                                              icon: Icon(
                                                Icons.login,
                                                size: 18.w,
                                                color: ConstTheme.centerChannelColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Container(
                                            height: 40.w,
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                              color: ConstTheme.errorTextColor.withOpacity(0.3),
                                              borderRadius: BorderRadius.circular(25.w),
                                            ),
                                            child: IconButton(
                                              onPressed: () async {
                                                if (OkCancelResult.ok ==
                                                    await showOkCancelAlertDialog(
                                                      useRootNavigator: false,
                                                      title: "提示",
                                                      message: "确认删除用户，用户为本地账户，删除后无法恢复",
                                                      context: globalCtx(),
                                                      okLabel: L10n.of(globalCtx())!.next,
                                                      cancelLabel: L10n.of(globalCtx())!.cancel,
                                                    )) {
                                                  AccountApi.create().remove(accounts[i].id);
                                                  BotToast.showText(
                                                    text: '用户删除成功',
                                                    duration: const Duration(seconds: 2),
                                                  );
                                                  getList();
                                                }
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                size: 18.w,
                                                color: ConstTheme.centerChannelColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                },
                                SizedBox(
                                  height: 10.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => selectAccountType(),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
                            margin: EdgeInsets.symmetric(horizontal: 30.w),
                            width: double.maxFinite,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ConstTheme.centerChannelColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              L10n.of(context)!.generate,
                              style: TextStyle(
                                color: ConstTheme.centerChannelBg,
                                fontWeight: FontWeight.bold,
                                fontSize: 19.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.w),
                        InkWell(
                          onTap: () {
                            if (accounts.length >= 3) {
                              BotToast.showText(
                                text: L10n.of(context)!.tooManyUsers,
                                duration: const Duration(seconds: 2),
                              );
                              return;
                            }
                            context.push("/importSr25519key");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
                            width: MediaQuery.of(context).size.width * 0.4,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              L10n.of(context)!.importAccount,
                              style: TextStyle(
                                color: ConstTheme.centerChannelColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                      ],
                    ),
                  ),
                  if (isPc())
                    Expanded(
                      child: moveWindow(Container(
                        color: ConstTheme.sidebarBg,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () => pop(),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.w),
                                    child: Icon(
                                      Icons.close,
                                      size: 25.w,
                                      color: ConstTheme.sidebarText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Opacity(
                                opacity: 0.3,
                                // child: Lottie.asset(
                                //   'assets/crypto-wallet.json',
                                //   repeat: true,
                                // ),
                                child: Image.asset(
                                  'assets/banner.png',
                                  width: 350.w,
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                            ),
                            SizedBox(height: 65.w)
                          ],
                        ),
                      )),
                    ),
                ],
              ),
      ),
    );
  }
}
