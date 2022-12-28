import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
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

class _PreloaderPageState extends State<PreloaderPage> with WindowListener {
  bool _loading = true;
  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    accounts = AccountApi.create().getUsers();
    var im = context.read<IMProvider>();
    if (im.connections.keys.isEmpty) {
      Timer(const Duration(milliseconds: 2000), () {
        setState(() {
          _loading = false;
        });
      });
    }
    im.addListener(() {
      if (im.current == null || im.currentState == null) {
        return;
      }
    });

    if (accounts.isNotEmpty) {
      Timer(const Duration(milliseconds: 2000), () {
        if (im.current == null && accounts.isNotEmpty) {
          context.push("/select_org");
        }
      });
    }
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
                      '注册波卡生态账户',
                      style: TextStyle(
                        color: ConstTheme.centerChannelBg,
                        fontWeight: FontWeight.w600,
                        fontSize: 19.w,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                context.push("/sr25519key");
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
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      moveWindow(SizedBox(
                        height: 70.w,
                        width: MediaQuery.of(context).size.width * 0.4,
                      )),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '生成加密账户',
                                style: TextStyle(
                                  fontSize: 32.w,
                                  color: ConstTheme.centerChannelColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                '欢迎使用「我门」web3协作软件，将你的办公搬进元宇宙！',
                                style: TextStyle(
                                  fontSize: 14.w,
                                  color: ConstTheme.centerChannelColor.withOpacity(0.7),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 120.w,
                              ),
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
                          padding: EdgeInsets.symmetric(
                            vertical: 15.w,
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ConstTheme.centerChannelColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '创建区快链账户',
                            style: TextStyle(
                              color: ConstTheme.centerChannelBg,
                              fontWeight: FontWeight.w600,
                              fontSize: 19.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.w),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.w,
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '导入区块链账户',
                            style: TextStyle(
                              color: ConstTheme.centerChannelColor,
                              fontWeight: FontWeight.w600,
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
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
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
                              opacity: 0.8,
                              child: Lottie.asset(
                                'assets/crypto-wallet.json',
                                repeat: true,
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
