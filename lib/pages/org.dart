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
    return Scaffold(
      backgroundColor: ConstTheme.sidebarBg,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: double.maxFinite,
            width: leftWidth,
            color: ConstTheme.sidebarBg,
            child: OrgViewPage(key: const Key("OrgViewPage"), onChannel: setChannelId),
          ),
          GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeColumn,
              child: SizedBox(
                width: 1.w,
                height: double.infinity,
                child: Container(color: ConstTheme.sidebarText.withOpacity(0.08)),
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
                      color: ConstTheme.centerChannelBg,
                      child: Center(
                        child: Text(
                          "Join DAO and run any app in web3",
                          style: TextStyle(color: ConstTheme.centerChannelColor, fontSize: 18.w),
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
