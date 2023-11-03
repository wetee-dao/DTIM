// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum PropStatus {
  ongoing('Ongoing', 0),
  approved('Approved', 1),
  rejected('Rejected', 2);

  const PropStatus(
    this.variantName,
    this.codecIndex,
  );

  factory PropStatus.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $PropStatusCodec codec = $PropStatusCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $PropStatusCodec with _i1.Codec<PropStatus> {
  const $PropStatusCodec();

  @override
  PropStatus decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return PropStatus.ongoing;
      case 1:
        return PropStatus.approved;
      case 2:
        return PropStatus.rejected;
      default:
        throw Exception('PropStatus: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    PropStatus value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
