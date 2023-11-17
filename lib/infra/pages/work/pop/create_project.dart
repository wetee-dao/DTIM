import 'package:convert/convert.dart';
import 'package:dtim/chain/wetee/wetee.dart';

import 'package:dtim/chain/wetee_gen/types/wetee_gov/member_data.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_runtime/runtime_call.dart';
import 'package:dtim/domain/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/router.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';

class CreateProjectPage extends StatefulWidget {
  final Function? closeModel;
  const CreateProjectPage({super.key, this.closeModel});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  bool publicGroup = false;
  final SubmitData _data = SubmitData(
    name: "",
    desc: "",
    type: 0,
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

    if (!await workCtx.checkAfterTx()) return;
    await waitFutureLoading(
      context: globalCtx(),
      future: () async {
        late RuntimeCall call;
        if (_data.type == 0) {
          call = workCtx.client.tx.weteeGuild.createGuild(
            daoId: workCtx.org.daoId,
            name: strToChain(_data.name),
            desc: strToChain(_data.desc),
            metaData: strToChain("{}"),
            creator: hex.decode(workCtx.user.address),
          );
        } else {
          call = workCtx.client.tx.weteeProject.createProject(
            daoId: workCtx.org.daoId,
            name: strToChain(_data.name),
            description: strToChain(_data.desc),
            creator: hex.decode(workCtx.user.address),
          );
        }

        workCtx.client.signAndSubmit(
          call,
          workCtx.user.address,
          gov: WithGovPs(
            runType: 1,
            amount: 10,
            member: const Global(),
            periodIndex: 0,
            daoId: BigInt.from(workCtx.org.daoId),
          ),
        );

        await workCtx.daoRefresh();
      },
    );

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
              title: "Create a project/guild",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "Create a project/guild",
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
                key: const Key("spaceName"),
                style: TextStyle(color: constTheme.centerChannelColor),
                decoration: InputDecoration(
                  hintText: 'Space Name',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.text_fields, color: constTheme.centerChannelColor),
                ),
                onSaved: (v) {
                  _data.name = v ?? "";
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '名称不能为空';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.w),
              TextFormField(
                key: const Key("spaceDescription"),
                style: TextStyle(color: constTheme.centerChannelColor),
                decoration: InputDecoration(
                  hintText: 'Space Description',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.description_rounded, color: constTheme.centerChannelColor),
                ),
                onSaved: (v) {
                  _data.desc = v ?? "";
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '简介不能为空';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.w),
              Row(children: [
                GestureDetector(
                  key: const Key("selectGuild"),
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _data.type = 0;
                    setState(() {});
                  },
                  child: renderType(
                    AppIcons.zuzhi_data_organization_6,
                    "Guild",
                    "Everything is for interest, exploration and growth .",
                    _data.type == 0,
                  ),
                ),
                GestureDetector(
                  key: const Key("selectProject"),
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _data.type = 1;
                    setState(() {});
                  },
                  child: renderType(
                    AppIcons.xiangmu,
                    "Project",
                    "Use Projects to manage tasks that .",
                    _data.type == 1,
                  ),
                ),
              ]),

              Expanded(child: Container()),
              // SizedBox(height: 50.w),
              InkWell(
                key: const Key("createSpace"),
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
                            'Create',
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
  String name;
  String desc;
  int type;

  SubmitData({
    required this.desc,
    required this.name,
    required this.type,
  });
}
