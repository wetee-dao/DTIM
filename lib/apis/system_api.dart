import 'package:hive/hive.dart';

import '../store/db.dart';
import '../models/system.dart';

class SystemApi {
  late final CollectionBox<System> storeBox;

  SystemApi._create(CollectionBox<System>  store) {
    storeBox = store;
  }

  static Future<SystemApi> create() async {
    var storeBox = await DB!.openBox<System>('System');
    return SystemApi._create(storeBox);
  }

  CollectionBox<System> store() {
    return storeBox;
  }

  Future<System> save(double width, double height) async {
    final sys = await get();
    if (sys == null) {
      final u = System(width: width, height: height, theme: "");
      await storeBox.put("1",u);
      return u;
    }

    if ((sys.width - width).abs() < 10 && (sys.height - height).abs() < 10) {
      return sys;
    }

    sys.width = width;
    sys.height = height;
    sys.theme = sys.theme;
    await storeBox.put("1",sys);
    return sys;
  }

  Future<System> saveTheme(String theme) async {
    final sys = await get();

    sys!.theme = theme;
    await storeBox.put("1",sys);
    return sys;
  }

  Future<System?> get() async {
    return await storeBox.get("1");
  }
}
