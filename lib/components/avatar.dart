import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import '../store/theme.dart';
import '../utils/screen.dart';
import 'mxc_image.dart';
import 'user_avatar.dart';

class Avatar extends StatelessWidget {
  final Uri? mxContent;
  final String? name;
  final String id;
  final double size;
  final void Function()? onTap;
  static const double defaultSize = 44;
  final Client? client;
  final double fontSize;

  const Avatar({
    required this.id,
    this.mxContent,
    this.name,
    this.size = defaultSize,
    this.onTap,
    this.client,
    this.fontSize = 18,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    var fallbackLetters = '@';
    final name = this.name;
    if (name != null) {
      if (name.runes.length >= 2) {
        fallbackLetters = String.fromCharCodes(name.runes, 0, 2);
      } else if (name.runes.length == 1) {
        fallbackLetters = name;
      }
    }
    final noPic = mxContent == null || mxContent.toString().isEmpty || mxContent.toString() == 'null';
    final textWidget = Center(
      child: Text(
        fallbackLetters,
        style: TextStyle(
          color: noPic ? Colors.white : null,
          fontSize: fontSize,
        ),
      ),
    );

    Widget container;

    if (!noPic) {
      container = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: constTheme.centerChannelColor.withOpacity(0.1),
        ),
        padding: EdgeInsets.all(5.w),
        alignment: Alignment.topLeft,
        child: MxcImage(
          key: Key(mxContent.toString()),
          uri: mxContent,
          fit: BoxFit.cover,
          width: size,
          height: size,
          placeholder: (_) => textWidget,
          cacheKey: mxContent.toString(),
        ),
      );
    } else {
      container = id == ""
          ? ClipRRect(
              borderRadius: BorderRadius.circular(5.w),
              child: Container(
                width: size,
                height: size,
                color: constTheme.centerChannelColor.withOpacity(0.1),
                child: textWidget,
              ),
            )
          : UserAvatar(
              id,
              true,
              size,
              color: constTheme.centerChannelColor,
            );
    }

    if (onTap == null) return container;
    return InkWell(
      onTap: onTap,
      child: container,
    );
  }
}
