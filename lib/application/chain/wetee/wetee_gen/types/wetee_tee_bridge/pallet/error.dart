// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Not a sudo account, nor a dao account.
  call404('Call404', 0),

  /// Call error.
  callBackError('CallBackError', 1),

  /// Call ink contract error.
  callInkError('CallInkError', 2),
  notAllowed403('NotAllowed403', 3),
  workStatusError('WorkStatusError', 4),

  /// Worker not found.
  workNotFound404('WorkNotFound404', 5),

  /// Worker not found.
  workNotStarted('WorkNotStarted', 6);

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
        return Error.call404;
      case 1:
        return Error.callBackError;
      case 2:
        return Error.callInkError;
      case 3:
        return Error.notAllowed403;
      case 4:
        return Error.workStatusError;
      case 5:
        return Error.workNotFound404;
      case 6:
        return Error.workNotStarted;
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
