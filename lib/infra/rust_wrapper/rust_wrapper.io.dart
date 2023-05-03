import 'dart:io';

import 'package:asyou_app/bridge_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

RustWraperImpl rustWrapper(){
  // rust 桥
  const base = 'rust_wraper';
  var path = Platform.isWindows
      ? '$base.dll'
      : (Platform.isMacOS ? "$base.dylib" : 'lib$base.so');
  final dylib = loadLibForFlutter(path);
  return RustWraperImpl(dylib);
  // late final rustApi = RustWraperImpl(dylib);
}