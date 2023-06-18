import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import 'utils.dart';

class RoomMemberContent extends StatelessWidget {
  final Event event;
  final Color textColor;

  const RoomMemberContent(this.event, this.textColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (event.prevContent != null) {
      return const RoomEvent(
        text: "修改了用户信息",
      );
    }
    if (event.content['membership'] == 'invite') {
      return RoomEvent(
        text: "邀请用户 ${event.content['displayname']} 加入${event.room.isDirectChat ? "私聊" : "频道"}",
      );
    } else if (event.content['membership'] == 'join') {
      return RoomEvent(
        text: "加入了${event.room.isDirectChat ? "私聊" : "频道"}",
      );
    }
    return Text(event.toJson().toString());
  }
}
