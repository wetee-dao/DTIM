import 'package:asyou_app/application/store/im.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:asyou_app/infra/components/components.dart';
import 'package:asyou_app/router.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:asyou_app/application/store/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix/matrix.dart';

class UserSettingPage extends StatefulWidget {
  final Function? closeModel;
  const UserSettingPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<UserSettingPage> createState() => _UserSettingPageState();
}

class _UserSettingPageState extends State<UserSettingPage> {
  late AppCubit im;
  SubmitData? _data;
  MatrixFile? avatar;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    getData();
  }

  getData() async {
    final uid = im.currentState!.client.userID!;
    var name = await im.currentState!.client.getDisplayName(uid);
    var img = await im.currentState!.client.getAvatarUrl(uid);

    print("name: $name, img: $img");
    setState(() {
      _data = SubmitData(
        name: name ?? "",
        avatar: img,
      );
    });
  }

  void submitAction() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    await waitFutureLoading(
      context: globalCtx(),
      future: () async {
        final uid = im.currentState!.client.userID!;
        final oldname = await im.currentState!.client.getDisplayName(uid);
        if (_data!.name != oldname) {
          await im.currentState!.client.setDisplayName(uid, _data!.name);
        }
        if (avatar != null) {
          await im.currentState!.client.setAvatar(avatar);
        }
      },
    );
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
              title: "User Setting",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "User Setting",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ),
      body: _data != null
          ? Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.w),
                    TextFormField(
                      initialValue: _data!.name.toString(),
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: constTheme.centerChannelColor),
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                        filled: true,
                        fillColor: constTheme.centerChannelColor.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        prefixIcon: Icon(Icons.text_fields, color: constTheme.centerChannelColor),
                      ),
                      onSaved: (v) {
                        _data!.name = v ?? "";
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
                    GestureDetector(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.image,
                          withData: true,
                          allowMultiple: true,
                        );
                        if (result == null || result.files.isEmpty) return;
                        // ignore: sdk_version_since
                        final pickedFile = result.files.firstOrNull;
                        if (pickedFile == null) return;
                        setState(() {
                          avatar = MatrixFile(
                            bytes: pickedFile.bytes!,
                            name: pickedFile.name,
                          );
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: constTheme.centerChannelColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        child: Row(
                          children: [
                            avatar == null
                                ? Avatar(mxContent: _data!.avatar, size: 50.w, id: im.me!.address)
                                : Image.memory(avatar!.bytes, width: 50.w, height: 50.w, fit: BoxFit.cover),
                            SizedBox(width: 7.w),
                            Text("Click to upload avatar", style: titleStyle.copyWith(fontSize: 17.w)),
                          ],
                        ),
                      ),
                    ),

                    Expanded(child: Container()),
                    // SizedBox(height: 50.w),
                    InkWell(
                      key: const Key('Save'),
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
                                  'Save',
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
            )
          : Center(child: CircularProgressIndicator.adaptive(strokeWidth: 4.w)),
    );
  }
}

class SubmitData {
  String name;
  Uri? avatar;

  SubmitData({
    required this.name,
    required this.avatar,
  });
}
