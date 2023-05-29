import 'dart:async';

import 'package:asyou_app/utils/functions.dart';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:flutter_gen/gen_l10n/l10n.dart';

import '../../components/components.dart';
import '../../store/theme.dart';
import '../../utils/platform_infos.dart';
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

  bool get speakerOn => widget.call.speakerOn;
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
      if (event == link.CallEvent.kFeedsChanged) {
        setState(() {
          call.tryRemoveStopedStreams();
        });
      } else if (event == link.CallEvent.kLocalHoldUnhold || event == link.CallEvent.kRemoteHoldUnhold) {
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
    final actions = buildActionButtons(_state);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 350.w,
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
                      onPressed: () {},
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
                widget.call.direction == link.CallDirection.kIncoming ? "Incoming" : "Outgoing",
                style: TextStyle(
                  fontSize: 20.w,
                  color: constTheme.centerChannelColor,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                (widget.call.room.isDirectChat ? "" : "channel:  ") + widget.call.room.getLocalizedDisplayname(),
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

  List<Action> buildActionButtons(state) {
    final switchCameraButton = Action(
      tooltip: 'switchCamera',
      onPressed: _switchCamera,
      backgroundColor: Colors.black45,
      child: const Icon(Icons.switch_camera),
    );

    final hangupButton = Action(
      onPressed: () {
        setState(() {
          if (widget.call.isRinging) {
            widget.call.reject();
          } else {
            widget.call.hangup();
          }
        });
      },
      tooltip: 'Hangup',
      backgroundColor: _state == link.CallState.kEnded ? Colors.black45 : Colors.red,
      child: const Icon(Icons.call_end),
    );

    final answerButton = Action(
      onPressed: () => setState(() {
        widget.call.answer();
      }),
      tooltip: 'Answer',
      backgroundColor: Colors.green,
      child: const Icon(Icons.phone),
    );

    final muteMicButton = Action(
      tooltip: 'muteMic',
      onPressed: () => setState(() {
        widget.call.setMicrophoneMuted(!widget.call.isMicrophoneMuted);
      }),
      backgroundColor: isMicrophoneMuted ? Colors.blueGrey : Colors.black45,
      child: Icon(isMicrophoneMuted ? Icons.mic_off : Icons.mic),
    );

    final screenSharingButton = Action(
      tooltip: 'screenSharing',
      onPressed: _screenSharing,
      backgroundColor: isScreensharingEnabled ? Colors.blueGrey : Colors.black45,
      child: const Icon(Icons.desktop_mac),
    );

    final holdButton = Action(
      tooltip: 'hold',
      onPressed: () => setState(() {
        widget.call.setRemoteOnHold(!widget.call.remoteOnHold);
      }),
      backgroundColor: isRemoteOnHold ? Colors.blueGrey : Colors.black45,
      child: Icon(isRemoteOnHold ? Icons.stop_circle_rounded : Icons.pause),
    );

    final muteCameraButton = Action(
      tooltip: 'muteCam',
      onPressed: () => setState(() {
        widget.call.setLocalVideoMuted(!widget.call.isLocalVideoMuted);
      }),
      backgroundColor: isLocalVideoMuted ? Colors.yellow : Colors.black45,
      child: Icon(isLocalVideoMuted ? Icons.videocam_off : Icons.videocam),
    );

    switch (_state) {
      case link.CallState.kRinging:
      case link.CallState.kInviteSent:
      case link.CallState.kCreateAnswer:
      case link.CallState.kConnecting:
        return widget.call.isOutgoing ? [hangupButton] : [answerButton, hangupButton];
      case link.CallState.kConnected:
        return [
          muteMicButton,
          //switchSpeakerButton,
          if (!voiceonly && !kIsWeb) switchCameraButton,
          if (!voiceonly) muteCameraButton,
          if (PlatformInfos.isMobile || PlatformInfos.isWeb) screenSharingButton,
          holdButton,
          hangupButton,
        ];
      case link.CallState.kEnded:
        return [
          hangupButton,
        ];
      case link.CallState.kFledgling:
        break;
      case link.CallState.kWaitLocalMedia:
        break;
      case link.CallState.kCreateOffer:
        break;
      case null:
        break;
    }
    return [];
  }

  void _switchCamera() async {
    if (widget.call.localUserMediaStream != null) {
      await Helper.switchCamera(
        widget.call.localUserMediaStream!.stream!.getVideoTracks()[0],
      );
      if (PlatformInfos.isMobile) {
        widget.call.facingMode == 'user' ? widget.call.facingMode = 'environment' : widget.call.facingMode = 'user';
      }
    }
    setState(() {});
  }

  void _screenSharing() async {
    if (PlatformInfos.isAndroid) {
      if (!widget.call.screensharingEnabled) {
        FlutterForegroundTask.init(
          androidNotificationOptions: AndroidNotificationOptions(
            channelId: 'notification_channel_id',
            channelName: 'Foreground Notification',
            channelDescription: 'Foreground Notification',
          ),
          iosNotificationOptions: const IOSNotificationOptions(),
          foregroundTaskOptions: const ForegroundTaskOptions(),
        );
        FlutterForegroundTask.startService(
          notificationTitle: "screen sharing",
          notificationText: "screen sharing",
        );
      } else {
        FlutterForegroundTask.stopService();
      }
    }

    setState(() {
      widget.call.setScreensharingEnabled(!widget.call.screensharingEnabled);
    });
  }
}

class Action {
  final String tooltip;
  final Color backgroundColor;
  final Widget child;
  final Function onPressed;
  Action({required this.backgroundColor, required this.child, required this.onPressed, required this.tooltip});
}
