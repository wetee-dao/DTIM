// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum BalanceStatus {
  free('Free', 0),
  reserved('Reserved', 1);

  const BalanceStatus(
    this.variantName,
    this.codecIndex,
  );

  factory BalanceStatus.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $BalanceStatusCodec codec = $BalanceStatusCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $BalanceStatusCodec with _i1.Codec<BalanceStatus> {
  const $BalanceStatusCodec();

  @override
  BalanceStatus decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return BalanceStatus.free;
      case 1:
        return BalanceStatus.reserved;
      default:
        throw Exception('BalanceStatus: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    BalanceStatus value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
