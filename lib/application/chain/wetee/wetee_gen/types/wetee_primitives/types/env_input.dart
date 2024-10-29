// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import 'edit_type.dart' as _i2;
import 'env_key.dart' as _i3;

class EnvInput {
  const EnvInput({
    required this.etype,
    required this.index,
    required this.k,
    required this.v,
  });

  factory EnvInput.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// EditType
  final _i2.EditType etype;

  /// u16
  final int index;

  /// EnvKey
  final _i3.EnvKey k;

  /// Vec<u8>
  final List<int> v;

  static const $EnvInputCodec codec = $EnvInputCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'etype': etype.toJson(),
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
      other is EnvInput &&
          other.etype == etype &&
          other.index == index &&
          other.k == k &&
          _i5.listsEqual(
            other.v,
            v,
          );

  @override
  int get hashCode => Object.hash(
        etype,
        index,
        k,
        v,
      );
}

class $EnvInputCodec with _i1.Codec<EnvInput> {
  const $EnvInputCodec();

  @override
  void encodeTo(
    EnvInput obj,
    _i1.Output output,
  ) {
    _i2.EditType.codec.encodeTo(
      obj.etype,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.index,
      output,
    );
    _i3.EnvKey.codec.encodeTo(
      obj.k,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.v,
      output,
    );
  }

  @override
  EnvInput decode(_i1.Input input) {
    return EnvInput(
      etype: _i2.EditType.codec.decode(input),
      index: _i1.U16Codec.codec.decode(input),
      k: _i3.EnvKey.codec.decode(input),
      v: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(EnvInput obj) {
    int size = 0;
    size = size + _i2.EditType.codec.sizeHint(obj.etype);
    size = size + _i1.U16Codec.codec.sizeHint(obj.index);
    size = size + _i3.EnvKey.codec.sizeHint(obj.k);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.v);
    return size;
  }
}
