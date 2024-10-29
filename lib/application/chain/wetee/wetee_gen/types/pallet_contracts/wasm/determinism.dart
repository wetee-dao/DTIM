// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum Determinism {
  enforced('Enforced', 0),
  relaxed('Relaxed', 1);

  const Determinism(
    this.variantName,
    this.codecIndex,
  );

  factory Determinism.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $DeterminismCodec codec = $DeterminismCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $DeterminismCodec with _i1.Codec<Determinism> {
  const $DeterminismCodec();

  @override
  Determinism decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Determinism.enforced;
      case 1:
        return Determinism.relaxed;
      default:
        throw Exception('Determinism: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Determinism value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
