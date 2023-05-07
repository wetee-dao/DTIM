import 'package:flutter/material.dart';
import 'router/router.dart';

export 'router/pop_router.dart';

bool runInTest = false;
GlobalKey<NavigatorState>? rootNavigatorKey;
setGlobalKey(GlobalKey<NavigatorState> key) {
  rootNavigatorKey = key;
}

BuildContext globalCtx() {
  return rootNavigatorKey!.currentContext!;
}
