import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:asyou_app/components/channels_list.dart';
import 'package:asyou_app/components/jump_to.dart';
import 'package:asyou_app/components/user_list.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../models/user.dart';
import '../store/im.dart';
import '../store/theme.dart';
import 'channel/chat.dart';

class ChannelListPage extends StatefulWidget {
  const ChannelListPage({Key? key}) : super(key: key);

  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  late ExpandableController _controllerChannels;
  late ExpandableController _controllerStarred;
  late ExpandableController _controllerUsers;
  IMProvider? im;
  User? receiverUser;
  String channelId = "";
  List<User> users = [];
  List<link.Room> channels = [];

  @override
  void initState() {
    super.initState();
    _controllerChannels = ExpandableController(initialExpanded: true);
    _controllerStarred = ExpandableController(initialExpanded: true);
    _controllerUsers = ExpandableController(initialExpanded: true);
    Future.delayed(Duration.zero).then((value) async {
      im = context.read<IMProvider>();
      im!.addListener(onImInit);
      onImInit();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerChannels.dispose();
    _controllerStarred.dispose();
    _controllerUsers.dispose();
  }

  onImInit() {
    if (im!.current == null || im!.currentState == null) {
      return;
    }
    setState(() {
      channels = im!.currentState!.channels;
      channelId = channels[0].id;
    });
    im!.currentState!.rosterListen((list) {
      setState(() {
        users = list;
      });
    });
  }

  onRoster(event) {
    setState(() {
      users = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.sidebarBg,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: "4B144A".toColor(),
      //   leading: InkWell(
      //     onTap: () => Scaffold.of(context).openDrawer(),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(
      //         horizontal: 10,
      //         vertical: 10,
      //       ),
      //       child: Container(
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //           color: Colors.grey.shade300,
      //           borderRadius: BorderRadius.circular(7),
      //         ),
      //         child: Text(
      // textScaleFactor:1,
      //           'AN',
      //           style: TextStyle(
      //             color: "4B144A".toColor(),
      //             fontSize: 20,
      //             fontWeight: FontWeight.w600,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   title: Text(
      //textScaleFactor:1,
      //     'Artur Workspace',
      //     style: TextStyle(
      //       fontSize: 22,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   actions: [
      //     PopupMenuButton(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.all(
      //             Radius.circular(10.0),
      //           ),
      //         ),
      //         icon: Icon(
      //           Icons.filter_list,
      //           color: Colors.white,
      //         ),
      //         onSelected: (value) {},
      //         itemBuilder: (context) => [
      //               PopupMenuItem(
      //                 value: 1,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Icon(
      //                           Icons.done,
      //                           color: Colors.grey,
      //                           size: 18,
      //                         ),
      //                         SizedBox(width: 10),
      //                         Text(
      //textScaleFactor:1,'Sections'),
      //                       ],
      //                     ),
      //                     Icon(
      //                       Icons.list_alt,
      //                       color: Colors.grey,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               PopupMenuItem(
      //                 value: 2,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         SizedBox(width: 30),
      //                         Text(
      // textScaleFactor:1,'Recent Activity'),
      //                       ],
      //                     ),
      //                     Icon(
      //                       Icons.access_time,
      //                       color: Colors.grey,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ]),
      //     SizedBox(
      //       width: 15,
      //     ),
      //   ],
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: double.maxFinite,
            width: 260.w,
            color: ConstTheme.sidebarBg,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  JumpTo(false, MediaQuery.of(context).size.width - 40, () {
                    context.push("/search");
                  }),
                  Divider(
                    height: 1,
                    color: ConstTheme.sidebarText.withOpacity(0.08),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '频道',
                          style: TextStyle(
                            color: ConstTheme.sidebarText.withAlpha(155),
                            fontWeight: FontWeight.w800,
                            fontSize: 14.w,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final client = im!.currentState!.client;
                                // final roomID = await showFutureLoadingDialog(
                                //   context: context,
                                //   future: () async {
                                //     final roomId = await client.createGroupChat(
                                //       preset: link.CreateRoomPreset.publicChat,
                                //       groupName: "测试",
                                //     );
                                //     return roomId;
                                //   },
                                // );
                              },
                              child: Icon(
                                Icons.add,
                                size: 25.w,
                                color: ConstTheme.sidebarText.withAlpha(155),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _controllerChannels.toggle();
                                });
                              },
                              child: Icon(
                                _controllerChannels.expanded
                                    ? Icons.keyboard_arrow_down_outlined
                                    : Icons.keyboard_arrow_up_outlined,
                                size: 25.w,
                                color: ConstTheme.sidebarText.withAlpha(155),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ExpandablePanel(
                    controller: _controllerChannels,
                    collapsed: const SizedBox(),
                    expanded: channelsListView(channels, channelId, (id) {
                      if (id == channelId) {
                        return;
                      }
                      setState(() {
                        channelId = id;
                      });
                    }),
                  ),
                  if (channels.isNotEmpty) SizedBox(height: 10.w),
                  Divider(
                    height: 1,
                    color: ConstTheme.sidebarText.withOpacity(0.08),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '私信',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14.w,
                            color: ConstTheme.sidebarText.withAlpha(155),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 15.w),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _controllerUsers.toggle();
                                });
                              },
                              child: Icon(
                                _controllerUsers.expanded
                                    ? Icons.keyboard_arrow_down_outlined
                                    : Icons.keyboard_arrow_up_outlined,
                                size: 25.w,
                                color: ConstTheme.sidebarText.withAlpha(155),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ExpandablePanel(
                    controller: _controllerUsers,
                    collapsed: const SizedBox(),
                    expanded: usersList(
                      users,
                      receiverUser,
                      (index) => {
                        setState(() {
                          receiverUser = users[index];
                        })
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: buildDetailPage(receiverUser, channelId),
          )
        ],
      ),
    );
  }

  Widget buildDetailPage(u, c) {
    if (u != null) {
      return ChannelDetailPage(
        key: Key("channel_${c!}"),
        channerlID: c!,
      );
    } else if (c != "") {
      return ChannelDetailPage(
        key: Key("channel_${c!}"),
        channerlID: c!,
      );
    }
    return Container(
      color: ConstTheme.centerChannelBg,
    );
  }
}
