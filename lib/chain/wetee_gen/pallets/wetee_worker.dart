// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i14;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/tuples.dart' as _i6;
import '../types/wetee_primitives/types/cr.dart' as _i7;
import '../types/wetee_primitives/types/work_id.dart' as _i10;
import '../types/wetee_runtime/runtime_call.dart' as _i15;
import '../types/wetee_worker/cluster_contract_state.dart' as _i11;
import '../types/wetee_worker/contract_state.dart' as _i12;
import '../types/wetee_worker/deposit.dart' as _i9;
import '../types/wetee_worker/deposit_price.dart' as _i8;
import '../types/wetee_worker/k8s_cluster.dart' as _i4;
import '../types/wetee_worker/pallet/call.dart' as _i16;
import '../types/wetee_worker/proof_of_cluster.dart' as _i5;
import '../types/wetee_worker/proof_of_work.dart' as _i13;

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

  final _i1.StorageMap<BigInt, _i5.ProofOfCluster> _proofOfClusters =
      const _i1.StorageMap<BigInt, _i5.ProofOfCluster>(
    prefix: 'WeteeWorker',
    storage: 'ProofOfClusters',
    valueCodec: _i5.ProofOfCluster.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i6.Tuple2<_i7.Cr, _i7.Cr>> _crs =
      const _i1.StorageMap<BigInt, _i6.Tuple2<_i7.Cr, _i7.Cr>>(
    prefix: 'WeteeWorker',
    storage: 'Crs',
    valueCodec: _i6.Tuple2Codec<_i7.Cr, _i7.Cr>(
      _i7.Cr.codec,
      _i7.Cr.codec,
    ),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i6.Tuple2<int, int>> _scores =
      const _i1.StorageMap<BigInt, _i6.Tuple2<int, int>>(
    prefix: 'WeteeWorker',
    storage: 'Scores',
    valueCodec: _i6.Tuple2Codec<int, int>(
      _i3.U8Codec.codec,
      _i3.U8Codec.codec,
    ),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<int, _i8.DepositPrice> _depositPrices =
      const _i1.StorageMap<int, _i8.DepositPrice>(
    prefix: 'WeteeWorker',
    storage: 'DepositPrices',
    valueCodec: _i8.DepositPrice.codec,
    hasher: _i1.StorageHasher.identity(_i3.U8Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, BigInt, _i9.Deposit> _deposits =
      const _i1.StorageDoubleMap<BigInt, BigInt, _i9.Deposit>(
    prefix: 'WeteeWorker',
    storage: 'Deposits',
    valueCodec: _i9.Deposit.codec,
    hasher1: _i1.StorageHasher.identity(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, _i10.WorkId, _i11.ClusterContractState>
      _clusterContracts = const _i1
          .StorageDoubleMap<BigInt, _i10.WorkId, _i11.ClusterContractState>(
    prefix: 'WeteeWorker',
    storage: 'ClusterContracts',
    valueCodec: _i11.ClusterContractState.codec,
    hasher1: _i1.StorageHasher.identity(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i10.WorkId.codec),
  );

  final _i1.StorageMap<_i10.WorkId, BigInt> _workContracts =
      const _i1.StorageMap<_i10.WorkId, BigInt>(
    prefix: 'WeteeWorker',
    storage: 'WorkContracts',
    valueCodec: _i3.U64Codec.codec,
    hasher: _i1.StorageHasher.identity(_i10.WorkId.codec),
  );

  final _i1.StorageDoubleMap<_i10.WorkId, BigInt, _i12.ContractState>
      _workContractState =
      const _i1.StorageDoubleMap<_i10.WorkId, BigInt, _i12.ContractState>(
    prefix: 'WeteeWorker',
    storage: 'WorkContractState',
    valueCodec: _i12.ContractState.codec,
    hasher1: _i1.StorageHasher.identity(_i10.WorkId.codec),
    hasher2: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageValue<int> _stage = const _i1.StorageValue<int>(
    prefix: 'WeteeWorker',
    storage: 'Stage',
    valueCodec: _i3.U32Codec.codec,
  );

  final _i1.StorageDoubleMap<_i10.WorkId, BigInt, _i13.ProofOfWork>
      _proofsOfWork =
      const _i1.StorageDoubleMap<_i10.WorkId, BigInt, _i13.ProofOfWork>(
    prefix: 'WeteeWorker',
    storage: 'ProofsOfWork',
    valueCodec: _i13.ProofOfWork.codec,
    hasher1: _i1.StorageHasher.identity(_i10.WorkId.codec),
    hasher2: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, _i10.WorkId, List<int>> _reports =
      const _i1.StorageDoubleMap<BigInt, _i10.WorkId, List<int>>(
    prefix: 'WeteeWorker',
    storage: 'Reports',
    valueCodec: _i3.U8SequenceCodec.codec,
    hasher1: _i1.StorageHasher.identity(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i10.WorkId.codec),
  );

  /// 用户对应集群的信息
  /// user's K8sCluster information
  _i14.Future<BigInt?> k8sClusterAccounts(
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
  _i14.Future<BigInt> nextClusterId({_i1.BlockHash? at}) async {
    final hashedKey = _nextClusterId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextClusterId.decodeValue(bytes);
    }
    return BigInt.one; /* Default */
  }

  /// 集群信息
  _i14.Future<_i4.K8sCluster?> k8sClusters(
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

  /// 集群工作量证明
  /// K8sCluster proof of work
  _i14.Future<_i5.ProofOfCluster?> proofOfClusters(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _proofOfClusters.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _proofOfClusters.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 计算资源 抵押/使用
  /// computing resource
  _i14.Future<_i6.Tuple2<_i7.Cr, _i7.Cr>?> crs(
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
  _i14.Future<_i6.Tuple2<int, int>?> scores(
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

  /// 抵押价格
  /// deposit of computing resource
  _i14.Future<_i8.DepositPrice?> depositPrices(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _depositPrices.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _depositPrices.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 抵押信息
  /// deposit of computing resource
  _i14.Future<_i9.Deposit?> deposits(
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

  /// 集群包含的智能合同
  /// smart contract
  _i14.Future<_i11.ClusterContractState?> clusterContracts(
    BigInt key1,
    _i10.WorkId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _clusterContracts.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _clusterContracts.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 程序使用的智能合同 （节点id，解锁)
  /// smart contract
  _i14.Future<BigInt?> workContracts(
    _i10.WorkId key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _workContracts.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _workContracts.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 程序使用的智能合同日志 （节点id，日志）
  /// smart contract log
  _i14.Future<_i12.ContractState?> workContractState(
    _i10.WorkId key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _workContractState.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _workContractState.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Work 结算周期
  /// Work settle period
  _i14.Future<int> stage({_i1.BlockHash? at}) async {
    final hashedKey = _stage.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _stage.decodeValue(bytes);
    }
    return 3; /* Default */
  }

  /// 工作任务工作量证明
  /// proof of work of task
  _i14.Future<_i13.ProofOfWork?> proofsOfWork(
    _i10.WorkId key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _proofsOfWork.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _proofsOfWork.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 投诉信息
  /// reports of work / cluster
  _i14.Future<List<int>?> reports(
    BigInt key1,
    _i10.WorkId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _reports.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _reports.decodeValue(bytes);
    }
    return null; /* Nullable */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::cluster_register`].
  _i15.RuntimeCall clusterRegister({
    required name,
    required ip,
    required port,
    required level,
  }) {
    final _call = _i16.Call.values.clusterRegister(
      name: name,
      ip: ip,
      port: port,
      level: level,
    );
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_proof_upload`].
  _i15.RuntimeCall clusterProofUpload({
    required id,
    required proof,
  }) {
    final _call = _i16.Call.values.clusterProofUpload(
      id: id,
      proof: proof,
    );
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_mortgage`].
  _i15.RuntimeCall clusterMortgage({
    required id,
    required cpu,
    required mem,
    required disk,
    required deposit,
  }) {
    final _call = _i16.Call.values.clusterMortgage(
      id: id,
      cpu: cpu,
      mem: mem,
      disk: disk,
      deposit: deposit,
    );
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_unmortgage`].
  _i15.RuntimeCall clusterUnmortgage({
    required id,
    required blockNum,
  }) {
    final _call = _i16.Call.values.clusterUnmortgage(
      id: id,
      blockNum: blockNum,
    );
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::work_proof_upload`].
  _i15.RuntimeCall workProofUpload({
    required workId,
    required proof,
  }) {
    final _call = _i16.Call.values.workProofUpload(
      workId: workId,
      proof: proof,
    );
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_withdrawal`].
  _i15.RuntimeCall clusterWithdrawal({
    required workId,
    required amount,
  }) {
    final _call = _i16.Call.values.clusterWithdrawal(
      workId: workId,
      amount: amount,
    );
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_stop`].
  _i15.RuntimeCall clusterStop({required id}) {
    final _call = _i16.Call.values.clusterStop(id: id);
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::cluster_report`].
  _i15.RuntimeCall clusterReport({
    required clusterId,
    required workId,
    required reason,
  }) {
    final _call = _i16.Call.values.clusterReport(
      clusterId: clusterId,
      workId: workId,
      reason: reason,
    );
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }

  /// See [`Pallet::report_close`].
  _i15.RuntimeCall reportClose({
    required clusterId,
    required workId,
  }) {
    final _call = _i16.Call.values.reportClose(
      clusterId: clusterId,
      workId: workId,
    );
    return _i15.RuntimeCall.values.weteeWorker(_call);
  }
}
