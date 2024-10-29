// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i8;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/orml_tokens/account_data.dart' as _i5;
import '../types/orml_tokens/balance_lock.dart' as _i4;
import '../types/orml_tokens/module/call.dart' as _i11;
import '../types/orml_tokens/reserve_data.dart' as _i6;
import '../types/sp_core/crypto/account_id32.dart' as _i3;
import '../types/sp_runtime/multiaddress/multi_address.dart' as _i10;
import '../types/wetee_runtime/runtime_call.dart' as _i9;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, BigInt> _totalIssuance =
      const _i1.StorageMap<BigInt, BigInt>(
    prefix: 'Tokens',
    storage: 'TotalIssuance',
    valueCodec: _i2.U128Codec.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i2.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<_i3.AccountId32, BigInt, List<_i4.BalanceLock>>
      _locks = const _i1
          .StorageDoubleMap<_i3.AccountId32, BigInt, List<_i4.BalanceLock>>(
    prefix: 'Tokens',
    storage: 'Locks',
    valueCodec: _i2.SequenceCodec<_i4.BalanceLock>(_i4.BalanceLock.codec),
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.AccountId32Codec()),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i2.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i5.AccountData>
      _accounts =
      const _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i5.AccountData>(
    prefix: 'Tokens',
    storage: 'Accounts',
    valueCodec: _i5.AccountData.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.AccountId32Codec()),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i2.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<_i3.AccountId32, BigInt, List<_i6.ReserveData>>
      _reserves = const _i1
          .StorageDoubleMap<_i3.AccountId32, BigInt, List<_i6.ReserveData>>(
    prefix: 'Tokens',
    storage: 'Reserves',
    valueCodec: _i2.SequenceCodec<_i6.ReserveData>(_i6.ReserveData.codec),
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.AccountId32Codec()),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i2.U64Codec.codec),
  );

  /// The total issuance of a token type.
  _i7.Future<BigInt> totalIssuance(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _totalIssuance.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _totalIssuance.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// Any liquidity locks of a token type under an account.
  /// NOTE: Should only be accessed when setting, changing and freeing a lock.
  _i7.Future<List<_i4.BalanceLock>> locks(
    _i3.AccountId32 key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _locks.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _locks.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// The balance of a token type under an account.
  ///
  /// NOTE: If the total is ever zero, decrease account ref account.
  ///
  /// NOTE: This is only used in the case that this module is used to store
  /// balances.
  _i7.Future<_i5.AccountData> accounts(
    _i3.AccountId32 key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _accounts.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _accounts.decodeValue(bytes);
    }
    return _i5.AccountData(
      free: BigInt.zero,
      reserved: BigInt.zero,
      frozen: BigInt.zero,
    ); /* Default */
  }

  /// Named reserves on some account balances.
  _i7.Future<List<_i6.ReserveData>> reserves(
    _i3.AccountId32 key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _reserves.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _reserves.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Returns the storage key for `totalIssuance`.
  _i8.Uint8List totalIssuanceKey(BigInt key1) {
    final hashedKey = _totalIssuance.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `locks`.
  _i8.Uint8List locksKey(
    _i3.AccountId32 key1,
    BigInt key2,
  ) {
    final hashedKey = _locks.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `accounts`.
  _i8.Uint8List accountsKey(
    _i3.AccountId32 key1,
    BigInt key2,
  ) {
    final hashedKey = _accounts.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `reserves`.
  _i8.Uint8List reservesKey(
    _i3.AccountId32 key1,
    BigInt key2,
  ) {
    final hashedKey = _reserves.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage map key prefix for `totalIssuance`.
  _i8.Uint8List totalIssuanceMapPrefix() {
    final hashedKey = _totalIssuance.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `locks`.
  _i8.Uint8List locksMapPrefix(_i3.AccountId32 key1) {
    final hashedKey = _locks.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `accounts`.
  _i8.Uint8List accountsMapPrefix(_i3.AccountId32 key1) {
    final hashedKey = _accounts.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `reserves`.
  _i8.Uint8List reservesMapPrefix(_i3.AccountId32 key1) {
    final hashedKey = _reserves.mapPrefix(key1);
    return hashedKey;
  }
}

class Txs {
  const Txs();

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
  _i9.RuntimeCall transfer({
    required _i10.MultiAddress dest,
    required BigInt currencyId,
    required BigInt amount,
  }) {
    final _call = _i11.Call.values.transfer(
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
    return _i9.RuntimeCall.values.tokens(_call);
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
  _i9.RuntimeCall transferAll({
    required _i10.MultiAddress dest,
    required BigInt currencyId,
    required bool keepAlive,
  }) {
    final _call = _i11.Call.values.transferAll(
      dest: dest,
      currencyId: currencyId,
      keepAlive: keepAlive,
    );
    return _i9.RuntimeCall.values.tokens(_call);
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
  _i9.RuntimeCall transferKeepAlive({
    required _i10.MultiAddress dest,
    required BigInt currencyId,
    required BigInt amount,
  }) {
    final _call = _i11.Call.values.transferKeepAlive(
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
    return _i9.RuntimeCall.values.tokens(_call);
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
  _i9.RuntimeCall forceTransfer({
    required _i10.MultiAddress source,
    required _i10.MultiAddress dest,
    required BigInt currencyId,
    required BigInt amount,
  }) {
    final _call = _i11.Call.values.forceTransfer(
      source: source,
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
    return _i9.RuntimeCall.values.tokens(_call);
  }

  /// Set the balances of a given account.
  ///
  /// This will alter `FreeBalance` and `ReservedBalance` in storage. it
  /// will also decrease the total issuance of the system
  /// (`TotalIssuance`). If the new free or reserved balance is below the
  /// existential deposit, it will reap the `AccountInfo`.
  ///
  /// The dispatch origin for this call is `root`.
  _i9.RuntimeCall setBalance({
    required _i10.MultiAddress who,
    required BigInt currencyId,
    required BigInt newFree,
    required BigInt newReserved,
  }) {
    final _call = _i11.Call.values.setBalance(
      who: who,
      currencyId: currencyId,
      newFree: newFree,
      newReserved: newReserved,
    );
    return _i9.RuntimeCall.values.tokens(_call);
  }
}

class Constants {
  Constants();

  final int maxLocks = 50;

  /// The maximum number of named reserves that can exist on an account.
  final int maxReserves = 50;
}
