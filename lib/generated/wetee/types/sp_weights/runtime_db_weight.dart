// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class RuntimeDbWeight {
  const RuntimeDbWeight({
    required this.read,
    required this.write,
  });

  factory RuntimeDbWeight.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u64
  final BigInt read;

  /// u64
  final BigInt write;

  static const $RuntimeDbWeightCodec codec = $RuntimeDbWeightCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, BigInt> toJson() => {
        'read': read,
        'write': write,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RuntimeDbWeight && other.read == read && other.write == write;

  @override
  int get hashCode => Object.hash(
        read,
        write,
      );
}

class $RuntimeDbWeightCodec with _i1.Codec<RuntimeDbWeight> {
  const $RuntimeDbWeightCodec();

  @override
  void encodeTo(
    RuntimeDbWeight obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.read,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.write,
      output,
    );
  }

  @override
  RuntimeDbWeight decode(_i1.Input input) {
    return RuntimeDbWeight(
      read: _i1.U64Codec.codec.decode(input),
      write: _i1.U64Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RuntimeDbWeight obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.read);
    size = size + _i1.U64Codec.codec.sizeHint(obj.write);
    return size;
  }
}
