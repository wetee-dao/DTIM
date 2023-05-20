import 'package:asyou_app/native_wraper.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../bridge_struct.dart';
import '../../../components/components.dart';
import '../../../router.dart';
import '../../../store/dao_ctx.dart';
import '../../../utils/screen/screen.dart';
import '../../../store/theme.dart';

class CreateProjectPage extends StatefulWidget {
  final Function? closeModel;
  const CreateProjectPage({Key? key, this.closeModel}) : super(key: key);

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

    if (!daoCtx.checkAfterTx()) return;
    await waitFutureLoading(
      context: context,
      future: () async {
        if (_data.type == 0) {
          await rustApi.createGuild(
            from: daoCtx.user.address,
            client: daoCtx.chainClient,
            daoId: daoCtx.org.daoId,
            name: _data.name,
            desc: _data.desc,
            ext: const WithGovPs(
              runType: 1,
              amount: 100,
              member: MemberGroup(scope: 1, id: 0),
            ),
          );
        } else {
          await rustApi.createProject(
            from: daoCtx.user.address,
            client: daoCtx.chainClient,
            daoId: daoCtx.org.daoId,
            name: _data.name,
            desc: _data.desc,
            ext: const WithGovPs(
              runType: 1,
              amount: 100,
              member: MemberGroup(scope: 1, id: 0),
            ),
          );
        }
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
                    Appicon.zuzhiDataOrganization6,
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
                    Appicon.xiangmu,
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
