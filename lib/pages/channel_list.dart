import 'dart:async';

import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:asyou_app/components/channels_list.dart';
import 'package:asyou_app/components/jump_to.dart';
import 'package:asyou_app/components/user_list.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../components/components.dart';
import '../components/popup.dart';
import '../models/models.dart';
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
  final BasePopupMenuController menuController = BasePopupMenuController();
  final StreamController<bool> menuStreamController = StreamController<bool>();
  IMProvider? im;
  Org? org;
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
    menuController.addListener(() {
      menuStreamController.add(menuController.menuIsShowing);
    });
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
      org = im!.currentState!.org;
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
                  Row(
                    children: [
                      SizedBox(width: 15.w),
                      BasePopupMenu(
                        verticalMargin: -1.w,
                        horizontalMargin: 5.w,
                        showArrow: false,
                        controller: menuController,
                        pressType: PressType.singleClick,
                        position: PreferredPosition.bottomLeft,
                        child: StreamBuilder<bool>(
                          stream: menuStreamController.stream,
                          initialData: false,
                          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                            return Container(
                              height: 40.w,
                              padding: EdgeInsets.only(left: 10.w, right: 7.w, top: 2.w, bottom: 2.w),
                              decoration: BoxDecoration(
                                color: snapshot.data != null && snapshot.data!
                                    ? ConstTheme.sidebarText.withOpacity(0.25)
                                    : ConstTheme.sidebarText.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.only(topLeft: Radius.circular(3.w), bottomLeft: Radius.circular(3.w)),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    org != null ? org!.name ?? "" : '',
                                    style: TextStyle(
                                      color: ConstTheme.centerChannelColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15.w,
                                      height: 1.2,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: ConstTheme.centerChannelColor,
                                    size: 14.w,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        menuBuilder: () => orgMenuRender(menuController),
                      ),
                      SizedBox(width: 1.w),
                      Expanded(
                        child: JumpTo(false, MediaQuery.of(context).size.width - 40, () {
                          context.push("/search");
                          return null;
                        }),
                      )
                    ],
                  ),
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
