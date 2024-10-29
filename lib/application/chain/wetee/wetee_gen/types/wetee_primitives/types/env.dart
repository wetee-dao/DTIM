// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import 'env_key.dart' as _i2;

class Env {
  const Env({
    required this.index,
    required this.k,
    required this.v,
  });

  factory Env.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u16
  final int index;

  /// EnvKey
  final _i2.EnvKey k;

  /// Vec<u8>
  final List<int> v;

  static const $EnvCodec codec = $EnvCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'index': index,
        'k': k.toJson(),
        'v': v,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Env &&
          other.index == index &&
          other.k == k &&
          _i4.listsEqual(
            other.v,
            v,
          );

  @override
  int get hashCode => Object.hash(
        index,
        k,
        v,
      );
}

class $EnvCodec with _i1.Codec<Env> {
  const $EnvCodec();

  @override
  void encodeTo(
    Env obj,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      obj.index,
      output,
    );
    _i2.EnvKey.codec.encodeTo(
      obj.k,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.v,
      output,
    );
  }

  @override
  Env decode(_i1.Input input) {
    return Env(
      index: _i1.U16Codec.codec.decode(input),
      k: _i2.EnvKey.codec.decode(input),
      v: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Env obj) {
    int size = 0;
    size = size + _i1.U16Codec.codec.sizeHint(obj.index);
    size = size + _i2.EnvKey.codec.sizeHint(obj.k);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.v);
    return size;
  }
}
