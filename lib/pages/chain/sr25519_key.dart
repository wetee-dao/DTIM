import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:window_manager/window_manager.dart';

import '../../store/theme.dart';
import '../../utils/screen.dart';
import '../../models/account.dart';
import '../../apis/account_api.dart';
import '../../rust_wraper.io.dart';
import '../../components/app_bar.dart';

class Sr25519KeyPage extends StatefulWidget {
  const Sr25519KeyPage({Key? key}) : super(key: key);

  @override
  State<Sr25519KeyPage> createState() => _Sr25519KeyPageState();
}

const titles = ["第一步：生成助记词", "第二步：完成创建"];

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
    api.seedGenerate().then((value) {
      setState(() {
        seeds = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LocalAppBar(
        title: "创建波卡生态加密账户",
        onBack: () {
          if (step == 0) {
            context.pop();
          } else {
            setState(() {
              step = step - 1;
            });
          }
        },
      ),
      backgroundColor: ConstTheme.centerChannelBg,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '创建区块链账户',
                style: TextStyle(
                  fontSize: 32.w,
                  color: ConstTheme.centerChannelColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                titles[step],
                style: TextStyle(
                  fontSize: 14.w,
                  color: ConstTheme.centerChannelColor.withOpacity(0.7),
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
    if (s == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: ConstTheme.sidebarBg,
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
                        color: ConstTheme.centerChannelColor,
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
                MotionToast.success(
                  title: const Text(
                    '提示',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  description: const Text('助记词复制成功'),
                  animationCurve: Curves.bounceIn,
                  borderRadius: 0,
                  animationDuration: const Duration(milliseconds: 500),
                ).show(context);
              });
            },
            child: Row(
              children: [
                Icon(
                  Icons.copy_all,
                  size: 20.w,
                  color: ConstTheme.centerChannelColor,
                ),
                SizedBox(width: 5.w),
                Text(
                  "复制到剪贴板",
                  style: TextStyle(
                    fontSize: 14.w,
                    color: ConstTheme.centerChannelColor,
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
                  color: ConstTheme.linkColor,
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                // margin: EdgeInsets.only(left: 5.w),
                child: Text(
                  "请写下你的钱包助记词，放在安全的地方。这个助记词可以用来恢复你的钱包。小心保管，以免失去你的资产。",
                  style: TextStyle(
                    fontSize: 12.w,
                    color: ConstTheme.linkColor.withOpacity(0.7),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50.w),
          InkWell(
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
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ConstTheme.centerChannelColor,
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        '下一步',
                        style: TextStyle(
                          color: ConstTheme.centerChannelBg,
                          fontWeight: FontWeight.w600,
                          fontSize: 19.w,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: ConstTheme.centerChannelBg,
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
              style: TextStyle(
                color: ConstTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: '账户昵称',
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: ConstTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: ConstTheme.sidebarBg.withOpacity(0.2),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.account_balance_wallet,
                  color: ConstTheme.centerChannelColor,
                ),
              ),
              onSaved: (v) {
                _name = v ?? "";
              },
              validator: (value) {
                RegExp reg = RegExp(r'^[\u4E00-\u9FA5A-Za-z0-9_]+$');
                if (!reg.hasMatch(value ?? "")) {
                  return '请输入中文、英文、数字、下划线组成昵称';
                }
                if (value == null || value.isEmpty) {
                  return '昵称不能为空';
                }
                return null;
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              style: TextStyle(
                color: ConstTheme.centerChannelColor,
              ),
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: '账户密码',
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: ConstTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: ConstTheme.sidebarBg.withOpacity(0.2),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.password,
                  color: ConstTheme.centerChannelColor,
                ),
              ),
              onSaved: (v) {
                _password = v ?? "";
              },
              validator: (value) {
                RegExp reg = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$');
                if (!reg.hasMatch(value ?? "")) {
                  return '密码不能为纯数字或字母，不少于6位';
                }
                return null;
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              style: TextStyle(
                color: ConstTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: '再次输入密码',
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: ConstTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: ConstTheme.sidebarBg.withOpacity(0.2),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.password,
                  color: ConstTheme.centerChannelColor,
                ),
              ),
              onSaved: (v) {
                _password = v ?? "";
              },
              validator: (value) {
                if (_passwordController.text != value) {
                  return "两次输入密码不一致";
                }
                return null;
              },
            ),
            SizedBox(height: 50.w),
            InkWell(
              onTap: () {
                if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
                  return;
                }
                _formKey.currentState!.save();

                api
                    .getSeedPhrase(
                  seedStr: seeds.join(" "),
                  name: _name,
                  password: _password,
                )
                    .then((accountStr) {
                  print(accountStr);
                  // 解码区块链账户问题
                  var chainData = ChainData.fromJson(
                    convert.jsonDecode(accountStr),
                  );

                  // 创建账户
                  var initUser = Account();
                  initUser.name = chainData.meta["name"];
                  initUser.address = chainData.address;
                  initUser.domain = "";
                  initUser.chainData = accountStr;

                  //保存在本地
                  AccountApi.create().addUser(initUser);

                  //跳转到组织列表
                  MotionToast.success(
                    title: const Text(
                      '提示',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    description: const Text('账户创建成功，稍后您需要选择您的组织连接web3网络'),
                    animationCurve: Curves.bounceIn,
                    borderRadius: 0,
                    animationDuration: const Duration(milliseconds: 500),
                    onClose: () {
                      context.push("/select_org");
                    },
                  ).show(context);
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
                  color: ConstTheme.centerChannelColor,
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          '创建本地账户',
                          style: TextStyle(
                            color: ConstTheme.centerChannelBg,
                            fontWeight: FontWeight.w600,
                            fontSize: 19.w,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: ConstTheme.centerChannelBg,
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
