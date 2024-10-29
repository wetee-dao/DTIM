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

  CreatedApp createdApp({
    required _i3.AccountId32 creator,
    required BigInt id,
  }) {
    return CreatedApp(
      creator: creator,
      id: id,
    );
  }

  AppRuning appRuning({
    required _i3.AccountId32 creator,
    required BigInt id,
  }) {
    return AppRuning(
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

  WorkStopped workStopped({
    required _i3.AccountId32 user,
    required _i4.WorkId workId,
  }) {
    return WorkStopped(
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
        return CreatedApp._decode(input);
      case 1:
        return AppRuning._decode(input);
      case 2:
        return Charge._decode(input);
      case 3:
        return PayRunFee._decode(input);
      case 4:
        return WorkUpdated._decode(input);
      case 5:
        return WorkStopped._decode(input);
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
      case CreatedApp:
        (value as CreatedApp).encodeTo(output);
        break;
      case AppRuning:
        (value as AppRuning).encodeTo(output);
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
      case WorkStopped:
        (value as WorkStopped).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case CreatedApp:
        return (value as CreatedApp)._sizeHint();
      case AppRuning:
        return (value as AppRuning)._sizeHint();
      case Charge:
        return (value as Charge)._sizeHint();
      case PayRunFee:
        return (value as PayRunFee)._sizeHint();
      case WorkUpdated:
        return (value as WorkUpdated)._sizeHint();
      case WorkStopped:
        return (value as WorkStopped)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// App created.
/// App创建
class CreatedApp extends Event {
  const CreatedApp({
    required this.creator,
    required this.id,
  });

  factory CreatedApp._decode(_i1.Input input) {
    return CreatedApp(
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
        'CreatedApp': {
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
      other is CreatedApp &&
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

/// App runing.
/// App运行
class AppRuning extends Event {
  const AppRuning({
    required this.creator,
    required this.id,
  });

  factory AppRuning._decode(_i1.Input input) {
    return AppRuning(
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
        'AppRuning': {
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
      other is AppRuning &&
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

/// App charge.
/// App充值
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
      2,
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

/// App pay run fee.
/// App支付运行费
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

/// A app has been update. [user]
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
      4,
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

/// A new app has been stopped. [user]
class WorkStopped extends Event {
  const WorkStopped({
    required this.user,
    required this.workId,
  });

  factory WorkStopped._decode(_i1.Input input) {
    return WorkStopped(
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
        'WorkStopped': {
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
      other is WorkStopped &&
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
