// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum Opinion {
  yes('YES', 0),
  no('NO', 1);

  const Opinion(
    this.variantName,
    this.codecIndex,
  );

  factory Opinion.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $OpinionCodec codec = $OpinionCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $OpinionCodec with _i1.Codec<Opinion> {
  const $OpinionCodec();

  @override
  Opinion decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Opinion.yes;
      case 1:
        return Opinion.no;
      default:
        throw Exception('Opinion: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Opinion value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
