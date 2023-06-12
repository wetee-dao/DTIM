import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/domain/utils/platform_infos.dart';

void main() {
  test("test PlatformInfos", () {
    expect(PlatformInfos.isAndroid, PlatformInfos.isAndroid);
    expect(PlatformInfos.isIOS, PlatformInfos.isIOS);
    expect(PlatformInfos.isWeb, kIsWeb);
    expect(PlatformInfos.isMacOS, PlatformInfos.isMacOS);
    expect(PlatformInfos.isWindows, PlatformInfos.isWindows);
    expect(PlatformInfos.isLinux, PlatformInfos.isLinux);
  });
}
