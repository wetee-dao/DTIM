import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix/matrix.dart' as link;

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/router.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/im.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/functions.dart';

class CreatePrivatePage extends StatefulWidget {
  final Function? closeModel;
  const CreatePrivatePage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<CreatePrivatePage> createState() => _CreatePrivatePageState();
}

class _CreatePrivatePageState extends State<CreatePrivatePage> {
  String search = "";
  late AppCubit im;
  List<link.Profile> allList = [];
  TextEditingController id = TextEditingController();
  String searchText = "";

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    id.text = "";
    getList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getList() async {
    final client = im.currentState!.client;
    link.SearchUserDirectoryResponse response =
        await client.searchUserDirectory(search != "" ? "%$search" : "", limit: 1000000);

    setState(() {
      allList = response.results.where((u) => u.userId != client.userID).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final userList = searchText == ""
        ? allList
        : allList
            .where(
                (v) => v.userId.contains(searchText) || (v.displayName != null && v.displayName!.contains(searchText)))
            .toList();
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "添加私信",
              height: 50.w,
              onBack: () {
                context.router.pop();
              },
            ) as PreferredSizeWidget
          : TopSearchBar(
              title: "搜索用户",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
              onInput: (String v) {
                setState(() {
                  searchText = v;
                });
              },
            ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 15.w),
                        Avatar(
                          id: getUserShortId(userList[index].userId),
                          name: userList[index].displayName ?? "",
                          mxContent: userList[index].avatarUrl,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userList[index].displayName ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle(
                                  color: constTheme.centerChannelColor.withOpacity(0.6),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.w,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                userList[index].userId,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle(
                                  color: constTheme.centerChannelColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.w,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          key: Key("copyPrivate$index"),
                          onPressed: () async {
                            await waitFutureLoading(
                              context: globalCtx(),
                              future: () async {
                                Clipboard.setData(ClipboardData(
                                  text: getUserShortId(userList[index].userId),
                                )).then((value) {
                                  BotToast.showText(text: '用户id复制成功', duration: const Duration(seconds: 2));
                                });
                              },
                            );
                          },
                          icon: Icon(Icons.copy_rounded, size: 20.w),
                          color: constTheme.centerChannelColor,
                        ),
                        IconButton(
                          key: Key("createPrivate$index"),
                          onPressed: () async {
                            final client = im.currentState!.client;
                            await waitFutureLoading(
                              context: globalCtx(),
                              future: () async {
                                await client.startDirectChat(userList[index].userId);
                                BotToast.showText(text: '创建私信成功', duration: const Duration(seconds: 2));
                                globalCtx().router.pop();
                              },
                            );
                          },
                          icon: Icon(Icons.send_rounded, size: 20.w),
                          color: constTheme.centerChannelColor,
                        ),
                        SizedBox(width: 15.w),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Divider(
                      height: 1.w,
                      color: constTheme.centerChannelColor.withOpacity(0.04),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 55.w,
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            decoration: BoxDecoration(
              color: constTheme.buttonBg,
            ),
            alignment: Alignment.center,
            child: TextField(
              key: const Key("cratePrivateInput"),
              controller: id,
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              style: TextStyle(color: constTheme.buttonColor.withAlpha(155), fontSize: 13.w),
              decoration: InputDecoration(
                label: null,
                hintText: '输入用户 id 开启私聊,如：@username',
                hintStyle: TextStyle(height: 1.5, color: constTheme.buttonColor),
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  key: const Key("cratePrivateSend"),
                  icon: Icon(Icons.send_rounded, color: constTheme.buttonColor),
                  onPressed: () async {
                    final client = im.currentState!.client;
                    final org = im.currentState!.org;
                    await waitFutureLoading(
                      context: globalCtx(),
                      future: () async {
                        await client.startDirectChat("${id.text}:${org.domain}");
                        BotToast.showText(text: '创建私信成功', duration: const Duration(seconds: 2));
                        // ignore: use_build_context_synchronously
                        globalCtx().router.pop();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          // SizedBox(height: 15.w),
        ],
      ),
    );
  }
}
