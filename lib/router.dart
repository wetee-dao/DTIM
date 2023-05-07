import 'package:flutter/material.dart';
import 'router/router.dart';

export 'router/pop_router.dart';

bool runInTest = false;
final rootRouter = AppRouter();
final GlobalKey<NavigatorState> rootNavigatorKey = rootRouter.navigatorKey;
BuildContext globalCtx() {
  return rootNavigatorKey.currentContext!;
}
