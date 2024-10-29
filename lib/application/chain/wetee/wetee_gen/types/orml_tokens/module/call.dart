// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../sp_runtime/multiaddress/multi_address.dart' as _i3;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

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

class $Call {
  const $Call();

  Transfer transfer({
    required _i3.MultiAddress dest,
    required BigInt currencyId,
    required BigInt amount,
  }) {
    return Transfer(
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
  }

  TransferAll transferAll({
    required _i3.MultiAddress dest,
    required BigInt currencyId,
    required bool keepAlive,
  }) {
    return TransferAll(
      dest: dest,
      currencyId: currencyId,
      keepAlive: keepAlive,
    );
  }

  TransferKeepAlive transferKeepAlive({
    required _i3.MultiAddress dest,
    required BigInt currencyId,
    required BigInt amount,
  }) {
    return TransferKeepAlive(
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
  }

  ForceTransfer forceTransfer({
    required _i3.MultiAddress source,
    required _i3.MultiAddress dest,
    required BigInt currencyId,
    required BigInt amount,
  }) {
    return ForceTransfer(
      source: source,
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
  }

  SetBalance setBalance({
    required _i3.MultiAddress who,
    required BigInt currencyId,
    required BigInt newFree,
    required BigInt newReserved,
  }) {
    return SetBalance(
      who: who,
      currencyId: currencyId,
      newFree: newFree,
      newReserved: newReserved,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Transfer._decode(input);
      case 1:
        return TransferAll._decode(input);
      case 2:
        return TransferKeepAlive._decode(input);
      case 3:
        return ForceTransfer._decode(input);
      case 4:
        return SetBalance._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Transfer:
        (value as Transfer).encodeTo(output);
        break;
      case TransferAll:
        (value as TransferAll).encodeTo(output);
        break;
      case TransferKeepAlive:
        (value as TransferKeepAlive).encodeTo(output);
        break;
      case ForceTransfer:
        (value as ForceTransfer).encodeTo(output);
        break;
      case SetBalance:
        (value as SetBalance).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case Transfer:
        return (value as Transfer)._sizeHint();
      case TransferAll:
        return (value as TransferAll)._sizeHint();
      case TransferKeepAlive:
        return (value as TransferKeepAlive)._sizeHint();
      case ForceTransfer:
        return (value as ForceTransfer)._sizeHint();
      case SetBalance:
        return (value as SetBalance)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Transfer some liquid free balance to another account.
///
/// `transfer` will set the `FreeBalance` of the sender and receiver.
/// It will decrease the total issuance of the system by the
/// `TransferFee`. If the sender's account is below the existential
/// deposit as a result of the transfer, the account will be reaped.
///
/// The dispatch origin for this call must be `Signed` by the
/// transactor.
///
/// - `dest`: The recipient of the transfer.
/// - `currency_id`: currency type.
/// - `amount`: free balance amount to tranfer.
class Transfer extends Call {
  const Transfer({
    required this.dest,
    required this.currencyId,
    required this.amount,
  });

  factory Transfer._decode(_i1.Input input) {
    return Transfer(
      dest: _i3.MultiAddress.codec.decode(input),
      currencyId: _i1.U64Codec.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// <T::Lookup as StaticLookup>::Source
  final _i3.MultiAddress dest;

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer': {
          'dest': dest.toJson(),
          'currencyId': currencyId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
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
          other.dest == dest &&
          other.currencyId == currencyId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        dest,
        currencyId,
        amount,
      );
}

/// Transfer all remaining balance to the given account.
///
/// NOTE: This function only attempts to transfer _transferable_
/// balances. This means that any locked, reserved, or existential
/// deposits (when `keep_alive` is `true`), will not be transferred by
/// this function. To ensure that this function results in a killed
/// account, you might need to prepare the account by removing any
/// reference counters, storage deposits, etc...
///
/// The dispatch origin for this call must be `Signed` by the
/// transactor.
///
/// - `dest`: The recipient of the transfer.
/// - `currency_id`: currency type.
/// - `keep_alive`: A boolean to determine if the `transfer_all`
///  operation should send all of the funds the account has, causing
///  the sender account to be killed (false), or transfer everything
///  except at least the existential deposit, which will guarantee to
///  keep the sender account alive (true).
class TransferAll extends Call {
  const TransferAll({
    required this.dest,
    required this.currencyId,
    required this.keepAlive,
  });

  factory TransferAll._decode(_i1.Input input) {
    return TransferAll(
      dest: _i3.MultiAddress.codec.decode(input),
      currencyId: _i1.U64Codec.codec.decode(input),
      keepAlive: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// <T::Lookup as StaticLookup>::Source
  final _i3.MultiAddress dest;

  /// T::CurrencyId
  final BigInt currencyId;

  /// bool
  final bool keepAlive;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer_all': {
          'dest': dest.toJson(),
          'currencyId': currencyId,
          'keepAlive': keepAlive,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + _i1.BoolCodec.codec.sizeHint(keepAlive);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      keepAlive,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TransferAll &&
          other.dest == dest &&
          other.currencyId == currencyId &&
          other.keepAlive == keepAlive;

  @override
  int get hashCode => Object.hash(
        dest,
        currencyId,
        keepAlive,
      );
}

/// Same as the [`transfer`] call, but with a check that the transfer
/// will not kill the origin account.
///
/// 99% of the time you want [`transfer`] instead.
///
/// The dispatch origin for this call must be `Signed` by the
/// transactor.
///
/// - `dest`: The recipient of the transfer.
/// - `currency_id`: currency type.
/// - `amount`: free balance amount to tranfer.
class TransferKeepAlive extends Call {
  const TransferKeepAlive({
    required this.dest,
    required this.currencyId,
    required this.amount,
  });

  factory TransferKeepAlive._decode(_i1.Input input) {
    return TransferKeepAlive(
      dest: _i3.MultiAddress.codec.decode(input),
      currencyId: _i1.U64Codec.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// <T::Lookup as StaticLookup>::Source
  final _i3.MultiAddress dest;

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer_keep_alive': {
          'dest': dest.toJson(),
          'currencyId': currencyId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
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
      other is TransferKeepAlive &&
          other.dest == dest &&
          other.currencyId == currencyId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        dest,
        currencyId,
        amount,
      );
}

/// Exactly as `transfer`, except the origin must be root and the source
/// account may be specified.
///
/// The dispatch origin for this call must be _Root_.
///
/// - `source`: The sender of the transfer.
/// - `dest`: The recipient of the transfer.
/// - `currency_id`: currency type.
/// - `amount`: free balance amount to tranfer.
class ForceTransfer extends Call {
  const ForceTransfer({
    required this.source,
    required this.dest,
    required this.currencyId,
    required this.amount,
  });

  factory ForceTransfer._decode(_i1.Input input) {
    return ForceTransfer(
      source: _i3.MultiAddress.codec.decode(input),
      dest: _i3.MultiAddress.codec.decode(input),
      currencyId: _i1.U64Codec.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// <T::Lookup as StaticLookup>::Source
  final _i3.MultiAddress source;

  /// <T::Lookup as StaticLookup>::Source
  final _i3.MultiAddress dest;

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_transfer': {
          'source': source.toJson(),
          'dest': dest.toJson(),
          'currencyId': currencyId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(source);
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      source,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
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
      other is ForceTransfer &&
          other.source == source &&
          other.dest == dest &&
          other.currencyId == currencyId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        source,
        dest,
        currencyId,
        amount,
      );
}

/// Set the balances of a given account.
///
/// This will alter `FreeBalance` and `ReservedBalance` in storage. it
/// will also decrease the total issuance of the system
/// (`TotalIssuance`). If the new free or reserved balance is below the
/// existential deposit, it will reap the `AccountInfo`.
///
/// The dispatch origin for this call is `root`.
class SetBalance extends Call {
  const SetBalance({
    required this.who,
    required this.currencyId,
    required this.newFree,
    required this.newReserved,
  });

  factory SetBalance._decode(_i1.Input input) {
    return SetBalance(
      who: _i3.MultiAddress.codec.decode(input),
      currencyId: _i1.U64Codec.codec.decode(input),
      newFree: _i1.CompactBigIntCodec.codec.decode(input),
      newReserved: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// <T::Lookup as StaticLookup>::Source
  final _i3.MultiAddress who;

  /// T::CurrencyId
  final BigInt currencyId;

  /// T::Balance
  final BigInt newFree;

  /// T::Balance
  final BigInt newReserved;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_balance': {
          'who': who.toJson(),
          'currencyId': currencyId,
          'newFree': newFree,
          'newReserved': newReserved,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    size = size + _i1.U64Codec.codec.sizeHint(currencyId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(newFree);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(newReserved);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      who,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      currencyId,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      newFree,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      newReserved,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetBalance &&
          other.who == who &&
          other.currencyId == currencyId &&
          other.newFree == newFree &&
          other.newReserved == newReserved;

  @override
  int get hashCode => Object.hash(
        who,
        currencyId,
        newFree,
        newReserved,
      );
}
