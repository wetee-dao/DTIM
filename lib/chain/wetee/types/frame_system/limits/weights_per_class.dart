// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../sp_weights/weight_v2/weight.dart' as _i2;

class WeightsPerClass {
  const WeightsPerClass({
    required this.baseExtrinsic,
    this.maxExtrinsic,
    this.maxTotal,
    this.reserved,
  });

  factory WeightsPerClass.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Weight
  final _i2.Weight baseExtrinsic;

  /// Option<Weight>
  final _i2.Weight? maxExtrinsic;

  /// Option<Weight>
  final _i2.Weight? maxTotal;

  /// Option<Weight>
  final _i2.Weight? reserved;

  static const $WeightsPerClassCodec codec = $WeightsPerClassCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, Map<String, BigInt>?> toJson() => {
        'baseExtrinsic': baseExtrinsic.toJson(),
        'maxExtrinsic': maxExtrinsic?.toJson(),
        'maxTotal': maxTotal?.toJson(),
        'reserved': reserved?.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeightsPerClass &&
          other.baseExtrinsic == baseExtrinsic &&
          other.maxExtrinsic == maxExtrinsic &&
          other.maxTotal == maxTotal &&
          other.reserved == reserved;

  @override
  int get hashCode => Object.hash(
        baseExtrinsic,
        maxExtrinsic,
        maxTotal,
        reserved,
      );
}

class $WeightsPerClassCodec with _i1.Codec<WeightsPerClass> {
  const $WeightsPerClassCodec();

  @override
  void encodeTo(
    WeightsPerClass obj,
    _i1.Output output,
  ) {
    _i2.Weight.codec.encodeTo(
      obj.baseExtrinsic,
      output,
    );
    const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec).encodeTo(
      obj.maxExtrinsic,
      output,
    );
    const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec).encodeTo(
      obj.maxTotal,
      output,
    );
    const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec).encodeTo(
      obj.reserved,
      output,
    );
  }

  @override
  WeightsPerClass decode(_i1.Input input) {
    return WeightsPerClass(
      baseExtrinsic: _i2.Weight.codec.decode(input),
      maxExtrinsic:
          const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec).decode(input),
      maxTotal:
          const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec).decode(input),
      reserved:
          const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec).decode(input),
    );
  }

  @override
  int sizeHint(WeightsPerClass obj) {
    int size = 0;
    size = size + _i2.Weight.codec.sizeHint(obj.baseExtrinsic);
    size = size +
        const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec)
            .sizeHint(obj.maxExtrinsic);
    size = size +
        const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec)
            .sizeHint(obj.maxTotal);
    size = size +
        const _i1.OptionCodec<_i2.Weight>(_i2.Weight.codec)
            .sizeHint(obj.reserved);
    return size;
  }
}
