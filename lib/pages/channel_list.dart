import 'dart:async';
import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../utils/screen.dart';
import '../components/jump_to.dart';
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
  double leftWidth = 200.w;
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
      if (channels.isNotEmpty) {
        channelId = channels[0].id;
      }
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
      backgroundColor: ConstTheme.sidebarBg,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: double.maxFinite,
            width: leftWidth,
            color: ConstTheme.sidebarBg,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  moveWindow(
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
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(3.w),
                                    bottomLeft: Radius.circular(3.w),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      org != null ? org!.name ?? "" : '',
                                      style: TextStyle(
                                        color: ConstTheme.sidebarText,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15.w,
                                        height: 1.3,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: ConstTheme.sidebarText,
                                      size: 16.w,
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
                            // context.push("/search");
                            showModelOrPage(context, "/search");
                            return null;
                          }),
                        )
                      ],
                    ),
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
                                showModelOrPage(
                                  context,
                                  "/create_channel",
                                  width: 450.w,
                                  height: 300.w,
                                );
                              },
                              child: Icon(
                                Icons.add,
                                size: 20.w,
                                color: ConstTheme.sidebarText.withAlpha(155),
                              ),
                            ),
                            SizedBox(width: 5.w),
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
                                size: 20.w,
                                color: ConstTheme.sidebarText.withAlpha(155),
                              ),
                            ),
                            SizedBox(width: 5.w),
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
          GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeColumn,
              child: SizedBox(
                width: 2,
                height: double.infinity,
                child: Container(color: ConstTheme.sidebarBg),
              ),
            ),
            onPanUpdate: (details) {
              setState(() {
                if (leftWidth + details.delta.dx < 180.w || leftWidth + details.delta.dx > 350.w) {
                  return;
                }
                leftWidth = leftWidth + details.delta.dx;
              });
            },
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
    return moveWindow(Container(
      color: ConstTheme.centerChannelBg,
    ));
  }
}
