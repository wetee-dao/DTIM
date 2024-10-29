// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../../wetee_runtime/runtime_call.dart' as _i5;
import '../review_opinion.dart' as _i4;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  ProjectJoinRequest projectJoinRequest({
    required BigInt daoId,
    required BigInt projectId,
    required _i3.AccountId32 who,
  }) {
    return ProjectJoinRequest(
      daoId: daoId,
      projectId: projectId,
      who: who,
    );
  }

  CreateProject createProject({
    required BigInt daoId,
    required List<int> name,
    required List<int> description,
    required _i3.AccountId32 creator,
  }) {
    return CreateProject(
      daoId: daoId,
      name: name,
      description: description,
      creator: creator,
    );
  }

  ApplyProjectFunds applyProjectFunds({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt amount,
  }) {
    return ApplyProjectFunds(
      daoId: daoId,
      projectId: projectId,
      amount: amount,
    );
  }

  CreateTask createTask({
    required BigInt daoId,
    required BigInt projectId,
    required List<int> name,
    required List<int> description,
    required int point,
    required int priority,
    int? maxAssignee,
    List<int>? skills,
    List<_i3.AccountId32>? assignees,
    List<_i3.AccountId32>? reviewers,
    required BigInt amount,
  }) {
    return CreateTask(
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
  }

  JoinTask joinTask({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    return JoinTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
  }

  LeaveTask leaveTask({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    return LeaveTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
  }

  JoinTaskReview joinTaskReview({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    return JoinTaskReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
  }

  LeaveTaskReview leaveTaskReview({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    return LeaveTaskReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
  }

  StartTask startTask({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    return StartTask(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
  }

  RequestReview requestReview({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    return RequestReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
  }

  TaskDone taskDone({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
  }) {
    return TaskDone(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
    );
  }

  MakeReview makeReview({
    required BigInt daoId,
    required BigInt projectId,
    required BigInt taskId,
    required _i4.ReviewOpinion opinion,
    required List<int> meta,
  }) {
    return MakeReview(
      daoId: daoId,
      projectId: projectId,
      taskId: taskId,
      opinion: opinion,
      meta: meta,
    );
  }

  CreateProxyProject createProxyProject({
    required List<int> name,
    required List<int> description,
    required BigInt deposit,
  }) {
    return CreateProxyProject(
      name: name,
      description: description,
      deposit: deposit,
    );
  }

  ProxyCall proxyCall({
    required BigInt projectId,
    required _i5.RuntimeCall call,
  }) {
    return ProxyCall(
      projectId: projectId,
      call: call,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return ProjectJoinRequest._decode(input);
      case 2:
        return CreateProject._decode(input);
      case 3:
        return ApplyProjectFunds._decode(input);
      case 4:
        return CreateTask._decode(input);
      case 5:
        return JoinTask._decode(input);
      case 6:
        return LeaveTask._decode(input);
      case 7:
        return JoinTaskReview._decode(input);
      case 8:
        return LeaveTaskReview._decode(input);
      case 9:
        return StartTask._decode(input);
      case 10:
        return RequestReview._decode(input);
      case 11:
        return TaskDone._decode(input);
      case 12:
        return MakeReview._decode(input);
      case 13:
        return CreateProxyProject._decode(input);
      case 14:
        return ProxyCall._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case ProjectJoinRequest:
        (value as ProjectJoinRequest).encodeTo(output);
        break;
      case CreateProject:
        (value as CreateProject).encodeTo(output);
        break;
      case ApplyProjectFunds:
        (value as ApplyProjectFunds).encodeTo(output);
        break;
      case CreateTask:
        (value as CreateTask).encodeTo(output);
        break;
      case JoinTask:
        (value as JoinTask).encodeTo(output);
        break;
      case LeaveTask:
        (value as LeaveTask).encodeTo(output);
        break;
      case JoinTaskReview:
        (value as JoinTaskReview).encodeTo(output);
        break;
      case LeaveTaskReview:
        (value as LeaveTaskReview).encodeTo(output);
        break;
      case StartTask:
        (value as StartTask).encodeTo(output);
        break;
      case RequestReview:
        (value as RequestReview).encodeTo(output);
        break;
      case TaskDone:
        (value as TaskDone).encodeTo(output);
        break;
      case MakeReview:
        (value as MakeReview).encodeTo(output);
        break;
      case CreateProxyProject:
        (value as CreateProxyProject).encodeTo(output);
        break;
      case ProxyCall:
        (value as ProxyCall).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case ProjectJoinRequest:
        return (value as ProjectJoinRequest)._sizeHint();
      case CreateProject:
        return (value as CreateProject)._sizeHint();
      case ApplyProjectFunds:
        return (value as ApplyProjectFunds)._sizeHint();
      case CreateTask:
        return (value as CreateTask)._sizeHint();
      case JoinTask:
        return (value as JoinTask)._sizeHint();
      case LeaveTask:
        return (value as LeaveTask)._sizeHint();
      case JoinTaskReview:
        return (value as JoinTaskReview)._sizeHint();
      case LeaveTaskReview:
        return (value as LeaveTaskReview)._sizeHint();
      case StartTask:
        return (value as StartTask)._sizeHint();
      case RequestReview:
        return (value as RequestReview)._sizeHint();
      case TaskDone:
        return (value as TaskDone)._sizeHint();
      case MakeReview:
        return (value as MakeReview)._sizeHint();
      case CreateProxyProject:
        return (value as CreateProxyProject)._sizeHint();
      case ProxyCall:
        return (value as ProxyCall)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// 申请加入团队
class ProjectJoinRequest extends Call {
  const ProjectJoinRequest({
    required this.daoId,
    required this.projectId,
    required this.who,
  });

  factory ProjectJoinRequest._decode(_i1.Input input) {
    return ProjectJoinRequest(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// T::AccountId
  final _i3.AccountId32 who;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'project_join_request': {
          'daoId': daoId,
          'projectId': projectId,
          'who': who.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProjectJoinRequest &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          _i6.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        who,
      );
}

/// 创建项目
class CreateProject extends Call {
  const CreateProject({
    required this.daoId,
    required this.name,
    required this.description,
    required this.creator,
  });

  factory CreateProject._decode(_i1.Input input) {
    return CreateProject(
      daoId: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      description: _i1.U8SequenceCodec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> description;

  /// T::AccountId
  final _i3.AccountId32 creator;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create_project': {
          'daoId': daoId,
          'name': name,
          'description': description,
          'creator': creator.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(description);
    size = size + const _i3.AccountId32Codec().sizeHint(creator);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      description,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      creator,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreateProject &&
          other.daoId == daoId &&
          _i6.listsEqual(
            other.name,
            name,
          ) &&
          _i6.listsEqual(
            other.description,
            description,
          ) &&
          _i6.listsEqual(
            other.creator,
            creator,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        name,
        description,
        creator,
      );
}

/// 为项目申请资金
class ApplyProjectFunds extends Call {
  const ApplyProjectFunds({
    required this.daoId,
    required this.projectId,
    required this.amount,
  });

  factory ApplyProjectFunds._decode(_i1.Input input) {
    return ApplyProjectFunds(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// BalanceOf<T>
  final BigInt amount;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'apply_project_funds': {
          'daoId': daoId,
          'projectId': projectId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ApplyProjectFunds &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        amount,
      );
}

/// 创建任务
class CreateTask extends Call {
  const CreateTask({
    required this.daoId,
    required this.projectId,
    required this.name,
    required this.description,
    required this.point,
    required this.priority,
    this.maxAssignee,
    this.skills,
    this.assignees,
    this.reviewers,
    required this.amount,
  });

  factory CreateTask._decode(_i1.Input input) {
    return CreateTask(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      description: _i1.U8SequenceCodec.codec.decode(input),
      point: _i1.U16Codec.codec.decode(input),
      priority: _i1.U8Codec.codec.decode(input),
      maxAssignee: const _i1.OptionCodec<int>(_i1.U8Codec.codec).decode(input),
      skills: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      assignees: const _i1.OptionCodec<List<_i3.AccountId32>>(
              _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()))
          .decode(input),
      reviewers: const _i1.OptionCodec<List<_i3.AccountId32>>(
              _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()))
          .decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> description;

  /// u16
  final int point;

  /// u8
  final int priority;

  /// Option<u8>
  final int? maxAssignee;

  /// Option<Vec<u8>>
  final List<int>? skills;

  /// Option<Vec<T::AccountId>>
  final List<_i3.AccountId32>? assignees;

  /// Option<Vec<T::AccountId>>
  final List<_i3.AccountId32>? reviewers;

  /// BalanceOf<T>
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create_task': {
          'daoId': daoId,
          'projectId': projectId,
          'name': name,
          'description': description,
          'point': point,
          'priority': priority,
          'maxAssignee': maxAssignee,
          'skills': skills,
          'assignees': assignees?.map((value) => value.toList()).toList(),
          'reviewers': reviewers?.map((value) => value.toList()).toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(description);
    size = size + _i1.U16Codec.codec.sizeHint(point);
    size = size + _i1.U8Codec.codec.sizeHint(priority);
    size = size +
        const _i1.OptionCodec<int>(_i1.U8Codec.codec).sizeHint(maxAssignee);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(skills);
    size = size +
        const _i1.OptionCodec<List<_i3.AccountId32>>(
                _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()))
            .sizeHint(assignees);
    size = size +
        const _i1.OptionCodec<List<_i3.AccountId32>>(
                _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()))
            .sizeHint(reviewers);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      description,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      point,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      priority,
      output,
    );
    const _i1.OptionCodec<int>(_i1.U8Codec.codec).encodeTo(
      maxAssignee,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      skills,
      output,
    );
    const _i1.OptionCodec<List<_i3.AccountId32>>(
            _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()))
        .encodeTo(
      assignees,
      output,
    );
    const _i1.OptionCodec<List<_i3.AccountId32>>(
            _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()))
        .encodeTo(
      reviewers,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreateTask &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          _i6.listsEqual(
            other.name,
            name,
          ) &&
          _i6.listsEqual(
            other.description,
            description,
          ) &&
          other.point == point &&
          other.priority == priority &&
          other.maxAssignee == maxAssignee &&
          other.skills == skills &&
          other.assignees == assignees &&
          other.reviewers == reviewers &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        name,
        description,
        point,
        priority,
        maxAssignee,
        skills,
        assignees,
        reviewers,
        amount,
      );
}

/// 加入任务
class JoinTask extends Call {
  const JoinTask({
    required this.daoId,
    required this.projectId,
    required this.taskId,
  });

  factory JoinTask._decode(_i1.Input input) {
    return JoinTask(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// ProjectId
  final BigInt taskId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'join_task': {
          'daoId': daoId,
          'projectId': projectId,
          'taskId': taskId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is JoinTask &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.taskId == taskId;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        taskId,
      );
}

/// 离开项目
class LeaveTask extends Call {
  const LeaveTask({
    required this.daoId,
    required this.projectId,
    required this.taskId,
  });

  factory LeaveTask._decode(_i1.Input input) {
    return LeaveTask(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// ProjectId
  final BigInt taskId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'leave_task': {
          'daoId': daoId,
          'projectId': projectId,
          'taskId': taskId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is LeaveTask &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.taskId == taskId;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        taskId,
      );
}

/// 加入项目审核团队
class JoinTaskReview extends Call {
  const JoinTaskReview({
    required this.daoId,
    required this.projectId,
    required this.taskId,
  });

  factory JoinTaskReview._decode(_i1.Input input) {
    return JoinTaskReview(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// TaskId
  final BigInt taskId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'join_task_review': {
          'daoId': daoId,
          'projectId': projectId,
          'taskId': taskId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is JoinTaskReview &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.taskId == taskId;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        taskId,
      );
}

/// 离开任务审核
class LeaveTaskReview extends Call {
  const LeaveTaskReview({
    required this.daoId,
    required this.projectId,
    required this.taskId,
  });

  factory LeaveTaskReview._decode(_i1.Input input) {
    return LeaveTaskReview(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// TaskId
  final BigInt taskId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'leave_task_review': {
          'daoId': daoId,
          'projectId': projectId,
          'taskId': taskId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is LeaveTaskReview &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.taskId == taskId;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        taskId,
      );
}

/// 开始任务
class StartTask extends Call {
  const StartTask({
    required this.daoId,
    required this.projectId,
    required this.taskId,
  });

  factory StartTask._decode(_i1.Input input) {
    return StartTask(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// ProjectId
  final BigInt taskId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'start_task': {
          'daoId': daoId,
          'projectId': projectId,
          'taskId': taskId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is StartTask &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.taskId == taskId;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        taskId,
      );
}

/// 申请审核
class RequestReview extends Call {
  const RequestReview({
    required this.daoId,
    required this.projectId,
    required this.taskId,
  });

  factory RequestReview._decode(_i1.Input input) {
    return RequestReview(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// ProjectId
  final BigInt taskId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'request_review': {
          'daoId': daoId,
          'projectId': projectId,
          'taskId': taskId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RequestReview &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.taskId == taskId;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        taskId,
      );
}

/// 完成任务
class TaskDone extends Call {
  const TaskDone({
    required this.daoId,
    required this.projectId,
    required this.taskId,
  });

  factory TaskDone._decode(_i1.Input input) {
    return TaskDone(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// ProjectId
  final BigInt taskId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'task_done': {
          'daoId': daoId,
          'projectId': projectId,
          'taskId': taskId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskDone &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.taskId == taskId;

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        taskId,
      );
}

/// 发送审核报告
class MakeReview extends Call {
  const MakeReview({
    required this.daoId,
    required this.projectId,
    required this.taskId,
    required this.opinion,
    required this.meta,
  });

  factory MakeReview._decode(_i1.Input input) {
    return MakeReview(
      daoId: _i1.U64Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
      opinion: _i4.ReviewOpinion.codec.decode(input),
      meta: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// ProjectId
  final BigInt projectId;

  /// ProjectId
  final BigInt taskId;

  /// ReviewOpinion
  final _i4.ReviewOpinion opinion;

  /// Vec<u8>
  final List<int> meta;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'make_review': {
          'daoId': daoId,
          'projectId': projectId,
          'taskId': taskId,
          'opinion': opinion.toJson(),
          'meta': meta,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    size = size + _i4.ReviewOpinion.codec.sizeHint(opinion);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(meta);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
    _i4.ReviewOpinion.codec.encodeTo(
      opinion,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      meta,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is MakeReview &&
          other.daoId == daoId &&
          other.projectId == projectId &&
          other.taskId == taskId &&
          other.opinion == opinion &&
          _i6.listsEqual(
            other.meta,
            meta,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        projectId,
        taskId,
        opinion,
        meta,
      );
}

/// 创建非DAO项目
class CreateProxyProject extends Call {
  const CreateProxyProject({
    required this.name,
    required this.description,
    required this.deposit,
  });

  factory CreateProxyProject._decode(_i1.Input input) {
    return CreateProxyProject(
      name: _i1.U8SequenceCodec.codec.decode(input),
      description: _i1.U8SequenceCodec.codec.decode(input),
      deposit: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> description;

  /// BalanceOf<T>
  final BigInt deposit;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create_proxy_project': {
          'name': name,
          'description': description,
          'deposit': deposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(description);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(deposit);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      description,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      deposit,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreateProxyProject &&
          _i6.listsEqual(
            other.name,
            name,
          ) &&
          _i6.listsEqual(
            other.description,
            description,
          ) &&
          other.deposit == deposit;

  @override
  int get hashCode => Object.hash(
        name,
        description,
        deposit,
      );
}

class ProxyCall extends Call {
  const ProxyCall({
    required this.projectId,
    required this.call,
  });

  factory ProxyCall._decode(_i1.Input input) {
    return ProxyCall(
      projectId: _i1.U64Codec.codec.decode(input),
      call: _i5.RuntimeCall.codec.decode(input),
    );
  }

  /// ProjectId
  final BigInt projectId;

  /// Box<<T as wetee_org::Config>::RuntimeCall>
  final _i5.RuntimeCall call;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'proxy_call': {
          'projectId': projectId,
          'call': call.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(projectId);
    size = size + _i5.RuntimeCall.codec.sizeHint(call);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      projectId,
      output,
    );
    _i5.RuntimeCall.codec.encodeTo(
      call,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProxyCall && other.projectId == projectId && other.call == call;

  @override
  int get hashCode => Object.hash(
        projectId,
        call,
      );
}
