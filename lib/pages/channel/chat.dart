import 'dart:async';

import 'package:asyou_app/utils/localized_extension.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/chat/chat_scroll_physics.dart';
import '../../components/close_bar.dart';
import '../../components/components.dart';
import '../../models/models.dart';
import '../../router.dart';
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
  final int _loadHistoryCount = 200;

  link.Timeline? timeline;
  Stream<bool>? sub;
  String srcAvatar = "";
  String nameAuthor = "";
  Condition<ImMessages>? get condition => null;

  bool get canLoadMore =>
      timeline != null && (timeline!.events.isEmpty || timeline!.events.last.type != link.EventTypes.RoomCreate);

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    me = im.me!;
    if (im.currentState != null) {
      client = im.currentState!.client;
      room = im.currentState!.client.getRoomById(widget.channerlID);
      if (room!.membership == link.Membership.invite) {
        Timer(const Duration(milliseconds: 10), () {
          waitFutureLoading(
            context: context,
            future: () => room!.join(),
          );
          getTimeline();
        });
      }
      getTimeline();
    }
    _listController.addListener(scrollListener);
  }

  void scrollListener() {
    if (_listController.position.pixels <= _listController.position.minScrollExtent) {
      if (timeline!.canRequestHistory && !timeline!.isRequestingHistory) requestHistory();
    }
  }

  @override
  void dispose() {
    _listController.removeListener(scrollListener);
    _listController.dispose();
    super.dispose();
  }

  Future<void>? _setReadMarkerFuture;
  void setReadMarker([_]) {
    print("setReadMarker");
    room!.markUnread(false);
    if (_setReadMarkerFuture == null &&
        (room!.hasNewMessages || room!.notificationCount > 0) &&
        timeline != null &&
        timeline!.events.isNotEmpty &&
        im.currentState!.webHasFocus) {
      _setReadMarkerFuture = timeline!.setReadMarker().then((_) {
        _setReadMarkerFuture = null;
      });
      // client!.updateIosBadge();
    }
  }

  getUserName(User u) {
    if (u.name != "") {
      return u.name;
    }
    return u.address;
  }

  void updateView(index) {
    if (!mounted) return;
    print("updateView ===> ${timeline!.events.length}");
    _msgController.add(timeline!.events.reversed.last.eventId);
    Timer(const Duration(milliseconds: 20), () {
      try {
        _listController.jumpTo(_listController.position.maxScrollExtent);
      } catch (e) {}
    });
  }

  Future<bool> getTimeline() async {
    if (timeline == null && im.currentState != null) {
      await im.currentState!.client.roomsLoading;
      await im.currentState!.client.accountDataLoading;
      timeline = await room!.getTimeline(onInsert: updateView);
      if (timeline!.events.isNotEmpty) {
        if (room!.isUnread) setReadMarker();
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

  void requestHistory() async {
    if (canLoadMore) {
      try {
        await timeline!.requestHistory(historyCount: _loadHistoryCount);
      } catch (err) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (err).toLocalizedString(context),
            ),
          ),
        );
        rethrow;
      }
    }
  }

  void recreateChat() async {
    final room = this.room;
    final userId = room?.directChatMatrixID;
    if (room == null || userId == null) {
      throw Exception(
        'Try to recreate a room with is not a DM room. This should not be possible from the UI!',
      );
    }
    final success = await waitFutureLoading(
      context: context,
      future: () async {
        final client = room.client;
        final waitForSync = client.onSync.stream.firstWhere((s) => s.rooms?.leave?.containsKey(room.id) ?? false);
        await room.leave();
        await waitForSync;
        return await client.startDirectChat(userId);
      },
    );
    final roomId = success.result;
    if (roomId == null) return;
    // VRouter.of(context).toSegments(['rooms', roomId]);
  }

  void leaveChat() async {
    final room = this.room;
    if (room == null) {
      throw Exception(
        'Leave room button clicked while room is null. This should not be possible from the UI!',
      );
    }
    final success = await waitFutureLoading(
      context: context,
      future: room.leave,
    );
    if (success.error != null) return;
    // VRouter.of(context).to('/rooms');
  }

  @override
  Widget build(BuildContext context) {
    if (room == null) return Container();
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      appBar: ChannelBar(
        room: room!,
        height: 71.w,
        tools: CloseBar(
          child: Row(
            children: [
              // Icon(
              //   Icons.meeting_room_outlined,
              //   color: constTheme.centerChannelColor.withAlpha(150),
              //   size: 19.w,
              // ),
              // SizedBox(width: 10.w),
              // Icon(
              //   Icons.task_outlined,
              //   color: constTheme.centerChannelColor.withAlpha(150),
              //   size: 19.w,
              // ),
              SizedBox(width: 10.w),
              StreamBuilder<link.SyncUpdate>(
                stream: client!.onSync.stream.where((s) => s.deviceLists != null),
                builder: (context, snapshot) {
                  return FutureBuilder<link.EncryptionHealthState>(
                    future: room!.calcEncryptionHealthState(),
                    builder: (BuildContext context, snapshot) => IconButton(
                      padding: EdgeInsets.all(3.w),
                      tooltip: room!.encrypted ? L10n.of(context)!.encrypted : L10n.of(context)!.encryptionNotEnabled,
                      icon: Icon(
                        room!.encrypted ? Icons.lock_outline : Icons.lock_open,
                        size: 19.w,
                        color: room!.joinRules != link.JoinRules.public && !room!.encrypted
                            ? constTheme.centerChannelColor.withAlpha(150)
                            : room!.joinRules != link.JoinRules.public &&
                                    snapshot.data == link.EncryptionHealthState.unverifiedDevices
                                ? constTheme.mentionBg
                                : constTheme.centerChannelColor.withAlpha(150),
                      ),
                      onPressed: () {
                        showModelOrPage(context, "/channel_setting/${Uri.encodeComponent(room!.id)}/e2e");
                      },
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () async {
                  showModelOrPage(context, "/channel_setting/${Uri.encodeComponent(room!.id)}/info");
                },
                icon: Icon(
                  Icons.info_outline,
                  color: constTheme.centerChannelColor.withAlpha(150),
                  size: 19.w,
                ),
              ),
              SizedBox(width: 5.w),
            ],
          ),
        ),
      ),
      backgroundColor: constTheme.centerChannelBg,
      body: Container(
        color: constTheme.centerChannelBg,
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
                    itemCount: events.length + 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ChatScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    controller: _listController,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        if (timeline != null && timeline!.isRequestingHistory) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                          );
                        }
                        return Container();
                      }

                      if (index == events.length + 1) {
                        return SizedBox(height: 10.w);
                      }
                      link.Event event = events[index - 1];
                      link.Event? preEvent;
                      if (index > 2) {
                        preEvent = events[index - 2];
                      }
                      if (event.type == link.EventTypes.RoomCreate) {
                        return renderCreate(event);
                      }
                      return Msg(event: event, preEvent: preEvent, client: client!, timeline: timeline!);
                    },
                  );
                },
              ),
            ),
            room?.isAbandonedDMRoom == true
                ? Container(
                    color: constTheme.centerChannelColor.withOpacity(0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(24.w),
                            foregroundColor: constTheme.errorTextColor,
                          ),
                          icon: Icon(
                            Icons.archive_outlined,
                            size: 20.w,
                          ),
                          onPressed: leaveChat,
                          label: Text(
                            L10n.of(context)!.leave,
                            style: TextStyle(color: constTheme.errorTextColor, fontSize: 15.w),
                          ),
                        ),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(24.w),
                          ),
                          icon: Icon(
                            Icons.forum_outlined,
                            size: 20.w,
                          ),
                          onPressed: recreateChat,
                          label: Text(
                            L10n.of(context)!.reopenChat,
                            style: TextStyle(fontSize: 15.w),
                          ),
                        ),
                      ],
                    ),
                  )
                : ChannelInputPage(room: room!),
          ],
        ),
      ),
    );
  }

  renderCreate(link.Event event) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    if (event.type == link.EventTypes.RoomCreate) {
      return Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "# ${room!.getLocalizedDisplayname().fisrtUpperCase()}",
              style: TextStyle(
                color: constTheme.centerChannelColor,
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
              )} 创建此频道，这是${room!.isDirectChat ? "聊天" : "频道"}的开头。",
              style: TextStyle(
                color: constTheme.centerChannelColor,
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
