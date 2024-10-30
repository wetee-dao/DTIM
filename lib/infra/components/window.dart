import 'dart:io';

import 'package:dtim/application/service/apis/system_api.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

final _kIsLinux = !kIsWeb && Platform.isLinux;
final _kIsWindows = !kIsWeb && Platform.isWindows;
final _kIsMacos = !kIsWeb && Platform.isMacOS;

class AeroFrame extends StatefulWidget {
  const AeroFrame({
    super.key,
    required this.child,
  });

  /// The [child] contained by the AeroFrame.
  final Widget child;

  @override
  State<StatefulWidget> createState() => _AeroFrameState();
}

class _AeroFrameState extends State<AeroFrame> with WindowListener {
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

  Widget _buildAeroFrame(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      decoration: BoxDecoration(
        color: constTheme.sidebarBg.withOpacity(0.90),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.3),
          width: (_isMaximized || _isFullScreen) ? 0 : 1,
        ),
        borderRadius: BorderRadius.circular(
          (_isMaximized || _isFullScreen) ? 0 : 14
        ),
        boxShadow: <BoxShadow>[
          if (!_isMaximized && !_isFullScreen)
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              // offset: Offset(0.0, _isFocused ? 4 : 2),
              blurRadius: 5
            ),
        ],
      ),
      margin: const EdgeInsets.all(5),
      child: ClipRRect(
        // clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(
          (_isMaximized || _isFullScreen) ? 0 : 16,
        ),
        child: Container(
          margin: const EdgeInsets.all(6),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(
              (_isMaximized || _isFullScreen) ? 0 : 12,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_kIsLinux) {
      return DragToResizeArea(
        enableResizeEdges: (_isMaximized || _isFullScreen) ? [] : null,
        child: _buildAeroFrame(context),
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
    windowManager.getSize().then((value) async {
      final systemStore = await SystemApi.create();
      await systemStore.save(value.width, value.height);
    });
  }
}

// ignore: non_constant_identifier_names
TransitionBuilder AeroFrameInit() {
  return (_, Widget? child) {
    return AeroFrame(
      child: child!,
    );
  };
}
