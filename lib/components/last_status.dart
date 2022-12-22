import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

// ignore: non_constant_identifier_names
WidgetLastStatus(String emoji, String title, String subtitle, IconData iconData) {
  var parser = EmojiParser();
  return ListTile(
    leading: Text(
      parser.emojify(emoji).toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 30,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: const TextStyle(fontSize: 16),
    ),
    trailing: Icon(iconData),
  );
}
