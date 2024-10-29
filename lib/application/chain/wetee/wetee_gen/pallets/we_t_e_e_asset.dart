// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/sp_runtime/multiaddress/multi_address.dart' as _i9;
import '../types/wetee_assets/dao_asset_info.dart' as _i2;
import '../types/wetee_assets/dao_asset_meta.dart' as _i7;
import '../types/wetee_assets/pallet/call.dart' as _i8;
import '../types/wetee_runtime/runtime_call.dart' as _i6;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, _i2.DaoAssetInfo> _daoAssetsInfo =
      const _i1.StorageMap<BigInt, _i2.DaoAssetInfo>(
    prefix: 'WeTEEAsset',
    storage: 'DaoAssetsInfo',
    valueCodec: _i2.DaoAssetInfo.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, int> _usersNumber =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeTEEAsset',
    storage: 'UsersNumber',
    valueCodec: _i3.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, BigInt> _existentDeposits =
      const _i1.StorageMap<BigInt, BigInt>(
    prefix: 'WeTEEAsset',
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

  /// Returns the storage key for `daoAssetsInfo`.
  _i5.Uint8List daoAssetsInfoKey(BigInt key1) {
    final hashedKey = _daoAssetsInfo.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `usersNumber`.
  _i5.Uint8List usersNumberKey(BigInt key1) {
    final hashedKey = _usersNumber.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `existentDeposits`.
  _i5.Uint8List existentDepositsKey(BigInt key1) {
    final hashedKey = _existentDeposits.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `daoAssetsInfo`.
  _i5.Uint8List daoAssetsInfoMapPrefix() {
    final hashedKey = _daoAssetsInfo.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `usersNumber`.
  _i5.Uint8List usersNumberMapPrefix() {
    final hashedKey = _usersNumber.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `existentDeposits`.
  _i5.Uint8List existentDepositsMapPrefix() {
    final hashedKey = _existentDeposits.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// create dao asset.
  /// 创建 WETEE 资产
  _i6.RuntimeCall createAsset({
    required BigInt daoId,
    required _i7.DaoAssetMeta metadata,
    required BigInt amount,
    required BigInt initDaoAsset,
  }) {
    final _call = _i8.Call.values.createAsset(
      daoId: daoId,
      metadata: metadata,
      amount: amount,
      initDaoAsset: initDaoAsset,
    );
    return _i6.RuntimeCall.values.weTEEAsset(_call);
  }

  /// 设置加入WETEE所需要的最小抵押
  _i6.RuntimeCall setExistenialDeposit({
    required BigInt daoId,
    required BigInt existenialDeposit,
  }) {
    final _call = _i8.Call.values.setExistenialDeposit(
      daoId: daoId,
      existenialDeposit: existenialDeposit,
    );
    return _i6.RuntimeCall.values.weTEEAsset(_call);
  }

  /// You should have created the asset first.
  /// 设置资产元数据
  _i6.RuntimeCall setMetadata({
    required BigInt daoId,
    required _i7.DaoAssetMeta metadata,
  }) {
    final _call = _i8.Call.values.setMetadata(
      daoId: daoId,
      metadata: metadata,
    );
    return _i6.RuntimeCall.values.weTEEAsset(_call);
  }

  /// Users destroy their own assets.
  /// 销毁资产
  _i6.RuntimeCall burn({
    required BigInt daoId,
    required BigInt amount,
  }) {
    final _call = _i8.Call.values.burn(
      daoId: daoId,
      amount: amount,
    );
    return _i6.RuntimeCall.values.weTEEAsset(_call);
  }

  /// This function transfers the given amount from the source to the destination.
  ///
  /// # Arguments
  ///
  /// * `amount` - The amount to transfer
  /// * `source` - The source account
  /// * `destination` - The destination account
  /// 转移资产
  _i6.RuntimeCall transfer({
    required _i9.MultiAddress dest,
    required BigInt daoId,
    required BigInt amount,
  }) {
    final _call = _i8.Call.values.transfer(
      dest: dest,
      daoId: daoId,
      amount: amount,
    );
    return _i6.RuntimeCall.values.weTEEAsset(_call);
  }
}
