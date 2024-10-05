import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
// ignore: implementation_imports
import 'package:matrix/src/voip/models/call_options.dart';
// ignore: implementation_imports
import 'package:matrix/src/voip/models/voip_id.dart';

import 'call.dart';

class WebrtcVoIP extends VoIP {
  OverlayEntry? callingPopup;

  WebrtcVoIP(super.client, super.delegate)
      : super(
          enableSFUE2EEKeyRatcheting: false,
        );

  @override
  Future<CallSession> inviteToCall(
    Room room,
    CallType type, {
    String? userId,
    String? deviceId,
  }) async {
    final roomId = room.id;
    final callId = 'cid${DateTime.now().millisecondsSinceEpoch}';
    if (currentGroupCID == null) {
      incomingCallRoomId[roomId] = callId;
    }
    final opts = CallOptions(
      callId: callId,
      type: type,
      dir: CallDirection.kOutgoing,
      room: room,
      voip: this,
      localPartyId: localPartyId,
      iceServers: await getIceServers(),
    );
    final newCall = createNewCall(opts);

    newCall.remoteUserId = userId;
    newCall.remoteDeviceId = deviceId;

    currentCID = VoipId(roomId: roomId, callId: callId);
    await newCall.initOutboundCall(type).then((_) {
      delegate.handleNewCall(newCall);
    });
    return newCall;
  }

  @override
  WebrtcCallSession createNewCall(CallOptions opts) {
    final call = WebrtcCallSession(opts);
    calls[VoipId(roomId: opts.room.id, callId: opts.callId)] = call;
    return call;
  }
}
