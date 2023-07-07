import 'dart:ui';

import 'package:dtim/domain/models/system.dart';
import 'package:dtim/domain/utils/screen/size_extension.dart';
import 'package:hive/hive.dart';
import 'package:window_manager/window_manager.dart';

class SystemApi {
  late final Box<System> storeBox;

  SystemApi._create(Box<System> store) {
    storeBox = store;
  }

  static Future<SystemApi> create() async {
    var storeBox = await Hive.openBox<System>('System');
    return SystemApi._create(storeBox);
  }

  Box<System> store() {
    return storeBox;
  }

  Future<System> save(double width, double height) async {
    final sys = await get();
    if (sys == null) {
      final u = System(width: width, height: height, theme: "");
      await storeBox.put("1", u);
      return u;
    }

    if ((sys.width - width).abs() < 10 && (sys.height - height).abs() < 10) {
      return sys;
    }

    sys.width = width;
    sys.height = height;
    sys.theme = sys.theme;
    await storeBox.put("1", sys);
    return sys;
  }

  Future<System> saveTheme(String theme) async {
    final sys = await get();
    if (sys == null) {
      var value = isPc() ? await windowManager.getSize() : Size.zero;
      final s = System(width: value.width, height: value.height, theme: theme);
      await storeBox.put("1", s);
      return s;
    }
    sys.theme = theme;
    await storeBox.put("1", sys);
    return sys;
  }

  Future<System> saveLogin(String accout) async {
    final sys = await get();
    if (sys == null) {
      var value = isPc() ? await windowManager.getSize() : Size.zero;
      final s = System(width: value.width, height: value.height, theme: "");
      s.loginAccount = accout;
      await storeBox.put("1", s);
      return s;
    }
    sys.loginAccount = accout;
    await storeBox.put("1", sys);
    return sys;
  }

  Future<System?> get() async {
    return await storeBox.get("1");
  }
}
