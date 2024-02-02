// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/sp_core/crypto/account_id32.dart' as _i3;
import '../types/wetee_primitives/types/app_setting.dart' as _i6;
import '../types/wetee_runtime/runtime_call.dart' as _i8;
import '../types/wetee_task/pallet/call.dart' as _i9;
import '../types/wetee_task/price.dart' as _i5;
import '../types/wetee_task/tee_task.dart' as _i4;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<BigInt> _nextTeeId = const _i1.StorageValue<BigInt>(
    prefix: 'WeteeTask',
    storage: 'NextTeeId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i4.TeeTask> _tEETasks =
      const _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i4.TeeTask>(
    prefix: 'WeteeTask',
    storage: 'TEETasks',
    valueCodec: _i4.TeeTask.codec,
    hasher1: _i1.StorageHasher.identity(_i3.AccountId32Codec()),
    hasher2: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<int, _i5.Price> _prices =
      const _i1.StorageMap<int, _i5.Price>(
    prefix: 'WeteeTask',
    storage: 'Prices',
    valueCodec: _i5.Price.codec,
    hasher: _i1.StorageHasher.identity(_i2.U8Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i3.AccountId32> _taskIdAccounts =
      const _i1.StorageMap<BigInt, _i3.AccountId32>(
    prefix: 'WeteeTask',
    storage: 'TaskIdAccounts',
    valueCodec: _i3.AccountId32Codec(),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, int, _i6.AppSetting> _appSettings =
      const _i1.StorageDoubleMap<BigInt, int, _i6.AppSetting>(
    prefix: 'WeteeTask',
    storage: 'AppSettings',
    valueCodec: _i6.AppSetting.codec,
    hasher1: _i1.StorageHasher.identity(_i2.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i2.U16Codec.codec),
  );

  final _i1.StorageMap<BigInt, BigInt> _taskVersion =
      const _i1.StorageMap<BigInt, BigInt>(
    prefix: 'WeteeTask',
    storage: 'TaskVersion',
    valueCodec: _i2.U64Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  /// The id of the next app to be created.
  /// 获取下一个app id
  _i7.Future<BigInt> nextTeeId({_i1.BlockHash? at}) async {
    final hashedKey = _nextTeeId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextTeeId.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// Task
  /// 应用
  _i7.Future<_i4.TeeTask?> tEETasks(
    _i3.AccountId32 key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _tEETasks.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _tEETasks.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Price of resource
  /// 价格
  _i7.Future<_i5.Price?> prices(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _prices.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _prices.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Task 对应账户
  /// user's K8sCluster information
  _i7.Future<_i3.AccountId32?> taskIdAccounts(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _taskIdAccounts.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _taskIdAccounts.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Task setting
  /// Task设置
  _i7.Future<_i6.AppSetting?> appSettings(
    BigInt key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _appSettings.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _appSettings.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Task version
  /// Task 版本
  _i7.Future<BigInt?> taskVersion(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _taskVersion.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _taskVersion.decodeValue(bytes);
    }
    return null; /* Nullable */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::create`].
  _i8.RuntimeCall create({
    required name,
    required image,
    required port,
    required cpu,
    required memory,
    required disk,
    required level,
    required deposit,
  }) {
    final _call = _i9.Call.values.create(
      name: name,
      image: image,
      port: port,
      cpu: cpu,
      memory: memory,
      disk: disk,
      level: level,
      deposit: deposit,
    );
    return _i8.RuntimeCall.values.weteeTask(_call);
  }

  /// See [`Pallet::rerun`].
  _i8.RuntimeCall rerun({required id}) {
    final _call = _i9.Call.values.rerun(id: id);
    return _i8.RuntimeCall.values.weteeTask(_call);
  }

  /// See [`Pallet::update`].
  _i8.RuntimeCall update({
    required appId,
    required name,
    required image,
    required port,
  }) {
    final _call = _i9.Call.values.update(
      appId: appId,
      name: name,
      image: image,
      port: port,
    );
    return _i8.RuntimeCall.values.weteeTask(_call);
  }

  /// See [`Pallet::set_settings`].
  _i8.RuntimeCall setSettings({
    required appId,
    required value,
  }) {
    final _call = _i9.Call.values.setSettings(
      appId: appId,
      value: value,
    );
    return _i8.RuntimeCall.values.weteeTask(_call);
  }

  /// See [`Pallet::recharge`].
  _i8.RuntimeCall recharge({
    required id,
    required deposit,
  }) {
    final _call = _i9.Call.values.recharge(
      id: id,
      deposit: deposit,
    );
    return _i8.RuntimeCall.values.weteeTask(_call);
  }

  /// See [`Pallet::stop`].
  _i8.RuntimeCall stop({required appId}) {
    final _call = _i9.Call.values.stop(appId: appId);
    return _i8.RuntimeCall.values.weteeTask(_call);
  }
}
