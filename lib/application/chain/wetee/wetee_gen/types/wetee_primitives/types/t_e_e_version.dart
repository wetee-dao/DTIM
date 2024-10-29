// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum TEEVersion {
  sgx('SGX', 0),
  cvm('CVM', 1);

  const TEEVersion(
    this.variantName,
    this.codecIndex,
  );

  factory TEEVersion.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $TEEVersionCodec codec = $TEEVersionCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $TEEVersionCodec with _i1.Codec<TEEVersion> {
  const $TEEVersionCodec();

  @override
  TEEVersion decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return TEEVersion.sgx;
      case 1:
        return TEEVersion.cvm;
      default:
        throw Exception('TEEVersion: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    TEEVersion value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
