import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

class RoomEvent extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool? wrap;

  const RoomEvent({super.key, required this.text, this.icon, this.wrap});

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        wrap != null && wrap!
            ? Container(
                transform: Matrix4.translationValues(-1.w, 0, 0),
                width: 20.w,
                height: 20.w,
                padding: EdgeInsets.all(4.w),
                margin: EdgeInsets.symmetric(vertical: 4.w),
                decoration: BoxDecoration(
                  color: constTheme.centerChannelColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Icon(icon ?? Icons.task_rounded, color: constTheme.centerChannelColor, size: 12.w),
              )
            : Container(
                transform: Matrix4.translationValues(-1.w, 0, 0),
                padding: EdgeInsets.symmetric(vertical: 2.w),
                margin: EdgeInsets.symmetric(vertical: 2.w),
                child: Icon(icon ?? Icons.task_rounded, color: constTheme.centerChannelColor, size: 19.w),
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
