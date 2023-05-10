import 'dart:ui';
import 'package:flutter/material.dart';

import 'screen_util.dart';
import 'size_extension.dart';
export 'size_extension.dart';

initScreen(
  double designWidth, // 设计图宽度
) {
  double windowWidth = window.physicalSize.width / window.devicePixelRatio;
  if (isPc()) {
    // PC 端套用当前屏幕缩放比
    windowWidth = designWidth * window.devicePixelRatio;
  }
  double swidth = windowWidth > 1200 ? 1200 : windowWidth;

  ScreenUtil.init(
    deviceSize: Size(swidth, swidth * 1.5),
    designSize: Size(designWidth, designWidth * 1.5),
    minTextAdapt: true,
    orientation: Orientation.portrait,
  );
  ScreenUtil.setConText(null);
}

extension ColorUtil on Color {
  Color lighter([double value = 0.5]) => Color.lerp(this, Colors.white, _limit(value))!.withAlpha(alpha);
  Color darker([double value = 0.5]) => Color.lerp(this, Colors.black, _limit(value))!.withAlpha(alpha);
  Color average(Color color, [double value = 0.5]) => Color.lerp(this, color, _limit(value))!;
  Color decolorize([double value = 1]) {
    int average = (red + green + blue) ~/ 3;
    final color = Color.fromARGB(alpha, average, average, average);
    return Color.lerp(this, color, _limit(value))!;
  }

  Color addOpacity([double value = 0.5]) => Color.fromARGB((alpha * _limit(value)).round(), red, green, blue);
  static int rgbaToArgb(int rgbaColor) {
    int a = rgbaColor & 0xFF;
    int rgb = rgbaColor >> 8;
    return rgb + (a << 24);
  }

  static int abgrToArgb(int argbColor) {
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    return (argbColor & 0xFF00FF00) | (b << 16) | r;
  }

  double _limit(double value) => (value < 0) ? 0 : (value > 1 ? 1 : value);
}
