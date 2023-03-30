import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../apis/system_api.dart';
import '../../utils/screen.dart';

final _kIsLinux = !kIsWeb && Platform.isLinux;
final _kIsWindows = !kIsWeb && Platform.isWindows;

double get kVirtualWindowFrameMargin => (_kIsLinux) ? 5.w : 0;

class VirtualWindowFrame extends StatefulWidget {
  /// The [child] contained by the VirtualWindowFrame.
  final Widget child;

  const VirtualWindowFrame({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VirtualWindowFrameState();
}

class _VirtualWindowFrameState extends State<VirtualWindowFrame> with WindowListener {
  bool _isFocused = true;
  bool _isMaximized = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  Widget _buildVirtualWindowFrame(BuildContext context) {
    if (Platform.isMacOS) {
      return widget.child;
    }

    return Container(
      margin: (_isMaximized || _isFullScreen) ? EdgeInsets.zero : EdgeInsets.all(kVirtualWindowFrameMargin),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: <BoxShadow>[
          if (!_isMaximized && !_isFullScreen)
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              // offset: Offset(0.0, _isFocused ? 4 : 2),
              blurRadius: 4.w,
            ),
        ],
      ),
      child: widget.child,
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(
      //     (_isMaximized || _isFullScreen) ? 0 : 10.w,
      //   ),
      //   child: widget.child,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_kIsLinux) {
      return DragToResizeArea(
        resizeEdgeMargin:
            (_isMaximized || _isFullScreen) ? EdgeInsets.zero : EdgeInsets.all(kVirtualWindowFrameMargin * 0.6),
        enableResizeEdges: (_isMaximized || _isFullScreen) ? [] : null,
        child: _buildVirtualWindowFrame(context),
      );
    } else if (_kIsWindows) {
      return DragToResizeArea(
        enableResizeEdges: (_isMaximized || _isFullScreen)
            ? []
            : [
                ResizeEdge.topLeft,
                ResizeEdge.top,
                ResizeEdge.topRight,
              ],
        child: widget.child,
      );
    }

    return widget.child;
  }

  @override
  void onWindowFocus() {
    setState(() {
      _isFocused = true;
    });
  }

  @override
  void onWindowBlur() {
    setState(() {
      _isFocused = false;
    });
  }

  @override
  void onWindowMaximize() {
    setState(() {
      _isMaximized = true;
    });
  }

  @override
  void onWindowUnmaximize() {
    setState(() {
      _isMaximized = false;
    });
  }

  @override
  void onWindowEnterFullScreen() {
    setState(() {
      _isFullScreen = true;
    });
  }

  @override
  void onWindowLeaveFullScreen() {
    setState(() {
      _isFullScreen = false;
    });
  }

  @override
  void onWindowResize() {
    windowManager.getSize().then((value) {
      SystemApi.create().save(value.width, value.height);
    });
  }

  @override
  void onWindowClose() async {
    windowManager.hide();
  }
}

// ignore: non_constant_identifier_names
TransitionBuilder VirtualWindowFrameInit() {
  return (_, Widget? child) {
    return VirtualWindowFrame(
      child: child!,
    );
  };
}
