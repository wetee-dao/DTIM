// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../sp_core/crypto/account_id32.dart' as _i2;
import '../tuples.dart' as _i3;
import 'task_status.dart' as _i4;

class TaskInfo {
  const TaskInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.point,
    required this.priority,
    required this.projectId,
    required this.creator,
    required this.rewards,
    required this.maxAssignee,
    required this.assignees,
    required this.reviewers,
    required this.skills,
    required this.status,
  });

  factory TaskInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// TaskId
  final BigInt id;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> description;

  /// u16
  final int point;

  /// u8
  final int priority;

  /// ProjectId
  final BigInt projectId;

  /// AccountId
  final _i2.AccountId32 creator;

  /// Vec<(DaoAssetId, Balance)>
  final List<_i3.Tuple2<BigInt, BigInt>> rewards;

  /// u8
  final int maxAssignee;

  /// Vec<AccountId>
  final List<_i2.AccountId32> assignees;

  /// Vec<AccountId>
  final List<_i2.AccountId32> reviewers;

  /// Vec<u8>
  final List<int> skills;

  /// TaskStatus
  final _i4.TaskStatus status;

  static const $TaskInfoCodec codec = $TaskInfoCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'point': point,
        'priority': priority,
        'projectId': projectId,
        'creator': creator.toList(),
        'rewards': rewards
            .map((value) => [
                  value.value0,
                  value.value1,
                ])
            .toList(),
        'maxAssignee': maxAssignee,
        'assignees': assignees.map((value) => value.toList()).toList(),
        'reviewers': reviewers.map((value) => value.toList()).toList(),
        'skills': skills,
        'status': status.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskInfo &&
          other.id == id &&
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
          other.projectId == projectId &&
          _i6.listsEqual(
            other.creator,
            creator,
          ) &&
          _i6.listsEqual(
            other.rewards,
            rewards,
          ) &&
          other.maxAssignee == maxAssignee &&
          _i6.listsEqual(
            other.assignees,
            assignees,
          ) &&
          _i6.listsEqual(
            other.reviewers,
            reviewers,
          ) &&
          _i6.listsEqual(
            other.skills,
            skills,
          ) &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        name,
        description,
        point,
        priority,
        projectId,
        creator,
        rewards,
        maxAssignee,
        assignees,
        reviewers,
        skills,
        status,
      );
}

class $TaskInfoCodec with _i1.Codec<TaskInfo> {
  const $TaskInfoCodec();

  @override
  void encodeTo(
    TaskInfo obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.id,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.description,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.point,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.priority,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.projectId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.creator,
      output,
    );
    const _i1.SequenceCodec<_i3.Tuple2<BigInt, BigInt>>(
        _i3.Tuple2Codec<BigInt, BigInt>(
      _i1.U64Codec.codec,
      _i1.U128Codec.codec,
    )).encodeTo(
      obj.rewards,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.maxAssignee,
      output,
    );
    const _i1.SequenceCodec<_i2.AccountId32>(_i2.AccountId32Codec()).encodeTo(
      obj.assignees,
      output,
    );
    const _i1.SequenceCodec<_i2.AccountId32>(_i2.AccountId32Codec()).encodeTo(
      obj.reviewers,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.skills,
      output,
    );
    _i4.TaskStatus.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  TaskInfo decode(_i1.Input input) {
    return TaskInfo(
      id: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      description: _i1.U8SequenceCodec.codec.decode(input),
      point: _i1.U16Codec.codec.decode(input),
      priority: _i1.U8Codec.codec.decode(input),
      projectId: _i1.U64Codec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      rewards: const _i1.SequenceCodec<_i3.Tuple2<BigInt, BigInt>>(
          _i3.Tuple2Codec<BigInt, BigInt>(
        _i1.U64Codec.codec,
        _i1.U128Codec.codec,
      )).decode(input),
      maxAssignee: _i1.U8Codec.codec.decode(input),
      assignees:
          const _i1.SequenceCodec<_i2.AccountId32>(_i2.AccountId32Codec())
              .decode(input),
      reviewers:
          const _i1.SequenceCodec<_i2.AccountId32>(_i2.AccountId32Codec())
              .decode(input),
      skills: _i1.U8SequenceCodec.codec.decode(input),
      status: _i4.TaskStatus.codec.decode(input),
    );
  }

  @override
  int sizeHint(TaskInfo obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.description);
    size = size + _i1.U16Codec.codec.sizeHint(obj.point);
    size = size + _i1.U8Codec.codec.sizeHint(obj.priority);
    size = size + _i1.U64Codec.codec.sizeHint(obj.projectId);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size +
        const _i1.SequenceCodec<_i3.Tuple2<BigInt, BigInt>>(
            _i3.Tuple2Codec<BigInt, BigInt>(
          _i1.U64Codec.codec,
          _i1.U128Codec.codec,
        )).sizeHint(obj.rewards);
    size = size + _i1.U8Codec.codec.sizeHint(obj.maxAssignee);
    size = size +
        const _i1.SequenceCodec<_i2.AccountId32>(_i2.AccountId32Codec())
            .sizeHint(obj.assignees);
    size = size +
        const _i1.SequenceCodec<_i2.AccountId32>(_i2.AccountId32Codec())
            .sizeHint(obj.reviewers);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.skills);
    size = size + _i4.TaskStatus.codec.sizeHint(obj.status);
    return size;
  }
}
