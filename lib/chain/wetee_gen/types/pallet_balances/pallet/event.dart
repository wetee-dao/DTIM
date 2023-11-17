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
    required _i3.AccountId32 account,
    required BigInt freeBalance,
  }) {
    return Endowed(
      account: account,
      freeBalance: freeBalance,
    );
  }

  DustLost dustLost({
    required _i3.AccountId32 account,
    required BigInt amount,
  }) {
    return DustLost(
      account: account,
      amount: amount,
    );
  }

  Transfer transfer({
    required _i3.AccountId32 from,
    required _i3.AccountId32 to,
    required BigInt amount,
  }) {
    return Transfer(
      from: from,
      to: to,
      amount: amount,
    );
  }

  BalanceSet balanceSet({
    required _i3.AccountId32 who,
    required BigInt free,
  }) {
    return BalanceSet(
      who: who,
      free: free,
    );
  }

  Reserved reserved({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Reserved(
      who: who,
      amount: amount,
    );
  }

  Unreserved unreserved({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Unreserved(
      who: who,
      amount: amount,
    );
  }

  ReserveRepatriated reserveRepatriated({
    required _i3.AccountId32 from,
    required _i3.AccountId32 to,
    required BigInt amount,
    required _i4.BalanceStatus destinationStatus,
  }) {
    return ReserveRepatriated(
      from: from,
      to: to,
      amount: amount,
      destinationStatus: destinationStatus,
    );
  }

  Deposit deposit({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Deposit(
      who: who,
      amount: amount,
    );
  }

  Withdraw withdraw({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Withdraw(
      who: who,
      amount: amount,
    );
  }

  Slashed slashed({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Slashed(
      who: who,
      amount: amount,
    );
  }

  Minted minted({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Minted(
      who: who,
      amount: amount,
    );
  }

  Burned burned({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Burned(
      who: who,
      amount: amount,
    );
  }

  Suspended suspended({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Suspended(
      who: who,
      amount: amount,
    );
  }

  Restored restored({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Restored(
      who: who,
      amount: amount,
    );
  }

  Upgraded upgraded({required _i3.AccountId32 who}) {
    return Upgraded(who: who);
  }

  Issued issued({required BigInt amount}) {
    return Issued(amount: amount);
  }

  Rescinded rescinded({required BigInt amount}) {
    return Rescinded(amount: amount);
  }

  Locked locked({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Locked(
      who: who,
      amount: amount,
    );
  }

  Unlocked unlocked({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Unlocked(
      who: who,
      amount: amount,
    );
  }

  Frozen frozen({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Frozen(
      who: who,
      amount: amount,
    );
  }

  Thawed thawed({
    required _i3.AccountId32 who,
    required BigInt amount,
  }) {
    return Thawed(
      who: who,
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
        return BalanceSet._decode(input);
      case 4:
        return Reserved._decode(input);
      case 5:
        return Unreserved._decode(input);
      case 6:
        return ReserveRepatriated._decode(input);
      case 7:
        return Deposit._decode(input);
      case 8:
        return Withdraw._decode(input);
      case 9:
        return Slashed._decode(input);
      case 10:
        return Minted._decode(input);
      case 11:
        return Burned._decode(input);
      case 12:
        return Suspended._decode(input);
      case 13:
        return Restored._decode(input);
      case 14:
        return Upgraded._decode(input);
      case 15:
        return Issued._decode(input);
      case 16:
        return Rescinded._decode(input);
      case 17:
        return Locked._decode(input);
      case 18:
        return Unlocked._decode(input);
      case 19:
        return Frozen._decode(input);
      case 20:
        return Thawed._decode(input);
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
      case BalanceSet:
        (value as BalanceSet).encodeTo(output);
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
      case Deposit:
        (value as Deposit).encodeTo(output);
        break;
      case Withdraw:
        (value as Withdraw).encodeTo(output);
        break;
      case Slashed:
        (value as Slashed).encodeTo(output);
        break;
      case Minted:
        (value as Minted).encodeTo(output);
        break;
      case Burned:
        (value as Burned).encodeTo(output);
        break;
      case Suspended:
        (value as Suspended).encodeTo(output);
        break;
      case Restored:
        (value as Restored).encodeTo(output);
        break;
      case Upgraded:
        (value as Upgraded).encodeTo(output);
        break;
      case Issued:
        (value as Issued).encodeTo(output);
        break;
      case Rescinded:
        (value as Rescinded).encodeTo(output);
        break;
      case Locked:
        (value as Locked).encodeTo(output);
        break;
      case Unlocked:
        (value as Unlocked).encodeTo(output);
        break;
      case Frozen:
        (value as Frozen).encodeTo(output);
        break;
      case Thawed:
        (value as Thawed).encodeTo(output);
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
      case BalanceSet:
        return (value as BalanceSet)._sizeHint();
      case Reserved:
        return (value as Reserved)._sizeHint();
      case Unreserved:
        return (value as Unreserved)._sizeHint();
      case ReserveRepatriated:
        return (value as ReserveRepatriated)._sizeHint();
      case Deposit:
        return (value as Deposit)._sizeHint();
      case Withdraw:
        return (value as Withdraw)._sizeHint();
      case Slashed:
        return (value as Slashed)._sizeHint();
      case Minted:
        return (value as Minted)._sizeHint();
      case Burned:
        return (value as Burned)._sizeHint();
      case Suspended:
        return (value as Suspended)._sizeHint();
      case Restored:
        return (value as Restored)._sizeHint();
      case Upgraded:
        return (value as Upgraded)._sizeHint();
      case Issued:
        return (value as Issued)._sizeHint();
      case Rescinded:
        return (value as Rescinded)._sizeHint();
      case Locked:
        return (value as Locked)._sizeHint();
      case Unlocked:
        return (value as Unlocked)._sizeHint();
      case Frozen:
        return (value as Frozen)._sizeHint();
      case Thawed:
        return (value as Thawed)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// An account was created with some free balance.
class Endowed extends Event {
  const Endowed({
    required this.account,
    required this.freeBalance,
  });

  factory Endowed._decode(_i1.Input input) {
    return Endowed(
      account: const _i1.U8ArrayCodec(32).decode(input),
      freeBalance: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 account;

  /// T::Balance
  final BigInt freeBalance;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Endowed': {
          'account': account.toList(),
          'freeBalance': freeBalance,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(account);
    size = size + _i1.U128Codec.codec.sizeHint(freeBalance);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      account,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      freeBalance,
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
          _i5.listsEqual(
            other.account,
            account,
          ) &&
          other.freeBalance == freeBalance;

  @override
  int get hashCode => Object.hash(
        account,
        freeBalance,
      );
}

/// An account was removed whose balance was non-zero but below ExistentialDeposit,
/// resulting in an outright loss.
class DustLost extends Event {
  const DustLost({
    required this.account,
    required this.amount,
  });

  factory DustLost._decode(_i1.Input input) {
    return DustLost(
      account: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 account;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'DustLost': {
          'account': account.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(account);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      account,
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
          _i5.listsEqual(
            other.account,
            account,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        account,
        amount,
      );
}

/// Transfer succeeded.
class Transfer extends Event {
  const Transfer({
    required this.from,
    required this.to,
    required this.amount,
  });

  factory Transfer._decode(_i1.Input input) {
    return Transfer(
      from: const _i1.U8ArrayCodec(32).decode(input),
      to: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 from;

  /// T::AccountId
  final _i3.AccountId32 to;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Transfer': {
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
      other is Transfer &&
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

/// A balance was set by root.
class BalanceSet extends Event {
  const BalanceSet({
    required this.who,
    required this.free,
  });

  factory BalanceSet._decode(_i1.Input input) {
    return BalanceSet(
      who: const _i1.U8ArrayCodec(32).decode(input),
      free: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt free;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'BalanceSet': {
          'who': who.toList(),
          'free': free,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(free);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
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
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BalanceSet &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.free == free;

  @override
  int get hashCode => Object.hash(
        who,
        free,
      );
}

/// Some balance was reserved (moved from free to reserved).
class Reserved extends Event {
  const Reserved({
    required this.who,
    required this.amount,
  });

  factory Reserved._decode(_i1.Input input) {
    return Reserved(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Reserved': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
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
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some balance was unreserved (moved from reserved to free).
class Unreserved extends Event {
  const Unreserved({
    required this.who,
    required this.amount,
  });

  factory Unreserved._decode(_i1.Input input) {
    return Unreserved(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Unreserved': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
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
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some balance was moved from the reserve of the first account to the second account.
/// Final argument indicates the destination balance type.
class ReserveRepatriated extends Event {
  const ReserveRepatriated({
    required this.from,
    required this.to,
    required this.amount,
    required this.destinationStatus,
  });

  factory ReserveRepatriated._decode(_i1.Input input) {
    return ReserveRepatriated(
      from: const _i1.U8ArrayCodec(32).decode(input),
      to: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
      destinationStatus: _i4.BalanceStatus.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 from;

  /// T::AccountId
  final _i3.AccountId32 to;

  /// T::Balance
  final BigInt amount;

  /// Status
  final _i4.BalanceStatus destinationStatus;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'ReserveRepatriated': {
          'from': from.toList(),
          'to': to.toList(),
          'amount': amount,
          'destinationStatus': destinationStatus.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(from);
    size = size + const _i3.AccountId32Codec().sizeHint(to);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    size = size + _i4.BalanceStatus.codec.sizeHint(destinationStatus);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
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
      destinationStatus,
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
          _i5.listsEqual(
            other.from,
            from,
          ) &&
          _i5.listsEqual(
            other.to,
            to,
          ) &&
          other.amount == amount &&
          other.destinationStatus == destinationStatus;

  @override
  int get hashCode => Object.hash(
        from,
        to,
        amount,
        destinationStatus,
      );
}

/// Some amount was deposited (e.g. for transaction fees).
class Deposit extends Event {
  const Deposit({
    required this.who,
    required this.amount,
  });

  factory Deposit._decode(_i1.Input input) {
    return Deposit(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Deposit': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
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
      other is Deposit &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some amount was withdrawn from the account (e.g. for transaction fees).
class Withdraw extends Event {
  const Withdraw({
    required this.who,
    required this.amount,
  });

  factory Withdraw._decode(_i1.Input input) {
    return Withdraw(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Withdraw': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
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
      other is Withdraw &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some amount was removed from the account (e.g. for misbehavior).
class Slashed extends Event {
  const Slashed({
    required this.who,
    required this.amount,
  });

  factory Slashed._decode(_i1.Input input) {
    return Slashed(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Slashed': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
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
      other is Slashed &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some amount was minted into an account.
class Minted extends Event {
  const Minted({
    required this.who,
    required this.amount,
  });

  factory Minted._decode(_i1.Input input) {
    return Minted(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Minted': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
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
      other is Minted &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some amount was burned from an account.
class Burned extends Event {
  const Burned({
    required this.who,
    required this.amount,
  });

  factory Burned._decode(_i1.Input input) {
    return Burned(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Burned': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
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
      other is Burned &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some amount was suspended from an account (it can be restored later).
class Suspended extends Event {
  const Suspended({
    required this.who,
    required this.amount,
  });

  factory Suspended._decode(_i1.Input input) {
    return Suspended(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Suspended': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
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
      other is Suspended &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some amount was restored into an account.
class Restored extends Event {
  const Restored({
    required this.who,
    required this.amount,
  });

  factory Restored._decode(_i1.Input input) {
    return Restored(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Restored': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
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
      other is Restored &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// An account was upgraded.
class Upgraded extends Event {
  const Upgraded({required this.who});

  factory Upgraded._decode(_i1.Input input) {
    return Upgraded(who: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'Upgraded': {'who': who.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
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
      other is Upgraded &&
          _i5.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => who.hashCode;
}

/// Total issuance was increased by `amount`, creating a credit to be balanced.
class Issued extends Event {
  const Issued({required this.amount});

  factory Issued._decode(_i1.Input input) {
    return Issued(amount: _i1.U128Codec.codec.decode(input));
  }

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'Issued': {'amount': amount}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      15,
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
      other is Issued && other.amount == amount;

  @override
  int get hashCode => amount.hashCode;
}

/// Total issuance was decreased by `amount`, creating a debt to be balanced.
class Rescinded extends Event {
  const Rescinded({required this.amount});

  factory Rescinded._decode(_i1.Input input) {
    return Rescinded(amount: _i1.U128Codec.codec.decode(input));
  }

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'Rescinded': {'amount': amount}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
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
      other is Rescinded && other.amount == amount;

  @override
  int get hashCode => amount.hashCode;
}

/// Some balance was locked.
class Locked extends Event {
  const Locked({
    required this.who,
    required this.amount,
  });

  factory Locked._decode(_i1.Input input) {
    return Locked(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Locked': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      17,
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
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some balance was unlocked.
class Unlocked extends Event {
  const Unlocked({
    required this.who,
    required this.amount,
  });

  factory Unlocked._decode(_i1.Input input) {
    return Unlocked(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Unlocked': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      18,
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
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some balance was frozen.
class Frozen extends Event {
  const Frozen({
    required this.who,
    required this.amount,
  });

  factory Frozen._decode(_i1.Input input) {
    return Frozen(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Frozen': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      19,
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
      other is Frozen &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Some balance was thawed.
class Thawed extends Event {
  const Thawed({
    required this.who,
    required this.amount,
  });

  factory Thawed._decode(_i1.Input input) {
    return Thawed(
      who: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Thawed': {
          'who': who.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      20,
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
      other is Thawed &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}
