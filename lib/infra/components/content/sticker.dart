// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:auto_route/auto_route.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/infra/components/iconfont.dart';
import 'package:dtim/router.dart';
import 'package:flutter/material.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'image_bubble.dart';

class Sticker extends StatefulWidget {
  final Event event;

  const Sticker(this.event, {Key? key}) : super(key: key);

  @override
  StickerState createState() => StickerState();
}

class StickerState extends State<Sticker> {
  bool? animated;

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    // return ImageBubble(
    //   widget.event,
    //   fit: BoxFit.contain,
    //   onTap: () {
    //     setState(() => animated = true);
    //     showOkAlertDialog(
    //       context: context,
    //       message: widget.event.body,
    //       okLabel: L10n.of(context)!.ok,
    //     );
    //   },
    //   animated: animated ?? true,
    // );

    return InkWell(
      onTap: () async {
        setState(() => animated = true);
        showOkAlertDialog(
          context: context,
          message: widget.event.body,
          okLabel: L10n.of(context)!.ok,
        );
      },
      child: Container(
        width: 250.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(color: constTheme.centerChannelColor.withOpacity(0.1)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: constTheme.centerChannelColor.withOpacity(0.01),
              blurRadius: 8.w,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: constTheme.centerChannelColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    padding: EdgeInsets.all(10.w),
                    child: Icon(Icons.how_to_vote_rounded, color: constTheme.centerChannelColor, size: 20.w),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      widget.event.body,
                      style: TextStyle(color: constTheme.centerChannelColor, fontSize: 13.w),
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
                  ElevatedButton.icon(
                    onPressed: () async {
                      globalCtx().router.root.pushNamed("/app/gov");
                    },
                    icon: Icon(AppIcons.jinrudaobo, color: constTheme.centerChannelColor, size: 16.w),
                    label: Text("Vote", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.w)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: constTheme.centerChannelColor,
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
                  SizedBox(width: 10.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
