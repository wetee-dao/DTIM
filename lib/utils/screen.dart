import 'dart:ui';

import 'package:asyou_app/utils/screen/screen_util.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';

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
