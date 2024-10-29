// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../../sp_core/crypto/account_id32.dart' as _i4;
import '../../sp_runtime/multiaddress/multi_address.dart' as _i3;
import '../types/adjustment_direction.dart' as _i5;

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

  TransferAllowDeath transferAllowDeath({
    required _i3.MultiAddress dest,
    required BigInt value,
  }) {
    return TransferAllowDeath(
      dest: dest,
      value: value,
    );
  }

  ForceTransfer forceTransfer({
    required _i3.MultiAddress source,
    required _i3.MultiAddress dest,
    required BigInt value,
  }) {
    return ForceTransfer(
      source: source,
      dest: dest,
      value: value,
    );
  }

  TransferKeepAlive transferKeepAlive({
    required _i3.MultiAddress dest,
    required BigInt value,
  }) {
    return TransferKeepAlive(
      dest: dest,
      value: value,
    );
  }

  TransferAll transferAll({
    required _i3.MultiAddress dest,
    required bool keepAlive,
  }) {
    return TransferAll(
      dest: dest,
      keepAlive: keepAlive,
    );
  }

  ForceUnreserve forceUnreserve({
    required _i3.MultiAddress who,
    required BigInt amount,
  }) {
    return ForceUnreserve(
      who: who,
      amount: amount,
    );
  }

  UpgradeAccounts upgradeAccounts({required List<_i4.AccountId32> who}) {
    return UpgradeAccounts(who: who);
  }

  ForceSetBalance forceSetBalance({
    required _i3.MultiAddress who,
    required BigInt newFree,
  }) {
    return ForceSetBalance(
      who: who,
      newFree: newFree,
    );
  }

  ForceAdjustTotalIssuance forceAdjustTotalIssuance({
    required _i5.AdjustmentDirection direction,
    required BigInt delta,
  }) {
    return ForceAdjustTotalIssuance(
      direction: direction,
      delta: delta,
    );
  }

  Burn burn({
    required BigInt value,
    required bool keepAlive,
  }) {
    return Burn(
      value: value,
      keepAlive: keepAlive,
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
        return TransferAllowDeath._decode(input);
      case 2:
        return ForceTransfer._decode(input);
      case 3:
        return TransferKeepAlive._decode(input);
      case 4:
        return TransferAll._decode(input);
      case 5:
        return ForceUnreserve._decode(input);
      case 6:
        return UpgradeAccounts._decode(input);
      case 8:
        return ForceSetBalance._decode(input);
      case 9:
        return ForceAdjustTotalIssuance._decode(input);
      case 10:
        return Burn._decode(input);
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
      case TransferAllowDeath:
        (value as TransferAllowDeath).encodeTo(output);
        break;
      case ForceTransfer:
        (value as ForceTransfer).encodeTo(output);
        break;
      case TransferKeepAlive:
        (value as TransferKeepAlive).encodeTo(output);
        break;
      case TransferAll:
        (value as TransferAll).encodeTo(output);
        break;
      case ForceUnreserve:
        (value as ForceUnreserve).encodeTo(output);
        break;
      case UpgradeAccounts:
        (value as UpgradeAccounts).encodeTo(output);
        break;
      case ForceSetBalance:
        (value as ForceSetBalance).encodeTo(output);
        break;
      case ForceAdjustTotalIssuance:
        (value as ForceAdjustTotalIssuance).encodeTo(output);
        break;
      case Burn:
        (value as Burn).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case TransferAllowDeath:
        return (value as TransferAllowDeath)._sizeHint();
      case ForceTransfer:
        return (value as ForceTransfer)._sizeHint();
      case TransferKeepAlive:
        return (value as TransferKeepAlive)._sizeHint();
      case TransferAll:
        return (value as TransferAll)._sizeHint();
      case ForceUnreserve:
        return (value as ForceUnreserve)._sizeHint();
      case UpgradeAccounts:
        return (value as UpgradeAccounts)._sizeHint();
      case ForceSetBalance:
        return (value as ForceSetBalance)._sizeHint();
      case ForceAdjustTotalIssuance:
        return (value as ForceAdjustTotalIssuance)._sizeHint();
      case Burn:
        return (value as Burn)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Transfer some liquid free balance to another account.
///
/// `transfer_allow_death` will set the `FreeBalance` of the sender and receiver.
/// If the sender's account is below the existential deposit as a result
/// of the transfer, the account will be reaped.
///
/// The dispatch origin for this call must be `Signed` by the transactor.
class TransferAllowDeath extends Call {
  const TransferAllowDeath({
    required this.dest,
    required this.value,
  });

  factory TransferAllowDeath._decode(_i1.Input input) {
    return TransferAllowDeath(
      dest: _i3.MultiAddress.codec.decode(input),
      value: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// T::Balance
  final BigInt value;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer_allow_death': {
          'dest': dest.toJson(),
          'value': value,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
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
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TransferAllowDeath && other.dest == dest && other.value == value;

  @override
  int get hashCode => Object.hash(
        dest,
        value,
      );
}

/// Exactly as `transfer_allow_death`, except the origin must be root and the source account
/// may be specified.
class ForceTransfer extends Call {
  const ForceTransfer({
    required this.source,
    required this.dest,
    required this.value,
  });

  factory ForceTransfer._decode(_i1.Input input) {
    return ForceTransfer(
      source: _i3.MultiAddress.codec.decode(input),
      dest: _i3.MultiAddress.codec.decode(input),
      value: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress source;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// T::Balance
  final BigInt value;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_transfer': {
          'source': source.toJson(),
          'dest': dest.toJson(),
          'value': value,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(source);
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
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
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
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
          other.value == value;

  @override
  int get hashCode => Object.hash(
        source,
        dest,
        value,
      );
}

/// Same as the [`transfer_allow_death`] call, but with a check that the transfer will not
/// kill the origin account.
///
/// 99% of the time you want [`transfer_allow_death`] instead.
///
/// [`transfer_allow_death`]: struct.Pallet.html#method.transfer
class TransferKeepAlive extends Call {
  const TransferKeepAlive({
    required this.dest,
    required this.value,
  });

  factory TransferKeepAlive._decode(_i1.Input input) {
    return TransferKeepAlive(
      dest: _i3.MultiAddress.codec.decode(input),
      value: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// T::Balance
  final BigInt value;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer_keep_alive': {
          'dest': dest.toJson(),
          'value': value,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TransferKeepAlive && other.dest == dest && other.value == value;

  @override
  int get hashCode => Object.hash(
        dest,
        value,
      );
}

/// Transfer the entire transferable balance from the caller account.
///
/// NOTE: This function only attempts to transfer _transferable_ balances. This means that
/// any locked, reserved, or existential deposits (when `keep_alive` is `true`), will not be
/// transferred by this function. To ensure that this function results in a killed account,
/// you might need to prepare the account by removing any reference counters, storage
/// deposits, etc...
///
/// The dispatch origin of this call must be Signed.
///
/// - `dest`: The recipient of the transfer.
/// - `keep_alive`: A boolean to determine if the `transfer_all` operation should send all
///  of the funds the account has, causing the sender account to be killed (false), or
///  transfer everything except at least the existential deposit, which will guarantee to
///  keep the sender account alive (true).
class TransferAll extends Call {
  const TransferAll({
    required this.dest,
    required this.keepAlive,
  });

  factory TransferAll._decode(_i1.Input input) {
    return TransferAll(
      dest: _i3.MultiAddress.codec.decode(input),
      keepAlive: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// bool
  final bool keepAlive;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer_all': {
          'dest': dest.toJson(),
          'keepAlive': keepAlive,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.BoolCodec.codec.sizeHint(keepAlive);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
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
          other.keepAlive == keepAlive;

  @override
  int get hashCode => Object.hash(
        dest,
        keepAlive,
      );
}

/// Unreserve some balance from a user by force.
///
/// Can only be called by ROOT.
class ForceUnreserve extends Call {
  const ForceUnreserve({
    required this.who,
    required this.amount,
  });

  factory ForceUnreserve._decode(_i1.Input input) {
    return ForceUnreserve(
      who: _i3.MultiAddress.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_unreserve': {
          'who': who.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
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
      other is ForceUnreserve && other.who == who && other.amount == amount;

  @override
  int get hashCode => Object.hash(
        who,
        amount,
      );
}

/// Upgrade a specified account.
///
/// - `origin`: Must be `Signed`.
/// - `who`: The account to be upgraded.
///
/// This will waive the transaction fee if at least all but 10% of the accounts needed to
/// be upgraded. (We let some not have to be upgraded just in order to allow for the
/// possibility of churn).
class UpgradeAccounts extends Call {
  const UpgradeAccounts({required this.who});

  factory UpgradeAccounts._decode(_i1.Input input) {
    return UpgradeAccounts(
        who: const _i1.SequenceCodec<_i4.AccountId32>(_i4.AccountId32Codec())
            .decode(input));
  }

  /// Vec<T::AccountId>
  final List<_i4.AccountId32> who;

  @override
  Map<String, Map<String, List<List<int>>>> toJson() => {
        'upgrade_accounts': {'who': who.map((value) => value.toList()).toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.SequenceCodec<_i4.AccountId32>(_i4.AccountId32Codec())
            .sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    const _i1.SequenceCodec<_i4.AccountId32>(_i4.AccountId32Codec()).encodeTo(
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
      other is UpgradeAccounts &&
          _i6.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => who.hashCode;
}

/// Set the regular balance of a given account.
///
/// The dispatch origin for this call is `root`.
class ForceSetBalance extends Call {
  const ForceSetBalance({
    required this.who,
    required this.newFree,
  });

  factory ForceSetBalance._decode(_i1.Input input) {
    return ForceSetBalance(
      who: _i3.MultiAddress.codec.decode(input),
      newFree: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress who;

  /// T::Balance
  final BigInt newFree;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_set_balance': {
          'who': who.toJson(),
          'newFree': newFree,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(newFree);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      who,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      newFree,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceSetBalance && other.who == who && other.newFree == newFree;

  @override
  int get hashCode => Object.hash(
        who,
        newFree,
      );
}

/// Adjust the total issuance in a saturating way.
///
/// Can only be called by root and always needs a positive `delta`.
///
/// # Example
class ForceAdjustTotalIssuance extends Call {
  const ForceAdjustTotalIssuance({
    required this.direction,
    required this.delta,
  });

  factory ForceAdjustTotalIssuance._decode(_i1.Input input) {
    return ForceAdjustTotalIssuance(
      direction: _i5.AdjustmentDirection.codec.decode(input),
      delta: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// AdjustmentDirection
  final _i5.AdjustmentDirection direction;

  /// T::Balance
  final BigInt delta;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_adjust_total_issuance': {
          'direction': direction.toJson(),
          'delta': delta,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i5.AdjustmentDirection.codec.sizeHint(direction);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(delta);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i5.AdjustmentDirection.codec.encodeTo(
      direction,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      delta,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceAdjustTotalIssuance &&
          other.direction == direction &&
          other.delta == delta;

  @override
  int get hashCode => Object.hash(
        direction,
        delta,
      );
}

/// Burn the specified liquid free balance from the origin account.
///
/// If the origin's account ends up below the existential deposit as a result
/// of the burn and `keep_alive` is false, the account will be reaped.
///
/// Unlike sending funds to a _burn_ address, which merely makes the funds inaccessible,
/// this `burn` operation will reduce total issuance by the amount _burned_.
class Burn extends Call {
  const Burn({
    required this.value,
    required this.keepAlive,
  });

  factory Burn._decode(_i1.Input input) {
    return Burn(
      value: _i1.CompactBigIntCodec.codec.decode(input),
      keepAlive: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// T::Balance
  final BigInt value;

  /// bool
  final bool keepAlive;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'burn': {
          'value': value,
          'keepAlive': keepAlive,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    size = size + _i1.BoolCodec.codec.sizeHint(keepAlive);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
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
      other is Burn && other.value == value && other.keepAlive == keepAlive;

  @override
  int get hashCode => Object.hash(
        value,
        keepAlive,
      );
}
