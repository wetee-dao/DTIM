// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../frame_support/traits/tokens/misc/balance_status.dart' as _i4;
import '../../sp_core/crypto/account_id32.dart' as _i3;

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

  Endowed endowed({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Endowed(
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  DustLost dustLost({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return DustLost(
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  Transfer transfer({
    required BigInt currencyId,
    required _i3.AccountId32 from,
    required _i3.AccountId32 to,
    required BigInt amount,
  }) {
    return Transfer(
      currencyId: currencyId,
      from: from,
      to: to,
      amount: amount,
    );
  }

  Reserved reserved({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Reserved(
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  Unreserved unreserved({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Unreserved(
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  ReserveRepatriated reserveRepatriated({
    required BigInt currencyId,
    required _i3.AccountId32 from,
    required _i3.AccountId32 to,
    required BigInt amount,
    required _i4.BalanceStatus status,
  }) {
    return ReserveRepatriated(
      currencyId: currencyId,
      from: from,
      to: to,
      amount: amount,
      status: status,
    );
  }

  BalanceSet balanceSet({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt free,
    required BigInt reserved,
  }) {
    return BalanceSet(
      currencyId: currencyId,
      who: who,
      free: free,
      reserved: reserved,
    );
  }

  TotalIssuanceSet totalIssuanceSet({
    required BigInt currencyId,
    required BigInt amount,
  }) {
    return TotalIssuanceSet(
      currencyId: currencyId,
      amount: amount,
    );
  }

  Withdrawn withdrawn({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Withdrawn(
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  Slashed slashed({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt freeAmount,
    required BigInt reservedAmount,
  }) {
    return Slashed(
      currencyId: currencyId,
      who: who,
      freeAmount: freeAmount,
      reservedAmount: reservedAmount,
    );
  }

  Deposited deposited({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Deposited(
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  LockSet lockSet({
    required List<int> lockId,
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return LockSet(
      lockId: lockId,
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  LockRemoved lockRemoved({
    required List<int> lockId,
    required BigInt currencyId,
    required _i3.AccountId32 who,
  }) {
    return LockRemoved(
      lockId: lockId,
      currencyId: currencyId,
      who: who,
    );
  }

  Locked locked({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Locked(
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  Unlocked unlocked({
    required BigInt currencyId,
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Unlocked(
      currencyId: currencyId,
      who: who,
      amount: amount,
    );
  }

  Issued issued({
    required BigInt currencyId,
    required BigInt amount,
  }) {
    return Issued(
      currencyId: currencyId,
      amount: amount,
    );
  }

  Rescinded rescinded({
    required BigInt currencyId,
    required BigInt amount,
  }) {
    return Rescinded(
      currencyId: currencyId,
      amount: amount,
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
        return Endowed._decode(input);
      case 1:
        return DustLost._decode(input);
      case 2:
        return Transfer._decode(input);
      case 3:
        return Reserved._decode(input);
      case 4:
        return Unreserved._decode(input);
      case 5:
        return ReserveRepatriated._decode(input);
      case 6:
        return BalanceSet._decode(input);
      case 7:
        return TotalIssuanceSet._decode(input);
      case 8:
        return Withdrawn._decode(input);
      case 9:
        return Slashed._decode(input);
      case 10:
        return Deposited._decode(input);
      case 11:
        return LockSet._decode(input);
      case 12:
        return LockRemoved._decode(input);
      case 13:
        return Locked._decode(input);
      case 14:
        return Unlocked._decode(input);
      case 15:
        return Issued._decode(input);
      case 16:
        return Rescinded._decode(input);
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
      case Endowed:
        (value as Endowed).encodeTo(output);
        break;
      case DustLost:
        (value as DustLost).encodeTo(output);
        break;
      case Transfer:
        (value as Transfer).encodeTo(output);
        break;
      case Reserved:
        (value as Reserved).encodeTo(output);
        break;
      case Unreserved:
        (value as Unreserved).encodeTo(output);
        break;
      case ReserveRepatriated:
        (value as ReserveRepatriated).encodeTo(output);
        break;
      case BalanceSet:
        (value as BalanceSet).encodeTo(output);
        break;
      case TotalIssuanceSet:
        (value as TotalIssuanceSet).encodeTo(output);
        break;
      case Withdrawn:
        (value as Withdrawn).encodeTo(output);
        break;
      case Slashed:
        (value as Slashed).encodeTo(output);
        break;
      case Deposited:
        (value as Deposited).encodeTo(output);
        break;
      case LockSet:
        (value as LockSet).encodeTo(output);
        break;
      case LockRemoved:
        (value as LockRemoved).encodeTo(output);
        break;
      case Locked:
        (value as Locked).encodeTo(output);
        break;
      case Unlocked:
        (value as Unlocked).encodeTo(output);
        break;
      case Issued:
        (value as Issued).encodeTo(output);
        break;
      case Rescinded:
        (value as Rescinded).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case Endowed:
        return (value as Endowed)._sizeHint();
      case DustLost:
        return (value as DustLost)._sizeHint();
      case Transfer:
        return (value as Transfer)._sizeHint();
      case Reserved:
        return (value as Reserved)._sizeHint();
      case Unreserved:
        return (value as Unreserved)._sizeHint();
      case ReserveRepatriated:
        return (value as ReserveRepatriated)._sizeHint();
      case BalanceSet:
        return (value as BalanceSet)._sizeHint();
      case TotalIssuanceSet:
        return (value as TotalIssuanceSet)._sizeHint();
      case Withdrawn:
        return (value as Withdrawn)._sizeHint();
      case Slashed:
        return (value as Slashed)._sizeHint();
      case Deposited:
        return (value as Deposited)._sizeHint();
      case LockSet:
        return (value as LockSet)._sizeHint();
      case LockRemoved:
        return (value as LockRemoved)._sizeHint();
      case Locked:
        return (value as Locked)._sizeHint();
      case Unlocked:
        return (value as Unlocked)._sizeHint();
      case Issued:
        return (value as Issued)._sizeHint();
      case Rescinded:
        return (value as Rescinded)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// An account was created with some free balance.
class Endowed extends Event {
  const Endowed({
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory Endowed._decode(_i1.Input input) {
    return Endowed(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Endowed': {
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is Endowed &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        amount,
      );
}

/// An account was removed whose balance was non-zero but below
/// ExistentialDeposit, resulting in an outright loss.
class DustLost extends Event {
  const DustLost({
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory DustLost._decode(_i1.Input input) {
    return DustLost(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'DustLost': {
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is DustLost &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        amount,
      );
}

/// Transfer succeeded.
class Transfer extends Event {
  const Transfer({
    required this.currencyId,
    required this.from,
    required this.to,
    required this.amount,
  });

  factory Transfer._decode(_i1.Input input) {
    return Transfer(
      currencyId: _i1.U64Codec.codec.decode(input),
      from: const _i1.U8ArrayCodec(32).decode(input),
      to: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 from;

  /// T::AccountId
  final _i3.AccountId32 to;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Transfer': {
          'currencyId': currencyId,
          'from': from.toList(),
          'to': to.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
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
    _i1.U64Codec.codec.encodeTo(
      currencyId,
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
      other is Transfer &&
          other.currencyId == currencyId &&
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
        currencyId,
        from,
        to,
        amount,
      );
}

/// Some balance was reserved (moved from free to reserved).
class Reserved extends Event {
  const Reserved({
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory Reserved._decode(_i1.Input input) {
    return Reserved(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Reserved': {
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is Reserved &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        amount,
      );
}

/// Some balance was unreserved (moved from reserved to free).
class Unreserved extends Event {
  const Unreserved({
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory Unreserved._decode(_i1.Input input) {
    return Unreserved(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Unreserved': {
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is Unreserved &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        amount,
      );
}

/// Some reserved balance was repatriated (moved from reserved to
/// another account).
class ReserveRepatriated extends Event {
  const ReserveRepatriated({
    required this.currencyId,
    required this.from,
    required this.to,
    required this.amount,
    required this.status,
  });

  factory ReserveRepatriated._decode(_i1.Input input) {
    return ReserveRepatriated(
      currencyId: _i1.U64Codec.codec.decode(input),
      from: const _i1.U8ArrayCodec(32).decode(input),
      to: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
      status: _i4.BalanceStatus.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 from;

  /// T::AccountId
  final _i3.AccountId32 to;

  /// T::Balance
  final BigInt amount;

  /// BalanceStatus
  final _i4.BalanceStatus status;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'ReserveRepatriated': {
          'currencyId': currencyId,
          'from': from.toList(),
          'to': to.toList(),
          'amount': amount,
          'status': status.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(from);
    size = size + const _i3.AccountId32Codec().sizeHint(to);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    size = size + _i4.BalanceStatus.codec.sizeHint(status);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
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
    _i4.BalanceStatus.codec.encodeTo(
      status,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ReserveRepatriated &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.from,
            from,
          ) &&
          _i5.listsEqual(
            other.to,
            to,
          ) &&
          other.amount == amount &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        currencyId,
        from,
        to,
        amount,
        status,
      );
}

/// A balance was set by root.
class BalanceSet extends Event {
  const BalanceSet({
    required this.currencyId,
    required this.who,
    required this.free,
    required this.reserved,
  });

  factory BalanceSet._decode(_i1.Input input) {
    return BalanceSet(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      free: _i1.U128Codec.codec.decode(input),
      reserved: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt free;

  /// T::Balance
  final BigInt reserved;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'BalanceSet': {
          'currencyId': currencyId,
          'who': who.toList(),
          'free': free,
          'reserved': reserved,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(free);
    size = size + _i1.U128Codec.codec.sizeHint(reserved);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      free,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      reserved,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BalanceSet &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.free == free &&
          other.reserved == reserved;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        free,
        reserved,
      );
}

/// The total issuance of an currency has been set
class TotalIssuanceSet extends Event {
  const TotalIssuanceSet({
    required this.currencyId,
    required this.amount,
  });

  factory TotalIssuanceSet._decode(_i1.Input input) {
    return TotalIssuanceSet(
      currencyId: _i1.U64Codec.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'TotalIssuanceSet': {
          'currencyId': currencyId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
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
      other is TotalIssuanceSet &&
          other.currencyId == currencyId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        amount,
      );
}

/// Some balances were withdrawn (e.g. pay for transaction fee)
class Withdrawn extends Event {
  const Withdrawn({
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory Withdrawn._decode(_i1.Input input) {
    return Withdrawn(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Withdrawn': {
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is Withdrawn &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        amount,
      );
}

/// Some balances were slashed (e.g. due to mis-behavior)
class Slashed extends Event {
  const Slashed({
    required this.currencyId,
    required this.who,
    required this.freeAmount,
    required this.reservedAmount,
  });

  factory Slashed._decode(_i1.Input input) {
    return Slashed(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      freeAmount: _i1.U128Codec.codec.decode(input),
      reservedAmount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt freeAmount;

  /// T::Balance
  final BigInt reservedAmount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Slashed': {
          'currencyId': currencyId,
          'who': who.toList(),
          'freeAmount': freeAmount,
          'reservedAmount': reservedAmount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(freeAmount);
    size = size + _i1.U128Codec.codec.sizeHint(reservedAmount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      freeAmount,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      reservedAmount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Slashed &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.freeAmount == freeAmount &&
          other.reservedAmount == reservedAmount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        freeAmount,
        reservedAmount,
      );
}

/// Deposited some balance into an account
class Deposited extends Event {
  const Deposited({
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory Deposited._decode(_i1.Input input) {
    return Deposited(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Deposited': {
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is Deposited &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        amount,
      );
}

/// Some funds are locked
class LockSet extends Event {
  const LockSet({
    required this.lockId,
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory LockSet._decode(_i1.Input input) {
    return LockSet(
      lockId: const _i1.U8ArrayCodec(8).decode(input),
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// LockIdentifier
  final List<int> lockId;

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'LockSet': {
          'lockId': lockId.toList(),
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(8).sizeHint(lockId);
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    const _i1.U8ArrayCodec(8).encodeTo(
      lockId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is LockSet &&
          _i5.listsEqual(
            other.lockId,
            lockId,
          ) &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        lockId,
        currencyId,
        who,
        amount,
      );
}

/// Some locked funds were unlocked
class LockRemoved extends Event {
  const LockRemoved({
    required this.lockId,
    required this.currencyId,
    required this.who,
  });

  factory LockRemoved._decode(_i1.Input input) {
    return LockRemoved(
      lockId: const _i1.U8ArrayCodec(8).decode(input),
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// LockIdentifier
  final List<int> lockId;

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'LockRemoved': {
          'lockId': lockId.toList(),
          'currencyId': currencyId,
          'who': who.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(8).sizeHint(lockId);
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    const _i1.U8ArrayCodec(8).encodeTo(
      lockId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is LockRemoved &&
          _i5.listsEqual(
            other.lockId,
            lockId,
          ) &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => Object.hash(
        lockId,
        currencyId,
        who,
      );
}

/// Some free balance was locked.
class Locked extends Event {
  const Locked({
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory Locked._decode(_i1.Input input) {
    return Locked(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Locked': {
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is Locked &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        amount,
      );
}

/// Some locked balance was freed.
class Unlocked extends Event {
  const Unlocked({
    required this.currencyId,
    required this.who,
    required this.amount,
  });

  factory Unlocked._decode(_i1.Input input) {
    return Unlocked(
      currencyId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Unlocked': {
          'currencyId': currencyId,
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
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
      other is Unlocked &&
          other.currencyId == currencyId &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        who,
        amount,
      );
}

class Issued extends Event {
  const Issued({
    required this.currencyId,
    required this.amount,
  });

  factory Issued._decode(_i1.Input input) {
    return Issued(
      currencyId: _i1.U64Codec.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'Issued': {
          'currencyId': currencyId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      15,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
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
      other is Issued &&
          other.currencyId == currencyId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        amount,
      );
}

class Rescinded extends Event {
  const Rescinded({
    required this.currencyId,
    required this.amount,
  });

  factory Rescinded._decode(_i1.Input input) {
    return Rescinded(
      currencyId: _i1.U64Codec.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'Rescinded': {
          'currencyId': currencyId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
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
      other is Rescinded &&
          other.currencyId == currencyId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        currencyId,
        amount,
      );
}
