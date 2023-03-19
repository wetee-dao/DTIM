import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../../components/components.dart';
import '../../../utils/screen.dart';
import '../../../store/im.dart';
import '../../../store/theme.dart';
import '../../../utils/functions.dart';

class ChannelInfoPage extends StatefulWidget {
  final String id;
  final Function? closeModel;
  const ChannelInfoPage({Key? key, required this.id, this.closeModel}) : super(key: key);

  @override
  State<ChannelInfoPage> createState() => _ChannelInfoPageState();
}

class _ChannelInfoPageState extends State<ChannelInfoPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
