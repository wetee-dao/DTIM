import 'package:dtim/infra/pages/webrtc/calling.dart';
import 'package:dtim/infra/pages/webrtc/group_calling.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import 'package:matrix/matrix.dart';

import 'package:webrtc_interface/src/rtc_video_renderer.dart';
import 'package:webrtc_interface/src/rtc_peerconnection.dart';
import 'package:webrtc_interface/src/mediadevices.dart';

import 'package:dtim/router.dart';
import 'package:dtim/application/store/app/webrtc.dart';
import 'voip.dart';

class WebrtcTool with WidgetsBindingObserver implements WebRTCDelegate {
  final Client client;
  late WebrtcVoIP voip;

  OverlayEntry? callingPopup;

  WebrtcTool(this.client) {
    voip = WebrtcVoIP(client, this);
  }

  @override
  bool get canHandleNewCall => true;

  @override
  Future<RTCPeerConnection> createPeerConnection(Map<String, dynamic> configuration,
      [Map<String, dynamic> constraints = const {}]) async {
    return webrtc.createPeerConnection(configuration, constraints);
  }

  @override
  VideoRenderer createRenderer() => webrtc.RTCVideoRenderer();

  @override
  Future<void> handleCallEnded(CallSession session) async {
    printError("handleCallEnded");
    callingPopup?.remove();
    callingPopup = null;
    final g = globalCtx().read<WebRTCCubit>();
    g.update();
  }

  @override
  Future<void> handleGroupCallEnded(GroupCall groupCall) async {
    printError("handleGroupCallEnded");
    callingPopup?.remove();
    callingPopup = null;
    final g = globalCtx().read<WebRTCCubit>();
    g.update();
  }

  @override
  Future<void> handleMissedCall(CallSession session) async {
    printError("handleMissedCall");
    callingPopup?.remove();
    callingPopup = null;
    final g = globalCtx().read<WebRTCCubit>();
    g.update();
  }

  @override
  Future<void> handleNewCall(CallSession session) async {
    final g = globalCtx().read<WebRTCCubit>();
    if (voip.calls.keys.length > 1) {
      g.update();
      session.reject();
      return;
    }
    g.update();
    session.onCallStateChanged.stream.listen((e) {
      g.update();
    });
    addCallingPopup(session.callId, session);
  }

  @override
  Future<void> handleNewGroupCall(GroupCall groupCall) async {
    printError("handleNewGroupCall => ${groupCall.groupCallId}");
    final g = globalCtx().read<WebRTCCubit>();
    if (voip.calls.keys.length > 1) {
      g.update();
      return;
    }
    g.update();
    // final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    // final scaffoldMessenger = ScaffoldMessenger.of(globalCtx());
    // scaffoldMessenger.showSnackBar(
    //   SnackBar(
    //     content: Text("频道 ${groupCall.room.getLocalizedDisplayname()} 开启了多媒体通话"),
    //     backgroundColor: constTheme.linkColor,
    //     margin: EdgeInsets.only(bottom: 1.sh - 60.w),
    //     behavior: SnackBarBehavior.floating,
    //   ),
    // );
    // addGroupCallingPopup(groupCall.groupCallId, groupCall);
  }

  @override
  bool get isWeb => kIsWeb;

  @override
  Future<void> playRingtone() async {
    printError("playRingtone");
  }

  @override
  Future<void> stopRingtone() async {
    print("stopRingtone");
  }

  void addCallingPopup(String callId, CallSession call) {
    final context = globalCtx(); // web is weird
    if (callingPopup != null) {
      Logs().e('[VOIP] addCallingOverlay: The call session already exists?');
      callingPopup!.remove();
    }
    // falling back on a dialog
    if (kIsWeb) {
      showDialog(
        context: context,
        builder: (context) => WebRTCCalling(
          context: context,
          client: client,
          callId: callId,
          call: call,
          onClear: () => Navigator.of(context).pop(),
        ),
      );
    } else {
      callingPopup = OverlayEntry(
        builder: (_) => WebRTCCalling(
          context: context,
          client: client,
          callId: callId,
          call: call,
          onClear: () {
            callingPopup?.remove();
            callingPopup = null;
          },
        ),
      );
      globalState().overlay!.insert(callingPopup!);
    }
  }

  void addGroupCallingPopup(String groupCallId, GroupCall groupCall) {
    final context = globalCtx(); // web is weird
    if (callingPopup != null) {
      Logs().e('[VOIP] addCallingOverlay: The call session already exists?');
      callingPopup!.remove();
    }
    // falling back on a dialog
    if (kIsWeb) {
      showDialog(
        context: context,
        builder: (context) => GroupWebRTCalling(
          context: context,
          client: client,
          callId: groupCallId,
          call: groupCall,
          onClear: () => Navigator.of(context).pop(),
        ),
      );
    } else {
      callingPopup = OverlayEntry(
        builder: (_) => GroupWebRTCalling(
          context: context,
          client: client,
          callId: groupCallId,
          call: groupCall,
          onClear: () {
            callingPopup?.remove();
            callingPopup = null;
          },
        ),
      );
      globalState().overlay!.insert(callingPopup!);
    }
  }

  @override
  MediaDevices get mediaDevices => webrtc.navigator.mediaDevices;
}
