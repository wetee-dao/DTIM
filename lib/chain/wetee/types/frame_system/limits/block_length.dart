// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../frame_support/dispatch/per_dispatch_class_3.dart' as _i2;

class BlockLength {
  const BlockLength({required this.max});

  factory BlockLength.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// PerDispatchClass<u32>
  final _i2.PerDispatchClass max;

  static const $BlockLengthCodec codec = $BlockLengthCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, Map<String, int>> toJson() => {'max': max.toJson()};

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BlockLength && other.max == max;

  @override
  int get hashCode => max.hashCode;
}

class $BlockLengthCodec with _i1.Codec<BlockLength> {
  const $BlockLengthCodec();

  @override
  void encodeTo(
    BlockLength obj,
    _i1.Output output,
  ) {
    _i2.PerDispatchClass.codec.encodeTo(
      obj.max,
      output,
    );
  }

  @override
  BlockLength decode(_i1.Input input) {
    return BlockLength(max: _i2.PerDispatchClass.codec.decode(input));
  }

  @override
  int sizeHint(BlockLength obj) {
    int size = 0;
    size = size + _i2.PerDispatchClass.codec.sizeHint(obj.max);
    return size;
  }
}
