import 'dart:io';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import './bridge_generated.dart';

// rust 桥
const base = 'chain_wraper';
var path = Platform.isWindows ? '$base.dll' : (Platform.isMacOS ? "$base.dylib" : 'lib$base.so');
final dylib = loadDylib(path);
final api = ChainWraperImpl(dylib);
