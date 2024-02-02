// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class DepositPrice {
  const DepositPrice({
    required this.cpuPer,
    required this.memoryPer,
    required this.diskPer,
  });

  factory DepositPrice.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u16
  final int cpuPer;

  /// u16
  final int memoryPer;

  /// u16
  final int diskPer;

  static const $DepositPriceCodec codec = $DepositPriceCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'cpuPer': cpuPer,
        'memoryPer': memoryPer,
        'diskPer': diskPer,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DepositPrice &&
          other.cpuPer == cpuPer &&
          other.memoryPer == memoryPer &&
          other.diskPer == diskPer;

  @override
  int get hashCode => Object.hash(
        cpuPer,
        memoryPer,
        diskPer,
      );
}

class $DepositPriceCodec with _i1.Codec<DepositPrice> {
  const $DepositPriceCodec();

  @override
  void encodeTo(
    DepositPrice obj,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      obj.cpuPer,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.memoryPer,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.diskPer,
      output,
    );
  }

  @override
  DepositPrice decode(_i1.Input input) {
    return DepositPrice(
      cpuPer: _i1.U16Codec.codec.decode(input),
      memoryPer: _i1.U16Codec.codec.decode(input),
      diskPer: _i1.U16Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(DepositPrice obj) {
    int size = 0;
    size = size + _i1.U16Codec.codec.sizeHint(obj.cpuPer);
    size = size + _i1.U16Codec.codec.sizeHint(obj.memoryPer);
    size = size + _i1.U16Codec.codec.sizeHint(obj.diskPer);
    return size;
  }
}
