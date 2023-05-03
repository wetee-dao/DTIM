import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

///
/// Please copy this file to your project and rename it to `injector.dart`
/// run `dart run build_runner build` to generate `./injector.config.dart`
/// do not edit method name `initPackageDI`
@InjectableInit()
Future initPackageDI(GetIt getIt, EnvSign env) async =>
    await getIt.init(environmentFilter: NoEnvOrContainsAny({env.name}));

enum EnvSign {
  dev,
  test,
  prod,
}
