

import 'dart:async';

import 'package:asyou_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

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

class _Calling  extends State<WebRTCCalling> {
  link.CallState? _state;

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
    initialize();
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
      } else if (event == link.CallEvent.kLocalHoldUnhold ||
          event == link.CallEvent.kRemoteHoldUnhold) {
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
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Container(
        child: Text("Calling"),
      ),
    );
  }
}