// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 1;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      address: fields[3] as String,
      chainData: fields[4] as String,
      orgs: (fields[5] as List).cast<AccountOrg>(),
    )
      ..id = fields[0] as int
      ..name = fields[1] as String?
      ..avatar = fields[6] as Uri?
      ..domain = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.avatar)
      ..writeByte(2)
      ..write(obj.domain)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.chainData)
      ..writeByte(5)
      ..write(obj.orgs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AccountOrgAdapter extends TypeAdapter<AccountOrg> {
  @override
  final int typeId = 2;

  @override
  AccountOrg read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountOrg(
      fields[2] as String,
    )
      ..orgName = fields[3] as String?
      ..orgColor = fields[4] as String?
      ..orgAvater = fields[5] as String?
      ..orgImg = fields[6] as String?
      ..domain = fields[7] as String?
      ..chainUrl = fields[8] as String?
      ..daoId = fields[9] as int
      ..status = fields[10] as int
      ..withAddr = fields[11] as String
      ..account = fields[12] as Account;
  }

  @override
  void write(BinaryWriter writer, AccountOrg obj) {
    writer
      ..writeByte(11)
      ..writeByte(2)
      ..write(obj.orgHash)
      ..writeByte(3)
      ..write(obj.orgName)
      ..writeByte(4)
      ..write(obj.orgColor)
      ..writeByte(5)
      ..write(obj.orgAvater)
      ..writeByte(6)
      ..write(obj.orgImg)
      ..writeByte(7)
      ..write(obj.domain)
      ..writeByte(8)
      ..write(obj.chainUrl)
      ..writeByte(9)
      ..write(obj.daoId)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.withAddr)
      ..writeByte(12)
      ..write(obj.account);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountOrgAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
