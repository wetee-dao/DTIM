import 'package:flutter/material.dart';

class ChatScrollBehavior extends ScrollBehavior {
  final bool showLeading;
  final bool showTrailing;

  const ChatScrollBehavior({
    this.showLeading: false,
    this.showTrailing: false,
  });

  // @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return GlowingOverscrollIndicator(
      showLeading: showLeading,
      showTrailing: showTrailing,
      axisDirection: axisDirection,
      color: Theme.of(context).primaryColor,
      child: child,
    );
  }
}
