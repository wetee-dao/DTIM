// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum DispatchClass {
  normal('Normal', 0),
  operational('Operational', 1),
  mandatory('Mandatory', 2);

  const DispatchClass(
    this.variantName,
    this.codecIndex,
  );

  factory DispatchClass.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $DispatchClassCodec codec = $DispatchClassCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $DispatchClassCodec with _i1.Codec<DispatchClass> {
  const $DispatchClassCodec();

  @override
  DispatchClass decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return DispatchClass.normal;
      case 1:
        return DispatchClass.operational;
      case 2:
        return DispatchClass.mandatory;
      default:
        throw Exception('DispatchClass: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    DispatchClass value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
