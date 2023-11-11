// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../frame_support/dispatch/per_dispatch_class_2.dart' as _i3;
import '../../sp_weights/weight_v2/weight.dart' as _i2;

class BlockWeights {
  const BlockWeights({
    required this.baseBlock,
    required this.maxBlock,
    required this.perClass,
  });

  factory BlockWeights.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Weight
  final _i2.Weight baseBlock;

  /// Weight
  final _i2.Weight maxBlock;

  /// PerDispatchClass<WeightsPerClass>
  final _i3.PerDispatchClass perClass;

  static const $BlockWeightsCodec codec = $BlockWeightsCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, Map<String, dynamic>> toJson() => {
        'baseBlock': baseBlock.toJson(),
        'maxBlock': maxBlock.toJson(),
        'perClass': perClass.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BlockWeights &&
          other.baseBlock == baseBlock &&
          other.maxBlock == maxBlock &&
          other.perClass == perClass;

  @override
  int get hashCode => Object.hash(
        baseBlock,
        maxBlock,
        perClass,
      );
}

class $BlockWeightsCodec with _i1.Codec<BlockWeights> {
  const $BlockWeightsCodec();

  @override
  void encodeTo(
    BlockWeights obj,
    _i1.Output output,
  ) {
    _i2.Weight.codec.encodeTo(
      obj.baseBlock,
      output,
    );
    _i2.Weight.codec.encodeTo(
      obj.maxBlock,
      output,
    );
    _i3.PerDispatchClass.codec.encodeTo(
      obj.perClass,
      output,
    );
  }

  @override
  BlockWeights decode(_i1.Input input) {
    return BlockWeights(
      baseBlock: _i2.Weight.codec.decode(input),
      maxBlock: _i2.Weight.codec.decode(input),
      perClass: _i3.PerDispatchClass.codec.decode(input),
    );
  }

  @override
  int sizeHint(BlockWeights obj) {
    int size = 0;
    size = size + _i2.Weight.codec.sizeHint(obj.baseBlock);
    size = size + _i2.Weight.codec.sizeHint(obj.maxBlock);
    size = size + _i3.PerDispatchClass.codec.sizeHint(obj.perClass);
    return size;
  }
}
