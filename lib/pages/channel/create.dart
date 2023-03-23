import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/components.dart';
import '../../components/form/switch.dart';
import '../../router.dart';
import '../../utils/screen.dart';
import '../../store/im.dart';
import '../../store/theme.dart';

class CreateChannelPage extends StatefulWidget {
  final Function? closeModel;
  const CreateChannelPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<CreateChannelPage> createState() => _CreateChannelPageState();
}

class _CreateChannelPageState extends State<CreateChannelPage> {
  bool publicGroup = false;
  late final IMProvider im;
  late link.Client? client;
  final SubmitData _data = SubmitData(groupName: "", preset: link.CreateRoomPreset.publicChat);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    // me = im.me!;
    if (im.currentState != null) {
      client = im.currentState!.client;
    }
  }

  void submitAction() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    final roomID = await showFutureLoadingDialog(
      context: context,
      future: () async {
        final roomId = await client!.createGroupChat(
          groupName: _data.groupName,
          preset: _data.preset,
          visibility: link.Visibility.public,
        );
        return roomId;
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
    return Scaffold(
      backgroundColor: ConstTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "创建频道",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "创建频道",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10.w),
              TextFormField(
                style: TextStyle(
                  color: ConstTheme.centerChannelColor,
                ),
                decoration: InputDecoration(
                  hintText: '频道名称',
                  hintStyle: TextStyle(
                    fontSize: 14.w,
                    color: ConstTheme.centerChannelColor,
                  ),
                  filled: true,
                  fillColor: ConstTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.text_fields,
                    color: ConstTheme.centerChannelColor,
                  ),
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
              SwitchFormField(
                initialValue: _data.preset == link.CreateRoomPreset.publicChat,
                decoration: InputDecoration(
                  hintText: '是否公开',
                  hintStyle: TextStyle(
                    fontSize: 14.w,
                    color: ConstTheme.centerChannelColor,
                  ),
                  filled: true,
                  fillColor: ConstTheme.centerChannelColor.withOpacity(0.1),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.public,
                    color: ConstTheme.centerChannelColor,
                  ),
                ),
                onSaved: (v) {
                  if (v == null) {
                    _data.preset = link.CreateRoomPreset.privateChat;
                    return;
                  }
                  _data.preset = v ? link.CreateRoomPreset.publicChat : link.CreateRoomPreset.privateChat;
                },
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 50.w),
              InkWell(
                onTap: submitAction,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 30.w),
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ConstTheme.buttonBg,
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            '创建频道',
                            style: TextStyle(
                              color: ConstTheme.buttonColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19.w,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: ConstTheme.buttonColor,
                      )
                    ],
                  ),
                ),
              ),
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
