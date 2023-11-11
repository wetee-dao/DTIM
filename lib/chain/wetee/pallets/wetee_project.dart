// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/wetee_project/pallet/call.dart' as _i8;
import '../types/wetee_project/project_info.dart' as _i3;
import '../types/wetee_project/review_status.dart' as _i5;
import '../types/wetee_project/task_info.dart' as _i4;
import '../types/wetee_runtime/runtime_call.dart' as _i7;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<BigInt> _nextProjectId =
      const _i1.StorageValue<BigInt>(
    prefix: 'WeteeProject',
    storage: 'NextProjectId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, List<_i3.ProjectInfo>> _daoProjects =
      const _i1.StorageMap<BigInt, List<_i3.ProjectInfo>>(
    prefix: 'WeteeProject',
    storage: 'DaoProjects',
    valueCodec: _i2.SequenceCodec<_i3.ProjectInfo>(_i3.ProjectInfo.codec),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<_i4.TaskInfo>> _tasks =
      const _i1.StorageMap<BigInt, List<_i4.TaskInfo>>(
    prefix: 'WeteeProject',
    storage: 'Tasks',
    valueCodec: _i2.SequenceCodec<_i4.TaskInfo>(_i4.TaskInfo.codec),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageValue<BigInt> _nextTaskId = const _i1.StorageValue<BigInt>(
    prefix: 'WeteeProject',
    storage: 'NextTaskId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, _i5.ReviewStatus> _taskReviews =
      const _i1.StorageMap<BigInt, _i5.ReviewStatus>(
    prefix: 'WeteeProject',
    storage: 'TaskReviews',
    valueCodec: _i5.ReviewStatus.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  /// The id of the next dao to be created.
  /// 获取下一个组织id
  _i6.Future<BigInt> nextProjectId({_i1.BlockHash? at}) async {
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
  _i6.Future<List<_i3.ProjectInfo>> daoProjects(
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

  /// project task
  /// 任务看板
  _i6.Future<List<_i4.TaskInfo>> tasks(
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
  _i6.Future<BigInt> nextTaskId({_i1.BlockHash? at}) async {
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
  _i6.Future<_i5.ReviewStatus?> taskReviews(
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
}

class Txs {
  const Txs();

  /// See [`Pallet::project_join_request`].
  _i7.RuntimeCall projectJoinRequest({
    required daoId,
    required projectId,
    required who,
  }) {
    final _call = _i8.Call.values.projectJoinRequest(
      daoId: daoId,
      projectId: projectId,
      who: who,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::create_project`].
  _i7.RuntimeCall createProject({
    required daoId,
    required name,
    required description,
    required creator,
  }) {
    final _call = _i8.Call.values.createProject(
      daoId: daoId,
      name: name,
      description: description,
      creator: creator,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::apply_project_funds`].
  _i7.RuntimeCall applyProjectFunds({
    required daoId,
    required projectId,
    required amount,
  }) {
    final _call = _i8.Call.values.applyProjectFunds(
      daoId: daoId,
      projectId: projectId,
      amount: amount,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::create_task`].
  _i7.RuntimeCall createTask({
    required daoId,
    required projectId,
    required name,
    required description,
    required point,
    required priority,
    maxAssignee,
    skills,
    assignees,
    reviewers,
    required amount,
  }) {
    final _call = _i8.Call.values.createTask(
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
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::join_task`].
  _i7.RuntimeCall joinTask({
    required daoId,
    required projectId,
    required taskId,
  }) {
    final _call = _i8.Call.values.joinTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::leave_task`].
  _i7.RuntimeCall leaveTask({
    required daoId,
    required projectId,
    required taskId,
  }) {
    final _call = _i8.Call.values.leaveTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::join_task_review`].
  _i7.RuntimeCall joinTaskReview({
    required daoId,
    required projectId,
    required taskId,
  }) {
    final _call = _i8.Call.values.joinTaskReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::leave_task_review`].
  _i7.RuntimeCall leaveTaskReview({
    required daoId,
    required projectId,
    required taskId,
  }) {
    final _call = _i8.Call.values.leaveTaskReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::start_task`].
  _i7.RuntimeCall startTask({
    required daoId,
    required projectId,
    required taskId,
  }) {
    final _call = _i8.Call.values.startTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::request_review`].
  _i7.RuntimeCall requestReview({
    required daoId,
    required projectId,
    required taskId,
  }) {
    final _call = _i8.Call.values.requestReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::task_done`].
  _i7.RuntimeCall taskDone({
    required daoId,
    required projectId,
    required taskId,
  }) {
    final _call = _i8.Call.values.taskDone(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }

  /// See [`Pallet::make_review`].
  _i7.RuntimeCall makeReview({
    required daoId,
    required projectId,
    required taskId,
    required opinion,
    required meta,
  }) {
    final _call = _i8.Call.values.makeReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
      opinion: opinion,
      meta: meta,
    );
    return _i7.RuntimeCall.values.weteeProject(_call);
  }
}
