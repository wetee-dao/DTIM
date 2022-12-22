import 'package:asyou_app/store/db.dart';

import '../models/im_message_model.dart';
import '../objectbox.g.dart';

class ImMsgApi {
  late final Box<ImMessages> storeBox;

  ImMsgApi._create(Store store) {
    storeBox = Box<ImMessages>(store);
  }

  static ImMsgApi create() {
    return ImMsgApi._create(DB!);
  }

  Box<ImMessages> store() {
    return storeBox;
  }

  Stream<List<ImMessages>> getImMsgs() {
    final builder = storeBox.query();
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
