import 'dart:async';

import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/infra/pages/webrtc/steam_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/application/store/theme.dart';
import '../../../application/store/app/app.dart';
import '../../../domain/utils/webrtc/action.dart';
import 'img_painter.dart';

class GroupWebRTCalling extends StatefulWidget {
  final VoidCallback? onClear;
  final String callId;
  // final link.GroupCall call;
  // final link.Client client;

  const GroupWebRTCalling({
    // required this.context,
    // required this.call,
    // required this.client,
    required this.callId,
    this.onClear,
    Key? key,
  }) : super(key: key);

  @override
  State<GroupWebRTCalling> createState() => _Calling();
}

class _Calling extends State<GroupWebRTCalling> with TickerProviderStateMixin {
  String? _state;
  late AppCubit im;
  late link.GroupCall gcall;
  late AnimationController _controller;

  // bool get speakerOn => gcall.speakerOn;
  bool get isMicrophoneMuted => gcall.isMicrophoneMuted;
  bool get isLocalVideoMuted => gcall.isLocalVideoMuted;
  bool get isScreensharingEnabled => gcall.screensharingEnabled;
  // bool get isRemoteOnHold => gcall.remoteOnHold;
  bool get voiceonly => gcall.type == link.GroupCallType.Voice;
  bool get connecting => gcall.state == link.GroupCallState.Entering;
  bool get connected => gcall.state == link.GroupCallState.Entered;

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    final voip = im.currentState!.webrtcTool!.voip;
    gcall = voip.groupCalls[widget.callId]!;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initialize() async {
    gcall.onGroupCallFeedsChanged.stream.listen(_handleCallState);
    gcall.onGroupCallEvent.stream.listen((event) {});
    _state = gcall.state;
  }

  void _handleCallState(link.GroupCall session) {
    printDebug('CallingPage::handleCallState: ${session.state}');
    if ({link.GroupCallState.Entered, link.GroupCallState.Ended}.contains(session.state)) {
      try {
        // Vibration.vibrate(duration: 200);
      } catch (e) {
        printDebug('[Dialer] could not vibrate for call updates');
      }
    }

    if (mounted) {
      setState(() {
        _state = session.state;
        if (_state == link.GroupCallState.Ended) cleanUp();
      });
    }
  }

