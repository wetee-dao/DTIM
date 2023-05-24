import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

class HtmlMessage extends StatelessWidget {
  final String html;
  final int? maxLines;
  final Room room;
  final TextStyle? defaultTextStyle;
  final TextStyle? linkStyle;
  final double? emoteSize;

  const HtmlMessage({
    Key? key,
    required this.html,
    this.maxLines,
    required this.room,
    this.defaultTextStyle,
    this.linkStyle,
    this.emoteSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final renderHtml = html.replaceAll(
    //   RegExp(
    //     '<mx-reply>.*</mx-reply>',
    //     caseSensitive: false,
    //     multiLine: false,
    //     dotAll: true,
    //   ),
    //   '',
    // );

    // final im = context.read<IMProvider>();
    // final client = im.currentState!.client;

    // final themeData = Theme.of(context);
    return const Text("HTML");
  }
}
