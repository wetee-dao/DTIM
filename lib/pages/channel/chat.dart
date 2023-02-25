import 'dart:async';

import 'package:asyou_app/objectbox.g.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/close_bar.dart';
import '../../models/models.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
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
    print("updateView updateView");
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
                color: ConstTheme.sidebarTextActiveBorder,
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
                  return Scrollbar(
                    key: Key("chat_scrollbar_${widget.channerlID}"),
                    child: ListView.builder(
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
                        return Msg(event: event, preEvent: preEvent, client: client!);
                      },
                    ),
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
}
