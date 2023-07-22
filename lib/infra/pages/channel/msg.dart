import 'package:dtim/infra/components/hover_list_item.dart';
import 'package:dtim/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrix/matrix.dart' as link;

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/time.dart';
import 'package:dtim/infra/components/content/content.dart';
import 'package:dtim/infra/components/content/verification_request.dart';

class Msg extends StatefulWidget {
  final link.Event event;
  final link.Event? preEvent;
  final link.Client client;
  final link.Timeline timeline;

  const Msg({Key? key, required this.event, required this.client, this.preEvent, required this.timeline})
      : super(key: key);

  @override
  State<Msg> createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  bool showDate = false;
  OverlayEntry? overlayEntry;
  bool hover = false;

  @override
  void didUpdateWidget(covariant Msg oldWidget) {
    if (oldWidget.event.eventId != widget.event.eventId) {
      // ctx = null;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final preEvent = widget.preEvent;
    final showAvatar = isShowAvatar(event, preEvent);
    // if (event.type == link.EventTypes.RoomMember ||
    //     event.type == link.EventTypes.RoomPowerLevels ||
    //     event.type == link.EventTypes.RoomJoinRules ||
    //     event.type == link.EventTypes.HistoryVisibility ||
    //     event.type == link.EventTypes.RoomName) {
    //   return const SizedBox(height: 0);
    // }

    if (preEvent != null) {
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
    if (event.originServerTs.millisecondsSinceEpoch - preEvent.originServerTs.millisecondsSinceEpoch < 600000 &&
        event.senderId == preEvent.senderId) {
      showAvatar = false;
    }
    return showAvatar;
  }

  buildMsg(link.Event event, bool showAvatar) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    final iconSize = BoxConstraints(minWidth: 30.w, maxWidth: 30.w, minHeight: 30.w, maxHeight: 30.w);
    final w = 3 * 30.w + 10.w;
    return FutureBuilder<link.User?>(
      future: event.fetchSenderUser(),
      builder: (context, snapshot) {
        final user = snapshot.data ?? event.senderFromMemoryOrFallback;
        return HoverListItem(
          key: Key(event.eventId),
          subkey: "DirectChat${event.eventId}",
          ishover: overlayEntry != null,
          color: Colors.transparent,
          hoverColor: constTheme.centerChannelColor.withOpacity(0.02),
          onPressed: () async {},
          onHover: (v) {
            setState(() {
              hover = v;
            });
          },
          child: hover
              ? Stack(
                  children: [
                    renderRow(event, showAvatar, user),
                    Positioned(
                      top: 3.w,
                      right: 10.w,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                              color: constTheme.centerChannelBg,
                              border: Border.all(color: constTheme.centerChannelColor.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(4.w),
                            ),
                            width: w,
                            height: 32.w,
                            child: Row(
                              children: [
                                IconButton(
                                  tooltip: "emoji",
                                  padding: EdgeInsets.zero,
                                  constraints: iconSize,
                                  style: IconButton.styleFrom(
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                  ),
                                  icon: Icon(
                                    Icons.mood_rounded,
                                    color: constTheme.centerChannelColor,
                                    size: 18.w,
                                  ),
                                  onPressed: () async {
                                    await widget.event.room.sendTextEvent('/react 🦊', inReplyTo: widget.event);
                                  },
                                ),
                                IconButton(
                                  tooltip: "replay",
                                  padding: EdgeInsets.zero,
                                  constraints: iconSize,
                                  style: IconButton.styleFrom(
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                  ),
                                  icon: Icon(
                                    Icons.reply_rounded,
                                    color: constTheme.centerChannelColor,
                                    size: 18.w,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  tooltip: "view code",
                                  padding: EdgeInsets.zero,
                                  constraints: iconSize,
                                  style: IconButton.styleFrom(
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                  ),
                                  icon: Icon(
                                    Icons.code_rounded,
                                    color: constTheme.centerChannelColor,
                                    size: 18.w,
                                  ),
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          "消息内容",
                                          style: TextStyle(fontSize: 18.w),
                                        ),
                                        content: Text(
                                          event.toJson().toString(),
                                          style: TextStyle(color: constTheme.centerChannelColor),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("确定"),
                                            onPressed: () => Navigator.pop(context),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : renderRow(event, showAvatar, user),
        );
      },
    );
  }

  renderRow(link.Event event, bool showAvatar, link.User user) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 15.w),
        if (showAvatar)
          Column(
            children: [
              SizedBox(height: 10.w),
              BaseAvatarWithPop(
                key: Key(user.id),
                user.id,
                user.displayName ?? "-",
                true,
                40.w,
                color: constTheme.centerChannelColor,
                bg: constTheme.centerChannelDivider,
                mxContent: user.avatarUrl,
              ),
            ],
          ),
        if (!showAvatar) SizedBox(width: 40.w),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showAvatar) SizedBox(height: 7.w),
              if (showAvatar)
                RichText(
                  text: TextSpan(
                    text: event.senderId == widget.client.userID ? "Me" : user.displayName,
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
              SizedBox(height: 5.w),
              renderBody(event),
              SizedBox(height: 5.w),
            ],
          ),
        ),
      ],
    );
  }

  renderBody(link.Event event) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    if (event.type == link.EventTypes.Message && event.messageType == link.EventTypes.KeyVerificationRequest) {
      return VerificationRequestContent(event: event, timeline: widget.timeline);
    }
    return MessageContent(event, textColor: constTheme.centerChannelColor, onInfoTab: (e) async {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "消息内容",
            style: TextStyle(fontSize: 18.w),
          ),
          content: Text(
            event.toJson().toString(),
            style: TextStyle(color: constTheme.centerChannelColor),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("确定"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    });
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

  // buildTip(bool hover) {
  //   if (overlayEntry != null) return;
  //   final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
  //   final renderBox = context.findRenderObject() as RenderBox;
  //   final size = renderBox.size;
  //   final offset = renderBox.localToGlobal(Offset.zero);
  //   final iconSize = BoxConstraints(minWidth: 30.w, maxWidth: 30.w, minHeight: 30.w, maxHeight: 30.w);
  //   final w = 60.w + 10.w;
  //   overlayEntry = OverlayEntry(
  //     maintainState: true,
  //     builder: (context) => Listener(
  //       behavior: HitTestBehavior.opaque,
  //       onPointerDown: (PointerDownEvent event) {},
  //       onPointerHover: (PointerHoverEvent event) {
  //         Offset poffset = event.localPosition;
  //         if (poffset.dy < offset.dy || poffset.dy > offset.dy + size.height || poffset.dx < offset.dx) {
  //           if (overlayEntry != null) {
  //             overlayEntry!.remove();
  //             overlayEntry = null;
  //             setState(() {});
  //           }
  //           return;
  //         }
  //       },
  //       child: Column(
  //         // width: 200.w,
  //         children: [
  //           Container(
  //             margin: EdgeInsets.only(
  //               left: offset.dx + size.width - w - 10.w,
  //               top: offset.dy + (showDate ? 43.w : 5.w),
  //             ),
  //             padding: EdgeInsets.symmetric(horizontal: 3.w),
  //             decoration: BoxDecoration(
  //               color: constTheme.centerChannelBg,
  //               border: Border.all(color: constTheme.centerChannelColor.withOpacity(0.1)),
  //               borderRadius: BorderRadius.circular(4.w),
  //             ),
  //             width: w,
  //             height: 32.w,
  //             child: Row(
  //               children: [
  //                 IconButton(
  //                   tooltip: "emoji",
  //                   padding: EdgeInsets.zero,
  //                   constraints: iconSize,
  //                   style: IconButton.styleFrom(
  //                     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  //                   ),
  //                   icon: Icon(
  //                     Icons.mood_rounded,
  //                     color: constTheme.centerChannelColor,
  //                     size: 18.w,
  //                   ),
  //                   onPressed: () async {
  //                     await widget.event.room.sendTextEvent('/react 🦊', inReplyTo: widget.event);
  //                   },
  //                 ),
  //                 IconButton(
  //                   padding: EdgeInsets.zero,
  //                   constraints: iconSize,
  //                   style: IconButton.styleFrom(
  //                     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  //                   ),
  //                   icon: Icon(
  //                     Icons.reply_rounded,
  //                     color: constTheme.centerChannelColor,
  //                     size: 18.w,
  //                   ),
  //                   onPressed: () {},
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  //   // Overlay.of(context).insert(overlayEntry!);
  //   setState(() {});
  // }
}
