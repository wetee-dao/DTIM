// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Weight {
  const Weight({
    required this.refTime,
    required this.proofSize,
  });

  factory Weight.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u64
  final BigInt refTime;

  /// u64
  final BigInt proofSize;

  static const $WeightCodec codec = $WeightCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, BigInt> toJson() => {
        'refTime': refTime,
        'proofSize': proofSize,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Weight &&
          other.refTime == refTime &&
          other.proofSize == proofSize;

  @override
  int get hashCode => Object.hash(
        refTime,
        proofSize,
      );
}

class $WeightCodec with _i1.Codec<Weight> {
  const $WeightCodec();

  @override
  void encodeTo(
    Weight obj,
    _i1.Output output,
  ) {
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.refTime,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.proofSize,
      output,
    );
  }

  @override
  Weight decode(_i1.Input input) {
    return Weight(
      refTime: _i1.CompactBigIntCodec.codec.decode(input),
      proofSize: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Weight obj) {
    int size = 0;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.refTime);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.proofSize);
    return size;
  }
}
