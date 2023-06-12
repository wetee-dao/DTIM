import 'package:asyou_app/native_wraper.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:asyou_app/bridge_struct.dart';
import 'package:asyou_app/infra/components/components.dart';
import 'package:asyou_app/router.dart';
import 'package:asyou_app/application/store/dao_ctx.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:asyou_app/application/store/theme.dart';

class ApplyProjectFundingPage extends StatefulWidget {
  final Function? closeModel;
  final String projectId;
  const ApplyProjectFundingPage({Key? key, this.closeModel, required this.projectId}) : super(key: key);

  @override
  State<ApplyProjectFundingPage> createState() => _ApplyProjectFundingPageState();
}

class _ApplyProjectFundingPageState extends State<ApplyProjectFundingPage> {
  bool publicGroup = false;
  final SubmitData _data = SubmitData(
    amount: 0,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void submitAction() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    if (_data.amount <= 0) {
      BotToast.showText(text: 'The application amount is not less than 0.', duration: const Duration(seconds: 2));
      return;
    }
    if (!await daoCtx.checkAfterTx()) return;
    await waitFutureLoading(
      context: context,
      future: () async {
        await rustApi.daoApplyProjectFunds(
          from: daoCtx.user.address,
          client: daoCtx.chainClient,
          daoId: daoCtx.org.daoId,
          projectId: int.parse(widget.projectId),
          amount: _data.amount,
          ext: const WithGovPs(
            runType: 1,
            amount: 10,
            member: MemberGroup(scope: 1, id: 0),
          ),
        );
      },
    );
    await daoCtx.daoRefresh();

    //跳转到组织列表
    if (!mounted) return;
    if (widget.closeModel != null) {
      widget.closeModel!.call();
      return;
    }
    globalCtx().router.pop();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "Apply for funding for task #${widget.projectId}",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "Apply for funding for task #${widget.projectId}",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 15.w),
              TextFormField(
                initialValue: _data.amount.toString(),
                style: TextStyle(color: constTheme.centerChannelColor),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)), borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.payment_rounded, color: constTheme.centerChannelColor, size: 18.w),
                  suffixText: "WTE",
                ),
                onSaved: (v) {
                  var i = 0;
                  if (v != null && v != "") {
                    i = int.tryParse(v) ?? 0;
                  }
                  _data.amount = i;
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
              Expanded(child: Container()),
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
                            'Start applying',
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

  renderType(icon, title, desc, select) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final titleStyle = TextStyle(
      fontSize: 14.w,
      color: constTheme.centerChannelColor,
      decorationColor: constTheme.centerChannelColor,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 13.w, left: 0.w),
          child: Icon(
            select ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
            color: select ? constTheme.buttonBg : constTheme.centerChannelColor,
            size: 20.w,
          ),
        ),
        Container(
          width: 220.w,
          padding: EdgeInsets.all(10.w),
          // margin: EdgeInsets.only(right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: constTheme.centerChannelColor, size: 17.w),
                  SizedBox(width: 7.w),
                  Text(title, style: titleStyle.copyWith(fontSize: 17.w)),
                ],
              ),
              SizedBox(height: 5.w),
              Text(
                desc,
                style: titleStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SubmitData {
  int amount;

  SubmitData({
    required this.amount,
  });
}
