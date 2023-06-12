import 'package:flutter/material.dart';

export 'package:asyou_app/infra/router/pop_router.dart';

// 是否是测试环境
bool runInTest = false;

// NavigatorKey
GlobalKey<NavigatorState>? rootNavigatorKey;

// 设置全局的NavigatorState
setGlobalKey(GlobalKey<NavigatorState> key) {
  rootNavigatorKey = key;
}

// 全局的BuildContext
BuildContext globalCtx() {
  return rootNavigatorKey!.currentContext!;
}

// 全局的NavigatorState
NavigatorState globalState() {
  return rootNavigatorKey!.currentState!;
}
