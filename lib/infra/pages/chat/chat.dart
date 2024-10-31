import 'package:auto_route/auto_route.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/infra/components/close_bar.dart';
import 'package:dtim/infra/pages/webrtc/group_calling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dtim/application/store/app/org.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/infra/components/components.dart';
import 'package:dtim/application/store/theme.dart';
import 'channel/chat.dart';
import 'chat_view.dart';

@RoutePage(name: "orgRoute")
class OrgPage extends StatefulWidget {
  const OrgPage({super.key});

  @override
  State<OrgPage> createState() => _OrgPageState();
}

class _OrgPageState extends State<OrgPage> {
  double leftWidth = 200.w;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: double.maxFinite,
            width: leftWidth,
            decoration: BoxDecoration(
              color: constTheme.centerChannelBg,
              borderRadius: BorderRadius.circular(10.w)
            ),
            margin: EdgeInsets.only(left: 3.w),
            child: OrgViewPage(key: const Key("OrgViewPage"), width: leftWidth),
          ),
          GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeColumn,
              child: Row(
                children: [
                  Container(
                    color: Colors.transparent,
                    width: 4.w,
                    height: double.infinity,
                  ),
                  const SizedBox(width: 1, height: double.infinity),
                ],
              ),
            ),
            onPanUpdate: (details) {
              setState(() {
                if (leftWidth + details.delta.dx < 180.w || leftWidth + details.delta.dx > 350.w) {
                  return;
                }
                leftWidth = leftWidth + details.delta.dx;
              });
            },
          ),
          Flexible(
            child: BlocBuilder<OrgCubit, OrgState>(
              builder: (context, state) {
                printSuccess("channelId => ${state.channelId}");
                if (state.channelId.contains("meeting||")) {
                  return GroupWebRTCalling(callId: state.channelId.replaceAll("meeting||", ""));
                }
                return state.channelId != ""
                    ? ChannelDetailPage(
                        key: Key("channel_$state.channelId"),
                        channerlID: state.channelId,
                      )
                    : moveWindow(
                        Container(
                          color: constTheme.centerChannelBg,
                          padding: EdgeInsets.only(bottom: 100.h),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.w, right: 7.w),
                                child: CloseBar(color: constTheme.centerChannelColor),
                              ),
                              const Spacer(),
                              Text(
                                "Work in web3 with DTIM",
                                style: TextStyle(color: constTheme.centerChannelColor, fontSize: 18.w),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
