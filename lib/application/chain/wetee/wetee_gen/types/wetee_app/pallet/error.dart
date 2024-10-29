// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// App status mismatch.
  /// 状态不匹配
  appStatusMismatch('AppStatusMismatch', 0),

  /// App not exists.
  /// App不存在
  appNotExist('AppNotExist', 1),

  /// Too many app.
  /// App 数量过多
  tooManyApp('TooManyApp', 2),

  /// App 403.
  /// App 403
  app403('App403', 3),

  /// Not enough balance.
  /// 余额不足
  notEnoughBalance('NotEnoughBalance', 4),

  /// Level not exists.
  /// 等级不存在
  levelNotExist('LevelNotExist', 5),

  /// Cpu too Low
  /// Cpu 过低
  cpuTooLow('CpuTooLow', 6),

  /// Memory too Low
  /// 内存过低
  memoryTooLow('MemoryTooLow', 7);

  const Error(
    this.variantName,
    this.codecIndex,
  );

  factory Error.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ErrorCodec codec = $ErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ErrorCodec with _i1.Codec<Error> {
  const $ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Error.appStatusMismatch;
      case 1:
        return Error.appNotExist;
      case 2:
        return Error.tooManyApp;
      case 3:
        return Error.app403;
      case 4:
        return Error.notEnoughBalance;
      case 5:
        return Error.levelNotExist;
      case 6:
        return Error.cpuTooLow;
      case 7:
        return Error.memoryTooLow;
      default:
        throw Exception('Error: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
