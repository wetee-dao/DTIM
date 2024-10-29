// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

abstract class EnvKey {
  const EnvKey();

  factory EnvKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EnvKeyCodec codec = $EnvKeyCodec();

  static const $EnvKey values = $EnvKey();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, List<int>> toJson();
}

class $EnvKey {
  const $EnvKey();

  Env env(List<int> value0) {
    return Env(value0);
  }

  File file(List<int> value0) {
    return File(value0);
  }
}

class $EnvKeyCodec with _i1.Codec<EnvKey> {
  const $EnvKeyCodec();

  @override
  EnvKey decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Env._decode(input);
      case 1:
        return File._decode(input);
      default:
        throw Exception('EnvKey: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    EnvKey value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Env:
        (value as Env).encodeTo(output);
        break;
      case File:
        (value as File).encodeTo(output);
        break;
      default:
        throw Exception(
            'EnvKey: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(EnvKey value) {
    switch (value.runtimeType) {
      case Env:
        return (value as Env)._sizeHint();
      case File:
        return (value as File)._sizeHint();
      default:
        throw Exception(
            'EnvKey: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Env extends EnvKey {
  const Env(this.value0);

  factory Env._decode(_i1.Input input) {
    return Env(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'Env': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
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
      other is Env &&
          _i3.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class File extends EnvKey {
  const File(this.value0);

  factory File._decode(_i1.Input input) {
    return File(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'File': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
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
      other is File &&
          _i3.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
