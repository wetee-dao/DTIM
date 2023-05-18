// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:asyou_app/utils/screen/screen.dart';
import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import '../../../store/theme.dart';
import '../../../utils/matrix_sdk_extensions/event_extension.dart';

class MessageDownloadContent extends StatelessWidget {
  final Event event;
  final Color textColor;

  const MessageDownloadContent(this.event, this.textColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final filename = event.content.tryGet<String>('filename') ?? event.body;
    final filetype = (filename.contains('.')
        ? filename.split('.').last.toUpperCase()
        : event.content.tryGetMap<String, dynamic>('info')?.tryGet<String>('mimetype')?.toUpperCase() ?? 'UNKNOWN');
    final sizeString = event.sizeString;
    return InkWell(
      onTap: () => event.saveFile(context),
      child: Container(
        width: 250.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                  Icon(
                    Icons.file_download_outlined,
                    color: textColor,
                    size: 28.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    filename,
                    maxLines: 1,
                    style: TextStyle(color: textColor,fontSize: 16.w),
                  ),
                ],
              ),
            ),
            Divider(height: 1.w, color: constTheme.centerChannelColor.withOpacity(0.4)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8.w),
              child: Row(
                children: [
                  Text(
                    filetype,
                    style: TextStyle(
                      fontSize: 14.w,
                      color: textColor.withAlpha(150),
                    ),
                  ),
                  const Spacer(),
                  if (sizeString != null)
                    Text(
                      sizeString,
                      style: TextStyle(
                        fontSize: 14.w,
                        color: textColor.withAlpha(150),
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
