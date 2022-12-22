import 'dart:ffi';
import 'dart:io';

import './bridge_generated.dart';

// rust 桥
const base = 'chain_wraper';
final path = Platform.isWindows ? '$base.dll' : 'lib$base.so';
final dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(path);
final api = ChainWraperImpl(dylib);
