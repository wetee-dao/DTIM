import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import 'package:matrix/matrix.dart';

import 'package:webrtc_interface/src/rtc_video_renderer.dart';
import 'package:webrtc_interface/src/rtc_peerconnection.dart';
import 'package:webrtc_interface/src/mediadevices.dart';

class VoipTool with WidgetsBindingObserver implements WebRTCDelegate {
  final Client client;
  late VoIP voip;

  VoipTool(this.client){
    voip = VoIP(client, this);
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
    print("handleNewCall");
  }

  @override
  Future<void> handleNewGroupCall(GroupCall groupCall) async {
    print("handleNewGroupCall");
  }

  @override
  bool get isWeb => kIsWeb;

  @override
  MediaDevices get mediaDevices => webrtc.mediaDevices;

  @override
  Future<void> playRingtone() async {
    print("playRingtone");
  }

  @override
  Future<void> stopRingtone() async {
    print("stopRingtone");
  }
}