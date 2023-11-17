// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum Releases {
  v1Ancient('V1Ancient', 0),
  v2('V2', 1);

  const Releases(
    this.variantName,
    this.codecIndex,
  );

  factory Releases.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ReleasesCodec codec = $ReleasesCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ReleasesCodec with _i1.Codec<Releases> {
  const $ReleasesCodec();

  @override
  Releases decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Releases.v1Ancient;
      case 1:
        return Releases.v2;
      default:
        throw Exception('Releases: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Releases value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
