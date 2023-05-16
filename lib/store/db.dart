import 'package:asyou_app/models/models.dart';
import 'package:asyou_app/utils/functions.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

// ignore: non_constant_identifier_names
BoxCollection? DB;

Future<BoxCollection> initDB() async {
  Hive.registerAdapter(SystemAdapter());
  Hive.registerAdapter(AccountAdapter());
  Hive.registerAdapter(AccountOrgAdapter());
  Hive.registerAdapter(OrgAdapter());
   

  if (DB != null) {
    return DB!;
  }

  final dir = await getApplicationSupportDirectory();
  printInfo("LocalStore ==> ${dir.path}/daoent");
  
  // DB = await openStore(directory: "${dir.path}/daoent");
  DB = await BoxCollection.open(
    'LocalStore',
    {'Account', 'AccountOrg', 'System'},
    path:"${dir.path}/daoent",
  );
  return DB!;
}
