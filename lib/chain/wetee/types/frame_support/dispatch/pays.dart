// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum Pays {
  yes('Yes', 0),
  no('No', 1);

  const Pays(
    this.variantName,
    this.codecIndex,
  );

  factory Pays.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $PaysCodec codec = $PaysCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $PaysCodec with _i1.Codec<Pays> {
  const $PaysCodec();

  @override
  Pays decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Pays.yes;
      case 1:
        return Pays.no;
      default:
        throw Exception('Pays: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Pays value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
