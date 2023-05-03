import 'package:get_it/get_it.dart';

import './bridge_generated.dart';

// // rust 桥
// const base = 'rust_wraper';
// var path = Platform.isWindows ? '$base.dll' : (Platform.isMacOS ? "$base.dylib" : 'lib$base.so');
// final dylib = loadLibForFlutter(path);
// late final rustApi = RustWraperImpl(dylib);
@Deprecated('use GetIt.I<RustWraperImpl>()')
RustWraperImpl get rustApi => GetIt.I<RustWraperImpl>();
