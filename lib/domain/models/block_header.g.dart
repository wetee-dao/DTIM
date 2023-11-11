// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockHeader _$BlockHeaderFromJson(Map<String, dynamic> json) => BlockHeader(
      json['parentHash'] as String,
      json['number'] as String,
    );

Map<String, dynamic> _$BlockHeaderToJson(BlockHeader instance) =>
    <String, dynamic>{
      'parentHash': instance.parentHash,
      'number': instance.number,
    };
