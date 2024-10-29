// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Task status mismatch.
  taskStatusMismatch('TaskStatusMismatch', 0),

  /// Root not exists.
  taskNotExists('TaskNotExists', 1),

  /// Too many app.
  tooManyTask('TooManyTask', 2),

  /// Task 403.
  task403('Task403', 3),

  /// Not enough balance.
  notEnoughBalance('NotEnoughBalance', 4),

  /// Task is runing.
  taskIsRuning('TaskIsRuning', 5),

  /// Task is stop.
  taskIsStoped('TaskIsStoped', 6),

  /// Level not exists.
  levelNotExists('LevelNotExists', 7);

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
        return Error.taskStatusMismatch;
      case 1:
        return Error.taskNotExists;
      case 2:
        return Error.tooManyTask;
      case 3:
        return Error.task403;
      case 4:
        return Error.notEnoughBalance;
      case 5:
        return Error.taskIsRuning;
      case 6:
        return Error.taskIsStoped;
      case 7:
        return Error.levelNotExists;
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
