import 'package:flutter/material.dart';

import 'package:asyou_app/application/store/theme.dart';

class PriorityIcon extends StatelessWidget {
  final double size;
  final int priority;

  const PriorityIcon({
    Key? key,
    this.size = 2,
    required this.priority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    if (priority == 0) {
      return Icon(Icons.more_horiz_rounded, size: size * 7, color: constTheme.centerChannelColor);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: size,
          height: size * 2,
          margin: EdgeInsets.only(right: size),
          color: constTheme.centerChannelColor.withOpacity(priority > 0 ? 1 : 0.3),
        ),
        Container(
          width: size,
          height: size * 3,
          margin: EdgeInsets.only(right: size),
          color: constTheme.centerChannelColor.withOpacity(priority > 1 ? 1 : 0.3),
        ),
        Container(
          width: size,
          height: size * 4,
          margin: EdgeInsets.only(right: size),
          color: constTheme.centerChannelColor.withOpacity(priority > 2 ? 1 : 0.3),
        ),
        Container(
          width: size,
          height: size * 5,
          color: constTheme.centerChannelColor.withOpacity(priority > 3 ? 1 : 0.3),
        ),
      ],
    );
  }
}

Map<int, String> prioritys = {
  0: "No Priority",
  1: "Low Priority",
  2: "Medium Priority",
  3: "High Priority",
  4: "Urgent",
};
