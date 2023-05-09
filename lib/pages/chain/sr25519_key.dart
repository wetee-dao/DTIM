import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:window_manager/window_manager.dart';

import '../../router.dart';
import '../../store/theme.dart';
import '../../utils/screen.dart';
import '../../models/account.dart';
import '../../apis/account_api.dart';
import '../../rust_wraper.io.dart';
import '../../components/app_bar.dart';

@RoutePage(name: "sr25519key")
class Sr25519KeyPage extends StatefulWidget {
  const Sr25519KeyPage({Key? key}) : super(key: key);

  @override
  State<Sr25519KeyPage> createState() => _Sr25519KeyPageState();
}

class _Sr25519KeyPageState extends State<Sr25519KeyPage> with WindowListener {
  List<String> seeds = [];
  int step = 0;
  String _name = "";
  String _password = "";
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getSeeds();
  }

  getSeeds() {
    rustApi.seedGenerate().then((value) {
      setState(() {
        seeds = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final titles = [L10n.of(context)!.singup1, L10n.of(context)!.singup2];
    return Scaffold(
      appBar: LocalAppBar(
        title: L10n.of(context)!.signUp,
        onBack: () {
          if (step == 0) {
            context.router.pop();
            ;
          } else {
            setState(() {
              step = step - 1;
            });
          }
        },
      ),
      backgroundColor: constTheme.centerChannelBg,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                L10n.of(context)!.generate,
                style: TextStyle(
                  fontSize: 32.w,
                  color: constTheme.centerChannelColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                titles[step],
                style: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor.withOpacity(0.7),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 40.w,
              ),
              stepRender(step),
            ],
          ),
        ),
      ),
    );
  }

  Widget stepRender(int s) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    if (s == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: constTheme.centerChannelColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: Wrap(
              children: [
                for (var i = 0; i < seeds.length; i++)
                  Container(
                    padding: EdgeInsets.all(5.w),
                    child: Text(
                      seeds[i],
                      style: TextStyle(
                        fontSize: 14.w,
                        color: constTheme.centerChannelColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 5.w,
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(
                text: seeds.join(" "),
              )).then((value) {
                BotToast.showText(text: L10n.of(context)!.mnemonicCopied, duration: const Duration(seconds: 2));
              });
            },
            child: Row(
              children: [
                Icon(
                  Icons.copy_all,
                  size: 20.w,
                  color: constTheme.centerChannelColor,
                ),
                SizedBox(width: 5.w),
                Text(
                  L10n.of(context)!.copyClipboard,
                  style: TextStyle(
                    fontSize: 14.w,
                    color: constTheme.centerChannelColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.w,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.w),
                child: Icon(
                  Icons.warning,
                  size: 14.w,
                  color: constTheme.linkColor,
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                // margin: EdgeInsets.only(left: 5.w),
                child: Text(
                  L10n.of(context)!.mnemonicNote,
                  style: TextStyle(
                    fontSize: 12.w,
                    color: constTheme.linkColor.withOpacity(0.7),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50.w),
          InkWell(
            key: const Key("goNext"),
            onTap: () {
              setState(() {
                step = 1;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15.w,
                horizontal: 30.w,
              ),
              decoration: BoxDecoration(
                color: constTheme.buttonBg,
                borderRadius: BorderRadius.circular(5.w),
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        L10n.of(context)!.next,
                        style: TextStyle(
                          color: constTheme.buttonColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 19.w,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: constTheme.buttonColor,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    } else if (s == 1) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: const Key("nick"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: L10n.of(context)!.accountName,
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.account_balance_wallet,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _name = v ?? "";
              },
              validator: (value) {
                RegExp reg = RegExp(r'^[\u4E00-\u9FA5A-Za-z0-9_]+$');
                if (!reg.hasMatch(value ?? "")) {
                  return L10n.of(context)!.accountNameRule;
                }
                if (value == null || value.isEmpty) {
                  return L10n.of(context)!.accountNameNotNull;
                }
                return null;
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              key: const Key("passwd"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: L10n.of(context)!.accountPasswd,
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.password,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _password = v ?? "";
              },
              validator: (value) {
                RegExp reg = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$');
                if (!reg.hasMatch(value ?? "")) {
                  return L10n.of(context)!.accountPasswdRule;
                }
                return null;
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              key: const Key("passwd2"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              obscureText: true,
              decoration: InputDecoration(
                hintText: L10n.of(context)!.accountPasswd2,
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.password,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _password = v ?? "";
              },
              validator: (value) {
                if (_passwordController.text != value) {
                  return L10n.of(context)!.accountPasswdNoeq;
                }
                return null;
              },
            ),
            SizedBox(height: 50.w),
            InkWell(
              key: const Key("keyDone"),
              onTap: () {
                if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
                  return;
                }
                _formKey.currentState!.save();

                rustApi
                    .getSeedPhrase(seedStr: seeds.join(" "), name: _name, password: _password)
                    .then((accountStr) async {
                  // print(accountStr);

                  // 解码区块链账户问题
                  final chainData = ChainData.fromJson(
                    convert.jsonDecode(accountStr),
                  );

                  // 创建账户
                  final initUser = Account();
                  initUser.name = chainData.meta["name"];
                  initUser.address = chainData.address;
                  initUser.domain = "";
                  initUser.chainData = accountStr;

                  //保存在本地
                  AccountApi.create().addUser(initUser);
                  BotToast.showText(text: L10n.of(context)!.accountCreated, duration: const Duration(seconds: 2));

                  globalCtx().router.pop();
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.w,
                  horizontal: 30.w,
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: constTheme.buttonBg,
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          L10n.of(context)!.createAccount,
                          style: TextStyle(
                            color: constTheme.buttonColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 19.w,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: constTheme.buttonColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }
}
