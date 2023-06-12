import 'package:asyou_app/domain/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';


 initDB() async {
  
  Hive.registerAdapter(SystemAdapter());
  Hive.registerAdapter(AccountAdapter());
  Hive.registerAdapter(AccountOrgAdapter());
  Hive.registerAdapter(OrgAdapter());

  // if (DB != null) {
  //   return DB!;
  // }

  await Hive.initFlutter();

  // if (PlatformInfos.isWeb) {
  //   DB = await BoxCollection.open(
  //     'LocalStore',
  //     {'Account', 'AccountOrg', 'System'},
  //   );
  //   return DB!;
  // }

  // final dir = await getApplicationSupportDirectory();
  // printInfo("LocalStore ==> ${dir.path}/localstore");

  // // DB = await openStore(directory: "${dir.path}/daoent");
  // DB = await BoxCollection.open(
  //   'LocalStore',
  //   {'Account', 'AccountOrg', 'System'},
  //   path: "${dir.path}/localstore",
  // );
  // return DB!;
}
