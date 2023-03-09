import '../store/db.dart';
import '../models/system.dart';
import '../objectbox.g.dart';

class SystemApi {
  late final Box<System> storeBox;

  SystemApi._create(Store store) {
    storeBox = Box<System>(store);
  }

  static SystemApi create() {
    return SystemApi._create(DB!);
  }

  Box<System> store() {
    return storeBox;
  }

  System save(double width, double height) {
    var sys = get();
    if (sys == null) {
      var u = System(width: width, height: height);
      final id = storeBox.put(u);
      u.id = id;
      return u;
    }

    if ((sys.width - width).abs() < 10 && (sys.height - height).abs() < 10) {
      return sys;
    }

    sys.width = width;
    sys.height = height;
    storeBox.put(sys);
    return sys;
  }

  System? get() {
    return storeBox.get(1);
  }
}
