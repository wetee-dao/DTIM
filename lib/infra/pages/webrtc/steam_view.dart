import 'package:dtim/infra/components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';

class MStreamView extends StatelessWidget {
  const MStreamView(
    this.wrappedStream, {
    Key? key,
    this.mainView = false,
    required this.matrixClient,
  }) : super(key: key);

  final WrappedMediaStream wrappedStream;
  final Client matrixClient;

  final bool mainView;

  Uri? get avatarUrl => wrappedStream.getUser().avatarUrl;

  String? get displayName => wrappedStream.displayName;

  String get avatarName => wrappedStream.avatarName;

  bool get isLocal => wrappedStream.isLocal();

  bool get mirrored => wrappedStream.isLocal() && wrappedStream.purpose == SDPStreamMetadataPurpose.Usermedia;

  bool get audioMuted => wrappedStream.audioMuted;

  bool get videoMuted => wrappedStream.videoMuted;

  bool get isScreenSharing => wrappedStream.purpose == SDPStreamMetadataPurpose.Screenshare;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          if (videoMuted)
            Container(
              color: Colors.transparent,
            ),
          if (!videoMuted)
            RTCVideoView(
              // yes, it must explicitly be casted even though I do not feel
              // comfortable with it...
              wrappedStream.renderer as RTCVideoRenderer,
              mirror: mirrored,
              objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
            ),
          if (videoMuted)
            Positioned(
              child: Avatar(
                id: '',
                mxContent: avatarUrl,
                name: displayName,
                size: mainView ? 96 : 48,
                client: matrixClient, 
                // textSize: mainView ? 36 : 24,
                // matrixClient: matrixClient,
              ),
            ),
          if (!isScreenSharing)
            Positioned(
              left: 4.0,
              bottom: 4.0,
              child: Icon(
                audioMuted ? Icons.mic_off : Icons.mic,
                color: Colors.white,
                size: 18.0,
              ),
            )
        ],
      ),
    );
  }
}
