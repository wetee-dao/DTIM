// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i14;
import 'dart:typed_data' as _i15;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/tuples.dart' as _i6;
import '../types/wetee_primitives/types/com_cr.dart' as _i7;
import '../types/wetee_primitives/types/ip.dart' as _i17;
import '../types/wetee_primitives/types/p2_p_addr.dart' as _i4;
import '../types/wetee_primitives/types/work_id.dart' as _i10;
import '../types/wetee_runtime/runtime_call.dart' as _i16;
import '../types/wetee_worker/pallet/call.dart' as _i18;
import '../types/wetee_worker/types/cluster_contract_state.dart' as _i11;
import '../types/wetee_worker/types/contract_state.dart' as _i12;
import '../types/wetee_worker/types/deposit.dart' as _i9;
import '../types/wetee_worker/types/deposit_price.dart' as _i8;
import '../types/wetee_worker/types/k8s_cluster.dart' as _i5;
import '../types/wetee_worker/types/proof_of_work.dart' as _i13;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.AccountId32, BigInt> _k8sClusterAccounts =
      const _i1.StorageMap<_i2.AccountId32, BigInt>(
    prefix: 'WeTEEWorker',
    storage: 'K8sClusterAccounts',
    valueCodec: _i3.U64Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.AccountId32Codec()),
  );

  final _i1.StorageValue<BigInt> _nextClusterId =
      const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEWorker',
    storage: 'NextClusterId',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageValue<List<int>> _codeSignature =
      const _i1.StorageValue<List<int>>(
    prefix: 'WeTEEWorker',
    storage: 'CodeSignature',
    valueCodec: _i3.U8SequenceCodec.codec,
  );

  final _i1.StorageValue<List<int>> _codeSigner =
      const _i1.StorageValue<List<int>>(
    prefix: 'WeTEEWorker',
    storage: 'CodeSigner',
    valueCodec: _i3.U8SequenceCodec.codec,
  );

  final _i1.StorageValue<List<_i4.P2PAddr>> _bootPeers =
      const _i1.StorageValue<List<_i4.P2PAddr>>(
    prefix: 'WeTEEWorker',
    storage: 'BootPeers',
    valueCodec: _i3.SequenceCodec<_i4.P2PAddr>(_i4.P2PAddr.codec),
  );

  final _i1.StorageMap<BigInt, _i5.K8sCluster> _k8sClusters =
      const _i1.StorageMap<BigInt, _i5.K8sCluster>(
    prefix: 'WeTEEWorker',
    storage: 'K8sClusters',
    valueCodec: _i5.K8sCluster.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<int>> _proofOfClusters =
      const _i1.StorageMap<BigInt, List<int>>(
    prefix: 'WeTEEWorker',
    storage: 'ProofOfClusters',
    valueCodec: _i3.U8SequenceCodec.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, BigInt> _proofOfClusterTimes =
      const _i1.StorageMap<BigInt, BigInt>(
    prefix: 'WeTEEWorker',
    storage: 'ProofOfClusterTimes',
    valueCodec: _i3.U64Codec.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i6.Tuple2<_i7.ComCr, _i7.ComCr>> _crs =
      const _i1.StorageMap<BigInt, _i6.Tuple2<_i7.ComCr, _i7.ComCr>>(
    prefix: 'WeTEEWorker',
    storage: 'Crs',
    valueCodec: _i6.Tuple2Codec<_i7.ComCr, _i7.ComCr>(
      _i7.ComCr.codec,
      _i7.ComCr.codec,
    ),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i6.Tuple2<int, int>> _scores =
      const _i1.StorageMap<BigInt, _i6.Tuple2<int, int>>(
    prefix: 'WeTEEWorker',
    storage: 'Scores',
    valueCodec: _i6.Tuple2Codec<int, int>(
      _i3.U8Codec.codec,
      _i3.U8Codec.codec,
    ),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<int, _i8.DepositPrice> _depositPrices =
      const _i1.StorageMap<int, _i8.DepositPrice>(
    prefix: 'WeTEEWorker',
    storage: 'DepositPrices',
    valueCodec: _i8.DepositPrice.codec,
    hasher: _i1.StorageHasher.identity(_i3.U8Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, BigInt, _i9.Deposit> _deposits =
      const _i1.StorageDoubleMap<BigInt, BigInt, _i9.Deposit>(
    prefix: 'WeTEEWorker',
    storage: 'Deposits',
    valueCodec: _i9.Deposit.codec,
    hasher1: _i1.StorageHasher.identity(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, _i10.WorkId, _i11.ClusterContractState>
      _clusterContracts = const _i1
          .StorageDoubleMap<BigInt, _i10.WorkId, _i11.ClusterContractState>(
    prefix: 'WeTEEWorker',
    storage: 'ClusterContracts',
    valueCodec: _i11.ClusterContractState.codec,
    hasher1: _i1.StorageHasher.identity(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i10.WorkId.codec),
  );

  final _i1.StorageMap<_i10.WorkId, BigInt> _workContracts =
      const _i1.StorageMap<_i10.WorkId, BigInt>(
    prefix: 'WeTEEWorker',
    storage: 'WorkContracts',
    valueCodec: _i3.U64Codec.codec,
    hasher: _i1.StorageHasher.identity(_i10.WorkId.codec),
  );

  final _i1.StorageDoubleMap<_i10.WorkId, BigInt, _i12.ContractState>
      _workContractState =
      const _i1.StorageDoubleMap<_i10.WorkId, BigInt, _i12.ContractState>(
    prefix: 'WeTEEWorker',
    storage: 'WorkContractState',
    valueCodec: _i12.ContractState.codec,
    hasher1: _i1.StorageHasher.identity(_i10.WorkId.codec),
    hasher2: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<_i10.WorkId, _i2.AccountId32> _deployKeys =
      const _i1.StorageMap<_i10.WorkId, _i2.AccountId32>(
    prefix: 'WeTEEWorker',
    storage: 'DeployKeys',
    valueCodec: _i2.AccountId32Codec(),
    hasher: _i1.StorageHasher.identity(_i10.WorkId.codec),
  );

  final _i1.StorageValue<int> _stage = const _i1.StorageValue<int>(
    prefix: 'WeTEEWorker',
    storage: 'Stage',
    valueCodec: _i3.U32Codec.codec,
  );

  final _i1.StorageDoubleMap<_i10.WorkId, BigInt, _i13.ProofOfWork>
      _proofsOfWork =
      const _i1.StorageDoubleMap<_i10.WorkId, BigInt, _i13.ProofOfWork>(
    prefix: 'WeTEEWorker',
    storage: 'ProofsOfWork',
    valueCodec: _i13.ProofOfWork.codec,
    hasher1: _i1.StorageHasher.identity(_i10.WorkId.codec),
    hasher2: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<_i10.WorkId, List<int>> _reportOfWork =
      const _i1.StorageMap<_i10.WorkId, List<int>>(
    prefix: 'WeTEEWorker',
    storage: 'ReportOfWork',
    valueCodec: _i3.U8SequenceCodec.codec,
    hasher: _i1.StorageHasher.identity(_i10.WorkId.codec),
  );

  final _i1.StorageDoubleMap<BigInt, _i10.WorkId, List<int>> _reports =
      const _i1.StorageDoubleMap<BigInt, _i10.WorkId, List<int>>(
    prefix: 'WeTEEWorker',
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

  /// code sig
  /// 代码版本
  _i14.Future<List<int>> codeSignature({_i1.BlockHash? at}) async {
    final hashedKey = _codeSignature.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _codeSignature.decodeValue(bytes);
    }
    return List<int>.filled(
      0,
      0,
      growable: true,
    ); /* Default */
  }

  /// code signer
  /// 代码打包签名人
  _i14.Future<List<int>> codeSigner({_i1.BlockHash? at}) async {
    final hashedKey = _codeSigner.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _codeSigner.decodeValue(bytes);
    }
    return List<int>.filled(
      0,
      0,
      growable: true,
    ); /* Default */
  }

  /// 侧链boot peers
  _i14.Future<List<_i4.P2PAddr>> bootPeers({_i1.BlockHash? at}) async {
    final hashedKey = _bootPeers.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _bootPeers.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// 集群信息
  _i14.Future<_i5.K8sCluster?> k8sClusters(
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
  _i14.Future<List<int>?> proofOfClusters(
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

  /// 集群工作证明时间
  /// K8sCluster proof of work time
  _i14.Future<BigInt?> proofOfClusterTimes(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _proofOfClusterTimes.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _proofOfClusterTimes.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 计算资源 抵押/使用
  /// computing resource
  _i14.Future<_i6.Tuple2<_i7.ComCr, _i7.ComCr>?> crs(
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

  /// 程序使用部署密钥，每次部署都会生成新的部署密钥
  /// smart deplopy key
  _i14.Future<_i2.AccountId32?> deployKeys(
    _i10.WorkId key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _deployKeys.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _deployKeys.decodeValue(bytes);
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
    return 600; /* Default */
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

  /// work report
  _i14.Future<List<int>?> reportOfWork(
    _i10.WorkId key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _reportOfWork.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _reportOfWork.decodeValue(bytes);
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

  /// Returns the storage key for `k8sClusterAccounts`.
  _i15.Uint8List k8sClusterAccountsKey(_i2.AccountId32 key1) {
    final hashedKey = _k8sClusterAccounts.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `nextClusterId`.
  _i15.Uint8List nextClusterIdKey() {
    final hashedKey = _nextClusterId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `codeSignature`.
  _i15.Uint8List codeSignatureKey() {
    final hashedKey = _codeSignature.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `codeSigner`.
  _i15.Uint8List codeSignerKey() {
    final hashedKey = _codeSigner.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `bootPeers`.
  _i15.Uint8List bootPeersKey() {
    final hashedKey = _bootPeers.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `k8sClusters`.
  _i15.Uint8List k8sClustersKey(BigInt key1) {
    final hashedKey = _k8sClusters.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `proofOfClusters`.
  _i15.Uint8List proofOfClustersKey(BigInt key1) {
    final hashedKey = _proofOfClusters.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `proofOfClusterTimes`.
  _i15.Uint8List proofOfClusterTimesKey(BigInt key1) {
    final hashedKey = _proofOfClusterTimes.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `crs`.
  _i15.Uint8List crsKey(BigInt key1) {
    final hashedKey = _crs.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `scores`.
  _i15.Uint8List scoresKey(BigInt key1) {
    final hashedKey = _scores.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `depositPrices`.
  _i15.Uint8List depositPricesKey(int key1) {
    final hashedKey = _depositPrices.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `deposits`.
  _i15.Uint8List depositsKey(
    BigInt key1,
    BigInt key2,
  ) {
    final hashedKey = _deposits.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `clusterContracts`.
  _i15.Uint8List clusterContractsKey(
    BigInt key1,
    _i10.WorkId key2,
  ) {
    final hashedKey = _clusterContracts.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `workContracts`.
  _i15.Uint8List workContractsKey(_i10.WorkId key1) {
    final hashedKey = _workContracts.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `workContractState`.
  _i15.Uint8List workContractStateKey(
    _i10.WorkId key1,
    BigInt key2,
  ) {
    final hashedKey = _workContractState.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `deployKeys`.
  _i15.Uint8List deployKeysKey(_i10.WorkId key1) {
    final hashedKey = _deployKeys.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `stage`.
  _i15.Uint8List stageKey() {
    final hashedKey = _stage.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `proofsOfWork`.
  _i15.Uint8List proofsOfWorkKey(
    _i10.WorkId key1,
    BigInt key2,
  ) {
    final hashedKey = _proofsOfWork.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `reportOfWork`.
  _i15.Uint8List reportOfWorkKey(_i10.WorkId key1) {
    final hashedKey = _reportOfWork.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `reports`.
  _i15.Uint8List reportsKey(
    BigInt key1,
    _i10.WorkId key2,
  ) {
    final hashedKey = _reports.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage map key prefix for `k8sClusterAccounts`.
  _i15.Uint8List k8sClusterAccountsMapPrefix() {
    final hashedKey = _k8sClusterAccounts.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `k8sClusters`.
  _i15.Uint8List k8sClustersMapPrefix() {
    final hashedKey = _k8sClusters.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `proofOfClusters`.
  _i15.Uint8List proofOfClustersMapPrefix() {
    final hashedKey = _proofOfClusters.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `proofOfClusterTimes`.
  _i15.Uint8List proofOfClusterTimesMapPrefix() {
    final hashedKey = _proofOfClusterTimes.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `crs`.
  _i15.Uint8List crsMapPrefix() {
    final hashedKey = _crs.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `scores`.
  _i15.Uint8List scoresMapPrefix() {
    final hashedKey = _scores.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `depositPrices`.
  _i15.Uint8List depositPricesMapPrefix() {
    final hashedKey = _depositPrices.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `deposits`.
  _i15.Uint8List depositsMapPrefix(BigInt key1) {
    final hashedKey = _deposits.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `clusterContracts`.
  _i15.Uint8List clusterContractsMapPrefix(BigInt key1) {
    final hashedKey = _clusterContracts.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `workContracts`.
  _i15.Uint8List workContractsMapPrefix() {
    final hashedKey = _workContracts.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `workContractState`.
  _i15.Uint8List workContractStateMapPrefix(_i10.WorkId key1) {
    final hashedKey = _workContractState.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `deployKeys`.
  _i15.Uint8List deployKeysMapPrefix() {
    final hashedKey = _deployKeys.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `proofsOfWork`.
  _i15.Uint8List proofsOfWorkMapPrefix(_i10.WorkId key1) {
    final hashedKey = _proofsOfWork.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `reportOfWork`.
  _i15.Uint8List reportOfWorkMapPrefix() {
    final hashedKey = _reportOfWork.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `reports`.
  _i15.Uint8List reportsMapPrefix(BigInt key1) {
    final hashedKey = _reports.mapPrefix(key1);
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Worker cluster register
  /// 集群注册
  _i16.RuntimeCall clusterRegister({
    required List<int> name,
    required List<_i17.Ip> ip,
    required int port,
    required int level,
  }) {
    final _call = _i18.Call.values.clusterRegister(
      name: name,
      ip: ip,
      port: port,
      level: level,
    );
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Worker cluster mortgage
  /// 质押硬件
  _i16.RuntimeCall clusterMortgage({
    required BigInt id,
    required int cpu,
    required int mem,
    required int cvmCpu,
    required int cvmMem,
    required int disk,
    required int gpu,
    required BigInt deposit,
  }) {
    final _call = _i18.Call.values.clusterMortgage(
      id: id,
      cpu: cpu,
      mem: mem,
      cvmCpu: cvmCpu,
      cvmMem: cvmMem,
      disk: disk,
      gpu: gpu,
      deposit: deposit,
    );
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Worker cluster unmortgage
  /// 解抵押
  _i16.RuntimeCall clusterUnmortgage({
    required BigInt id,
    required BigInt blockNum,
  }) {
    final _call = _i18.Call.values.clusterUnmortgage(
      id: id,
      blockNum: blockNum,
    );
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Work proof of work data upload
  /// 提交工作证明
  _i16.RuntimeCall workProofUpload({
    required _i10.WorkId workId,
    _i13.ProofOfWork? proof,
    List<int>? report,
  }) {
    final _call = _i18.Call.values.workProofUpload(
      workId: workId,
      proof: proof,
      report: report,
    );
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Worker cluster withdrawal
  /// 提现余额
  _i16.RuntimeCall clusterWithdrawal({
    required _i10.WorkId workId,
    required BigInt amount,
  }) {
    final _call = _i18.Call.values.clusterWithdrawal(
      workId: workId,
      amount: amount,
    );
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Worker cluster stop
  /// 停止集群
  _i16.RuntimeCall clusterStop({required BigInt id}) {
    final _call = _i18.Call.values.clusterStop(id: id);
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Worker cluster report
  /// 投诉集群
  _i16.RuntimeCall clusterReport({
    required BigInt clusterId,
    required _i10.WorkId workId,
    required List<int> reason,
  }) {
    final _call = _i18.Call.values.clusterReport(
      clusterId: clusterId,
      workId: workId,
      reason: reason,
    );
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Worker report stop
  /// 停止投诉
  _i16.RuntimeCall reportClose({
    required BigInt clusterId,
    required _i10.WorkId workId,
  }) {
    final _call = _i18.Call.values.reportClose(
      clusterId: clusterId,
      workId: workId,
    );
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Work stop
  /// 停止应用
  _i16.RuntimeCall workStop({required _i10.WorkId workId}) {
    final _call = _i18.Call.values.workStop(workId: workId);
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// Set boot peers
  /// 设置引导节点
  _i16.RuntimeCall setBootPeers({required List<_i4.P2PAddr> boots}) {
    final _call = _i18.Call.values.setBootPeers(boots: boots);
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  _i16.RuntimeCall setStage({required int stage}) {
    final _call = _i18.Call.values.setStage(stage: stage);
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }

  /// 上传共识节点代码
  /// update consensus node code
  _i16.RuntimeCall uploadCode({
    required List<int> signature,
    required List<int> signer,
  }) {
    final _call = _i18.Call.values.uploadCode(
      signature: signature,
      signer: signer,
    );
    return _i16.RuntimeCall.values.weTEEWorker(_call);
  }
}
