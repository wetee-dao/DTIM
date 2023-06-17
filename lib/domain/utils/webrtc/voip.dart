import 'dart:async';

import 'package:dtim/domain/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

import 'call.dart';

class WebrtcVoIP extends link.VoIP {
  OverlayEntry? callingPopup;

  WebrtcVoIP(client, delegate) : super(client, delegate);

  @override
  Future<WebrtcCallSession> inviteToCall(String roomId, link.CallType type) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      printDebug('[VOIP] Invalid room id [$roomId].');
      return Null as WebrtcCallSession;
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
    await newCall.initOutboundCall(type).then((_) {
      delegate.handleNewCall(newCall);
    });
    currentCID = callId;
    return newCall;
  }

  @override
  WebrtcCallSession createNewCall(link.CallOptions opts) {
    final call = WebrtcCallSession(opts);
    calls[opts.callId] = call;
    return call;
  }
}
