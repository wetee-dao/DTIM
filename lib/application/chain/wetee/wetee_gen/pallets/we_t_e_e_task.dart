// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i8;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/sp_core/crypto/account_id32.dart' as _i3;
import '../types/wetee_primitives/types/command.dart' as _i11;
import '../types/wetee_primitives/types/disk.dart' as _i13;
import '../types/wetee_primitives/types/env.dart' as _i6;
import '../types/wetee_primitives/types/env_input.dart' as _i12;
import '../types/wetee_primitives/types/service.dart' as _i10;
import '../types/wetee_primitives/types/t_e_e_version.dart' as _i14;
import '../types/wetee_runtime/runtime_call.dart' as _i9;
import '../types/wetee_task/pallet/call.dart' as _i15;
import '../types/wetee_task/price.dart' as _i5;
import '../types/wetee_task/tee_task.dart' as _i4;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<BigInt> _nextTeeId = const _i1.StorageValue<BigInt>(
    prefix: 'WeTEETask',
    storage: 'NextTeeId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i4.TeeTask> _tEETasks =
      const _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i4.TeeTask>(
    prefix: 'WeTEETask',
    storage: 'TEETasks',
    valueCodec: _i4.TeeTask.codec,
    hasher1: _i1.StorageHasher.identity(_i3.AccountId32Codec()),
    hasher2: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<int, _i5.Price> _prices =
      const _i1.StorageMap<int, _i5.Price>(
    prefix: 'WeTEETask',
    storage: 'Prices',
    valueCodec: _i5.Price.codec,
    hasher: _i1.StorageHasher.identity(_i2.U8Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i3.AccountId32> _taskIdAccounts =
      const _i1.StorageMap<BigInt, _i3.AccountId32>(
    prefix: 'WeTEETask',
    storage: 'TaskIdAccounts',
    valueCodec: _i3.AccountId32Codec(),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, int, _i6.Env> _envs =
      const _i1.StorageDoubleMap<BigInt, int, _i6.Env>(
    prefix: 'WeTEETask',
    storage: 'Envs',
    valueCodec: _i6.Env.codec,
    hasher1: _i1.StorageHasher.identity(_i2.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i2.U16Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<int>> _secretEnvs =
      const _i1.StorageMap<BigInt, List<int>>(
    prefix: 'WeTEETask',
    storage: 'SecretEnvs',
    valueCodec: _i2.U8SequenceCodec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<int>> _codeSignature =
      const _i1.StorageMap<BigInt, List<int>>(
    prefix: 'WeTEETask',
    storage: 'CodeSignature',
    valueCodec: _i2.U8SequenceCodec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<int>> _codeSigner =
      const _i1.StorageMap<BigInt, List<int>>(
    prefix: 'WeTEETask',
    storage: 'CodeSigner',
    valueCodec: _i2.U8SequenceCodec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, BigInt> _taskVersion =
      const _i1.StorageMap<BigInt, BigInt>(
    prefix: 'WeTEETask',
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
  _i7.Future<_i6.Env?> envs(
    BigInt key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _envs.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _envs.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Secret app setting
  /// 加密设置
  _i7.Future<List<int>?> secretEnvs(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _secretEnvs.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _secretEnvs.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 代码版本
  _i7.Future<List<int>> codeSignature(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _codeSignature.hashedKeyFor(key1);
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

  /// 代码打包签名人
  _i7.Future<List<int>> codeSigner(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _codeSigner.hashedKeyFor(key1);
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

  /// Returns the storage key for `nextTeeId`.
  _i8.Uint8List nextTeeIdKey() {
    final hashedKey = _nextTeeId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `tEETasks`.
  _i8.Uint8List tEETasksKey(
    _i3.AccountId32 key1,
    BigInt key2,
  ) {
    final hashedKey = _tEETasks.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `prices`.
  _i8.Uint8List pricesKey(int key1) {
    final hashedKey = _prices.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `taskIdAccounts`.
  _i8.Uint8List taskIdAccountsKey(BigInt key1) {
    final hashedKey = _taskIdAccounts.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `envs`.
  _i8.Uint8List envsKey(
    BigInt key1,
    int key2,
  ) {
    final hashedKey = _envs.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `secretEnvs`.
  _i8.Uint8List secretEnvsKey(BigInt key1) {
    final hashedKey = _secretEnvs.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `codeSignature`.
  _i8.Uint8List codeSignatureKey(BigInt key1) {
    final hashedKey = _codeSignature.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `codeSigner`.
  _i8.Uint8List codeSignerKey(BigInt key1) {
    final hashedKey = _codeSigner.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `taskVersion`.
  _i8.Uint8List taskVersionKey(BigInt key1) {
    final hashedKey = _taskVersion.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `tEETasks`.
  _i8.Uint8List tEETasksMapPrefix(_i3.AccountId32 key1) {
    final hashedKey = _tEETasks.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `prices`.
  _i8.Uint8List pricesMapPrefix() {
    final hashedKey = _prices.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `taskIdAccounts`.
  _i8.Uint8List taskIdAccountsMapPrefix() {
    final hashedKey = _taskIdAccounts.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `envs`.
  _i8.Uint8List envsMapPrefix(BigInt key1) {
    final hashedKey = _envs.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `secretEnvs`.
  _i8.Uint8List secretEnvsMapPrefix() {
    final hashedKey = _secretEnvs.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `codeSignature`.
  _i8.Uint8List codeSignatureMapPrefix() {
    final hashedKey = _codeSignature.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `codeSigner`.
  _i8.Uint8List codeSignerMapPrefix() {
    final hashedKey = _codeSigner.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `taskVersion`.
  _i8.Uint8List taskVersionMapPrefix() {
    final hashedKey = _taskVersion.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Task create
  /// 注册任务
  _i9.RuntimeCall create({
    required List<int> name,
    required List<int> image,
    required List<int> signer,
    required List<int> signature,
    required List<int> meta,
    required List<_i10.Service> port,
    required _i11.Command command,
    required List<_i12.EnvInput> env,
    List<int>? secretEnv,
    required int cpu,
    required int memory,
    required List<_i13.Disk> disk,
    required int level,
    required _i14.TEEVersion teeVersion,
  }) {
    final _call = _i15.Call.values.create(
      name: name,
      image: image,
      signer: signer,
      signature: signature,
      meta: meta,
      port: port,
      command: command,
      env: env,
      secretEnv: secretEnv,
      cpu: cpu,
      memory: memory,
      disk: disk,
      level: level,
      teeVersion: teeVersion,
    );
    return _i9.RuntimeCall.values.weTEETask(_call);
  }

  /// Rerun task
  /// 重启任务
  _i9.RuntimeCall rerun({required BigInt id}) {
    final _call = _i15.Call.values.rerun(id: id);
    return _i9.RuntimeCall.values.weTEETask(_call);
  }

  /// Task update
  /// 更新任务
  _i9.RuntimeCall update({
    required BigInt appId,
    List<int>? newName,
    List<int>? newImage,
    List<int>? newSigner,
    List<int>? newSignature,
    List<_i10.Service>? newPort,
    _i11.Command? newCommand,
    required List<_i12.EnvInput> newEnv,
    List<int>? secretEnv,
    required bool withRestart,
  }) {
    final _call = _i15.Call.values.update(
      appId: appId,
      newName: newName,
      newImage: newImage,
      newSigner: newSigner,
      newSignature: newSignature,
      newPort: newPort,
      newCommand: newCommand,
      newEnv: newEnv,
      secretEnv: secretEnv,
      withRestart: withRestart,
    );
    return _i9.RuntimeCall.values.weTEETask(_call);
  }

  /// update price
  /// 更新价格
  _i9.RuntimeCall updatePrice({
    required int level,
    required _i5.Price price,
  }) {
    final _call = _i15.Call.values.updatePrice(
      level: level,
      price: price,
    );
    return _i9.RuntimeCall.values.weTEETask(_call);
  }
}
