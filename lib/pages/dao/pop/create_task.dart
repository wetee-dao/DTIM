import 'dart:typed_data';

import 'package:asyou_app/rust_wraper.io.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../components/dao/priority_icon.dart';
import '../../../components/form/muti_select.dart';
import '../../../components/form/select.dart';
import '../../../models/models.dart';
import '../../../router.dart';
import '../../../store/dao_ctx.dart';
import '../../../utils/screen.dart';
import '../../../store/theme.dart';

class CreateTaskPage extends StatefulWidget {
  final String projectId;
  final Function? closeModel;
  const CreateTaskPage({Key? key, this.closeModel, required this.projectId}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateRoadMapPageState();
}

class _CreateRoadMapPageState extends State<CreateTaskPage> {
  bool publicGroup = false;
  final SubmitData _data = SubmitData(
    roadmapId: 202301,
    name: "",
    priority: 0,
    tags: [],
    amount: 10,
    desc: '',
    point: 10,
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
        await rustApi.daoProjectCreateTask(
          from: daoCtx.user.address,
          client: daoCtx.chainClient,
          daoId: daoCtx.org.daoId,
          name: _data.name,
          priority: _data.priority,
          skills: Uint8List.fromList(_data.tags),
          desc: _data.desc,
          point: _data.point,
          projectId: int.parse(widget.projectId),
          assignees: [],
          // reviewers: [daoCtx.user.address],
          amount: _data.amount,
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
    rootNavigatorKey.currentContext?.pop();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "创建任务",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "创建任务",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ),
      body: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20.w, bottom: 20.w),
                child: Column(
                  children: [...renderLeft()],
                ),
              ),
            ),
            Container(
              width: 250.w,
              margin: EdgeInsets.all(15.w),
              padding: EdgeInsets.only(left: 15.w),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: constTheme.centerChannelColor.withOpacity(0.1), width: 1)),
              ),
              child: Column(
                children: [...renderRight()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  renderRight() {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final titleStyle = TextStyle(
      fontSize: 14.w,
      color: constTheme.centerChannelColor,
      decorationColor: constTheme.centerChannelColor,
    );
    return [
      SelectFormField<int>(
        initialValue: _data.priority,
        options: <PopupMenuItem<int>>[
          for (var i = 0; i < prioritys.length; i++)
            PopupMenuItem<int>(
              value: i,
              child: Text(
                prioritys[i]!,
                style: titleStyle,
              ),
            ),
        ],
        decoration: InputDecoration(
          hintText: '优先级',
          hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
          filled: true,
          fillColor: constTheme.centerChannelColor.withOpacity(0.1),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.w)), borderSide: BorderSide.none),
          prefixIcon: Icon(Appicon.youxianji, color: constTheme.centerChannelColor, size: 18.w),
        ),
        onSaved: (v) {
          _data.priority = v ?? 0;
        },
        validator: (value) {
          if (value == null) {
            return '请选择优先级';
          }
          return null;
        },
      ),
      SizedBox(height: 10.w),
      MutiSelectFormField<int>(
        initialValue: _data.tags,
        options: C2Choice.listFrom<int, String>(
          source: tags.map((e) => e.label).toList(),
          value: (i, v) => tags[i].value,
          label: (i, v) => v,
          tooltip: (i, v) => v,
          style: (i, v) {
            if (['Science', 'Politics', 'News', 'Tech'].contains(v)) {
              return C2ChipStyle.toned(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              );
            }
            return null;
          },
        ),
        prefixIcon: Icon(Appicon.tag, color: constTheme.centerChannelColor, size: 18.w),
        decoration: InputDecoration(
          hintText: '标签',
          hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
          filled: true,
          fillColor: constTheme.centerChannelColor.withOpacity(0.1),
          // prefixIcon: Icon(Appicon.tag, color: constTheme.centerChannelColor, size: 18.w),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.w)), borderSide: BorderSide.none),
          contentPadding: EdgeInsets.zero,
        ),
        onSaved: (v) {
          _data.tags = v ?? [];
        },
        validator: (value) {
          if (value == null) {
            return '请选择标签';
          }
          return null;
        },
      ),
      SizedBox(height: 10.w),
      TextFormField(
        initialValue: _data.amount.toString(),
        style: TextStyle(color: constTheme.centerChannelColor),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '任务奖励',
          hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
          filled: true,
          fillColor: constTheme.centerChannelColor.withOpacity(0.1),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.w)), borderSide: BorderSide.none),
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
      SizedBox(height: 10.w),
      TextFormField(
        initialValue: _data.point.toString(),
        style: TextStyle(color: constTheme.centerChannelColor),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '任务奖励荣誉点',
          hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
          filled: true,
          fillColor: constTheme.centerChannelColor.withOpacity(0.1),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.w)), borderSide: BorderSide.none),
          prefixIcon: Icon(Icons.scoreboard_rounded, color: constTheme.centerChannelColor, size: 18.w),
        ),
        onSaved: (v) {
          var i = 0;
          if (v != null && v != "") {
            i = int.tryParse(v) ?? 0;
          }
          _data.point = i;
        },
        validator: (value) {
          final reg = RegExp(r"^[0-9_]+$");
          if (!reg.hasMatch(value ?? "")) {
            return '请输入数字';
          }
          if (value == null || value.isEmpty) {
            return '任务奖励荣誉点';
          }
          return null;
        },
      ),
    ];
  }

  renderLeft() {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return [
      TextFormField(
        style: TextStyle(color: constTheme.centerChannelColor),
        decoration: InputDecoration(
          hintText: '任务内容',
          hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
          filled: true,
          fillColor: constTheme.centerChannelColor.withOpacity(0.1),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.w)), borderSide: BorderSide.none),
          prefixIcon: Icon(Icons.text_fields, color: constTheme.centerChannelColor, size: 18.w),
        ),
        onSaved: (v) {
          _data.name = v ?? "";
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
      SizedBox(height: 10.w),
      Container(
        decoration: BoxDecoration(
          color: constTheme.centerChannelColor.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(4.w)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 7.w, top: 9.w),
              child: Icon(Icons.description_rounded, color: constTheme.centerChannelColor, size: 18.w),
            ),
            Expanded(
              child: TextFormField(
                style: TextStyle(color: constTheme.centerChannelColor),
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: '任务详情',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  hoverColor: Colors.transparent,
                ),
                onSaved: (v) {
                  _data.desc = v ?? "";
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
            ),
          ],
        ),
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
                    '创建任务',
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
    ];
  }
}

class SubmitData {
  int roadmapId;
  String name;
  int priority;
  List<int> tags;
  String desc;
  int point;
  int amount;

  SubmitData({
    required this.roadmapId,
    required this.name,
    required this.priority,
    required this.tags,
    required this.desc,
    required this.point,
    required this.amount,
  });
}
