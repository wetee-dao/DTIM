import 'dart:async';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';

class WebrtcCallSession extends CallSession {
  WebrtcCallSession(super.opts);

  // @override
  // Future<void> addLocalStream(MediaStream stream, String purpose, {bool addToPeerConnection = true}) async {
  //   final existingStream = getLocalStreams.where((element) => element.purpose == purpose);
  //   if (existingStream.isNotEmpty) {
  //     existingStream.first.setNewStream(stream);
  //   } else {
  //     final newStream = WrappedMediaStream(
  //       participant: localParticipant!,
  //       room: opts.room,
  //       stream: stream,
  //       purpose: purpose,
  //       client: client,
  //       audioMuted: stream.getAudioTracks().isEmpty,
  //       videoMuted: stream.getVideoTracks().isEmpty,
  //       isGroupCall: groupCallId != null,
  //       pc: pc,
  //       voip: voip,
  //     );
  //     _streams.add(newStream);
  //     onStreamAdd.add(newStream);
  //   }
  //   if (addToPeerConnection) {
  //     if (purpose == SDPStreamMetadataPurpose.Screenshare) {
  //       screensharingSenders.clear();
  //       for (final track in stream.getTracks()) {
  //         screensharingSenders.add(await pc!.addTrack(track, stream));
  //       }
  //     } else if (purpose == SDPStreamMetadataPurpose.Usermedia) {
  //       usermediaSenders.clear();
  //       for (final track in stream.getTracks()) {
  //         usermediaSenders.add(await pc!.addTrack(track, stream));
  //       }
  //     }
  //   }
  //   // if (purpose == SDPStreamMetadataPurpose.Usermedia) {
  //   //   speakerOn = type == CallType.kVideo;
  //   //   if (!voip.delegate.isWeb && stream.getAudioTracks().isNotEmpty) {
  //   //     final audioTrack = stream.getAudioTracks()[0];
  //   //     audioTrack.enableSpeakerphone(speakerOn);
  //   //   }
  //   // }
  //   fireCallEvent(CallEvent.kFeedsChanged);
  // }
}
