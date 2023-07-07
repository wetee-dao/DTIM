import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/infra/components/iconfont.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dtim/infra/components/loading_dialog.dart';
import 'package:dtim/native_wraper.dart';
import 'package:dtim/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/infra/components/app_bar.dart';

import '../../../application/store/work_ctx.dart';

@RoutePage(name: "createOrg")
class CreateOrgPage extends StatefulWidget {
  const CreateOrgPage({Key? key}) : super(key: key);

  @override
  State<CreateOrgPage> createState() => _CreateOrgPageState();
}

class _CreateOrgPageState extends State<CreateOrgPage> with WindowListener {
  List<String> seeds = [];
  int step = 0;
  final TextEditingController _imController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SubmitData _data = SubmitData(
    name: "",
    desc: "",
    purpose: "",
    imApi: "",
    bg: "",
    logo: "",
    img: "",
    homeUrl: "",
  );

  @override
  void initState() {
    super.initState();
    getSeeds();
  }

  getSeeds() {}

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final titles = ["1. Deploy the node on the cloud/computer", "2. Connect to the DTIM blockchain  "];
    return Scaffold(
      appBar: LocalAppBar(
        title: "Deploying an on-premise organization node:",
        onBack: () {
          if (step == 0) {
            context.router.pop();
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
                "Deploying an on-premise organization node:",
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
            child: TextFormField(
              key: const Key("imUrl"),
              style: TextStyle(color: constTheme.centerChannelColor),
              controller: _imController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '不能为空';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Please enter im address",
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  AppIcons.chat,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
            ),
          ),
          SizedBox(
            height: 10.w,
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
                child: InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse("https://github.com/DAOent/dao-entrance-node"));
                  },
                  child: Text(
                    "We have provided deployment documents, click to view",
                    style: TextStyle(
                      fontSize: 12.w,
                      color: constTheme.linkColor.withOpacity(0.7),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50.w),
          InkWell(
            key: const Key("goNext"),
            onTap: () async {
              try {
                final service = Uri.parse(_imController.text.replaceAll(RegExp(r"\s*"), ""));
                final im = context.read<AppCubit>();
                final userName = '${im.me!.address}@${service.host}/${platformGet()}';
                final client = Client(userName);

                // 链接节点
                await client.init();
                await client.checkHomeserver(service);
                setState(() {
                  step = 1;
                });
              } catch (e) {
                BotToast.showText(text: "im地址不正确", duration: const Duration(seconds: 2));
              }
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
              key: const Key("name"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: "Please enter organization name",
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _data.name = v ?? "";
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '不能为空';
                }
                return null;
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              key: const Key("logo"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: "Please enter the organization logo url",
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.logo_dev_rounded,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _data.logo = v ?? "";
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              key: const Key("desc"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: "Please enter a brief description of the organization",
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.description_rounded,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _data.desc = v ?? "";
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '不能为空';
                }
                return null;
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              key: const Key("purpose"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: "Please enter organization mission (optional)",
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.tag_rounded,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _data.purpose = v ?? "";
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              key: const Key("bg"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: "Please enter the organization background image URL (optional)",
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.colorize_rounded,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _data.bg = v ?? "";
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              key: const Key("img"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: "Please enter the URL of the image to be used to introduce the organization (optional)",
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.image_rounded,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _data.img = v ?? "";
              },
            ),
            SizedBox(height: 10.w),
            TextFormField(
              key: const Key("homeUrl"),
              style: TextStyle(
                color: constTheme.centerChannelColor,
              ),
              decoration: InputDecoration(
                hintText: "Please enter the organization homepage URL (optional)",
                hintStyle: TextStyle(
                  fontSize: 14.w,
                  color: constTheme.centerChannelColor,
                ),
                filled: true,
                fillColor: constTheme.centerChannelColor.withOpacity(0.08),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.home_rounded,
                  color: constTheme.centerChannelColor,
                ),
                errorMaxLines: 2,
              ),
              onSaved: (v) {
                _data.homeUrl = v ?? "";
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
                final im = context.read<AppCubit>();

                workCtx.connectChain(() async {
                  printInfo("workCtx.connectChain2");
                  if (!await inputPasswordg(im.me!)) {
                    return;
                  }
                  final res = await waitFutureLoading<String>(
                    context: globalCtx(),
                    future: () async {
                      printSuccess(_imController.text.replaceAll(RegExp(r"\s*"), ""));
                      try {
                        await rustApi.createDao(
                          client: workCtx.chainClient,
                          from: im.me!.address,
                          name: _data.name,
                          purpose: _data.purpose,
                          metaData: "{}",
                          desc: _data.desc,
                          imApi: _imController.text.replaceAll(RegExp(r"\s*"), ""),
                          bg: _data.bg,
                          logo: _data.logo,
                          img: _data.img,
                          homeUrl: _data.homeUrl,
                        );
                      } catch (e) {
                        return "The user's balance is not enough to pay the handling fee";
                      }
                      return "ok";
                    },
                  );
                  if (res.result != "ok") {
                    BotToast.showText(text: res.result ?? "error", duration: const Duration(seconds: 2));
                    return;
                  }
                  BotToast.showText(text: "Create org success", duration: const Duration(seconds: 2));
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

class SubmitData {
  String name;
  String desc;
  String purpose;
  String imApi;
  String bg;
  String logo;
  String img;
  String homeUrl;

  SubmitData({
    required this.desc,
    required this.name,
    required this.purpose,
    required this.imApi,
    required this.bg,
    required this.logo,
    required this.img,
    required this.homeUrl,
  });
}
