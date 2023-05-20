import 'dart:async';
import 'dart:math';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';

class WebrtcCallSession extends CallSession {
  WebrtcCallSession(super.opts);

  @override
  Future<void> initOutboundCall(CallType type) async {
    await _preparePeerConnection();
    setCallState(CallState.kCreateOffer);
    final stream = await _getUserMedia(type);
    if (stream != null) {
      await addLocalStream(stream, SDPStreamMetadataPurpose.Usermedia);
    }
  }

  Future<void> _preparePeerConnection() async {
    try {
      pc = await _createPeerConnection();
      pc!.onRenegotiationNeeded = onNegotiationNeeded;

      pc!.onIceCandidate = (RTCIceCandidate candidate) async {
        if (callHasEnded) return;
        //Logs().v('[VOIP] onIceCandidate => ${candidate.toMap().toString()}');
        localCandidates.add(candidate);

        if (state == CallState.kRinging || !inviteOrAnswerSent) return;

        // MSC2746 recommends these values (can be quite long when calling because the
        // callee will need a while to answer the call)
        final delay = direction == CallDirection.kIncoming ? 500 : 2000;
        if (candidateSendTries == 0) {
          Timer(Duration(milliseconds: delay), () {
            _sendCandidateQueue();
          });
        }
      };

      pc!.onIceGatheringState = (RTCIceGatheringState state) async {
        Logs().v('[VOIP] IceGatheringState => ${state.toString()}');
        if (state == RTCIceGatheringState.RTCIceGatheringStateGathering) {
          Timer(Duration(seconds: 3), () async {
            if (!iceGatheringFinished) {
              iceGatheringFinished = true;
              await _sendCandidateQueue();
            }
          });
        }
        if (state == RTCIceGatheringState.RTCIceGatheringStateComplete) {
          if (!iceGatheringFinished) {
            iceGatheringFinished = true;
            await _sendCandidateQueue();
          }
        }
      };
      pc!.onIceConnectionState = (RTCIceConnectionState state) async {
        Logs().v('[VOIP] RTCIceConnectionState => ${state.toString()}');
        if (state == RTCIceConnectionState.RTCIceConnectionStateConnected) {
          localCandidates.clear();
          remoteCandidates.clear();
          setCallState(CallState.kConnected);
          // fix any state/race issues we had with sdp packets and cloned streams
          await updateMuteStatus();
          missedCall = false;
        } else if (state == RTCIceConnectionState.RTCIceConnectionStateFailed) {
          await hangup(CallErrorCode.IceFailed, false);
        }
      };
    } catch (e) {
      Logs().v('[VOIP] prepareMediaStream error => ${e.toString()}');
    }
  }

  Future<RTCPeerConnection> _createPeerConnection() async {
    final configuration = <String, dynamic>{'iceServers': opts.iceServers, 'sdpSemantics': 'unified-plan'};
    final pc = await voip.delegate.createPeerConnection(configuration);
    pc.onTrack = (RTCTrackEvent event) async {
      if (event.streams.isNotEmpty) {
        final stream = event.streams[0];
        await _addRemoteStream(stream);
        for (final track in stream.getTracks()) {
          track.onEnded = () async {
            if (stream.getTracks().isEmpty) {
              Logs().d('[VOIP] detected a empty stream, removing it');
              await _removeStream(stream);
            }
          };
        }
      }
    };

    return pc;
  }

  Future<MediaStream?> _getUserMedia(CallType type) async {
    final mediaConstraints = {
      'audio': true,
      'video': type == CallType.kVideo
          ? {
              'mandatory': {
                'minWidth': '640',
                'minHeight': '480',
                'minFrameRate': '30',
              },
              'facingMode': 'user',
              'optional': [],
            }
          : false,
    };
    try {
      return await voip.delegate.mediaDevices.getUserMedia(mediaConstraints);
    } catch (e) {
      _getUserMediaFailed(e);
    }
    return null;
  }

  void _getUserMediaFailed(dynamic err) {
    if (state != CallState.kConnected) {
      Logs().w('Failed to get user media - ending call ${err.toString()}');
      fireCallEvent(CallEvent.kError);
      lastError = CallError(CallErrorCode.NoUserMedia,
          'Couldn\'t start capturing media! Is your microphone set up and does this app have permission?', err);
      terminate(CallParty.kLocal, CallErrorCode.NoUserMedia, false);
    }
  }

