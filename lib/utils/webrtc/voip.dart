import 'dart:async';

import 'package:asyou_app/router.dart';
import 'package:asyou_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import 'package:matrix/matrix.dart' as link;

import '../signaling.dart';

class WebrtcVoIP extends link.VoIP {
  final webrtc.RTCVideoRenderer _localRenderer = webrtc.RTCVideoRenderer();
  final webrtc.RTCVideoRenderer _remoteRenderer = webrtc.RTCVideoRenderer();

  // final link.VoIP v;
  OverlayEntry? callingPopup;
  Signaling? _signaling;
  String? _selfId;

  WebrtcVoIP(client,delegate) : super(client, delegate);

  initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
    await _connect(globalCtx());
  }

  inviteToCall2(String peerId, bool useScreen){
    if (_signaling != null && peerId != _selfId) {
      _signaling?.invite(peerId, 'video', useScreen);
    }
  }

  Future<void> _connect(BuildContext context) async {
    _signaling ??= Signaling("demo.cloudwebrtc.com", context)..connect();
    _signaling?.onSignalingStateChange = (SignalingState state) {
      switch (state) {
        case SignalingState.ConnectionClosed:
        case SignalingState.ConnectionError:
        case SignalingState.ConnectionOpen:
          break;
      }
    };

    _signaling?.onCallStateChange = (Session session, CallState state) async {
      switch (state) {
        case CallState.CallStateNew:
          break;
        case CallState.CallStateRinging:
          print("收到邀请");
          break;
        case CallState.CallStateBye:
          print('peer reject');
          break;
        case CallState.CallStateInvite:
          print("收到邀请");
          break;
        case CallState.CallStateConnected:
          print("开始");
          break;
        case CallState.CallStateRinging:
      }
    };

    _signaling?.onPeersUpdate = ((event) {
      _selfId = event['self'];
      // _peers = event['peers'];
    });

    _signaling?.onLocalStream = ((stream) {
      _localRenderer.srcObject = stream;
    });

    _signaling?.onAddRemoteStream = ((_, stream) {
      _remoteRenderer.srcObject = stream;

    });

    _signaling?.onRemoveRemoteStream = ((_, stream) {
      _remoteRenderer.srcObject = null;
    });
  }

  @override
  Future<link.CallSession> inviteToCall(String roomId, link.CallType type) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      printDebug('[VOIP] Invalid room id [$roomId].');
      return Null as link.CallSession;
    }
    final callId = 'cid${DateTime.now().millisecondsSinceEpoch}';
    if (currentGroupCID == null) {
      incomingCallRoomId[roomId] = callId;
    }
    final opts = link.CallOptions()
      ..callId = callId
      ..type = type
      ..dir = link.CallDirection.kOutgoing
      ..room = room
      ..voip = this
      ..localPartyId = localPartyId!
      ..iceServers = await getIceSevers();

    final newCall = createNewCall(opts);
    currentCID = callId;
    // await newCall.initOutboundCall(type).then((_) {
    //   delegate.handleNewCall(newCall);
    // });
    currentCID = callId;
    return newCall;
  }


  @override
  Future<void> onCallInvite(
      String roomId, String senderId, Map<String, dynamic> content) async {
    if (senderId == client.userID) {
      // Ignore messages to yourself.
      return;
    }

    printDebug(
        '[VOIP] onCallInvite $senderId => ${client.userID}, \ncontent => ${content.toString()}');

    final String callId = content['call_id'];
    final String partyId = content['party_id'];
    final int lifetime = content['lifetime'];
    final String? confId = content['conf_id'];
    final String? deviceId = content['device_id'];
    final call = calls[callId];

    printDebug(
        '[glare] got new call ${content.tryGet('call_id')} and currently room id is mapped to ${incomingCallRoomId.tryGet(roomId)}');

    if (call != null && call.state == link.CallState.kEnded) {
      // Session already exist.
      printDebug('[VOIP] onCallInvite: Session [$callId] already exist.');
      return;
    }

    if (content['invitee'] != null && content['invitee'] != client.userID) {
      return; // This invite was meant for another user in the room
    }

    if (content['capabilities'] != null) {
      final capabilities = link.CallCapabilities.fromJson(content['capabilities']);
      printDebug(
          '[VOIP] CallCapabilities: dtmf => ${capabilities.dtmf}, transferee => ${capabilities.transferee}');
    }

    var callType = link.CallType.kVoice;
    link.SDPStreamMetadata? sdpStreamMetadata;
    if (content[link.sdpStreamMetadataKey] != null) {
      sdpStreamMetadata =
          link.SDPStreamMetadata.fromJson(content[link.sdpStreamMetadataKey]);
      sdpStreamMetadata.sdpStreamMetadatas
          .forEach((streamId, link.SDPStreamPurpose purpose) {
        printDebug(
            '[VOIP] [$streamId] => purpose: ${purpose.purpose}, audioMuted: ${purpose.audio_muted}, videoMuted:  ${purpose.video_muted}');

        if (!purpose.video_muted) {
          callType = link.CallType.kVideo;
        }
      });
    } else {
      callType = getCallType(content['offer']['sdp']);
    }

    final room = client.getRoomById(roomId);

    final opts = link.CallOptions()
      ..voip = this
      ..callId = callId
      ..groupCallId = confId
      ..dir = link.CallDirection.kIncoming
      ..type = callType
      ..room = room!
      ..localPartyId = localPartyId!
      ..iceServers = await getIceSevers();

    final newCall = createNewCall(opts);
    newCall.remotePartyId = partyId;
    newCall.remoteUser = await room.requestUser(senderId);
    newCall.opponentDeviceId = deviceId;
    newCall.opponentSessionId = content['sender_session_id'];
    if (!delegate.canHandleNewCall &&
        (confId == null || confId != currentGroupCID)) {
      printDebug(
          '[VOIP] onCallInvite: Unable to handle new calls, maybe user is busy.');
      await newCall.reject(reason: link.CallErrorCode.UserBusy, shouldEmit: false);
      await delegate.handleMissedCall(newCall);
      return;
    }

    final offer = webrtc.RTCSessionDescription(
      content['offer']['sdp'],
      content['offer']['type'],
    );

    if (confId == null) {
      await delegate.playRingtone();
    }

    await newCall.initWithInvite(
        callType, offer, sdpStreamMetadata, lifetime, confId != null);

    currentCID = callId;

    // Popup CallingPage for incoming call.
    if (confId == null && !newCall.callHasEnded) {
      await delegate.handleNewCall(newCall);
    }

    onIncomingCall.add(newCall);
  }
}

