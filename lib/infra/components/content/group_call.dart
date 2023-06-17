import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/localized_extension.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:matrix/matrix.dart';

import 'package:dtim/infra/components/iconfont.dart';
import 'package:dtim/infra/components/loading_dialog.dart';
import 'package:dtim/router.dart';
import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/application/store/theme.dart';

class GroupCallContent extends StatelessWidget {
  final Event event;
  final Color textColor;

  const GroupCallContent(this.event, this.textColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final im = context.read<AppCubit>();
    final voip = im.currentState!.webrtcTool!.voip;
    var state = "started";
    if (event.content["m.terminated"] != null) {
      if (event.content["m.terminated"] == "call_ended") {
        state = "ended";
      }
    }
    return InkWell(
      // onTap: () => event.saveFile(context),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "消息内容",
              style: TextStyle(fontSize: 18.w),
            ),
            content: Text(
              event.toJson().toString(),
              style: TextStyle(color: constTheme.centerChannelColor),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("确定"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
      },
      child: Container(
        width: 250.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: constTheme.centerChannelColor.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: Row(
                children: [
                  Icon(AppIcons.icon_meeting, color: textColor.withOpacity(0.6), size: 35.w),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      "Meeting ${event.stateKey} is $state",
                      style: TextStyle(color: textColor, fontSize: 13.w),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1.w, color: constTheme.centerChannelColor.withOpacity(0.1)),
            Padding(
              padding: EdgeInsets.only(top: 8.w),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    "Meeting is $state",
                    style: TextStyle(color: textColor, fontSize: 13.w),
                  ),
                  SizedBox(width: 10.w),
                  if (voip.groupCalls[event.stateKey] != null)
                    ElevatedButton.icon(
                      onPressed: () async {
                        printDebug(voip.groupCalls.toString());
                        final success = await waitFutureLoading(
                          context: context,
                          future: () => voip.requestTurnServerCredentials(),
                        );
                        if (success.result == null) {
                          BotToast.showText(text: "获取 turn 服务器失败");
                        }
                        try {
                          await voip.createGroupCallFromRoomStateEvent(event);
                        } catch (e) {
                          BotToast.showText(text: e.toLocalizedString(globalCtx()));
                        }
                      },
                      icon: Icon(AppIcons.jinrudaobo, color: textColor, size: 16.w),
                      label: Text("Join", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.w)),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: textColor,
                        backgroundColor: constTheme.centerChannelColor.withOpacity(0.08),
                        surfaceTintColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.w)),
                          side: BorderSide.none,
                        ),
                        elevation: 0,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
