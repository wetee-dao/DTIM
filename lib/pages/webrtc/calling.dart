import 'dart:async';

import 'package:asyou_app/utils/functions.dart';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/components.dart';
import '../../store/app/app.dart';
import '../../store/theme.dart';
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
  late AppCubit im;

  void _playCallSound() async {
    // const path = 'assets/sounds/call.ogg';
    // if (kIsWeb || PlatformInfos.isMobile || PlatformInfos.isMacOS) {
    //   final player = AudioPlayer();
    //   await player.setAsset(path);
    //   player.play();
    // } else {
    //   Logs().w('Playing sound not implemented for this platform!');
    // }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    initialize();
    im = context.read<AppCubit>();
    _playCallSound();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        child: UserAvatar(
                          key: Key(im.currentState!.user.id.toString()),
                          im.me!.address,
                          true,
                          60.w,
                          bg: Colors.transparent,
                          color: constTheme.sidebarText,
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
                "Incoming...",
                style: TextStyle(
                  fontSize: 20.w,
                  color: constTheme.centerChannelColor,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 15.w),
              Text(
                "XXXXXXX",
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
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                    // color: Colors.redAccent,
                    child: IconButton(
                      iconSize: 30.w,
                      icon: const Icon(Icons.call_end),
                      color: Colors.white,
                      onPressed: () async {
                        if (widget.call.isRinging) {
                          await widget.call.reject();
                        } else {
                          await widget.call.hangup();
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 50.w),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                    child: IconButton(
                      iconSize: 30.0,
                      icon: const Icon(Icons.call),
                      color: Colors.white,
                      onPressed: () async {
                        await widget.call.answer();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
