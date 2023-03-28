import 'package:flutter/material.dart';

import '../utils/screen.dart';
import '../components/components.dart';
import '../store/theme.dart';
import 'channel/chat.dart';
import 'org_view.dart';

class OrgPage extends StatefulWidget {
  const OrgPage({Key? key}) : super(key: key);

  @override
  State<OrgPage> createState() => _OrgPageState();
}

class _OrgPageState extends State<OrgPage> {
  String channelId = "";
  double leftWidth = 200.w;

  setChannelId(id) {
    if (id == channelId) {
      return;
    }
    setState(() {
      channelId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: double.maxFinite,
            width: leftWidth,
            color: constTheme.sidebarBg,
            child: OrgViewPage(key: const Key("OrgViewPage"), onChannel: setChannelId),
          ),
          GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeColumn,
              child: Row(
                children: [
                  Container(
                    color: constTheme.centerChannelColor.withOpacity(0.08),
                    // color: Colors.red,
                    width: 1.w,
                    height: double.infinity,
                  ),
                  SizedBox(width: 1.w, height: double.infinity),
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
            child: channelId != ""
                ? ChannelDetailPage(
                    key: Key("channel_$channelId"),
                    channerlID: channelId,
                  )
                : moveWindow(
                    Container(
                      color: constTheme.centerChannelBg,
                      child: Center(
                        child: Text(
                          "Join DAO and run any app in web3",
                          style: TextStyle(color: constTheme.centerChannelColor, fontSize: 18.w),
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
