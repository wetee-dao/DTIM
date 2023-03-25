import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../../components/components.dart';
import '../../../utils/screen.dart';
import '../../../store/im.dart';
import '../../../store/theme.dart';
import '../../../utils/functions.dart';

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
    final client = im.currentState!.client;

    List<link.User> matrixEvents = client.getRoomById(widget.id)!.getParticipants();
    // Iterable<link.User>? users = matrixEvents?.map((e) => link.Event.fromMatrixEvent(e, room!).asUser);
    // if (users == null) {
    //   return;
    // }

    setState(() {
      userList = matrixEvents;
    });
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   height: 40.w,
          //   margin: EdgeInsets.only(top: 10.w, bottom: 10.w, left: 15.w, right: 15.w),
          //   padding: EdgeInsets.only(left: 10.w),
          //   decoration: BoxDecoration(
          //     color: constTheme.sidebarText.withOpacity(0.1),
          //     borderRadius: BorderRadius.all(Radius.circular(3.w)),
          //   ),
          //   alignment: Alignment.center,
          //   child: TextField(
          //     onTap: () {},
          //     autofocus: true,
          //     keyboardType: TextInputType.text,
          //     style: TextStyle(color: constTheme.sidebarText.withAlpha(155), fontSize: 13.w),
          //     decoration: InputDecoration(
          //       label: null,
          //       hintText: '查找频道',
          //       hintStyle: TextStyle(
          //         height: 1.5,
          //         color: constTheme.sidebarText.withAlpha(155),
          //       ),
          //       // suffixIcon: Icon(Icons.search, size: 20.w, color: constTheme.sidebarText.withAlpha(155)),
          //       contentPadding: const EdgeInsets.all(0),
          //       border: const OutlineInputBorder(borderSide: BorderSide.none),
          //       suffixIcon: IconButton(
          //         icon: Icon(Icons.search, size: 20.w, color: constTheme.sidebarText),
          //         onPressed: () async {},
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 10.w,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15.w),
                        UserAvatar(
                          getUserShortId(userList[index].senderId),
                          true,
                          40.w,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userList[index].calcDisplayname(),
                                maxLines: 2,
                                softWrap: false,
                                style: TextStyle(
                                  color: constTheme.centerChannelColor.withOpacity(0.6),
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                userList[index].id,
                                maxLines: 2,
                                softWrap: false,
                                style: TextStyle(
                                  color: constTheme.centerChannelColor,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15.w),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
