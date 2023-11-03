// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

abstract class MessageOrigin {
  const MessageOrigin();

  factory MessageOrigin.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $MessageOriginCodec codec = $MessageOriginCodec();

  static const $MessageOrigin values = $MessageOrigin();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, dynamic> toJson();
}

class $MessageOrigin {
  const $MessageOrigin();

  Here here() {
    return Here();
  }

  There there() {
    return There();
  }

  Everywhere everywhere(int value0) {
    return Everywhere(value0);
  }
}

class $MessageOriginCodec with _i1.Codec<MessageOrigin> {
  const $MessageOriginCodec();

  @override
  MessageOrigin decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return const Here();
      case 1:
        return const There();
      case 2:
        return Everywhere._decode(input);
      default:
        throw Exception('MessageOrigin: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    MessageOrigin value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Here:
        (value as Here).encodeTo(output);
        break;
      case There:
        (value as There).encodeTo(output);
        break;
      case Everywhere:
        (value as Everywhere).encodeTo(output);
        break;
      default:
        throw Exception(
            'MessageOrigin: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(MessageOrigin value) {
    switch (value.runtimeType) {
      case Here:
        return 1;
      case There:
        return 1;
      case Everywhere:
        return (value as Everywhere)._sizeHint();
      default:
        throw Exception(
            'MessageOrigin: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Here extends MessageOrigin {
  const Here();

  @override
  Map<String, dynamic> toJson() => {'Here': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Here;

  @override
  int get hashCode => runtimeType.hashCode;
}

class There extends MessageOrigin {
  const There();

  @override
  Map<String, dynamic> toJson() => {'There': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is There;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Everywhere extends MessageOrigin {
  const Everywhere(this.value0);

  factory Everywhere._decode(_i1.Input input) {
    return Everywhere(_i1.U32Codec.codec.decode(input));
  }

  /// u32
  final int value0;

  @override
  Map<String, int> toJson() => {'Everywhere': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Everywhere && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
