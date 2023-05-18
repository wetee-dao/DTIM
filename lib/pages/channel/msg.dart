import 'package:asyou_app/router.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/components.dart';
import '../../utils/screen/screen.dart';
import '../../store/theme.dart';
import '../../utils/time.dart';
import 'content/content.dart';
import 'content/verification_request_content.dart';

class Msg extends StatelessWidget {
  final link.Event event;
  final link.Event? preEvent;
  final link.Client client;
  final link.Timeline timeline;

  const Msg({Key? key, required this.event, required this.client, this.preEvent, required this.timeline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showAvatar = isShowAvatar(event, preEvent);
    var showDate = false;
    // if (event.type == link.EventTypes.RoomMember ||
    //     event.type == link.EventTypes.RoomPowerLevels ||
    //     event.type == link.EventTypes.RoomJoinRules ||
    //     event.type == link.EventTypes.HistoryVisibility ||
    //     event.type == link.EventTypes.RoomName) {
    //   return const SizedBox(height: 0);
    // }

    if (preEvent != null) {
      if ("${event.originServerTs.year}-${event.originServerTs.month}-${event.originServerTs.day}" !=
          "${preEvent!.originServerTs.year}-${preEvent!.originServerTs.month}-${preEvent!.originServerTs.day}") {
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
    if (event.originServerTs.millisecondsSinceEpoch - preEvent.originServerTs.millisecondsSinceEpoch < 600000 &&
        event.senderId == preEvent.senderId) {
      showAvatar = false;
    }
    return showAvatar;
  }

  buildMsg(link.Event event, bool showAvatar) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    return FutureBuilder<link.User?>(
      future: event.fetchSenderUser(),
      builder: (context, snapshot) {
        final user = snapshot.data ?? event.senderFromMemoryOrFallback;
        return Row(
          key: Key(event.eventId),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 15.w),
            if (showAvatar)
              Column(
                children: [
                  SizedBox(height: 10.w),
                  UserAvatarWithPop(
                    key: Key(user.id),
                    user.id,
                    user.displayName ?? "-",
                    true,
                    40.w,
                    color: constTheme.centerChannelColor,
                    bg: constTheme.centerChannelDivider,
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
                        text: event.senderId == client.userID ? "我" : user.displayName,
                        style: TextStyle(
                          color: constTheme.centerChannelColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.w,
                        ),
                        children: [
                          TextSpan(
                            text: "  ${getTime(event.originServerTs)}",
                            style: TextStyle(
                              color: constTheme.centerChannelColor.withAlpha(155),
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
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    if (event.type == link.EventTypes.Encryption) {
      return Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: constTheme.centerChannelColor.withOpacity(0.1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline, color: constTheme.mentionBg, size: 19.w),
            SizedBox(width: 5.w),
            Text(
              "启用了E2E加密",
              style: TextStyle(fontSize: 16.w, color: constTheme.centerChannelColor),
            )
          ],
        ),
      );
    }
    if (event.type == link.EventTypes.Message && event.messageType == link.EventTypes.KeyVerificationRequest) {
      return VerificationRequestContent(event: event, timeline: timeline);
    }
    return MessageContent(event, textColor: constTheme.centerChannelColor);
  }

  buildDayTag(event) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    return SizedBox(
      width: double.maxFinite,
      height: 40.w,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 1,
            color: constTheme.centerChannelColor.withOpacity(0.08),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
              decoration: BoxDecoration(color: constTheme.centerChannelBg),
              child: Text(
                getDay(event.originServerTs),
                style: TextStyle(color: constTheme.centerChannelColor, fontSize: 14.w),
              ),
            ),
          )
        ],
      ),
    );
  }
}
