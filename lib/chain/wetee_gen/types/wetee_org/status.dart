// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum Status {
  active('Active', 0),
  inActive('InActive', 1);

  const Status(
    this.variantName,
    this.codecIndex,
  );

  factory Status.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $StatusCodec codec = $StatusCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $StatusCodec with _i1.Codec<Status> {
  const $StatusCodec();

  @override
  Status decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Status.active;
      case 1:
        return Status.inActive;
      default:
        throw Exception('Status: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Status value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
