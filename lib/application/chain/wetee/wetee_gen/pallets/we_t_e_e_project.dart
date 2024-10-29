// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i8;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/sp_core/crypto/account_id32.dart' as _i4;
import '../types/wetee_project/pallet/call.dart' as _i10;
import '../types/wetee_project/project_info.dart' as _i3;
import '../types/wetee_project/review_opinion.dart' as _i11;
import '../types/wetee_project/review_status.dart' as _i6;
import '../types/wetee_project/task_info.dart' as _i5;
import '../types/wetee_runtime/runtime_call.dart' as _i9;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<BigInt> _nextProjectId =
      const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEProject',
    storage: 'NextProjectId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, List<_i3.ProjectInfo>> _daoProjects =
      const _i1.StorageMap<BigInt, List<_i3.ProjectInfo>>(
    prefix: 'WeTEEProject',
    storage: 'DaoProjects',
    valueCodec: _i2.SequenceCodec<_i3.ProjectInfo>(_i3.ProjectInfo.codec),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<_i4.AccountId32, BigInt, _i3.ProjectInfo>
      _proxyProjects =
      const _i1.StorageDoubleMap<_i4.AccountId32, BigInt, _i3.ProjectInfo>(
    prefix: 'WeTEEProject',
    storage: 'ProxyProjects',
    valueCodec: _i3.ProjectInfo.codec,
    hasher1: _i1.StorageHasher.identity(_i4.AccountId32Codec()),
    hasher2: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<_i5.TaskInfo>> _tasks =
      const _i1.StorageMap<BigInt, List<_i5.TaskInfo>>(
    prefix: 'WeTEEProject',
    storage: 'Tasks',
    valueCodec: _i2.SequenceCodec<_i5.TaskInfo>(_i5.TaskInfo.codec),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageValue<BigInt> _nextTaskId = const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEProject',
    storage: 'NextTaskId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, _i6.ReviewStatus> _taskReviews =
      const _i1.StorageMap<BigInt, _i6.ReviewStatus>(
    prefix: 'WeTEEProject',
    storage: 'TaskReviews',
    valueCodec: _i6.ReviewStatus.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  /// The id of the next dao to be created.
  /// 获取下一个组织id
  _i7.Future<BigInt> nextProjectId({_i1.BlockHash? at}) async {
    final hashedKey = _nextProjectId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextProjectId.decodeValue(bytes);
    }
    return BigInt.one; /* Default */
  }

  /// project board
  /// 项目看板
  _i7.Future<List<_i3.ProjectInfo>> daoProjects(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _daoProjects.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _daoProjects.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// project board
  /// 项目看板
  _i7.Future<_i3.ProjectInfo?> proxyProjects(
    _i4.AccountId32 key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _proxyProjects.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _proxyProjects.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// project task
  /// 任务看板
  _i7.Future<List<_i5.TaskInfo>> tasks(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _tasks.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _tasks.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// The id of the next dao to be created.
  /// 获取下一个组织id
  _i7.Future<BigInt> nextTaskId({_i1.BlockHash? at}) async {
    final hashedKey = _nextTaskId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextTaskId.decodeValue(bytes);
    }
    return BigInt.one; /* Default */
  }

  /// TODO taskDone
  /// 已完成项目
  /// task reviews
  /// 项目审核报告
  _i7.Future<_i6.ReviewStatus?> taskReviews(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _taskReviews.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _taskReviews.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `nextProjectId`.
  _i8.Uint8List nextProjectIdKey() {
    final hashedKey = _nextProjectId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `daoProjects`.
  _i8.Uint8List daoProjectsKey(BigInt key1) {
    final hashedKey = _daoProjects.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `proxyProjects`.
  _i8.Uint8List proxyProjectsKey(
    _i4.AccountId32 key1,
    BigInt key2,
  ) {
    final hashedKey = _proxyProjects.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `tasks`.
  _i8.Uint8List tasksKey(BigInt key1) {
    final hashedKey = _tasks.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `nextTaskId`.
  _i8.Uint8List nextTaskIdKey() {
    final hashedKey = _nextTaskId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `taskReviews`.
  _i8.Uint8List taskReviewsKey(BigInt key1) {
    final hashedKey = _taskReviews.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `daoProjects`.
  _i8.Uint8List daoProjectsMapPrefix() {
    final hashedKey = _daoProjects.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `proxyProjects`.
  _i8.Uint8List proxyProjectsMapPrefix(_i4.AccountId32 key1) {
    final hashedKey = _proxyProjects.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `tasks`.
  _i8.Uint8List tasksMapPrefix() {
    final hashedKey = _tasks.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `taskReviews`.
  _i8.Uint8List taskReviewsMapPrefix() {
    final hashedKey = _taskReviews.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// 申请加入团队
  _i9.RuntimeCall projectJoinRequest({
    required BigInt daoId,
    required BigInt projectId,
    required _i4.AccountId32 who,
  }) {
    final _call = _i10.Call.values.projectJoinRequest(
      daoId: daoId,
      projectId: projectId,
      who: who,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 创建项目
  _i9.RuntimeCall createProject({
    required BigInt daoId,
    required List<int> name,
    required List<int> description,
    required _i4.AccountId32 creator,
  }) {
    final _call = _i10.Call.values.createProject(
      daoId: daoId,
      name: name,
      description: description,
      creator: creator,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 为项目申请资金
  _i9.RuntimeCall applyProjectFunds({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt amount,
  }) {
    final _call = _i10.Call.values.applyProjectFunds(
      daoId: daoId,
      projectId: projectId,
      amount: amount,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 创建任务
  _i9.RuntimeCall createTask({
    required BigInt daoId,
    required BigInt projectId,
    required List<int> name,
    required List<int> description,
    required int point,
    required int priority,
    int? maxAssignee,
    List<int>? skills,
    List<_i4.AccountId32>? assignees,
    List<_i4.AccountId32>? reviewers,
    required BigInt amount,
  }) {
    final _call = _i10.Call.values.createTask(
      daoId: daoId,
      projectId: projectId,
      name: name,
      description: description,
      point: point,
      priority: priority,
      maxAssignee: maxAssignee,
      skills: skills,
      assignees: assignees,
      reviewers: reviewers,
      amount: amount,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 加入任务
  _i9.RuntimeCall joinTask({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    final _call = _i10.Call.values.joinTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 离开项目
  _i9.RuntimeCall leaveTask({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    final _call = _i10.Call.values.leaveTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 加入项目审核团队
  _i9.RuntimeCall joinTaskReview({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    final _call = _i10.Call.values.joinTaskReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 离开任务审核
  _i9.RuntimeCall leaveTaskReview({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    final _call = _i10.Call.values.leaveTaskReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 开始任务
  _i9.RuntimeCall startTask({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    final _call = _i10.Call.values.startTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 申请审核
  _i9.RuntimeCall requestReview({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    final _call = _i10.Call.values.requestReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 完成任务
  _i9.RuntimeCall taskDone({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    final _call = _i10.Call.values.taskDone(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 发送审核报告
  _i9.RuntimeCall makeReview({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
    required _i11.ReviewOpinion opinion,
    required List<int> meta,
  }) {
    final _call = _i10.Call.values.makeReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
      opinion: opinion,
      meta: meta,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  /// 创建非DAO项目
  _i9.RuntimeCall createProxyProject({
    required List<int> name,
    required List<int> description,
    required BigInt deposit,
  }) {
    final _call = _i10.Call.values.createProxyProject(
      name: name,
      description: description,
      deposit: deposit,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }

  _i9.RuntimeCall proxyCall({
    required BigInt projectId,
    required _i9.RuntimeCall call,
  }) {
    final _call = _i10.Call.values.proxyCall(
      projectId: projectId,
      call: call,
    );
    return _i9.RuntimeCall.values.weTEEProject(_call);
  }
}
