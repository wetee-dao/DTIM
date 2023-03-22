import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../components/chat_list.dart';
import '../components/direct_chat.dart';
import '../models/models.dart';
import '../store/im.dart';
import '../store/theme.dart';
import '../utils/screen.dart';

class ChannelMoblePage extends StatefulWidget {
  const ChannelMoblePage({Key? key}) : super(key: key);

  @override
  State<ChannelMoblePage> createState() => _ChannelMoblePageState();
}

class _ChannelMoblePageState extends State<ChannelMoblePage> {
  late ExpandableController _controllerChannels;
  late ExpandableController _controllerStarred;
  late ExpandableController _controllerUsers;

  double leftWidth = 200.w;
  IMProvider? im;
  AccountOrg? org;
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
      var client = im!.currentState!.client;
      var channels = client.rooms.toList();
      org = im!.currentState!.org;
      if (channels.isNotEmpty) {
        channelId = channels[0].id;
      }
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstTheme.sidebarHeaderBg,
        leading: InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                'AN',
                style: TextStyle(
                  color: ConstTheme.sidebarHeaderTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'Artur Workspace',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: ConstTheme.sidebarHeaderTextColor,
          ),
        ),
        actions: [
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              icon: Icon(
                Icons.filter_list,
                color: ConstTheme.sidebarHeaderTextColor,
              ),
              onSelected: (value) {},
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(width: 10),
                              Text('Sections'),
                            ],
                          ),
                          Icon(
                            Icons.list_alt,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 30),
                              Text('Recent Activity'),
                            ],
                          ),
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ]),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      backgroundColor: ConstTheme.sidebarBg,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // JumpTo(false, MediaQuery.of(context).size.width - 40, () {}),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextField(
                    onTap: () {},
                    autofocus: false,
                    keyboardType: false ? TextInputType.text : TextInputType.none,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Jump to...',
                      hintStyle: TextStyle(
                        height: 0.9,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Transform(
                      transform: Matrix4.rotationY(math.pi),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.message_outlined,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Threads',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 30,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Channels',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            '+',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(width: 15),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _controllerChannels.toggle();
                              });
                            },
                            icon: Icon(
                              _controllerChannels.expanded
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.arrow_forward_ios_outlined,
                              size: _controllerChannels.expanded ? 25 : 17,
                            ),
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expandable(
                controller: _controllerChannels,
                collapsed: SizedBox(),
                expanded: ChatList(channels, channelId, (id) {
                  if (id == channelId) {
                    return;
                  }
                  setState(() {
                    channelId = id;
                  });
                }),
              ),
              Divider(
                height: 30,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Starred',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _controllerStarred.toggle();
                              });
                            },
                            icon: Icon(
                              _controllerStarred.expanded
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.arrow_forward_ios_outlined,
                              size: _controllerStarred.expanded ? 25 : 17,
                            ),
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ExpandablePanel(
              //   controller: _controllerStarred,
              //   collapsed: SizedBox(),
              //   expanded: ChannelsList(channelsListTwo),
              // ),
              Divider(
                height: 30,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Direct Messages',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _controllerUsers.toggle();
                              });
                            },
                            icon: Icon(
                              _controllerUsers.expanded
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.arrow_forward_ios_outlined,
                              size: _controllerUsers.expanded ? 25 : 17,
                            ),
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ExpandablePanel(
              //   controller: _controllerUsers,
              //   collapsed: const SizedBox(),
              //   expanded: usersList(
              //     users,
              //     receiverUser,
              //     (index) => {
              //       setState(() {
              //         receiverUser = users[index];
              //       })
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: hexToColor("#4B144A"),
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
