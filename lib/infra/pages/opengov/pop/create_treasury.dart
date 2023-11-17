import 'package:bot_toast/bot_toast.dart';
import 'package:dtim/application/store/app/app.dart';

import 'package:dtim/infra/components/gov_pop.dart';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/router.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTreasuryPage extends StatefulWidget {
  final Function? closeModel;
  const CreateTreasuryPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<CreateTreasuryPage> createState() => _CreateTreasuryPageState();
}

class _CreateTreasuryPageState extends State<CreateTreasuryPage> {
  bool publicGroup = false;
  final SubmitData _data = SubmitData(
    amount: 10,
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

    var gov = await showGovPop(const MemberGroup(
      scope: 1,
      id: 0,
    ));
    if (gov == null) {
      BotToast.showText(text: "取消操作");
      return;
    }
   
    final im = globalCtx().read<AppCubit>();
    if (!await inputPasswordg(im.me!)) {
      return;
    }

    await waitFutureLoading(
      context: globalCtx(),
      future: () async {
        // var pid = await XXXXcreateTreasuryProposal(
        //   from: workCtx.user.address,
        //   client: workCtx.chainClient,
        //   daoId: workCtx.org.daoId,
        //   value: _data.amount,
        //   beneficiary: workCtx.user.address,
        // );

        // await XXXXgovProposal(
        //   from: workCtx.user.address,
        //   client: workCtx.chainClient,
        //   daoId: workCtx.org.daoId,
        //   proposalId: pid,
        //   ext: gov,
        // );

        BotToast.showText(text: gov.runType == 2 ? "国库申请成功" : "国库申请成功，请到治理插件中开启投票");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      key: const Key("createTaskView"),
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "Create a treasury proposal",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "Create a treasury proposal",
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
                key: const Key("Amount"),
                style: TextStyle(color: constTheme.centerChannelColor),
                decoration: InputDecoration(
                  hintText: 'Amount value',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.w),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.money_rounded, color: constTheme.centerChannelColor),
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
                    return '金额不能为空';
                  }
                  if (value == "0") {
                    return '金额不能为空';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.w),

              Expanded(child: Container()),
              // SizedBox(height: 50.w),
              InkWell(
                key: const Key("createProposal"),
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
                            'Create proposal',
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
  int amount;

  SubmitData({
    required this.amount,
  });
}
