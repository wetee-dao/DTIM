import 'package:json_annotation/json_annotation.dart';

import 'package:asyou_app/bridge_struct.dart';

part 'bridge_struct_json.g.dart';

@JsonSerializable()
class AssetAccountDataJ extends AssetAccountData {
  AssetAccountDataJ({required int free, required int reserved, required int frozen})
      : super(free: free, reserved: reserved, frozen: frozen);

  factory AssetAccountDataJ.fromJson(Map<String, dynamic> json) => _$AssetAccountDataJFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AssetAccountDataJToJson(this);
}

@JsonSerializable()
class DaoInfoJ extends DaoInfo {
  DaoInfoJ(
      {required int id,
      required String creator,
      required int startBlock,
      required String daoAccountId,
      required String name,
      required String purpose,
      required String metaData,
      required int chainUnit})
      : super(
            id: id,
            creator: creator,
            startBlock: startBlock,
            daoAccountId: daoAccountId,
            name: name,
            purpose: purpose,
            metaData: metaData,
            chainUnit: chainUnit);

  factory DaoInfoJ.fromJson(Map<String, dynamic> json) => _$DaoInfoJFromJson(json);
  Map<String, dynamic> toJson() => _$DaoInfoJToJson(this);
}

@JsonSerializable()
class QuarterJ extends Quarter {
  QuarterJ({
    required int year,
    required int quarter,
    required this.tasks,
  }) : super(quarter: quarter, year: year, tasks: []);

  @override
  final List<QuarterTaskJ> tasks;
  factory QuarterJ.fromJson(Map<String, dynamic> json) => _$QuarterJFromJson(json);
  Map<String, dynamic> toJson() => _$QuarterJToJson(this);
}

@JsonSerializable()
class QuarterTaskJ extends QuarterTask {
  QuarterTaskJ(
      {required int id,
      required String name,
      required int priority,
      required String creator,
      required this.tags,
      required int status})
      : super(
          id: id,
          name: name,
          priority: priority,
          creator: creator,
          tags: [],
          status: status,
        );

  @override
  final List<U8WrapJ> tags;
  factory QuarterTaskJ.fromJson(Map<String, dynamic> json) => _$QuarterTaskJFromJson(json);
  Map<String, dynamic> toJson() => _$QuarterTaskJToJson(this);
}

@JsonSerializable()
class U8WrapJ extends U8Wrap {
  U8WrapJ({required int value}) : super(value: value);

  factory U8WrapJ.fromJson(Map<String, dynamic> json) => _$U8WrapJFromJson(json);

  Map<String, dynamic> toJson() => _$U8WrapJToJson(this);
}

@JsonSerializable()
class GovPropsJ extends GovProps {
  GovPropsJ(
      {required int index,
      required String hash,
      required String runtimeCall,
      required this.memberGroup,
      required String account})
      : super(
          index: index,
          hash: hash,
          runtimeCall: runtimeCall,
          memberGroup: memberGroup,
          account: account,
        );

  @override
  final MemberGroupJ memberGroup;
  factory GovPropsJ.fromJson(Map<String, dynamic> json) => _$GovPropsJFromJson(json);
  Map<String, dynamic> toJson() => _$GovPropsJToJson(this);
}

@JsonSerializable()
class MemberGroupJ extends MemberGroup {
  MemberGroupJ({required int scope, required int id}) : super(scope: scope, id: id);

  factory MemberGroupJ.fromJson(Map<String, dynamic> json) => _$MemberGroupJFromJson(json);
  Map<String, dynamic> toJson() => _$MemberGroupJToJson(this);
}

@JsonSerializable()
class ProjectInfoJ extends ProjectInfo {
  ProjectInfoJ(
      {required int id,
      required String name,
      required String daoAccountId,
      required String description,
      required String creator,
      required int status})
      : super(
          id: id,
          name: name,
          daoAccountId: daoAccountId,
          description: description,
          creator: creator,
          status: status,
        );

  factory ProjectInfoJ.fromJson(Map<String, dynamic> json) => _$ProjectInfoJFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectInfoJToJson(this);
}

@JsonSerializable()
class GuildInfoJ extends GuildInfo {
  GuildInfoJ(
      {required int id,
      required String creator,
      required String daoAccountId,
      required int startBlock,
      required String name,
      required String desc,
      required String metaData,
      required int status})
      : super(
          id: id,
          creator: creator,
          daoAccountId: daoAccountId,
          startBlock: startBlock,
          name: name,
          desc: desc,
          metaData: metaData,
          status: status,
        );

  factory GuildInfoJ.fromJson(Map<String, dynamic> json) => _$GuildInfoJFromJson(json);
  Map<String, dynamic> toJson() => _$GuildInfoJToJson(this);
}

@JsonSerializable()
class GovReferendumJ extends GovReferendum {
  GovReferendumJ(
      {required int id,
      required String hash,
      required int end,
      required String proposal,
      required int delay,
      required this.tally,
      required this.memberGroup,
      required int status})
      : super(
            id: id,
            hash: hash,
            end: end,
            proposal: proposal,
            delay: delay,
            tally: tally,
            memberGroup: memberGroup,
            status: status);

  @override
  final TallyJ tally;
  @override
  final MemberGroupJ memberGroup;
  factory GovReferendumJ.fromJson(Map<String, dynamic> json) => _$GovReferendumJFromJson(json);
  Map<String, dynamic> toJson() => _$GovReferendumJToJson(this);
}

@JsonSerializable()
class TallyJ extends Tally {
  TallyJ({required int yes, required int no}) : super(yes: yes, no: no);

  factory TallyJ.fromJson(Map<String, dynamic> json) => _$TallyJFromJson(json);
  Map<String, dynamic> toJson() => _$TallyJToJson(this);
}

@JsonSerializable()
class TaskInfoJ extends TaskInfo {
  TaskInfoJ(
      {required int id,
      required String name,
      required String description,
      required int point,
      required int priority,
      required int projectId,
      required String creator,
      required List<RewardJ> this.rewards,
      required int maxAssignee,
      required List<String> assignees,
      required List<String> reviewers,
      required List<U8WrapJ> this.skills,
      required int status})
      : super(
          id: id,
          name: name,
          description: description,
          point: point,
          priority: priority,
          projectId: projectId,
          creator: creator,
          rewards: rewards,
          maxAssignee: maxAssignee,
          assignees: assignees,
          reviewers: reviewers,
          skills: skills,
          status: status,
        );

  @override
  final List<U8WrapJ> skills;
  @override
  final List<RewardJ> rewards;

  factory TaskInfoJ.fromJson(Map<String, dynamic> json) => _$TaskInfoJFromJson(json);
  Map<String, dynamic> toJson() => _$TaskInfoJToJson(this);
}

@JsonSerializable()
class RewardJ extends Reward {
  RewardJ({required int assetId, required int amount}) : super(assetId: assetId, amount: amount);

  factory RewardJ.fromJson(Map<String, dynamic> json) => _$RewardJFromJson(json);
  Map<String, dynamic> toJson() => _$RewardJToJson(this);
}
