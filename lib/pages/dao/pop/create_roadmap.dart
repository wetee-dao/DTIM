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

class CreateRoadMapPage extends StatefulWidget {
  final Function? closeModel;
  const CreateRoadMapPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<CreateRoadMapPage> createState() => _CreateRoadMapPageState();
}

class _CreateRoadMapPageState extends State<CreateRoadMapPage> {
  bool publicGroup = false;
  final SubmitData _data = SubmitData(
    roadmapId: 202301,
    name: "",
    priority: 0,
    tags: [],
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
        await rustApi.daoCreateRoadmapTask(
          from: daoCtx.user.address,
          client: daoCtx.chainClient,
          daoId: daoCtx.org.daoId,
          roadmapId: _data.roadmapId,
          name: _data.name,
          priority: _data.priority,
          tags: Uint8List.fromList(_data.tags),
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
    final titleStyle = TextStyle(
      fontSize: 14.w,
      color: constTheme.centerChannelColor,
      decorationColor: constTheme.centerChannelColor,
    );
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "Create task",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "Create task",
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
                  hintText: 'Task content',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.text_fields, color: constTheme.centerChannelColor, size: 18.w),
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
                  hintText: 'time',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Appicon.iconjinxingzhong, color: constTheme.centerChannelColor, size: 16.w),
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
                  hintText: 'Priority',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
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
                  hintText: 'Tag',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
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
                            'Create task',
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
