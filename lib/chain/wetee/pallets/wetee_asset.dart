// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/wetee_assets/dao_asset_info.dart' as _i2;
import '../types/wetee_assets/pallet/call.dart' as _i6;
import '../types/wetee_runtime/runtime_call.dart' as _i5;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, _i2.DaoAssetInfo> _daoAssetsInfo =
      const _i1.StorageMap<BigInt, _i2.DaoAssetInfo>(
    prefix: 'WeteeAsset',
    storage: 'DaoAssetsInfo',
    valueCodec: _i2.DaoAssetInfo.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, int> _usersNumber =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeteeAsset',
    storage: 'UsersNumber',
    valueCodec: _i3.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, BigInt> _existentDeposits =
      const _i1.StorageMap<BigInt, BigInt>(
    prefix: 'WeteeAsset',
    storage: 'ExistentDeposits',
    valueCodec: _i3.U128Codec.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  _i4.Future<_i2.DaoAssetInfo?> daoAssetsInfo(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _daoAssetsInfo.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _daoAssetsInfo.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i4.Future<int> usersNumber(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _usersNumber.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _usersNumber.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  _i4.Future<BigInt> existentDeposits(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _existentDeposits.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _existentDeposits.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::create_asset`].
  _i5.RuntimeCall createAsset({
    required daoId,
    required metadata,
    required amount,
    required initDaoAsset,
  }) {
    final _call = _i6.Call.values.createAsset(
      daoId: daoId,
      metadata: metadata,
      amount: amount,
      initDaoAsset: initDaoAsset,
    );
    return _i5.RuntimeCall.values.weteeAsset(_call);
  }

  /// See [`Pallet::set_existenial_deposit`].
  _i5.RuntimeCall setExistenialDeposit({
    required daoId,
    required existenialDeposit,
  }) {
    final _call = _i6.Call.values.setExistenialDeposit(
      daoId: daoId,
      existenialDeposit: existenialDeposit,
    );
    return _i5.RuntimeCall.values.weteeAsset(_call);
  }

  /// See [`Pallet::set_metadata`].
  _i5.RuntimeCall setMetadata({
    required daoId,
    required metadata,
  }) {
    final _call = _i6.Call.values.setMetadata(
      daoId: daoId,
      metadata: metadata,
    );
    return _i5.RuntimeCall.values.weteeAsset(_call);
  }

  /// See [`Pallet::burn`].
  _i5.RuntimeCall burn({
    required daoId,
    required amount,
  }) {
    final _call = _i6.Call.values.burn(
      daoId: daoId,
      amount: amount,
    );
    return _i5.RuntimeCall.values.weteeAsset(_call);
  }

  /// See [`Pallet::transfer`].
  _i5.RuntimeCall transfer({
    required dest,
    required daoId,
    required amount,
  }) {
    final _call = _i6.Call.values.transfer(
      dest: dest,
      daoId: daoId,
      amount: amount,
    );
    return _i5.RuntimeCall.values.weteeAsset(_call);
  }

  /// See [`Pallet::join`].
  _i5.RuntimeCall join({
    required daoId,
    required shareExpect,
    required existenialDeposit,
  }) {
    final _call = _i6.Call.values.join(
      daoId: daoId,
      shareExpect: shareExpect,
      existenialDeposit: existenialDeposit,
    );
    return _i5.RuntimeCall.values.weteeAsset(_call);
  }
}
