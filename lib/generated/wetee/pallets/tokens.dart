// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/orml_tokens/account_data.dart' as _i5;
import '../types/orml_tokens/balance_lock.dart' as _i4;
import '../types/orml_tokens/module/call.dart' as _i9;
import '../types/orml_tokens/reserve_data.dart' as _i6;
import '../types/sp_core/crypto/account_id32.dart' as _i3;
import '../types/wetee_runtime/runtime_call.dart' as _i8;

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
}

class Txs {
  const Txs();

  /// See [`Pallet::transfer`].
  _i8.RuntimeCall transfer({
    required dest,
    required currencyId,
    required amount,
  }) {
    final _call = _i9.Call.values.transfer(
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
    return _i8.RuntimeCall.values.tokens(_call);
  }

  /// See [`Pallet::transfer_all`].
  _i8.RuntimeCall transferAll({
    required dest,
    required currencyId,
    required keepAlive,
  }) {
    final _call = _i9.Call.values.transferAll(
      dest: dest,
      currencyId: currencyId,
      keepAlive: keepAlive,
    );
    return _i8.RuntimeCall.values.tokens(_call);
  }

  /// See [`Pallet::transfer_keep_alive`].
  _i8.RuntimeCall transferKeepAlive({
    required dest,
    required currencyId,
    required amount,
  }) {
    final _call = _i9.Call.values.transferKeepAlive(
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
    return _i8.RuntimeCall.values.tokens(_call);
  }

  /// See [`Pallet::force_transfer`].
  _i8.RuntimeCall forceTransfer({
    required source,
    required dest,
    required currencyId,
    required amount,
  }) {
    final _call = _i9.Call.values.forceTransfer(
      source: source,
      dest: dest,
      currencyId: currencyId,
      amount: amount,
    );
    return _i8.RuntimeCall.values.tokens(_call);
  }

  /// See [`Pallet::set_balance`].
  _i8.RuntimeCall setBalance({
    required who,
    required currencyId,
    required newFree,
    required newReserved,
  }) {
    final _call = _i9.Call.values.setBalance(
      who: who,
      currencyId: currencyId,
      newFree: newFree,
      newReserved: newReserved,
    );
    return _i8.RuntimeCall.values.tokens(_call);
  }
}

class Constants {
  Constants();

  final int maxLocks = 50;

  /// The maximum number of named reserves that can exist on an account.
  final int maxReserves = 50;
}
