// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../../wetee_primitives/types/work_id.dart' as _i4;

/// The `Event` enum of this pallet
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

  Map<String, Map<String, dynamic>> toJson();
}

class $Event {
  const $Event();

  CreatedTask createdTask({
    required _i3.AccountId32 creator,
    required BigInt id,
  }) {
    return CreatedTask(
      creator: creator,
      id: id,
    );
  }

  TaskRuning taskRuning({
    required _i3.AccountId32 creator,
    required BigInt id,
  }) {
    return TaskRuning(
      creator: creator,
      id: id,
    );
  }

  TaskStop taskStop({
    required _i3.AccountId32 creator,
    required BigInt id,
  }) {
    return TaskStop(
      creator: creator,
      id: id,
    );
  }

  Charge charge({
    required _i3.AccountId32 from,
    required _i3.AccountId32 to,
    required BigInt amount,
  }) {
    return Charge(
      from: from,
      to: to,
      amount: amount,
    );
  }

  PayRunFee payRunFee({
    required _i3.AccountId32 from,
    required _i3.AccountId32 to,
    required BigInt amount,
  }) {
    return PayRunFee(
      from: from,
      to: to,
      amount: amount,
    );
  }

  WorkUpdated workUpdated({
    required _i3.AccountId32 user,
    required _i4.WorkId workId,
  }) {
    return WorkUpdated(
      user: user,
      workId: workId,
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
        return CreatedTask._decode(input);
      case 1:
        return TaskRuning._decode(input);
      case 2:
        return TaskStop._decode(input);
      case 3:
        return Charge._decode(input);
      case 4:
        return PayRunFee._decode(input);
      case 5:
        return WorkUpdated._decode(input);
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
      case CreatedTask:
        (value as CreatedTask).encodeTo(output);
        break;
      case TaskRuning:
        (value as TaskRuning).encodeTo(output);
        break;
      case TaskStop:
        (value as TaskStop).encodeTo(output);
        break;
      case Charge:
        (value as Charge).encodeTo(output);
        break;
      case PayRunFee:
        (value as PayRunFee).encodeTo(output);
        break;
      case WorkUpdated:
        (value as WorkUpdated).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case CreatedTask:
        return (value as CreatedTask)._sizeHint();
      case TaskRuning:
        return (value as TaskRuning)._sizeHint();
      case TaskStop:
        return (value as TaskStop)._sizeHint();
      case Charge:
        return (value as Charge)._sizeHint();
      case PayRunFee:
        return (value as PayRunFee)._sizeHint();
      case WorkUpdated:
        return (value as WorkUpdated)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Task created.
class CreatedTask extends Event {
  const CreatedTask({
    required this.creator,
    required this.id,
  });

  factory CreatedTask._decode(_i1.Input input) {
    return CreatedTask(
      creator: const _i1.U8ArrayCodec(32).decode(input),
      id: _i1.U64Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 creator;

  /// u64
  final BigInt id;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'CreatedTask': {
          'creator': creator.toList(),
          'id': id,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(creator);
    size = size + _i1.U64Codec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      creator,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreatedTask &&
          _i5.listsEqual(
            other.creator,
            creator,
          ) &&
          other.id == id;

  @override
  int get hashCode => Object.hash(
        creator,
        id,
      );
}

/// Task runing.
class TaskRuning extends Event {
  const TaskRuning({
    required this.creator,
    required this.id,
  });

  factory TaskRuning._decode(_i1.Input input) {
    return TaskRuning(
      creator: const _i1.U8ArrayCodec(32).decode(input),
      id: _i1.U64Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 creator;

  /// u64
  final BigInt id;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'TaskRuning': {
          'creator': creator.toList(),
          'id': id,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(creator);
    size = size + _i1.U64Codec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      creator,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskRuning &&
          _i5.listsEqual(
            other.creator,
            creator,
          ) &&
          other.id == id;

  @override
  int get hashCode => Object.hash(
        creator,
        id,
      );
}

/// Task stop.
class TaskStop extends Event {
  const TaskStop({
    required this.creator,
    required this.id,
  });

  factory TaskStop._decode(_i1.Input input) {
    return TaskStop(
      creator: const _i1.U8ArrayCodec(32).decode(input),
      id: _i1.U64Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 creator;

  /// u64
  final BigInt id;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'TaskStop': {
          'creator': creator.toList(),
          'id': id,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(creator);
    size = size + _i1.U64Codec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      creator,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskStop &&
          _i5.listsEqual(
            other.creator,
            creator,
          ) &&
          other.id == id;

  @override
  int get hashCode => Object.hash(
        creator,
        id,
      );
}

/// Task charge.
class Charge extends Event {
  const Charge({
    required this.from,
    required this.to,
    required this.amount,
  });

  factory Charge._decode(_i1.Input input) {
    return Charge(
      from: const _i1.U8ArrayCodec(32).decode(input),
      to: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 from;

  /// T::AccountId
  final _i3.AccountId32 to;

  /// BalanceOf<T>
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Charge': {
          'from': from.toList(),
          'to': to.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(from);
    size = size + const _i3.AccountId32Codec().sizeHint(to);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      from,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      to,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Charge &&
          _i5.listsEqual(
            other.from,
            from,
          ) &&
          _i5.listsEqual(
            other.to,
            to,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        from,
        to,
        amount,
      );
}

/// Task pay run fee.
class PayRunFee extends Event {
  const PayRunFee({
    required this.from,
    required this.to,
    required this.amount,
  });

  factory PayRunFee._decode(_i1.Input input) {
    return PayRunFee(
      from: const _i1.U8ArrayCodec(32).decode(input),
      to: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 from;

  /// T::AccountId
  final _i3.AccountId32 to;

  /// BalanceOf<T>
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'PayRunFee': {
          'from': from.toList(),
          'to': to.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(from);
    size = size + const _i3.AccountId32Codec().sizeHint(to);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      from,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      to,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PayRunFee &&
          _i5.listsEqual(
            other.from,
            from,
          ) &&
          _i5.listsEqual(
            other.to,
            to,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        from,
        to,
        amount,
      );
}

class WorkUpdated extends Event {
  const WorkUpdated({
    required this.user,
    required this.workId,
  });

  factory WorkUpdated._decode(_i1.Input input) {
    return WorkUpdated(
      user: const _i1.U8ArrayCodec(32).decode(input),
      workId: _i4.WorkId.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 user;

  /// WorkId
  final _i4.WorkId workId;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'WorkUpdated': {
          'user': user.toList(),
          'workId': workId.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(user);
    size = size + _i4.WorkId.codec.sizeHint(workId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      user,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      workId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WorkUpdated &&
          _i5.listsEqual(
            other.user,
            user,
          ) &&
          other.workId == workId;

  @override
  int get hashCode => Object.hash(
        user,
        workId,
      );
}
