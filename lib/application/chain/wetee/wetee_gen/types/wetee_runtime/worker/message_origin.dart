// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum MessageOrigin {
  work('Work', 0);

  const MessageOrigin(
    this.variantName,
    this.codecIndex,
  );

  factory MessageOrigin.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $MessageOriginCodec codec = $MessageOriginCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $MessageOriginCodec with _i1.Codec<MessageOrigin> {
  const $MessageOriginCodec();

  @override
  MessageOrigin decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return MessageOrigin.work;
      default:
        throw Exception('MessageOrigin: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    MessageOrigin value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
