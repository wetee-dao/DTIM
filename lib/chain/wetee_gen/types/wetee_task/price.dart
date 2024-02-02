// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Price {
  const Price({
    required this.cpuPerBlock,
    required this.memoryPerBlock,
    required this.diskPerBlock,
  });

  factory Price.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u16
  final int cpuPerBlock;

  /// u16
  final int memoryPerBlock;

  /// u16
  final int diskPerBlock;

  static const $PriceCodec codec = $PriceCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'cpuPerBlock': cpuPerBlock,
        'memoryPerBlock': memoryPerBlock,
        'diskPerBlock': diskPerBlock,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Price &&
          other.cpuPerBlock == cpuPerBlock &&
          other.memoryPerBlock == memoryPerBlock &&
          other.diskPerBlock == diskPerBlock;

  @override
  int get hashCode => Object.hash(
        cpuPerBlock,
        memoryPerBlock,
        diskPerBlock,
      );
}

class $PriceCodec with _i1.Codec<Price> {
  const $PriceCodec();

  @override
  void encodeTo(
    Price obj,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      obj.cpuPerBlock,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.memoryPerBlock,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.diskPerBlock,
      output,
    );
  }

  @override
  Price decode(_i1.Input input) {
    return Price(
      cpuPerBlock: _i1.U16Codec.codec.decode(input),
      memoryPerBlock: _i1.U16Codec.codec.decode(input),
      diskPerBlock: _i1.U16Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Price obj) {
    int size = 0;
    size = size + _i1.U16Codec.codec.sizeHint(obj.cpuPerBlock);
    size = size + _i1.U16Codec.codec.sizeHint(obj.memoryPerBlock);
    size = size + _i1.U16Codec.codec.sizeHint(obj.diskPerBlock);
    return size;
  }
}
