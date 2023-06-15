// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_struct_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetAccountDataJ _$AssetAccountDataJFromJson(Map<String, dynamic> json) =>
    AssetAccountDataJ(
      free: json['free'] as int,
      reserved: json['reserved'] as int,
      frozen: json['frozen'] as int,
    );

Map<String, dynamic> _$AssetAccountDataJToJson(AssetAccountDataJ instance) =>
    <String, dynamic>{
      'free': instance.free,
      'reserved': instance.reserved,
      'frozen': instance.frozen,
    };

DaoInfoJ _$DaoInfoJFromJson(Map<String, dynamic> json) => DaoInfoJ(
      id: json['id'] as int,
      creator: json['creator'] as String,
      startBlock: json['startBlock'] as int,
      daoAccountId: json['daoAccountId'] as String,
      name: json['name'] as String,
      purpose: json['purpose'] as String,
      metaData: json['metaData'] as String,
      chainUnit: json['chainUnit'] as int,
    );

Map<String, dynamic> _$DaoInfoJToJson(DaoInfoJ instance) => <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator,
      'startBlock': instance.startBlock,
      'daoAccountId': instance.daoAccountId,
      'name': instance.name,
      'purpose': instance.purpose,
      'metaData': instance.metaData,
      'chainUnit': instance.chainUnit,
    };

QuarterJ _$QuarterJFromJson(Map<String, dynamic> json) => QuarterJ(
      year: json['year'] as int,
      quarter: json['quarter'] as int,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => QuarterTaskJ.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuarterJToJson(QuarterJ instance) => <String, dynamic>{
      'year': instance.year,
      'quarter': instance.quarter,
      'tasks': instance.tasks,
    };

QuarterTaskJ _$QuarterTaskJFromJson(Map<String, dynamic> json) => QuarterTaskJ(
      id: json['id'] as int,
      name: json['name'] as String,
      priority: json['priority'] as int,
      creator: json['creator'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => U8WrapJ.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
    );

Map<String, dynamic> _$QuarterTaskJToJson(QuarterTaskJ instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'priority': instance.priority,
      'creator': instance.creator,
      'status': instance.status,
      'tags': instance.tags,
    };

U8WrapJ _$U8WrapJFromJson(Map<String, dynamic> json) => U8WrapJ(
      value: json['value'] as int,
    );

Map<String, dynamic> _$U8WrapJToJson(U8WrapJ instance) => <String, dynamic>{
      'value': instance.value,
    };

GovPropsJ _$GovPropsJFromJson(Map<String, dynamic> json) => GovPropsJ(
      index: json['index'] as int,
      hash: json['hash'] as String,
      runtimeCall: json['runtimeCall'] as String,
      memberGroup:
          MemberGroupJ.fromJson(json['memberGroup'] as Map<String, dynamic>),
      account: json['account'] as String,
    );

Map<String, dynamic> _$GovPropsJToJson(GovPropsJ instance) => <String, dynamic>{
      'index': instance.index,
      'hash': instance.hash,
      'runtimeCall': instance.runtimeCall,
      'account': instance.account,
      'memberGroup': instance.memberGroup,
    };

MemberGroupJ _$MemberGroupJFromJson(Map<String, dynamic> json) => MemberGroupJ(
      scope: json['scope'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$MemberGroupJToJson(MemberGroupJ instance) =>
    <String, dynamic>{
      'scope': instance.scope,
      'id': instance.id,
    };

ProjectInfoJ _$ProjectInfoJFromJson(Map<String, dynamic> json) => ProjectInfoJ(
      id: json['id'] as int,
      name: json['name'] as String,
      daoAccountId: json['daoAccountId'] as String,
      description: json['description'] as String,
      creator: json['creator'] as String,
      status: json['status'] as int,
    );

Map<String, dynamic> _$ProjectInfoJToJson(ProjectInfoJ instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'daoAccountId': instance.daoAccountId,
      'description': instance.description,
      'creator': instance.creator,
      'status': instance.status,
    };

GuildInfoJ _$GuildInfoJFromJson(Map<String, dynamic> json) => GuildInfoJ(
      id: json['id'] as int,
      creator: json['creator'] as String,
      daoAccountId: json['daoAccountId'] as String,
      startBlock: json['startBlock'] as int,
      name: json['name'] as String,
      desc: json['desc'] as String,
      metaData: json['metaData'] as String,
      status: json['status'] as int,
    );

Map<String, dynamic> _$GuildInfoJToJson(GuildInfoJ instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator,
      'daoAccountId': instance.daoAccountId,
      'startBlock': instance.startBlock,
      'name': instance.name,
      'desc': instance.desc,
      'metaData': instance.metaData,
      'status': instance.status,
    };

GovReferendumJ _$GovReferendumJFromJson(Map<String, dynamic> json) =>
    GovReferendumJ(
      id: json['id'] as int,
      hash: json['hash'] as String,
      end: json['end'] as int,
      proposal: json['proposal'] as String,
      delay: json['delay'] as int,
      tally: TallyJ.fromJson(json['tally'] as Map<String, dynamic>),
      memberGroup:
          MemberGroupJ.fromJson(json['memberGroup'] as Map<String, dynamic>),
      status: json['status'] as int,
    );

Map<String, dynamic> _$GovReferendumJToJson(GovReferendumJ instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hash': instance.hash,
      'end': instance.end,
      'proposal': instance.proposal,
      'delay': instance.delay,
      'status': instance.status,
      'tally': instance.tally,
      'memberGroup': instance.memberGroup,
    };

TallyJ _$TallyJFromJson(Map<String, dynamic> json) => TallyJ(
      yes: json['yes'] as int,
      no: json['no'] as int,
    );

Map<String, dynamic> _$TallyJToJson(TallyJ instance) => <String, dynamic>{
      'yes': instance.yes,
      'no': instance.no,
    };

TaskInfoJ _$TaskInfoJFromJson(Map<String, dynamic> json) => TaskInfoJ(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      point: json['point'] as int,
      priority: json['priority'] as int,
      projectId: json['projectId'] as int,
      creator: json['creator'] as String,
      rewards: (json['rewards'] as List<dynamic>)
          .map((e) => RewardJ.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxAssignee: json['maxAssignee'] as int,
      assignees:
          (json['assignees'] as List<dynamic>).map((e) => e as String).toList(),
      reviewers:
          (json['reviewers'] as List<dynamic>).map((e) => e as String).toList(),
      skills: (json['skills'] as List<dynamic>)
          .map((e) => U8WrapJ.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
    );

Map<String, dynamic> _$TaskInfoJToJson(TaskInfoJ instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'point': instance.point,
      'priority': instance.priority,
      'projectId': instance.projectId,
      'creator': instance.creator,
      'maxAssignee': instance.maxAssignee,
      'assignees': instance.assignees,
      'reviewers': instance.reviewers,
      'status': instance.status,
      'skills': instance.skills,
      'rewards': instance.rewards,
    };

RewardJ _$RewardJFromJson(Map<String, dynamic> json) => RewardJ(
      assetId: json['assetId'] as int,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$RewardJToJson(RewardJ instance) => <String, dynamic>{
      'assetId': instance.assetId,
      'amount': instance.amount,
    };