  Future<void> _sendCandidateQueue() async {
    if (callHasEnded) return;
    /*
    Currently, trickle-ice is not supported, so it will take a
    long time to wait to collect all the canidates, set the
    timeout for collection canidates to speed up the connection.
    */
    final candidatesQueue = localCandidates;
    try {
      if (candidatesQueue.isNotEmpty) {
        final candidates = <Map<String, dynamic>>[];
        candidatesQueue.forEach((element) {
          candidates.add(element.toMap());
        });
        localCandidates = [];
        final res = await sendCallCandidates(opts.room, callId, localPartyId, candidates);
        Logs().v('[VOIP] sendCallCandidates res => $res');
      }
    } catch (e) {
      Logs().v('[VOIP] sendCallCandidates e => ${e.toString()}');
      candidateSendTries++;
      localCandidates = candidatesQueue;

      if (candidateSendTries > 5) {
        Logs().d('Failed to send candidates on attempt $candidateSendTries Giving up on this call.');
        lastError = CallError(CallErrorCode.SignallingFailed, 'Signalling failed', e);
        await hangup(CallErrorCode.SignallingFailed, true);
        return;
      }

      final delay = 500 * pow(2, candidateSendTries);
      Timer(Duration(milliseconds: delay as int), () {
        _sendCandidateQueue();
      });
    }
  }

  Future<void> _addRemoteStream(MediaStream stream) async {
    //final userId = remoteUser.id;
    final metadata = remoteSDPStreamMetadata!.sdpStreamMetadatas[stream.id];
    if (metadata == null) {
      Logs().i('Ignoring stream with id ${stream.id} because we didn\'t get any metadata about it');
      return;
    }

    final purpose = metadata.purpose;
    final audioMuted = metadata.audio_muted;
    final videoMuted = metadata.video_muted;

    // Try to find a feed with the same purpose as the new stream,
    // if we find it replace the old stream with the new one
    final existingStream = getRemoteStreams.where((element) => element.purpose == purpose);
    if (existingStream.isNotEmpty) {
      existingStream.first.setNewStream(stream);
    } else {
      final newStream = WrappedMediaStream(
        renderer: voip.delegate.createRenderer(),
        userId: remoteUser!.id,
        room: opts.room,
        stream: stream,
        purpose: purpose,
        client: client,
        audioMuted: audioMuted,
        videoMuted: videoMuted,
        isWeb: voip.delegate.isWeb,
        isGroupCall: groupCallId != null,
        pc: pc,
      );
      await newStream.initialize();
      streams.add(newStream);
      onStreamAdd.add(newStream);
    }
    fireCallEvent(CallEvent.kFeedsChanged);
    Logs().i('Pushed remote stream (id="${stream.id}", purpose=$purpose)');
  }

  Future<void> _removeStream(MediaStream stream) async {
    Logs().v('Removing feed with stream id ${stream.id}');

    final it = streams.where((element) => element.stream!.id == stream.id);
    if (it.isEmpty) {
      Logs().v('Didn\'t find the feed with stream id ${stream.id} to delete');
      return;
    }
    final wpstream = it.first;
    streams.removeWhere((element) => element.stream!.id == stream.id);
    onStreamRemoved.add(wpstream);
    fireCallEvent(CallEvent.kFeedsChanged);
    await wpstream.dispose();
  }

  @override
  Future<void> addLocalStream(MediaStream stream, String purpose, {bool addToPeerConnection = true}) async {
    final existingStream = getLocalStreams.where((element) => element.purpose == purpose);
    if (existingStream.isNotEmpty) {
      existingStream.first.setNewStream(stream);
    } else {
      final newStream = WrappedMediaStream(
        renderer: voip.delegate.createRenderer(),
        userId: client.userID!,
        room: opts.room,
        stream: stream,
        purpose: purpose,
        client: client,
        audioMuted: stream.getAudioTracks().isEmpty,
        videoMuted: stream.getVideoTracks().isEmpty,
        isWeb: voip.delegate.isWeb,
        isGroupCall: groupCallId != null,
        pc: pc,
      );
      await newStream.initialize();
      streams.add(newStream);
      onStreamAdd.add(newStream);
    }
    if (addToPeerConnection) {
      if (purpose == SDPStreamMetadataPurpose.Screenshare) {
        screensharingSenders.clear();
        for (final track in stream.getTracks()) {
          screensharingSenders.add(await pc!.addTrack(track, stream));
        }
      } else if (purpose == SDPStreamMetadataPurpose.Usermedia) {
        usermediaSenders.clear();
        for (final track in stream.getTracks()) {
          usermediaSenders.add(await pc!.addTrack(track, stream));
        }
      }
    }
    // if (purpose == SDPStreamMetadataPurpose.Usermedia) {
    //   speakerOn = type == CallType.kVideo;
    //   if (!voip.delegate.isWeb && stream.getAudioTracks().isNotEmpty) {
    //     final audioTrack = stream.getAudioTracks()[0];
    //     audioTrack.enableSpeakerphone(speakerOn);
    //   }
    // }
    print("addLocalStream5");
    fireCallEvent(CallEvent.kFeedsChanged);
  }
}
