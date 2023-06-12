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
