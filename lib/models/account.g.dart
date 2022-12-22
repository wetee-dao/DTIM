// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChainData _$ChainDataFromJson(Map<String, dynamic> json) => ChainData(
      json['address'] as String,
      json['encoded'] as String,
      ChainDataEncoding.fromJson(json['encoding'] as Map<String, dynamic>),
      Map<String, String>.from(json['meta'] as Map),
    );

Map<String, dynamic> _$ChainDataToJson(ChainData instance) => <String, dynamic>{
      'encoded': instance.encoded,
      'address': instance.address,
      'encoding': instance.encoding,
      'meta': instance.meta,
    };

ChainDataEncoding _$ChainDataEncodingFromJson(Map<String, dynamic> json) =>
    ChainDataEncoding(
      (json['content'] as List<dynamic>).map((e) => e as String).toList(),
      json['type'] as String,
      json['version'] as String,
    );

Map<String, dynamic> _$ChainDataEncodingToJson(ChainDataEncoding instance) =>
    <String, dynamic>{
      'content': instance.content,
      'type': instance.type,
      'version': instance.version,
    };
