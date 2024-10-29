// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum AdjustmentDirection {
  increase('Increase', 0),
  decrease('Decrease', 1);

  const AdjustmentDirection(
    this.variantName,
    this.codecIndex,
  );

  factory AdjustmentDirection.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $AdjustmentDirectionCodec codec = $AdjustmentDirectionCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $AdjustmentDirectionCodec with _i1.Codec<AdjustmentDirection> {
  const $AdjustmentDirectionCodec();

  @override
  AdjustmentDirection decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return AdjustmentDirection.increase;
      case 1:
        return AdjustmentDirection.decrease;
      default:
        throw Exception('AdjustmentDirection: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    AdjustmentDirection value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
