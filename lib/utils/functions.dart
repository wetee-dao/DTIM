import 'package:flutter/material.dart';

extension ColorExtension on String {
  // 16进制颜色转换为Color
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

// 获取用户id
String getUserShortId(String id) {
  String userId = id.split(":")[0];
  userId = userId.replaceAll("@", "");
  return userId;
}

// 获取用户组织
String getUserOrg(String id) {
  return id.split(":")[1];
}

// 获取用户名称
String getUserShortName(String id) {
  if (!id.startsWith("0x")) {
    if (id.length > 20) return "${id.substring(0, 19)}...";
    return id;
  }
  String userId = id.split(":")[0];
  userId = userId.replaceAll("@", "");
  return "${userId.substring(0, 11)}...${userId.substring(userId.length - 11, userId.length)}";
}

// 打印警告
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

// 打印错误
void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

// 打印成功
void printSuccess(String text) {
  print('\x1B[32m$text\x1B[0m');
}

// 打印信息
void printInfo(String text) {
  print('\x1B[34m$text\x1B[0m');
}

// 打印调试
void printDebug(String text) {
  print('\x1B[35m$text\x1B[0m');
}

extension StringExtension on String {
  String fisrtUpperCase() {
    if (isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
