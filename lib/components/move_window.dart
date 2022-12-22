import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Widget moveWindow(Widget wigdet) {
  if (!isPc()) {
    return wigdet;
  }
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onPanStart: (details) {
      windowManager.startDragging();
    },
    onDoubleTap: () async {
      bool isMaximized = await windowManager.isMaximized();
      if (!isMaximized) {
        windowManager.maximize();
      } else {
        windowManager.unmaximize();
      }
    },
    child: wigdet,
  );
}
