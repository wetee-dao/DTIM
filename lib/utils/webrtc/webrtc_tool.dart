import 'package:asyou_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import 'package:matrix/matrix.dart';

import 'package:webrtc_interface/src/rtc_video_renderer.dart';
import 'package:webrtc_interface/src/rtc_peerconnection.dart';
import 'package:webrtc_interface/src/mediadevices.dart';

import '../../pages/webrtc/calling.dart';
import '../../router.dart';
import 'voip.dart';

class WebrtcTool with WidgetsBindingObserver implements WebRTCDelegate {
  final Client client;
  late WebrtcVoIP voip;
  
  OverlayEntry? callingPopup;
  CallSession? csession;

  WebrtcTool(this.client){
    voip = WebrtcVoIP(client, this);
  }

  @override
  bool get canHandleNewCall => true;

  @override
  Future<RTCPeerConnection> createPeerConnection(Map<String, dynamic> configuration, [Map<String, dynamic> constraints = const {}]) async {
    return webrtc.createPeerConnection(configuration, constraints);
  }

  @override
  VideoRenderer createRenderer() => webrtc.RTCVideoRenderer(); 
  
  @override
  Future<void> handleCallEnded(CallSession session) async {
    printError("handleCallEnded");
    callingPopup?.remove();
    callingPopup = null;
    csession = null;
  }

  @override
  Future<void> handleGroupCallEnded(GroupCall groupCall) async {
    printError("handleGroupCallEnded");
    callingPopup?.remove();
    callingPopup = null;
    csession = null;
  }

  @override
  Future<void> handleMissedCall(CallSession session) async {
    printError("handleMissedCall");
    callingPopup?.remove();
    callingPopup = null;
    csession = null;
  }

  @override
  Future<void> handleNewCall(CallSession session) async {
    /// 已经有通话了
    if (csession != null) {
      session.reject();
      return;
    }
    csession = session;
    addCallingPopup(session.callId, session);
  }

  @override
  Future<void> handleNewGroupCall(GroupCall groupCall) async {
    printError("handleNewGroupCall");
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
  
  @override
  MediaDevices get mediaDevices => webrtc.navigator.mediaDevices;
}