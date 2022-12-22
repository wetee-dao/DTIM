import 'dart:ui';

import 'package:asyou_app/utils/screen/screen_util.dart';
import 'package:flutter/material.dart';

initScreen(double width) {
  // var size = MediaQuery.of(context).size;
  var windowWidth = window.physicalSize.width / window.devicePixelRatio;
  // 初始化页面缩放单位
  double swidth = windowWidth > 1200 ? 1200 : windowWidth;
  // print("window_width ==> " + window_width.toString());
  // print("swidth ==> " + swidth.toString());
  ScreenUtil.init(
    deviceSize: Size(swidth, swidth * 1.5),
    designSize: Size(width, width * 1.5),
    minTextAdapt: true,
    orientation: Orientation.portrait,
  );
  ScreenUtil.setConText(null);
}
