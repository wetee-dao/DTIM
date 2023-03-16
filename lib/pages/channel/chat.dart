import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themed/themed.dart';
import 'package:window_manager/window_manager.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/close_bar.dart';
import '../../models/models.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import '../../utils/functions.dart';
import '../../objectbox.g.dart';
import '../../utils/screen.dart';
import 'bar.dart';
import 'input.dart';
import 'msg.dart';

// ignore: must_be_immutable
class ChannelDetailPage extends StatefulWidget {
  String channerlID;

  ChannelDetailPage({Key? key, required this.channerlID}) : super(key: key);

  @override
  State<ChannelDetailPage> createState() => _ChannelDetailPageState();
}

class _ChannelDetailPageState extends State<ChannelDetailPage> with WindowListener {
  final StreamController<String> _msgController = StreamController<String>();
  final _listController = ScrollController();
  late final IMProvider im;
  late link.Room? room;
  late link.Client? client;
  late Account me;

  link.Timeline? timeline;
  Stream<bool>? sub;
  String srcAvatar = "";
  String nameAuthor = "";
  Condition<ImMessages>? get condition => null;

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    me = im.me!;
    if (im.currentState != null) {
      client = im.currentState!.client;
      room = im.currentState!.client.getRoomById(widget.channerlID);
      getTimeline();
    }
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  getUserName(User u) {
    if (u.name != "") {
      return u.name;
    }
    return u.address;
  }

  void updateView(index) {
    if (!mounted) return;
    print("updateView updateView ===> " + timeline!.events.length.toString());
    _msgController.add(timeline!.events.reversed.last.eventId);
    Timer(const Duration(milliseconds: 20), () {
      _listController.jumpTo(_listController.position.maxScrollExtent);
    });
  }

  Future<bool> getTimeline() async {
    if (timeline == null && im.currentState != null) {
      await im.currentState!.client.roomsLoading;
      await im.currentState!.client.accountDataLoading;
      timeline = await room!.getTimeline(onInsert: updateView);
      if (timeline!.events.isNotEmpty) {
        if (room!.markedUnread) room!.markUnread(false);
        // setReadMarker();updateView
      }
      updateView(0);
      // when the scroll controller is attached we want to scroll to an event id, if specified
      // and update the scroll controller...which will trigger a request history, if the
      // "load more" button is visible on the screen
      // SchedulerBinding.instance.addPostFrameCallback((_) async {
      //   if (mounted) {
      //     final event = VRouter.of(context).queryParameters['event'];
      //     if (event != null) {
      //       scrollToEventId(event);
      //     }
      //     _updateScrollController();
      //   }
      // });
    }
    timeline!.requestKeys(onlineKeyBackupOnly: false);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (room == null) return Container();
    return Scaffold(
      appBar: ChannelBar(
        room: room!,
        height: 71.w,
        tools: CloseBar(
          child: Row(
            children: [
              Icon(
                Icons.meeting_room_outlined,
                color: ConstTheme.centerChannelColor.withAlpha(150),
                size: 19.w,
              ),
              SizedBox(width: 10.w),
              Icon(
                Icons.task_outlined,
                color: ConstTheme.centerChannelColor.withAlpha(150),
                size: 19.w,
              ),
              SizedBox(width: 10.w),
              Icon(
                Icons.lock_outline,
                color: ConstTheme.mentionBg,
                size: 19.w,
              ),
              SizedBox(width: 10.w),
              Icon(
                Icons.info_outline,
                color: ConstTheme.centerChannelColor.withAlpha(150),
                size: 19.w,
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
      backgroundColor: ConstTheme.centerChannelBg,
      body: Container(
        color: ConstTheme.centerChannelBg,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<String>(
                stream: _msgController.stream,
                initialData: "",
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  List<link.Event> events = timeline != null ? timeline!.events.reversed.toList() : [];
                  return ListView.builder(
                    key: Key("chat_list_${widget.channerlID}"),
                    itemCount: events.length + 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _listController,
                    itemBuilder: (context, index) {
                      if (index == events.length) {
                        return SizedBox(height: 10.w);
                      }
                      link.Event event = events[index];
                      link.Event? preEvent;
                      if (index - 1 > 0) {
                        preEvent = events[index - 1];
                      }
                      if (event.type == link.EventTypes.RoomCreate) {
                        return renderCreate(event);
                      }

                      return Msg(event: event, preEvent: preEvent, client: client!);
                    },
                  );
                },
              ),
            ),
            ChannelInputPage(room: room!),
          ],
        ),
      ),
    );
  }

  renderCreate(link.Event event) {
    if (event.type == link.EventTypes.RoomCreate) {
      return Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "# ${room!.name.fisrtUpperCase()}",
              style: TextStyle(
                color: ConstTheme.centerChannelColor,
                fontWeight: FontWeight.w400,
                fontSize: 20.w,
              ),
            ),
            SizedBox(height: 5.w),
            Text(
              "你于 在 ${formatDate(
                event.originServerTs,
                [
                  yyyy,
                  ' 年 ',
                  mm,
                  " 月 ",
                  dd,
                  " 日",
                ],
              )} 创建此频道，这是 ${room!.name} 频道的开头。",
              style: TextStyle(
                color: ConstTheme.centerChannelColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.w,
              ),
            )
          ],
        ),
      );
    }
  }
}
