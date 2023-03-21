import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

String getUserShortId(String id) {
  String userId = id.split(":")[0];
  userId = userId.replaceAll("@", "");
  return userId;
}

String getUserShortName(String id) {
  if (!id.startsWith("0x")) {
    if (id.length > 20) return "${id.substring(0, 19)}...";
    return id;
  }
  String userId = id.split(":")[0];
  userId = userId.replaceAll("@", "");
  return "${userId.substring(0, 11)}...${userId.substring(userId.length - 11, userId.length)}";
}

extension StringExtension on String {
  String fisrtUpperCase() {
    if (isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
