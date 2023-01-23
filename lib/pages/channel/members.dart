import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/components.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import '../../utils/functions.dart';

class ChannelMemberPage extends StatefulWidget {
  final String id;
  final Function? closeModel;
  const ChannelMemberPage({Key? key, required this.id, this.closeModel}) : super(key: key);

  @override
  State<ChannelMemberPage> createState() => _ChannelMemberPageState();
}

class _ChannelMemberPageState extends State<ChannelMemberPage> {
  late IMProvider im;
  late link.Room? room;
  List<link.User> userList = [];

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    room = im.currentState!.client.getRoomById(widget.id);
    getList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getList() async {
    var client = im.currentState!.client;

    List<link.MatrixEvent>? matrixEvents = await client.getMembersByRoom(widget.id);
    Iterable<link.User>? users = matrixEvents?.map((e) => link.Event.fromMatrixEvent(e, room!).asUser);
    if (users == null) {
      return;
    }

    setState(() {
      userList = users.toList(growable: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "成员列表",
              onBack: () {
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "成员列表",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Container(
                      height: 40.w,
                      margin: EdgeInsets.only(top: 10.w, bottom: 10.w),
                      padding: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        color: ConstTheme.sidebarText.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(3.w)),
                      ),
                      alignment: Alignment.center,
                      child: TextField(
                        onTap: () {},
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: ConstTheme.sidebarText.withAlpha(155), fontSize: 13.w),
                        decoration: InputDecoration(
                          label: null,
                          hintText: '查找频道',
                          hintStyle: TextStyle(
                            height: 1.5,
                            color: ConstTheme.sidebarText.withAlpha(155),
                          ),
                          suffixIcon: Icon(Icons.search, size: 20.w, color: ConstTheme.sidebarText.withAlpha(155)),
                          contentPadding: const EdgeInsets.all(0),
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.w,
                    width: 60.w,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          if (widget.closeModel != null) {
                            widget.closeModel!.call();
                            return;
                          }
                          context.pop();
                        },
                        child: Text(
                          '取消',
                          style: TextStyle(
                            color: ConstTheme.centerChannelColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              Divider(
                height: 5.w,
                color: ConstTheme.centerChannelColor.withOpacity(0.1),
              ),
              SizedBox(
                height: 10.w,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                height: 110.w,
                child: ListView.builder(
                  itemCount: userList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            UserAvatar(
                              getUserShortId(userList[index].senderId),
                              true,
                              40.w,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userList[index].calcDisplayname(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: ConstTheme.centerChannelColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  userList[index].id,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: ConstTheme.centerChannelColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
