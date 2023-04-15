import 'dart:typed_data';

import 'package:asyou_app/rust_wraper.io.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../components/dao/priority_icon.dart';
import '../../../components/form/muti_select.dart';
import '../../../components/form/select.dart';
import '../../../models/models.dart';
import '../../../router.dart';
import '../../../store/im.dart';
import '../../../utils/screen.dart';
import '../../../store/theme.dart';

class CreateRoadMapPage extends StatefulWidget {
  final Function? closeModel;
  const CreateRoadMapPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<CreateRoadMapPage> createState() => _CreateRoadMapPageState();
}

class _CreateRoadMapPageState extends State<CreateRoadMapPage> {
  bool publicGroup = false;
  late final IMProvider im;
  final SubmitData _data = SubmitData(
    roadmapId: 202301,
    name: "",
    priority: 0,
    tags: [],
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    im = context.read<IMProvider>();
    super.initState();
  }

  void submitAction() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    await waitFutureLoading(
      context: context,
      future: () async {
        await rustApi.daoCreateRoadmapTask(
          from: im.me!.address,
          client: im.currentState!.chainClient,
          daoId: im.currentState!.org.daoId,
          roadmapId: _data.roadmapId,
          name: _data.name,
          priority: _data.priority,
          tags: Uint8List.fromList(_data.tags),
        );
      },
    );

    //跳转到组织列表
    if (!mounted) return;
    BotToast.showText(text: '频道创建成功，现在返回主页面', duration: const Duration(seconds: 2));
    if (widget.closeModel != null) {
      widget.closeModel!.call();
      return;
    }
    rootNavigatorKey.currentContext?.pop();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final titleStyle = TextStyle(
      fontSize: 14.w,
      color: constTheme.centerChannelColor,
      decorationColor: constTheme.centerChannelColor,
    );
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
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 15.w),
              TextFormField(
                style: TextStyle(color: constTheme.centerChannelColor),
                decoration: InputDecoration(
                  hintText: '标题',
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
              SelectFormField<int>(
                initialValue: _data.roadmapId,
                options: <PopupMenuItem<int>>[
                  PopupMenuItem<int>(
                    value: 202301,
                    child: Text(
                      "2023.Q1",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 202302,
                    child: Text(
                      "2023.Q2",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 202303,
                    child: Text(
                      "2023.Q3",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 202304,
                    child: Text(
                      "2023.Q4",
                      style: titleStyle,
                    ),
                  ),
                ],
                decoration: InputDecoration(
                  hintText: '时间',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Appicon.youxianji, color: constTheme.centerChannelColor),
                ),
                onSaved: (v) {
                  _data.roadmapId = v ?? 0;
                },
                validator: (value) {
                  if (value == null || value == 0) {
                    return '请选择时间';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.w),
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
                  border: InputBorder.none,
                  prefixIcon: Icon(Appicon.youxianji, color: constTheme.centerChannelColor),
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
                decoration: InputDecoration(
                  hintText: '标签',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Appicon.tag, color: constTheme.centerChannelColor),
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
  String name;
  int priority;
  List<int> tags;

  SubmitData({
    required this.roadmapId,
    required this.name,
    required this.priority,
    required this.tags,
  });
}
