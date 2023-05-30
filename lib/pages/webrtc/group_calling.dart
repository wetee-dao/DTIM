import 'dart:async';

import 'package:asyou_app/utils/functions.dart';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:flutter_gen/gen_l10n/l10n.dart';

import '../../components/components.dart';
import '../../store/theme.dart';
import '../../utils/webrtc/action.dart';
import 'img_painter.dart';

class GroupWebRTCalling extends StatefulWidget {
  final VoidCallback? onClear;
  final BuildContext context;
  final String callId;
  final link.GroupCall call;
  final link.Client client;

  const GroupWebRTCalling({
    required this.context,
    required this.call,
    required this.client,
    required this.callId,
    this.onClear,
    Key? key,
  }) : super(key: key);

  @override
  State<GroupWebRTCalling> createState() => _Calling();
}

class _Calling extends State<GroupWebRTCalling> with TickerProviderStateMixin {
  String? _state;
  late AnimationController _controller;

  // bool get speakerOn => widget.call.speakerOn;
  bool get isMicrophoneMuted => widget.call.isMicrophoneMuted;
  bool get isLocalVideoMuted => widget.call.isLocalVideoMuted;
  bool get isScreensharingEnabled => widget.call.screensharingEnabled;
  // bool get isRemoteOnHold => widget.call.remoteOnHold;
  bool get voiceonly => widget.call.type == link.GroupCallType.Voice;
  bool get connecting => widget.call.state == link.GroupCallState.Entering;
  bool get connected => widget.call.state == link.GroupCallState.Entered;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initialize() async {
    final call = widget.call;
    call.onGroupCallFeedsChanged.stream.listen(_handleCallState);
    call.onGroupCallEvent.stream.listen((event) {});
    _state = call.state;
  }

  void _handleCallState(link.GroupCall session) {
    printDebug('CallingPage::handleCallState: ${session.state}');
    if ({link.GroupCallState.Entered, link.GroupCallState.Ended}.contains(session.state)) {
      try {
        // Vibration.vibrate(duration: 200);
      } catch (e) {
        printDebug('[Dialer] could not vibrate for call updates');
      }
    }

    if (mounted) {
      setState(() {
        _state = session.state;
        if (_state == link.GroupCallState.Ended) cleanUp();
      });
    }
  }

  void cleanUp() {
    Timer(
      const Duration(seconds: 2),
      () => widget.onClear?.call(),
    );
    if (widget.call.type == link.CallType.kVideo) {
      try {
        // unawaited(Wakelock.disable());
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    // final callActions = CallAction(widget.call);
    // final actions = callActions.buildActionButtons();
    final actions = [];
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: actions.length > 3 ? 550.w : 350.w,
          height: 600.w,
          decoration: BoxDecoration(
            color: constTheme.centerChannelBg.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: IconButton(
                      onPressed: () {
                        widget.onClear?.call();
                      },
                      icon: Icon(AppIcons.suoxiao, color: constTheme.sidebarHeaderTextColor, size: 24.w),
                      constraints: BoxConstraints(minWidth: 40.w, maxWidth: 40.w, minHeight: 40.w, maxHeight: 40.w),
                      padding: EdgeInsets.zero,
                      tooltip: L10n.of(context)!.close,
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        hoverColor: constTheme.errorTextColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomPaint(
                painter: ImgPainter(
                  _controller,
                  color: constTheme.buttonBg,
                ),
                child: SizedBox(
                  width: 140.w,
                  height: 100.w,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Container(
                        color: constTheme.centerChannelBg,
                        width: 90.w,
                        height: 90.w,
                        padding: EdgeInsets.all(15.w),
                        child: widget.call.room.isDirectChat
                            ? UserAvatar(
                                key: Key(widget.call.room.directChatMatrixID ?? "-"),
                                widget.call.room.directChatMatrixID ?? "-",
                                true,
                                60.w,
                                bg: Colors.transparent,
                                color: constTheme.centerChannelColor,
                              )
                            : Container(
                                width: 60.w,
                                height: 60.w,
                                padding: EdgeInsets.only(top: 2.w),
                                child: Center(
                                  child: Icon(
                                      widget.call.room.encrypted
                                          ? Icons.private_connectivity
                                          : Icons.all_inclusive_sharp,
                                      size: 45.w,
                                      color: constTheme.centerChannelColor),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70.w,
              ),
              Text(
                "Channel",
                style: TextStyle(
                  fontSize: 20.w,
                  color: constTheme.centerChannelColor,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                widget.call.room.getLocalizedDisplayname(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.w,
                  color: constTheme.centerChannelColor,
                ),
              ),
              SizedBox(height: 75.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < actions.length; i++)
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: actions[i].backgroundColor),
                      margin: EdgeInsets.only(right: i != actions.length - 1 ? 20.w : 0),
                      child: IconButton(
                        iconSize: 30.w,
                        icon: actions[i].child,
                        color: Colors.white,
                        onPressed: () async {
                          actions[i].onPressed();
                        },
                      ),
                    ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
