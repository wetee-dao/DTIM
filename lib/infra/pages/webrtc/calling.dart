import 'dart:async';

import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/webrtc/action.dart';
import 'img_painter.dart';

class WebRTCCalling extends StatefulWidget {
  final VoidCallback? onClear;
  final BuildContext context;
  final String callId;
  final link.CallSession call;
  final link.Client client;

  const WebRTCCalling({
    required this.context,
    required this.call,
    required this.client,
    required this.callId,
    this.onClear,
    Key? key,
  }) : super(key: key);

  @override
  State<WebRTCCalling> createState() => _Calling();
}

class _Calling extends State<WebRTCCalling> with TickerProviderStateMixin {
  link.CallState? _state;
  late AnimationController _controller;

  bool get speakerOn => true;
  bool get isMicrophoneMuted => widget.call.isMicrophoneMuted;
  bool get isLocalVideoMuted => widget.call.isLocalVideoMuted;
  bool get isScreensharingEnabled => widget.call.screensharingEnabled;
  bool get isRemoteOnHold => widget.call.remoteOnHold;
  bool get voiceonly => widget.call.type == link.CallType.kVoice;
  bool get connecting => widget.call.state == link.CallState.kConnecting;
  bool get connected => widget.call.state == link.CallState.kConnected;

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
    call.onCallStateChanged.stream.listen(_handleCallState);
    call.onCallEventChanged.stream.listen((event) {
      if (event == link.CallStateChange.kFeedsChanged) {
        call.tryRemoveStopedStreams();
      } else if (event == link.CallStateChange.kLocalHoldUnhold || event == link.CallStateChange.kRemoteHoldUnhold) {
        setState(() {});
        printDebug(
          'Call hold event: local ${call.localHold}, remote ${call.remoteOnHold}',
        );
      }
    });
    _state = call.state;

    if (call.type == link.CallType.kVideo) {
      try {
        // Enable wakelock (keep screen on)
        // unawaited(Wakelock.enable());
      } catch (_) {}
    }
  }

  void _handleCallState(link.CallState state) {
    printDebug('CallingPage::handleCallState: ${state.toString()}');
    if ({link.CallState.kConnected, link.CallState.kEnded}.contains(state)) {
      try {
        // Vibration.vibrate(duration: 200);
      } catch (e) {
        printDebug('[Dialer] could not vibrate for call updates');
      }
    }

    if (mounted) {
      setState(() {
        _state = state;
        if (_state == link.CallState.kEnded) cleanUp();
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
    final callActions = CallAction(widget.call);
    final actions = callActions.buildActionButtons();
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
                            ? BaseAvatar(
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
                widget.call.direction == link.CallDirection.kIncoming ? "Incoming" : "Outgoing",
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
                      decoration: BoxDecoration(shape: BoxShape.circle, color: actions[i].backgroundColor),
                      margin: EdgeInsets.only(right: i != actions.length - 1 ? 25.w : 0),
                      child: IconButton(
                        padding: EdgeInsets.all(18.w),
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
