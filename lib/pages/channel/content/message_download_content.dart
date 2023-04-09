import 'package:asyou_app/utils/screen.dart';
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
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: constTheme.centerChannelColor.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.file_download_outlined,
                    color: textColor,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    filename,
                    maxLines: 1,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    filetype,
                    style: TextStyle(
                      color: textColor.withAlpha(150),
                    ),
                  ),
                  const Spacer(),
                  if (sizeString != null)
                    Text(
                      sizeString,
                      style: TextStyle(
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
