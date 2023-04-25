import 'package:asyou_app/rust_wraper.io.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../router.dart';
import '../../../store/dao_ctx.dart';
import '../../../utils/screen.dart';
import '../../../store/theme.dart';

class JoinDaoPage extends StatefulWidget {
  final Function? closeModel;
  const JoinDaoPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<JoinDaoPage> createState() => _JoinDaoPageState();
}

class _JoinDaoPageState extends State<JoinDaoPage> {
  bool publicGroup = false;
  late String ss58Address;
  final SubmitData _data = SubmitData(
    roadmapId: 202301,
    share: 10000,
    value: 10000,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ss58Address = daoCtx.ss58Address;
  }

  void submitAction() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    if (daoCtx.nativeAmount.free < 100) {
      BotToast.showText(
        text: "The user's balance is not enough to pay the handling fee",
        duration: const Duration(seconds: 2),
      );
      return;
    }
    await waitFutureLoading(
      context: context,
      future: () async {
        await rustApi.joinDao(
          from: daoCtx.user.address,
          client: daoCtx.chainClient,
          daoId: daoCtx.org.daoId,
          shareExpect: _data.share,
          value: _data.value,
        );
      },
    );

    //跳转到组织列表
    if (!mounted) return;
    if (widget.closeModel != null) {
      widget.closeModel!.call();
      return;
    }

    rootNavigatorKey.currentContext?.pop();
    await daoCtx.daoRefresh();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "Join DAO",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "Join DAO",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.w),
              Text(
                "Account：$ss58Address",
                style: TextStyle(fontSize: 15.w, color: constTheme.centerChannelColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.w),
              Text(
                "Expected to get SHARE:",
                style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
              ),
              SizedBox(height: 10.w),
              TextFormField(
                initialValue: _data.share.toString(),
                keyboardType: TextInputType.number,
                style: TextStyle(color: constTheme.centerChannelColor),
                decoration: InputDecoration(
                  hintText: 'Share',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.text_fields, color: constTheme.centerChannelColor),
                ),
                onSaved: (v) {
                  _data.share = int.parse(v ?? "0");
                },
                validator: (value) {
                  final reg = RegExp(r"^[0-9_]+$");
                  if (!reg.hasMatch(value ?? "")) {
                    return '请输入数字';
                  }
                  if (value == null || value.isEmpty) {
                    return '任务奖励不能为空';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.w),
              Text(
                "Expected investment:",
                style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
              ),
              SizedBox(height: 10.w),
              TextFormField(
                initialValue: _data.value.toString(),
                keyboardType: TextInputType.number,
                style: TextStyle(color: constTheme.centerChannelColor),
                decoration: InputDecoration(
                  hintText: 'Amount',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.text_fields, color: constTheme.centerChannelColor),
                ),
                onSaved: (v) {
                  _data.value = int.parse(v ?? "0");
                },
                validator: (value) {
                  RegExp reg = RegExp(r'^[\u4E00-\u9FA5A-Za-z0-9_]+$');
                  if (!reg.hasMatch(value ?? "")) {
                    return '请输入中文、英文、数字、下划线组成昵称';
                  }
                  if (value == null || value.isEmpty) {
                    return '名称不能为空';
                  }
                  return null;
                },
              ),
              Expanded(child: Container()),
              // SizedBox(height: 50.w),
              InkWell(
                onTap: submitAction,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 30.w),
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
                            'Join',
                            style: TextStyle(
                              color: constTheme.buttonColor,
                              fontWeight: FontWeight.bold,
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
              SizedBox(height: 30.w),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitData {
  int roadmapId;
  int share;
  int value;

  SubmitData({
    required this.roadmapId,
    required this.share,
    required this.value,
  });
}
