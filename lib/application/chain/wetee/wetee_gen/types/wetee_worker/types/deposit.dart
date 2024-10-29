// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Deposit {
  const Deposit({
    required this.deposit,
    required this.cpu,
    required this.cvmCpu,
    required this.mem,
    required this.cvmMem,
    required this.disk,
    required this.gpu,
  });

  factory Deposit.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Balance
  final BigInt deposit;

  /// u32
  final int cpu;

  /// u32
  final int cvmCpu;

  /// u32
  final int mem;

  /// u32
  final int cvmMem;

  /// u32
  final int disk;

  /// u32
  final int gpu;

  static const $DepositCodec codec = $DepositCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'deposit': deposit,
        'cpu': cpu,
        'cvmCpu': cvmCpu,
        'mem': mem,
        'cvmMem': cvmMem,
        'disk': disk,
        'gpu': gpu,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Deposit &&
          other.deposit == deposit &&
          other.cpu == cpu &&
          other.cvmCpu == cvmCpu &&
          other.mem == mem &&
          other.cvmMem == cvmMem &&
          other.disk == disk &&
          other.gpu == gpu;

  @override
  int get hashCode => Object.hash(
        deposit,
        cpu,
        cvmCpu,
        mem,
        cvmMem,
        disk,
        gpu,
      );
}

class $DepositCodec with _i1.Codec<Deposit> {
  const $DepositCodec();

  @override
  void encodeTo(
    Deposit obj,
    _i1.Output output,
  ) {
    _i1.U128Codec.codec.encodeTo(
      obj.deposit,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.cpu,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.cvmCpu,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.mem,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.cvmMem,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.disk,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.gpu,
      output,
    );
  }

  @override
  Deposit decode(_i1.Input input) {
    return Deposit(
      deposit: _i1.U128Codec.codec.decode(input),
      cpu: _i1.U32Codec.codec.decode(input),
      cvmCpu: _i1.U32Codec.codec.decode(input),
      mem: _i1.U32Codec.codec.decode(input),
      cvmMem: _i1.U32Codec.codec.decode(input),
      disk: _i1.U32Codec.codec.decode(input),
      gpu: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Deposit obj) {
    int size = 0;
    size = size + _i1.U128Codec.codec.sizeHint(obj.deposit);
    size = size + _i1.U32Codec.codec.sizeHint(obj.cpu);
    size = size + _i1.U32Codec.codec.sizeHint(obj.cvmCpu);
    size = size + _i1.U32Codec.codec.sizeHint(obj.mem);
    size = size + _i1.U32Codec.codec.sizeHint(obj.cvmMem);
    size = size + _i1.U32Codec.codec.sizeHint(obj.disk);
    size = size + _i1.U32Codec.codec.sizeHint(obj.gpu);
    return size;
  }
}
