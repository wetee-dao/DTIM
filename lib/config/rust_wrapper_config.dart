import 'package:asyou_app/bridge_generated.dart';
import 'package:asyou_app/infra/rust_wrapper/mock_rust_wrapper.dart';
import 'package:asyou_app/infra/rust_wrapper/rust_wrapper.io.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RustWrapperConfig {
  @dev
  @lazySingleton
  RustWraperImpl get devRustWrapper => MockRustWrapperImpl(null);

  @test
  @prod
  @lazySingleton
  RustWraperImpl get prodRustWrapper => rustWrapper();
}
