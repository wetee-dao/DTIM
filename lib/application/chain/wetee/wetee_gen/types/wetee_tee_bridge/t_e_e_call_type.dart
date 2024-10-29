// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum TEECallType {
  ink('Ink', 0),
  evm('Evm', 1),
  pallet('Pallet', 2);

  const TEECallType(
    this.variantName,
    this.codecIndex,
  );

  factory TEECallType.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $TEECallTypeCodec codec = $TEECallTypeCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $TEECallTypeCodec with _i1.Codec<TEECallType> {
  const $TEECallTypeCodec();

  @override
  TEECallType decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return TEECallType.ink;
      case 1:
        return TEECallType.evm;
      case 2:
        return TEECallType.pallet;
      default:
        throw Exception('TEECallType: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    TEECallType value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
