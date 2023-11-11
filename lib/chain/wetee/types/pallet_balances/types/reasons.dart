// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum Reasons {
  fee('Fee', 0),
  misc('Misc', 1),
  all('All', 2);

  const Reasons(
    this.variantName,
    this.codecIndex,
  );

  factory Reasons.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ReasonsCodec codec = $ReasonsCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ReasonsCodec with _i1.Codec<Reasons> {
  const $ReasonsCodec();

  @override
  Reasons decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Reasons.fee;
      case 1:
        return Reasons.misc;
      case 2:
        return Reasons.all;
      default:
        throw Exception('Reasons: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Reasons value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
