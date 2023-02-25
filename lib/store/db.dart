import 'package:flutter/foundation.dart';

import '../objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

// ignore: non_constant_identifier_names
Store? DB;

Future<Store> initDB() async {
  if (DB != null) {
    return DB!;
  }
  
  final dir = await getApplicationSupportDirectory();
  if (kDebugMode) {
    print("objectbox ==> ${dir.path}_daoent xxxx");
  }
  DB = await openStore(directory: "${dir.path}_daoent");
  return DB!;
}
