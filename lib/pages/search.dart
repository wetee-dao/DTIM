import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:provider/provider.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';

import '../store/theme.dart';
import '../components/components.dart';
import '../store/im.dart';

class SearchPage extends StatefulWidget {
  final Function? closeModel;
  const SearchPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late IMProvider im;
  List<link.PublicRoomsChunk> rooms = [];
  List userList = [];

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    getList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getList() async {
    var client = im.currentState!.client;
    var roomResp = await client.getPublicRooms();
    setState(() {
      rooms = roomResp.chunk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "搜索频道",
              onBack: () {
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "搜索频道",
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
                      width: MediaQuery.of(context).size.width - 120.w,
                      margin: EdgeInsets.only(left: 0.w, right: 15.w, top: 15.w, bottom: 15.w),
                      padding: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        color: ConstTheme.sidebarText.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(3.w)),
                      ),
                      alignment: Alignment.center,
                      child: TextField(
                        onTap: () {},
                        style: TextStyle(color: ConstTheme.sidebarText.withAlpha(155), fontSize: 13.w),
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: '查找频道',
                          hintStyle: TextStyle(
                            height: 1.5,
                            color: ConstTheme.sidebarText.withAlpha(155),
                          ),
                          suffixIcon: Icon(Icons.search, size: 20.w, color: ConstTheme.sidebarText.withAlpha(155)),
                          contentPadding: const EdgeInsets.all(0),
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
                          label: null,
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
                padding: EdgeInsets.only(left: 15.w),
                height: 110.w,
                child: ListView.builder(
                    itemCount: userList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              UserAvatar(
                                userList[index].avatarSrc,
                                userList[index].online,
                                60.w,
                              ),
                              SizedBox(height: 5.w),
                              SizedBox(
                                width: 50.w,
                                child: Text(
                                  userList[index].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: ConstTheme.centerChannelColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 10.w),
              Divider(
                height: 5.w,
                color: ConstTheme.centerChannelColor.withOpacity(0.1),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15.w,
                  top: 15.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '搜索历史',
                      style: TextStyle(fontWeight: FontWeight.w600, color: ConstTheme.centerChannelColor),
                    ),
                    SizedBox(height: 10.w),
                    ListView.builder(
                      itemCount: rooms.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            var client = im.currentState!.client;
                            client.joinRoomById(rooms[index].roomId);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.w),
                              child: Row(
                                children: [
                                  UserAvatar(
                                    rooms[index].roomId,
                                    false,
                                    40.w,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    rooms[index].name ?? "",
                                    style: TextStyle(
                                      color: ConstTheme.centerChannelColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    rooms[index].name ?? "",
                                    style: TextStyle(fontWeight: FontWeight.w500, color: ConstTheme.centerChannelColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
