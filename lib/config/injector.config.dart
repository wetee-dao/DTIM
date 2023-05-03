// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:asyou_app/bridge_generated.dart' as _i3;
import 'package:asyou_app/config/rust_wrapper_config.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final rustWrapperConfig = _$RustWrapperConfig();
    gh.lazySingleton<_i3.RustWraperImpl>(
      () => rustWrapperConfig.devRustWrapper,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i3.RustWraperImpl>(
      () => rustWrapperConfig.prodRustWrapper,
      registerFor: {
        _test,
        _prod,
      },
    );
    return this;
  }
}

class _$RustWrapperConfig extends _i4.RustWrapperConfig {}
