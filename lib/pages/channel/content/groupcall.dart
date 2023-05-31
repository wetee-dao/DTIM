import 'package:asyou_app/utils/functions.dart';
import 'package:asyou_app/utils/localized_extension.dart';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:matrix/matrix.dart';

import '../../../components/iconfont.dart';
import '../../../components/loading_dialog.dart';
import '../../../router.dart';
import '../../../store/app/app.dart';
import '../../../store/theme.dart';

class GroupCallContent extends StatelessWidget {
  final Event event;
  final Color textColor;

  const GroupCallContent(this.event, this.textColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final im = context.read<AppCubit>();
    final voip = im.currentState!.webrtcTool!.voip;
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
                  Icon(AppIcons.icon_meeting, color: textColor, size: 28.w),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      "Create a new meeting",
                      style: TextStyle(color: textColor, fontSize: 16.w),
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
                      icon: Icon(Icons.add_circle_rounded, color: textColor, size: 16.w),
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
                  if (voip.groupCalls[event.stateKey] == null)
                    Text(
                      "Meeting is end",
                      style: TextStyle(color: textColor, fontSize: 14.w),
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
