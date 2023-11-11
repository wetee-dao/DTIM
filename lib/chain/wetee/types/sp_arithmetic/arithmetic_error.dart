// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum ArithmeticError {
  underflow('Underflow', 0),
  overflow('Overflow', 1),
  divisionByZero('DivisionByZero', 2);

  const ArithmeticError(
    this.variantName,
    this.codecIndex,
  );

  factory ArithmeticError.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ArithmeticErrorCodec codec = $ArithmeticErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ArithmeticErrorCodec with _i1.Codec<ArithmeticError> {
  const $ArithmeticErrorCodec();

  @override
  ArithmeticError decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return ArithmeticError.underflow;
      case 1:
        return ArithmeticError.overflow;
      case 2:
        return ArithmeticError.divisionByZero;
      default:
        throw Exception('ArithmeticError: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    ArithmeticError value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
