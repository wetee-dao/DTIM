// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Deposit {
  const Deposit({
    required this.deposit,
    required this.cpu,
    required this.memory,
    required this.disk,
  });

  factory Deposit.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Balance
  final BigInt deposit;

  /// u16
  final int cpu;

  /// u16
  final int memory;

  /// u16
  final int disk;

  static const $DepositCodec codec = $DepositCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'deposit': deposit,
        'cpu': cpu,
        'memory': memory,
        'disk': disk,
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
          other.memory == memory &&
          other.disk == disk;

  @override
  int get hashCode => Object.hash(
        deposit,
        cpu,
        memory,
        disk,
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
    _i1.U16Codec.codec.encodeTo(
      obj.cpu,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.memory,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.disk,
      output,
    );
  }

  @override
  Deposit decode(_i1.Input input) {
    return Deposit(
      deposit: _i1.U128Codec.codec.decode(input),
      cpu: _i1.U16Codec.codec.decode(input),
      memory: _i1.U16Codec.codec.decode(input),
      disk: _i1.U16Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Deposit obj) {
    int size = 0;
    size = size + _i1.U128Codec.codec.sizeHint(obj.deposit);
    size = size + _i1.U16Codec.codec.sizeHint(obj.cpu);
    size = size + _i1.U16Codec.codec.sizeHint(obj.memory);
    size = size + _i1.U16Codec.codec.sizeHint(obj.disk);
    return size;
  }
}
