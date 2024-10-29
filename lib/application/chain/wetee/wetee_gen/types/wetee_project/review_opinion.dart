// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum ReviewOpinion {
  yes('YES', 0),
  no('NO', 1);

  const ReviewOpinion(
    this.variantName,
    this.codecIndex,
  );

  factory ReviewOpinion.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ReviewOpinionCodec codec = $ReviewOpinionCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ReviewOpinionCodec with _i1.Codec<ReviewOpinion> {
  const $ReviewOpinionCodec();

  @override
  ReviewOpinion decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return ReviewOpinion.yes;
      case 1:
        return ReviewOpinion.no;
      default:
        throw Exception('ReviewOpinion: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    ReviewOpinion value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
