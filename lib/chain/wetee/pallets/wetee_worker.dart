// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/tuples.dart' as _i5;
import '../types/wetee_runtime/runtime_call.dart' as _i9;
import '../types/wetee_worker/cr.dart' as _i6;
import '../types/wetee_worker/deposit.dart' as _i7;
import '../types/wetee_worker/k8s_cluster.dart' as _i4;
import '../types/wetee_worker/pallet/call.dart' as _i10;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.AccountId32, BigInt> _k8sClusterAccounts =
      const _i1.StorageMap<_i2.AccountId32, BigInt>(
    prefix: 'WeteeWorker',
    storage: 'K8sClusterAccounts',
    valueCodec: _i3.U64Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.AccountId32Codec()),
  );

  final _i1.StorageValue<BigInt> _nextClusterId =
      const _i1.StorageValue<BigInt>(
    prefix: 'WeteeWorker',
    storage: 'NextClusterId',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, _i4.K8sCluster> _k8sClusters =
      const _i1.StorageMap<BigInt, _i4.K8sCluster>(
    prefix: 'WeteeWorker',
    storage: 'K8sClusters',
    valueCodec: _i4.K8sCluster.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i5.Tuple2<_i6.Cr, _i6.Cr>> _crs =
      const _i1.StorageMap<BigInt, _i5.Tuple2<_i6.Cr, _i6.Cr>>(
    prefix: 'WeteeWorker',
    storage: 'Crs',
    valueCodec: _i5.Tuple2Codec<_i6.Cr, _i6.Cr>(
      _i6.Cr.codec,
      _i6.Cr.codec,
    ),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i5.Tuple2<int, int>> _scores =
      const _i1.StorageMap<BigInt, _i5.Tuple2<int, int>>(
    prefix: 'WeteeWorker',
    storage: 'Scores',
    valueCodec: _i5.Tuple2Codec<int, int>(
      _i3.U8Codec.codec,
      _i3.U8Codec.codec,
    ),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, BigInt, _i7.Deposit> _deposits =
      const _i1.StorageDoubleMap<BigInt, BigInt, _i7.Deposit>(
    prefix: 'WeteeWorker',
    storage: 'Deposits',
    valueCodec: _i7.Deposit.codec,
    hasher1: _i1.StorageHasher.identity(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  /// 用户对应集群的信息
  _i8.Future<BigInt?> k8sClusterAccounts(
    _i2.AccountId32 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _k8sClusterAccounts.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _k8sClusterAccounts.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The id of the next cluster to be created.
  /// 获取下一个集群id
  _i8.Future<BigInt> nextClusterId({_i1.BlockHash? at}) async {
    final hashedKey = _nextClusterId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextClusterId.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// 集群信息
  _i8.Future<_i4.K8sCluster?> k8sClusters(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _k8sClusters.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _k8sClusters.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 计算资源 抵押/使用
  /// computing resource
  _i8.Future<_i5.Tuple2<_i6.Cr, _i6.Cr>?> crs(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _crs.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _crs.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 节点(评级,评分)
  /// computing resource
  _i8.Future<_i5.Tuple2<int, int>?> scores(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _scores.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _scores.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 抵押信息
  /// deposit of computing resource
  _i8.Future<_i7.Deposit?> deposits(
    BigInt key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _deposits.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _deposits.decodeValue(bytes);
    }
    return null; /* Nullable */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::cluster_register`].
  _i9.RuntimeCall clusterRegister({
    required name,
    required image,
    required ip,
    required port,
  }) {
    final _call = _i10.Call.values.clusterRegister(
      name: name,
      image: image,
      ip: ip,
      port: port,
    );
    return _i9.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_mortgage`].
  _i9.RuntimeCall clusterMortgage({
    required id,
    required cpu,
    required mem,
    required disk,
    required deposit,
  }) {
    final _call = _i10.Call.values.clusterMortgage(
      id: id,
      cpu: cpu,
      mem: mem,
      disk: disk,
      deposit: deposit,
    );
    return _i9.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_unmortgage`].
  _i9.RuntimeCall clusterUnmortgage({
    required id,
    required blockNum,
  }) {
    final _call = _i10.Call.values.clusterUnmortgage(
      id: id,
      blockNum: blockNum,
    );
    return _i9.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_proof_upload`].
  _i9.RuntimeCall clusterProofUpload() {
    final _call = _i10.Call.values.clusterProofUpload();
    return _i9.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_withdrawal`].
  _i9.RuntimeCall clusterWithdrawal() {
    final _call = _i10.Call.values.clusterWithdrawal();
    return _i9.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_stop`].
  _i9.RuntimeCall clusterStop() {
    final _call = _i10.Call.values.clusterStop();
    return _i9.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_report`].
  _i9.RuntimeCall clusterReport() {
    final _call = _i10.Call.values.clusterReport();
    return _i9.RuntimeCall.values.weteeWorker(_call);
  }
}
