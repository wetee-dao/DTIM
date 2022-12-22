import '../objectbox.g.dart';

// ignore: non_constant_identifier_names
Store? DB;

Future<Store> initDB() async {
  if (DB != null) {
    return DB!;
  }
  DB = await openStore(macosApplicationGroup: 'me.asyou.asyou_app');
  return DB!;
}
