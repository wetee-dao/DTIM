import 'package:asyou_app/store/db.dart';

import '../models/fmsg.dart';
import '../objectbox.g.dart';

class DirectMsgApi {
  late final Box<DirectMsg> storeBox;

  DirectMsgApi._create(Store store) {
    storeBox = Box<DirectMsg>(store);
  }

  static DirectMsgApi create() {
    return DirectMsgApi._create(DB!);
  }

  Box<DirectMsg> store() {
    return storeBox;
  }

  int addMsg(DirectMsg fm) {
    return storeBox.put(fm);
  }
}
