// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum TransactionalError {
  limitReached('LimitReached', 0),
  noLayer('NoLayer', 1);

  const TransactionalError(
    this.variantName,
    this.codecIndex,
  );

  factory TransactionalError.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $TransactionalErrorCodec codec = $TransactionalErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $TransactionalErrorCodec with _i1.Codec<TransactionalError> {
  const $TransactionalErrorCodec();

  @override
  TransactionalError decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return TransactionalError.limitReached;
      case 1:
        return TransactionalError.noLayer;
      default:
        throw Exception('TransactionalError: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    TransactionalError value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
