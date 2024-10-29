// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class DepositPrice {
  const DepositPrice({
    required this.cpuPer,
    required this.cvmCpuPer,
    required this.memoryPer,
    required this.cvmMemoryPer,
    required this.diskPer,
    required this.gpuPer,
  });

  factory DepositPrice.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u32
  final int cpuPer;

  /// u32
  final int cvmCpuPer;

  /// u32
  final int memoryPer;

  /// u32
  final int cvmMemoryPer;

  /// u32
  final int diskPer;

  /// u32
  final int gpuPer;

  static const $DepositPriceCodec codec = $DepositPriceCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'cpuPer': cpuPer,
        'cvmCpuPer': cvmCpuPer,
        'memoryPer': memoryPer,
        'cvmMemoryPer': cvmMemoryPer,
        'diskPer': diskPer,
        'gpuPer': gpuPer,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DepositPrice &&
          other.cpuPer == cpuPer &&
          other.cvmCpuPer == cvmCpuPer &&
          other.memoryPer == memoryPer &&
          other.cvmMemoryPer == cvmMemoryPer &&
          other.diskPer == diskPer &&
          other.gpuPer == gpuPer;

  @override
  int get hashCode => Object.hash(
        cpuPer,
        cvmCpuPer,
        memoryPer,
        cvmMemoryPer,
        diskPer,
        gpuPer,
      );
}

class $DepositPriceCodec with _i1.Codec<DepositPrice> {
  const $DepositPriceCodec();

  @override
  void encodeTo(
    DepositPrice obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.cpuPer,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.cvmCpuPer,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.memoryPer,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.cvmMemoryPer,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.diskPer,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.gpuPer,
      output,
    );
  }

  @override
  DepositPrice decode(_i1.Input input) {
    return DepositPrice(
      cpuPer: _i1.U32Codec.codec.decode(input),
      cvmCpuPer: _i1.U32Codec.codec.decode(input),
      memoryPer: _i1.U32Codec.codec.decode(input),
      cvmMemoryPer: _i1.U32Codec.codec.decode(input),
      diskPer: _i1.U32Codec.codec.decode(input),
      gpuPer: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(DepositPrice obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.cpuPer);
    size = size + _i1.U32Codec.codec.sizeHint(obj.cvmCpuPer);
    size = size + _i1.U32Codec.codec.sizeHint(obj.memoryPer);
    size = size + _i1.U32Codec.codec.sizeHint(obj.cvmMemoryPer);
    size = size + _i1.U32Codec.codec.sizeHint(obj.diskPer);
    size = size + _i1.U32Codec.codec.sizeHint(obj.gpuPer);
    return size;
  }
}
