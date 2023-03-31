import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/utils/platform_infos.dart';

void main() {
  test("test PlatformInfos", () {
    expect(PlatformInfos.isAndroid, Platform.isAndroid);
    expect(PlatformInfos.isIOS, Platform.isIOS);
    expect(PlatformInfos.isWeb, kIsWeb);
    expect(PlatformInfos.isMacOS, Platform.isMacOS);
    expect(PlatformInfos.isWindows, Platform.isWindows);
    expect(PlatformInfos.isLinux, Platform.isLinux);
  });
}
