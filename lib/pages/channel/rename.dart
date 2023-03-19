import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../router.dart';
import '../../utils/screen.dart';
import '../../components/app_bar.dart';
import '../../store/im.dart';
import '../../store/theme.dart';

class RenameChannelPage extends StatefulWidget {
  final String id;
  const RenameChannelPage({Key? key, required this.id}) : super(key: key);

  @override
  State<RenameChannelPage> createState() => _RenameChannelPageState();
}

class _RenameChannelPageState extends State<RenameChannelPage> {
  bool publicGroup = false;
  late final IMProvider im;
  late link.Client? client;
  late link.Room? room;
  final SubmitData _data = SubmitData(groupName: "");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    if (im.currentState != null) {
      if (im.currentState != null) {
        client = im.currentState!.client;
        room = im.currentState!.client.getRoomById(Uri.decodeComponent(widget.id));
      }
    }
  }

  void submitAction() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    await showFutureLoadingDialog(
      context: context,
      future: () async {
        await room!.setName(_data.groupName);
        return true;
      },
    );
    //跳转到组织列表
    if (!mounted) return;

    await showOkAlertDialog(
      context: context,
      title: '提示',
      message: '频道创建成功，现在返回主页面',
    );

    rootNavigatorKey.currentContext?.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.centerChannelBg,
      appBar: LocalAppBar(
        title: "重命名频道",
        onBack: () {
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
                SizedBox(height: 100.w),
                TextFormField(
                  initialValue: room!.displayname,
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
                              '修改频道',
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

  SubmitData({required this.groupName});
}
