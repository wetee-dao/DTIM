// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

/// success event
/// 成功事件
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, dynamic> toJson();
}

class $Event {
  const $Event();

  CreatedDao createdDao(
    _i3.AccountId32 value0,
    BigInt value1,
  ) {
    return CreatedDao(
      value0,
      value1,
    );
  }

  Success success() {
    return Success();
  }

  TaskCreated taskCreated(
    BigInt value0,
    int value1,
    BigInt value2,
    _i3.AccountId32 value3,
  ) {
    return TaskCreated(
      value0,
      value1,
      value2,
      value3,
    );
  }

  TaskUpdated taskUpdated(
    BigInt value0,
    int value1,
    BigInt value2,
    _i3.AccountId32 value3,
  ) {
    return TaskUpdated(
      value0,
      value1,
      value2,
      value3,
    );
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return CreatedDao._decode(input);
      case 1:
        return const Success();
      case 2:
        return TaskCreated._decode(input);
      case 3:
        return TaskUpdated._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case CreatedDao:
        (value as CreatedDao).encodeTo(output);
        break;
      case Success:
        (value as Success).encodeTo(output);
        break;
      case TaskCreated:
        (value as TaskCreated).encodeTo(output);
        break;
      case TaskUpdated:
        (value as TaskUpdated).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case CreatedDao:
        return (value as CreatedDao)._sizeHint();
      case Success:
        return 1;
      case TaskCreated:
        return (value as TaskCreated)._sizeHint();
      case TaskUpdated:
        return (value as TaskUpdated)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// DAO create event
/// DAO创建成功事件
class CreatedDao extends Event {
  const CreatedDao(
    this.value0,
    this.value1,
  );

  factory CreatedDao._decode(_i1.Input input) {
    return CreatedDao(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U64Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 value0;

  /// DaoAssetId
  final BigInt value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'CreatedDao': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreatedDao &&
          _i4.listsEqual(
            other.value0,
            value0,
          ) &&
          other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

/// nomal success
/// 成功的事件
class Success extends Event {
  const Success();

  @override
  Map<String, dynamic> toJson() => {'Success': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Success;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// task create event
/// 任务创建成功事件
class TaskCreated extends Event {
  const TaskCreated(
    this.value0,
    this.value1,
    this.value2,
    this.value3,
  );

  factory TaskCreated._decode(_i1.Input input) {
    return TaskCreated(
      _i1.U64Codec.codec.decode(input),
      _i1.U32Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// u32
  final int value1;

  /// u64
  final BigInt value2;

  /// T::AccountId
  final _i3.AccountId32 value3;

  @override
  Map<String, List<dynamic>> toJson() => {
        'TaskCreated': [
          value0,
          value1,
          value2,
          value3.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U32Codec.codec.sizeHint(value1);
    size = size + _i1.U64Codec.codec.sizeHint(value2);
    size = size + const _i3.AccountId32Codec().sizeHint(value3);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value3,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskCreated &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          other.value2 == value2 &&
          _i4.listsEqual(
            other.value3,
            value3,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
        value3,
      );
}

/// task update event
/// 任务更新成功事件
class TaskUpdated extends Event {
  const TaskUpdated(
    this.value0,
    this.value1,
    this.value2,
    this.value3,
  );

  factory TaskUpdated._decode(_i1.Input input) {
    return TaskUpdated(
      _i1.U64Codec.codec.decode(input),
      _i1.U32Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// u32
  final int value1;

  /// u64
  final BigInt value2;

  /// T::AccountId
  final _i3.AccountId32 value3;

  @override
  Map<String, List<dynamic>> toJson() => {
        'TaskUpdated': [
          value0,
          value1,
          value2,
          value3.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U32Codec.codec.sizeHint(value1);
    size = size + _i1.U64Codec.codec.sizeHint(value2);
    size = size + const _i3.AccountId32Codec().sizeHint(value3);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value3,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskUpdated &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          other.value2 == value2 &&
          _i4.listsEqual(
            other.value3,
            value3,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
        value3,
      );
}