  void cleanUp() {
    Timer(
      const Duration(seconds: 2),
      () => widget.onClear?.call(),
    );
    if (gcall.type == link.CallType.kVideo) {
      try {
        // unawaited(Wakelock.disable());
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    // final callActions = CallAction(call);
    // final actions = callActions.buildActionButtons();
    print("_state_state_state" + (_state ?? ""));
    print(gcall.userMediaStreams);
    link.CallSession? call = gcall.calls.isNotEmpty ? gcall.calls[0] : null;
    final actions = call != null ? CallAction(call, gcall: gcall).buildActionButtons() : [];
    // call.remoteUserMediaStream

    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      body: _state == link.GroupCallState.Entered
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: IconButton(
                        onPressed: () {
                          widget.onClear?.call();
                        },
                        icon: Icon(AppIcons.suoxiao, color: constTheme.sidebarHeaderTextColor, size: 24.w),
                        constraints: BoxConstraints(minWidth: 40.w, maxWidth: 40.w, minHeight: 40.w, maxHeight: 40.w),
                        padding: EdgeInsets.zero,
                        tooltip: L10n.of(context)!.close,
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          hoverColor: constTheme.errorTextColor.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Wrap(runSpacing: 20.w, spacing: 20.w, alignment: WrapAlignment.start, children: [
                    for (var i = 0; i < gcall.userMediaStreams.length; i++)
                      SizedBox(
                        width: 140.w,
                        height: 100.w,
                        child: MStreamView(
                          gcall.userMediaStreams[i],
                          mainView: i == 0,
                          matrixClient: im.currentState!.client!,
                        ),
                      ),
                    //   child: CustomPaint(
                    //     painter: ImgPainter(
                    //       _controller,
                    //       color: constTheme.buttonBg,
                    //     ),
                    //     child: Center(
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(200.0),
                    //         child: Container(
                    //           color: constTheme.centerChannelBg,
                    //           width: 90.w,
                    //           height: 90.w,
                    //           padding: EdgeInsets.all(15.w),
                    //           child: gcall.room.isDirectChat
                    //               ? BaseAvatar(
                    //                   key: Key(gcall.room.directChatMatrixID ?? "-"),
                    //                   gcall.room.directChatMatrixID ?? "-",
                    //                   true,
                    //                   60.w,
                    //                   bg: Colors.transparent,
                    //                   color: constTheme.centerChannelColor,
                    //                 )
                    //               : Container(
                    //                   width: 60.w,
                    //                   height: 60.w,
                    //                   padding: EdgeInsets.only(top: 2.w),
                    //                   child: Center(
                    //                     child: Icon(gcall.room.encrypted ? Icons.private_connectivity : Icons.all_inclusive_sharp,
                    //                         size: 45.w, color: constTheme.centerChannelColor),
                    //                   ),
                    //                 ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: constTheme.centerChannelColor.withOpacity(0.08), width: 1.w)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < actions.length; i++)
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: actions[i].backgroundColor),
                          margin: EdgeInsets.only(right: i != actions.length - 1 ? 15.w : 0),
                          child: IconButton(
                            padding: EdgeInsets.all(8.w),
                            iconSize: 22.w,
                            icon: actions[i].child,
                            color: Colors.white,
                            onPressed: () async {
                              actions[i].onPressed();
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                // Column(
                //   children: [
                //     Container(
                //       decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                //       margin: EdgeInsets.only(bottom: 15.w),
                //       child: IconButton(
                //         padding: EdgeInsets.all(18.w),
                //         icon: Icon(Icons.close, size: 30.w),
                //         color: Colors.white,
                //         onPressed: () async {
                //           gcall.terminate();
                //         },
                //       ),
                //     ),
                //     Text(
                //       "terminate",
                //       style: TextStyle(
                //         fontSize: 15.w,
                //         color: constTheme.centerChannelColor,
                //         fontWeight: FontWeight.w300,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            )
          : renderLoading(),
    );
  }

  renderLoading() {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: IconButton(
                onPressed: () {
                  widget.onClear?.call();
                },
                icon: Icon(AppIcons.suoxiao, color: constTheme.sidebarHeaderTextColor, size: 24.w),
                constraints: BoxConstraints(minWidth: 40.w, maxWidth: 40.w, minHeight: 40.w, maxHeight: 40.w),
                padding: EdgeInsets.zero,
                tooltip: L10n.of(context)!.close,
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  hoverColor: constTheme.errorTextColor.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        CustomPaint(
          painter: ImgPainter(
            _controller,
            color: constTheme.buttonBg,
          ),
          child: SizedBox(
            width: 140.w,
            height: 100.w,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Container(
                  color: constTheme.centerChannelBg,
                  width: 90.w,
                  height: 90.w,
                  padding: EdgeInsets.all(15.w),
                  child: gcall.room.isDirectChat
                      ? BaseAvatar(
                          key: Key(gcall.room.directChatMatrixID ?? "-"),
                          gcall.room.directChatMatrixID ?? "-",
                          true,
                          60.w,
                          bg: Colors.transparent,
                          color: constTheme.centerChannelColor,
                        )
                      : Container(
                          width: 60.w,
                          height: 60.w,
                          padding: EdgeInsets.only(top: 2.w),
                          child: Center(
                            child: Icon(gcall.room.encrypted ? Icons.private_connectivity : Icons.all_inclusive_sharp,
                                size: 45.w, color: constTheme.centerChannelColor),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70.w,
        ),
        Text(
          "会议号",
          style: TextStyle(
            fontSize: 20.w,
            color: constTheme.centerChannelColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 10.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.w),
          child: Text(
            gcall.groupCallId,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.w,
              color: constTheme.centerChannelColor,
            ),
          ),
        ),
        SizedBox(height: 75.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                  margin: EdgeInsets.only(bottom: 15.w),
                  child: IconButton(
                    padding: EdgeInsets.all(18.w),
                    icon: Icon(AppIcons.jinrudaobo, size: 30.w),
                    color: Colors.white,
                    onPressed: () async {
                      final stream = await gcall.initLocalStream();
                      gcall.enter(stream: stream);
                    },
                  ),
                ),
                Text(
                  "join",
                  style: TextStyle(
                    fontSize: 13.w,
                    color: constTheme.centerChannelColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(width: 30.w),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
                  margin: EdgeInsets.only(bottom: 15.w),
                  child: IconButton(
                    padding: EdgeInsets.all(18.w),
                    icon: Icon(Icons.remove, size: 30.w),
                    color: Colors.black,
                    onPressed: () async {
                      widget.onClear?.call();
                    },
                  ),
                ),
                Text(
                  "ignore",
                  style: TextStyle(
                    fontSize: 15.w,
                    color: constTheme.centerChannelColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(width: 30.w),
            // if(call)
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  margin: EdgeInsets.only(bottom: 15.w),
                  child: IconButton(
                    padding: EdgeInsets.all(18.w),
                    icon: Icon(Icons.close, size: 30.w),
                    color: Colors.white,
                    onPressed: () async {
                      gcall.terminate();
                    },
                  ),
                ),
                Text(
                  "terminate",
                  style: TextStyle(
                    fontSize: 15.w,
                    color: constTheme.centerChannelColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
  // render
}
