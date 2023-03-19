import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/user_avatar.dart';
import '../../utils/screen.dart';
import '../../store/theme.dart';
import '../../utils/functions.dart';
import '../../utils/time.dart';
import 'content/content.dart';

class Msg extends StatefulWidget {
  final link.Event event;
  final link.Event? preEvent;
  final link.Client client;

  const Msg({Key? key, required this.event, required this.client, this.preEvent}) : super(key: key);

  @override
  State<Msg> createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var event = widget.event;
    var showAvatar = isShowAvatar(event, widget.preEvent);
    var showDate = false;
    if (event.type == link.EventTypes.RoomMember ||
        event.type == link.EventTypes.RoomPowerLevels ||
        event.type == link.EventTypes.RoomJoinRules ||
        event.type == link.EventTypes.HistoryVisibility ||
        event.type == link.EventTypes.RoomName) {
      return const SizedBox(height: 0);
    }

    if (widget.preEvent != null) {
      link.Event preEvent = widget.preEvent!;

      if ("${event.originServerTs.year}-${event.originServerTs.month}-${event.originServerTs.day}" !=
          "${preEvent.originServerTs.year}-${preEvent.originServerTs.month}-${preEvent.originServerTs.day}") {
        showDate = true;
      }
    }
    if (showDate == true) {
      return Column(children: [
        buildDayTag(event),
        buildMsg(event, showAvatar),
      ]);
    }
    return buildMsg(event, showAvatar);
  }

  isShowAvatar(link.Event event, link.Event? preEvent) {
    var showAvatar = true;
    if (preEvent == null) return true;
    if (preEvent.type == link.EventTypes.RoomMember ||
        preEvent.type == link.EventTypes.RoomPowerLevels ||
        preEvent.type == link.EventTypes.RoomJoinRules ||
        preEvent.type == link.EventTypes.HistoryVisibility ||
        preEvent.type == link.EventTypes.RoomName) {
      return true;
    }
    if (event.originServerTs.millisecondsSinceEpoch - preEvent.originServerTs.millisecondsSinceEpoch < 240000 &&
        event.senderId == preEvent.senderId) {
      showAvatar = false;
    }
    return showAvatar;
  }

  buildMsg(link.Event event, bool showAvatar) {
    return FutureBuilder<link.User?>(
      future: event.fetchSenderUser(),
      builder: (context, snapshot) {
        final user = snapshot.data ?? event.senderFromMemoryOrFallback;
        return Row(
          key: Key(event.eventId),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20.w),
            if (showAvatar)
              Column(
                children: [
                  SizedBox(height: 10.w),
                  UserAvatarWithPop(
                    key: Key(user.id),
                    user,
                    true,
                    40.w,
                  ),
                ],
              ),
            if (!showAvatar) SizedBox(width: 40.w),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showAvatar) SizedBox(height: 10.w),
                  if (showAvatar)
                    RichText(
                      text: TextSpan(
                        text: event.senderId == widget.client.userID ? "我" : event.senderId,
                        style: TextStyle(
                          color: ConstTheme.centerChannelColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.w,
                        ),
                        children: [
                          TextSpan(
                            text: "  ${getTime(event.originServerTs)}",
                            style: TextStyle(
                              color: ConstTheme.centerChannelColor.withAlpha(155),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.w,
                            ),
                          )
                        ],
                      ),
                    ),
                  if (showAvatar) SizedBox(height: 5.w),
                  renderBody(event),
                  SizedBox(height: 5.w),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  renderBody(link.Event event) {
    if (event.type == link.EventTypes.Encryption) {
      return Row(
        children: [
          Icon(Icons.lock_outline, color: ConstTheme.mentionBg, size: 19.w),
          SizedBox(width: 5.w),
          Text(
            "启用了E2E加密",
            style: TextStyle(fontSize: 16.w, color: ConstTheme.centerChannelColor),
          )
        ],
      );
    }
    // if (event.messageType == link.MessageTypes.Image) {
    //   return ClipRRect(
    //     borderRadius: BorderRadius.circular(10.w),
    //     child: Image.network(
    //       detailMessages[index].srcImage!,
    //       width: MediaQuery.of(context).size.width * 0.7,
    //     ),
    //   );
    // }
    return MessageContent(event, textColor: ConstTheme.centerChannelColor);
  }

  buildDayTag(event) {
    return SizedBox(
      width: double.maxFinite,
      height: 40.w,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 1,
            color: ConstTheme.centerChannelColor.withOpacity(0.08),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
              decoration: BoxDecoration(color: ConstTheme.centerChannelBg),
              child: Text(
                getDay(event.originServerTs),
                style: TextStyle(color: ConstTheme.centerChannelColor, fontSize: 14.w),
              ),
            ),
          )
        ],
      ),
    );
  }
}
