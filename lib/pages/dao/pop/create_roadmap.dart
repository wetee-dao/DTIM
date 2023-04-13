import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../../components/components.dart';
import '../../../components/form/muti_select.dart';
import '../../../components/form/select.dart';
import '../../../components/form/switch.dart';
import '../../../router.dart';
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
  final SubmitData _data = SubmitData(groupName: "", preset: link.CreateRoomPreset.publicChat);
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
    await waitFutureLoading(
      context: context,
      future: () async {
        return "";
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
                  _data.groupName = v ?? "";
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
              TextFormField(
                style: TextStyle(color: constTheme.centerChannelColor),
                decoration: InputDecoration(
                  hintText: '描述',
                  hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                  filled: true,
                  fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.info_outline_rounded, color: constTheme.centerChannelColor),
                ),
                onSaved: (v) {
                  _data.groupName = v ?? "";
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
                initialValue: 0,
                options: <PopupMenuItem<int>>[
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "2023.Q1",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      "2023.Q2",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text(
                      "2023.Q3",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
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
                onSaved: (v) {},
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 10.w),
              SelectFormField<int>(
                initialValue: 0,
                options: <PopupMenuItem<int>>[
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "No Priority",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      "Low Priority",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text(
                      "Medium Priority",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text(
                      "High Priority",
                      style: titleStyle,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 4,
                    child: Text(
                      "Urgent",
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
                onSaved: (v) {},
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 10.w),
              MutiSelectFormField<int>(
                initialValue: [],
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
                onChanged: (v) {
                  print(v);
                },
                onSaved: (v) {},
                validator: (value) {
                  return null;
                },
              ),
              Expanded(child: Container()),
              // SizedBox(height: 50.w),
              InkWell(
                onTap: submitAction,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 30.w),
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
  String groupName;
  link.CreateRoomPreset preset;

  SubmitData({required this.groupName, required this.preset});
}

final tags = [Tag("DAPP", 1), Tag("TEE", 2), Tag("Pallet", 3)];

class Tag {
  final int value;
  final String label;

  Tag(this.label, this.value);
}
