import 'dart:convert';

import 'package:dtim/chain/wetee/types/pallet_balances/types/account_data.dart';
import 'package:dtim/chain/wetee/types/primitive_types/h256.dart';
import 'package:dtim/chain/wetee/types/wetee_gov/member_data.dart';
import 'package:dtim/chain/wetee/types/wetee_gov/pre_prop.dart';
import 'package:dtim/chain/wetee/types/wetee_gov/tally.dart';
import 'package:dtim/chain/wetee/types/wetee_org/guild_info.dart';
import 'package:dtim/chain/wetee/types/wetee_org/org_info.dart';
import 'package:dtim/chain/wetee/types/wetee_org/quarter_task.dart';
import 'package:dtim/chain/wetee/types/wetee_project/project_info.dart';
import 'package:dtim/chain/wetee/types/wetee_runtime/runtime_call.dart';
import 'package:json_annotation/json_annotation.dart';

/// vote yes or no
/// 投票
class WithGovPs {
  final int runType;
  final int amount;
  final MemberData member;
  final int periodIndex;
  const WithGovPs({
    required this.runType,
    required this.amount,
    required this.member,
    required this.periodIndex,
  });
}

@JsonSerializable()
class AssetAccountDataLocal extends AccountData {
  AssetAccountDataLocal({required super.free, required super.reserved, required super.frozen});

  factory AssetAccountDataLocal.fromJson(Map<String, dynamic> json) => _$AssetAccountDataLocalFromJson(json);

  @override
  Map<String, BigInt> toJson() => _$AssetAccountDataLocalToJson(this);
}

@JsonSerializable()
class OrgInfoLocal extends OrgInfo {
  OrgInfoLocal(
      {required super.id,
      required super.creator,
      required super.startBlock,
      required super.daoAccountId,
      required super.name,
      required super.purpose,
      required super.metaData,
      required super.desc,
      required super.imApi,
      required super.bg,
      required super.logo,
      required super.img,
      required super.homeUrl,
      required super.status});

  factory OrgInfoLocal.fromJson(Map<String, dynamic> json) => _$OrgInfoLocalFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrgInfoLocalToJson(this);
}

@JsonSerializable()
class QuarterLocal {
  QuarterLocal({
    required int year,
    required int quarter,
    required this.tasks,
  });

  final List<QuarterTaskLocal> tasks;
  factory QuarterLocal.fromJson(Map<String, dynamic> json) => _$QuarterLocalFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuarterLocalToJson(this);
}

@JsonSerializable()
class QuarterTaskLocal extends QuarterTask {
  QuarterTaskLocal(
      {required super.id,
      required super.name,
      required super.priority,
      required super.creator,
      required super.tags,
      required super.status});

  factory QuarterTaskLocal.fromJson(Map<String, dynamic> json) => _$QuarterTaskLocalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$QuarterTaskLocalToJson(this);
}

@JsonSerializable()
class PropsLocal extends PreProp {
  PropsLocal({
    required super.id,
    required super.hash,
    required super.call,
    required super.memberData,
    required super.creater,
    required super.periodIndex,
    required super.start,
  });

  factory PropsLocal.fromJson(Map<String, dynamic> json) => _$PropsLocalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PropsLocalToJson(this);
}

@JsonSerializable()
class PeriodLocal extends Period {
  PeriodLocal({
    required super.name,
    required super.preparePeriod,
    required super.maxDeciding,
    required super.confirmPeriod,
    required super.decisionPeriod,
    required super.minEnactmentPeriod,
    required super.decisionDeposit,
    required super.minApproval,
    required super.minSupport,
  });

  factory PeriodLocal.fromJson(Map<String, dynamic> json) => _$PeriodLocalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PeriodLocalToJson(this);
}

@JsonSerializable()
class ProjectInfoLocal extends ProjectInfo {
  ProjectInfoLocal({
    required super.id,
    required super.name,
    required super.description,
    required super.daoAccountId,
    required super.creator,
    required super.status,
  });

  factory ProjectInfoLocal.fromJson(Map<String, dynamic> json) => _$ProjectInfoLocalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProjectInfoLocalToJson(this);
}

@JsonSerializable()
class GuildInfoLocal extends GuildInfo {
  GuildInfoLocal({
    required super.id,
    required super.creator,
    required super.startBlock,
    required super.daoAccountId,
    required super.name,
    required super.desc,
    required super.metaData,
    required super.status,
  });

  factory GuildInfoLocal.fromJson(Map<String, dynamic> json) => _$GuildInfoLocalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GuildInfoLocalToJson(this);
}

@JsonSerializable()
class PropLocal extends PreProp {
  PropLocal({
    required BigInt id,
    required H256 hash,
    // required int end,
    required RuntimeCall proposal,
    // required int delay,
    required this.tally,
    required this.memberGroup,
    required this.period,
    required int status,
  }) : super(
          id: id,
          hash: hash,
          proposal: proposal,
          tally: tally,
          period: period,
          memberGroup: memberGroup,
          status: status,
          start: start,
        );

