// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// Error for the System pallet
enum Error {
  /// The name of specification does not match between the current runtime
  /// and the new runtime.
  invalidSpecName('InvalidSpecName', 0),

  /// The specification version is not allowed to decrease between the current runtime
  /// and the new runtime.
  specVersionNeedsToIncrease('SpecVersionNeedsToIncrease', 1),

  /// Failed to extract the runtime version from the new runtime.
  ///
  /// Either calling `Core_version` or decoding `RuntimeVersion` failed.
  failedToExtractRuntimeVersion('FailedToExtractRuntimeVersion', 2),

  /// Suicide called when the account has non-default composite data.
  nonDefaultComposite('NonDefaultComposite', 3),

  /// There is a non-zero reference count preventing the account from being purged.
  nonZeroRefCount('NonZeroRefCount', 4),

  /// The origin filter prevent the call to be dispatched.
  callFiltered('CallFiltered', 5);

  const Error(
    this.variantName,
    this.codecIndex,
  );

  factory Error.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ErrorCodec codec = $ErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ErrorCodec with _i1.Codec<Error> {
  const $ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Error.invalidSpecName;
      case 1:
        return Error.specVersionNeedsToIncrease;
      case 2:
        return Error.failedToExtractRuntimeVersion;
      case 3:
        return Error.nonDefaultComposite;
      case 4:
        return Error.nonZeroRefCount;
      case 5:
        return Error.callFiltered;
      default:
        throw Exception('Error: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
