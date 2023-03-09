import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

// ignore: non_constant_identifier_names
Store? DB;

Future<Store> initDB() async {
  if (DB != null) {
    return DB!;
  }

  final dir = await getApplicationSupportDirectory();
  if (kDebugMode) {
    print("objectbox ==> ${dir.path}/daoent");
  }
  DB = await openStore(directory: "${dir.path}/daoent");
  return DB!;
}