  @override
  final TallyLocal tally;

  @override
  final PropLocal memberGroup;

  @override
  final PropLocal period;

  factory PropLocal.fromJson(Map<String, dynamic> json) => _$PropLocalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PropLocalToJson(this);
}

@JsonSerializable()
class TallyLocal extends Tally {
  TallyLocal({
    required super.yes,
    required super.no,
  });

  factory TallyLocal.fromJson(Map<String, dynamic> json) => _$TallyLocalFromJson(json);
  @override
  Map<String, BigInt> toJson() => _$TallyLocalToJson(this);
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

@JsonSerializable()
class GovVoteJ extends GovVote {
  GovVoteJ({
    required int daoId,
    required int pledge,
    required int opinion,
    required int voteWeight,
    required int unlockBlock,
    required int referendumIndex,
  }) : super(
          daoId: daoId,
          pledge: pledge,
          opinion: opinion,
          voteWeight: voteWeight,
          unlockBlock: unlockBlock,
          referendumIndex: referendumIndex,
        );

  factory GovVoteJ.fromJson(Map<String, dynamic> json) => _$GovVoteJFromJson(json);
  Map<String, dynamic> toJson() => _$GovVoteJToJson(this);
}

@JsonSerializable()
class OrgAppJ extends OrgApp {
  const OrgAppJ({
    required int id,
    required int appId,
    required int startBlock,
    required String name,
    required String desc,
    required String icon,
    required String url,
    required int status,
  }) : super(
          id: id,
          appId: appId,
          startBlock: startBlock,
          name: name,
          desc: desc,
          icon: icon,
          url: url,
          status: status,
        );

  factory OrgAppJ.fromJson(Map<String, dynamic> json) => _$OrgAppJFromJson(json);
  Map<String, dynamic> toJson() => _$OrgAppJToJson(this);
}

@JsonSerializable()
class AppJ extends App {
  const AppJ({
    required int id,
    required String name,
    required String desc,
    required String icon,
    required String url,
    required int status,
    required String creator,
  }) : super(id: id, name: name, desc: desc, icon: icon, url: url, status: status, creator: creator);

  factory AppJ.fromJson(Map<String, dynamic> json) => _$AppJFromJson(json);
  Map<String, dynamic> toJson() => _$AppJToJson(this);
}

class Treasury {
  String proposer;
  String value;
  String beneficiary;
  String bond;
  String status;
  int daoId;
  int proposalIndex;

  Treasury({
    required this.proposer,
    required this.value,
    required this.beneficiary,
    required this.bond,
    required this.status,
    required this.daoId,
    required this.proposalIndex,
  });

  factory Treasury.fromRawJson(String str) => Treasury.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Treasury.fromJson(Map<String, dynamic> json) => Treasury(
        proposer: json["proposer"],
        value: json["value"],
        beneficiary: json["beneficiary"],
        bond: json["bond"],
        status: json["status"],
        daoId: json["dao_id"],
        proposalIndex: json["proposal_index"],
      );

  Map<String, dynamic> toJson() => {
        "proposer": proposer,
        "value": value,
        "beneficiary": beneficiary,
        "bond": bond,
        "status": status,
        "dao_id": daoId,
        "proposal_index": proposalIndex,
      };
}

class Period {
  String name;
  int preparePeriod;
  int maxDeciding;
  int confirmPeriod;
  int decisionPeriod;
  int minEnactmentPeriod;
  int decisionDeposit;
  int minApproval;
  int minSupport;

  Period({
    required this.name,
    required this.preparePeriod,
    required this.maxDeciding,
    required this.confirmPeriod,
    required this.decisionPeriod,
    required this.minEnactmentPeriod,
    required this.decisionDeposit,
    required this.minApproval,
    required this.minSupport,
  });

  factory Period.fromRawJson(String str) => Period.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Period.fromJson(Map<String, dynamic> json) => Period(
        name: json["name"],
        preparePeriod: json["preparePeriod"],
        maxDeciding: json["maxDeciding"],
        confirmPeriod: json["confirmPeriod"],
        decisionPeriod: json["decisionPeriod"],
        minEnactmentPeriod: json["minEnactmentPeriod"],
        decisionDeposit: json["decisionDeposit"],
        minApproval: json["minApproval"],
        minSupport: json["minSupport"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "preparePeriod": preparePeriod,
        "maxDeciding": maxDeciding,
        "confirmPeriod": confirmPeriod,
        "decisionPeriod": decisionPeriod,
        "minEnactmentPeriod": minEnactmentPeriod,
        "decisionDeposit": decisionDeposit,
        "minApproval": minApproval,
        "minSupport": minSupport,
      };
}
