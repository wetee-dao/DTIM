import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

class RoomEvent extends StatelessWidget {
  final String text;

  const RoomEvent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          transform: Matrix4.translationValues(-2.w, 0, 0),
          child: Icon(Icons.task_rounded, color: constTheme.centerChannelColor, size: 19.w),
        ),
        SizedBox(width: 2.w),
        SelectableText(
          text,
          style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor.withAlpha(200)),
        )
      ],
    );
  }
}
