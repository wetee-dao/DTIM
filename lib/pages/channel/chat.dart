import 'dart:async';

import 'package:asyou_app/utils/localized_extension.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:date_format/date_format.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/close_bar.dart';
import '../../components/components.dart';
import '../../models/models.dart';
import '../../router.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import '../../utils/functions.dart';
import '../../utils/screen/screen.dart';
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
  late final AppCubit im;
  late link.Room? room;
  late link.Client? client;
  late Account me;
  final int _loadHistoryCount = 30;

  link.Timeline? timeline;
  Stream<bool>? sub;
  String srcAvatar = "";
  String nameAuthor = "";

  bool get canLoadMore =>
      timeline != null && (timeline!.events.isEmpty || timeline!.events.last.type != link.EventTypes.RoomCreate);

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
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

    // im.currentState!.webrtcTool!.voip.initRenderers();
  }

  void scrollListener() {
    if (_listController.position.pixels + 30 >= _listController.position.maxScrollExtent) {
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

  void updateView() {
    if (!mounted) return;
    print("updateView ===> ${timeline!.events.length}");
    _msgController.add(timeline!.events.reversed.last.eventId);
    // Timer(const Duration(milliseconds: 20), () {
    //   try {
    //     _listController.jumpTo(_listController.position.maxScrollExtent);
    //   } catch (e) {}
    // });
  }

  Future<bool> getTimeline() async {
    if (timeline == null && im.currentState != null) {
      await im.currentState!.client.roomsLoading;
      await im.currentState!.client.accountDataLoading;
      timeline = await room!.getTimeline(
        onInsert: (i) => EasyDebounce.debounce(
          'updateView',
          const Duration(milliseconds: 200),
          () => updateView(),
        ),
      );
      if (timeline!.events.isNotEmpty) {
        if (room!.isUnread) setReadMarker();
      }
      updateView();
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
        height: 66.w,
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
              SizedBox(width: 9.w),
              IconButton(
                onPressed: () async {
                  final voip = im.currentState!.webrtcTool!.voip;
                  final success = await waitFutureLoading(
                    context: context,
                    future: () => voip.requestTurnServerCredentials(),
                  );
                  if (success.result != null) {
                    try {
                      await voip.inviteToCall(room!.id, link.CallType.kVoice);
                    } catch (e) {
                      BotToast.showText(text: e.toLocalizedString(globalCtx()));
                    }
                  } else {
                    BotToast.showText(text: "获取 turn 服务器失败");
                  }
                },
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 30.w, maxWidth: 30.w, minHeight: 30.w, maxHeight: 30.w),
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                ),
                tooltip: "call",
                icon: Icon(
                  Icons.call_rounded,
                  color: constTheme.centerChannelColor,
                  size: 21.w,
                ),
              ),
              SizedBox(width: 5.w),
              IconButton(
                onPressed: () async {

                },
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 30.w, maxWidth: 30.w, minHeight: 30.w, maxHeight: 30.w),
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                ),
                tooltip: "video call",
                icon: Icon(
                  Icons.duo_outlined,
                  color: constTheme.centerChannelColor,
                  size: 21.w,
                ),
              ),
              SizedBox(width: 5.w),
              StreamBuilder<link.SyncUpdate>(
                stream: client!.onSync.stream.where((s) => s.deviceLists != null),
                builder: (context, snapshot) {
                  return FutureBuilder<link.EncryptionHealthState>(
                    future: room!.calcEncryptionHealthState(),
                    builder: (BuildContext context, snapshot) => IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(minWidth: 30.w, maxWidth: 30.w, minHeight: 30.w, maxHeight: 30.w),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                      ),
                      tooltip: room!.encrypted ? L10n.of(context)!.encrypted : L10n.of(context)!.encryptionNotEnabled,
                      icon: Icon(
                        room!.encrypted ? Icons.lock_rounded : Icons.lock_open_rounded,
                        size: 21.w,
                        color: room!.joinRules != link.JoinRules.public && !room!.encrypted
                            ? constTheme.centerChannelColor
                            : room!.joinRules != link.JoinRules.public &&
                                    snapshot.data == link.EncryptionHealthState.unverifiedDevices
                                ? constTheme.buttonBg
                                : constTheme.centerChannelColor,
                      ),
                      onPressed: () {
                        showModelOrPage(context, "/channel_setting/${Uri.encodeComponent(room!.id)}/e2e");
                      },
                    ),
                  );
                },
              ),
              SizedBox(width: 2.w),
              IconButton(
                onPressed: () async {
                  showModelOrPage(context, "/channel_setting/${Uri.encodeComponent(room!.id)}/info");
                },
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 30.w, maxWidth: 30.w, minHeight: 30.w, maxHeight: 30.w),
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                ),
                tooltip: "info",
                icon: Icon(
                  Icons.info_outline,
                  color: constTheme.centerChannelColor,
                  size: 21.w,
                ),
              ),
              SizedBox(width: 9.w),
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
                  List<link.Event> events = timeline != null ? timeline!.events : [];
                  return ListView.builder(
                    key: Key("chat_list_${widget.channerlID}"),
                    itemCount: events.length + 2,
                    shrinkWrap: true,
                    reverse: true,
                    scrollDirection: Axis.vertical,
                    controller: _listController,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SizedBox(height: 10.w);
                      }
                      if (index == events.length + 1) {
                        if (timeline != null && timeline!.isRequestingHistory) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: CircularProgressIndicator.adaptive(strokeWidth: 4.w),
                            ),
                          );
                        }
                        return Container();
                      }

                      link.Event event = events[index - 1];
                      link.Event? preEvent;
                      if (index < events.length - 1) {
                        preEvent = events[index];
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
      return Container(
        padding: EdgeInsets.all(18.w),
        margin: EdgeInsets.only(bottom: 10.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: constTheme.centerChannelDivider,
            ),
          ),
        ),
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
              "你于 ${formatDate(
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
