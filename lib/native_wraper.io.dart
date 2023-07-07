import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import './bridge_generated.dart';
import 'package:dtim/domain/utils/platform_infos.dart';

// rust 桥
const base = 'rust_wraper';
String path = PlatformInfos.isWindows ? '$base.dll' : (PlatformInfos.isMacOS ? "$base.dylib" : 'lib$base.so');
final dylib = loadLibForFlutter(path);
final rustApi = RustWraperImpl(dylib);
