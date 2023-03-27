import 'package:asyou_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import '../store/theme.dart';
import '../utils/screen.dart';

// ignore: non_constant_identifier_names
WidgetUserNameEmoji(String name, String? emoji) {
  final parser = EmojiParser();
  final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;

  return RichText(
    text: TextSpan(
      text: name,
      style: TextStyle(
        color: constTheme.sidebarText.withAlpha(180),
        fontWeight: FontWeight.normal,
        fontSize: 15.w,
        overflow: TextOverflow.ellipsis,
      ),
      children: [
        (emoji != null)
            ? WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(10.0, -5.0),
                  child: Text(
                    parser.emojify(emoji).toString(),
                    style: TextStyle(fontSize: 15.w),
                  ),
                ),
              )
            : const TextSpan(text: ''),
      ],
    ),
  );
}
