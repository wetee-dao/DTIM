import 'package:flutter/material.dart';

import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../utils/screen.dart';
import '../../components/components.dart';
import '../../components/form/switch.dart';
import '../../store/im.dart';
import '../../store/theme.dart';

class NoticePage extends StatefulWidget {
  final Function? closeModel;
  const NoticePage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
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
        final roomId = await client!.createGroupChat(groupName: _data.groupName, preset: _data.preset);
        return roomId;
      },
    );
    //跳转到组织列表
    if (!mounted) return;
    MotionToast.success(
      title: const Text(
        '提示',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('频道创建成功，现在返回主页面'),
      animationCurve: Curves.bounceIn,
      borderRadius: 0,
      animationDuration: const Duration(milliseconds: 500),
      onClose: () {
        if (widget.closeModel != null) {
          widget.closeModel!.call();
          return;
        }
        context.pop();
      },
    ).show(context);
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
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                    fillColor: ConstTheme.sidebarBg.withOpacity(0.2),
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
                    fillColor: ConstTheme.sidebarBg.withOpacity(0.2),
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
                    padding: EdgeInsets.symmetric(
                      vertical: 15.w,
                      horizontal: 30.w,
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ConstTheme.centerChannelColor,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              '创建频道',
                              style: TextStyle(
                                color: ConstTheme.centerChannelBg,
                                fontWeight: FontWeight.w600,
                                fontSize: 19.w,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: ConstTheme.centerChannelBg,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
