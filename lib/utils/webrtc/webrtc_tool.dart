import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import 'package:matrix/matrix.dart';

import 'package:webrtc_interface/src/rtc_video_renderer.dart';
import 'package:webrtc_interface/src/rtc_peerconnection.dart';
import 'package:webrtc_interface/src/mediadevices.dart';

import '../../pages/channel/webrtc/calling.dart';
import '../../router.dart';
import 'voip.dart';

class WebrtcTool with WidgetsBindingObserver implements WebRTCDelegate {
  final Client client;
  late WebrtcVoIP voip;
  
  OverlayEntry? callingPopup;

  WebrtcTool(this.client){
    voip = WebrtcVoIP(client, this);
  }

  @override
  bool get canHandleNewCall => true;

  @override
  Future<RTCPeerConnection> createPeerConnection(Map<String, dynamic> configuration, [Map<String, dynamic> constraints = const {}]) async {
    print(configuration);
    print(constraints);
    return webrtc.createPeerConnection(configuration, constraints);
  }

  @override
  VideoRenderer createRenderer() => webrtc.RTCVideoRenderer(); 
  
  @override
  Future<void> handleCallEnded(CallSession session) async {
    print("handleCallEnded");
  }

  @override
  Future<void> handleGroupCallEnded(GroupCall groupCall) async {
    print("handleGroupCallEnded");
  }

  @override
  Future<void> handleMissedCall(CallSession session) async {
    print("handleMissedCall");
  }

  @override
  Future<void> handleNewCall(CallSession session) async {
    if (callingPopup != null) {
      /// 已经有通话了
      session.reject();
      return;
    }
    print("handleNewCall");
    // session.onCallStateChanged.stream.listen(_handleCallState);
    if (session.direction == CallDirection.kIncoming){
      await showDialog<bool?>(
        context: globalCtx(),
        builder: (context) {
          return AlertDialog(
            title: Text("邀请参与xxxx"),
            content: Text("waiting"),
            actions: <Widget>[
              TextButton(
                child: Text("ok"),
                onPressed: () {
                  session.answer();
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text("false"),
                onPressed: () {
                  session.reject();
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        },
      );
    }else{
      await showDialog<bool?>(
        context: globalCtx(),
        builder: (context) {
          return AlertDialog(
            title: Text("等待对方回应"),
            content: Text("waiting"),
            actions: <Widget>[
              TextButton(
                child: Text("cancel"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        },
      );
    }
    // addCallingPopup(session.callId, session);
  }

  @override
  Future<void> handleNewGroupCall(GroupCall groupCall) async {
    print("handleNewGroupCall");
  }

  bool get isWeb => kIsWeb;

  @override
  Future<void> playRingtone() async {
    print("playRingtone");
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
      Overlay.of(context).insert(callingPopup!);
    }
  }
  
  @override
  MediaDevices get mediaDevices => webrtc.navigator.mediaDevices;
}