import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:asyou_app/components/jump_to.dart';
import 'package:asyou_app/components/user_avatar.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:provider/provider.dart';

import '../components/app_bar.dart';
import '../store/im.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late IMProvider im;
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
    // await client.createGroupChat(
    //     groupName: "xxxxx2", visibility: link.Visibility.public, preset: link.CreateRoomPreset.publicChat);
    var roomResp = await client.getPublicRooms();
    roomResp.chunk;
    print(roomResp.chunk);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.centerChannelBg,
      appBar: LocalAppBar(
        title: "搜索频道",
        onBack: () {
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
                  JumpTo(true, MediaQuery.of(context).size.width - 120.w, () => null),
                  SizedBox(
                    height: 40.w,
                    width: 60.w,
                    child: Center(
                      child: InkWell(
                        onTap: () {
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
              // Divider(
              //   height: 5.w,
              //   color: ConstTheme.centerChannelColor.withOpacity(0.1),
              // ),
              // Container(
              //   padding: EdgeInsets.only(
              //     left: 15.w,
              //     top: 15.w,
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         '搜索历史',
              //         style: TextStyle(fontWeight: FontWeight.w600, color: ConstTheme.centerChannelColor),
              //       ),
              //       SizedBox(height: 10.w),
              //       ListView.builder(
              //           itemCount: userList.length,
              //           shrinkWrap: true,
              //           scrollDirection: Axis.vertical,
              //           itemBuilder: (context, index) {
              //             return Container(
              //               width: MediaQuery.of(context).size.width * 0.8,
              //               child: Padding(
              //                 padding: EdgeInsets.only(bottom: 10.w),
              //                 child: Row(
              //                   children: [
              //                     UserAvatar(
              //                       userList[index].avatarSrc,
              //                       userList[index].online,
              //                       40,
              //                     ),
              //                     SizedBox(width: 8.w),
              //                     Text(
              //                       userList[index].name,
              //                       style: TextStyle(
              //                         color: ConstTheme.centerChannelColor,
              //                         fontWeight: FontWeight.w600,
              //                       ),
              //                     ),
              //                     SizedBox(width: 8.w),
              //                     Text(
              //                       userList[index].name,
              //                       style: TextStyle(fontWeight: FontWeight.w500, color: ConstTheme.centerChannelColor),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             );
              //           }),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
