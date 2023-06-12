// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrgAdapter extends TypeAdapter<Org> {
  @override
  final int typeId = 3;

  @override
  Org read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Org(
      fields[1] as String,
      daoId: fields[2] as int,
      name: fields[3] as String?,
      desc: fields[4] as String?,
      metaData: fields[6] as OrgMetaData?,
      chainUrl: fields[5] as String?,
      apps: (fields[7] as List).cast<OrgApp>(),
    );
  }

  @override
  void write(BinaryWriter writer, Org obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.hash)
      ..writeByte(2)
      ..write(obj.daoId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.desc)
      ..writeByte(5)
      ..write(obj.chainUrl)
      ..writeByte(6)
      ..write(obj.metaData)
      ..writeByte(7)
      ..write(obj.apps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrgAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrgMetaDataAdapter extends TypeAdapter<OrgMetaData> {
  @override
  final int typeId = 4;

  @override
  OrgMetaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrgMetaData(
      domain: fields[1] as String?,
      avater: fields[2] as String?,
      homeUrl: fields[5] as String?,
      img: fields[3] as String?,
      color: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrgMetaData obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.domain)
      ..writeByte(2)
      ..write(obj.avater)
      ..writeByte(3)
      ..write(obj.img)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.homeUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrgMetaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrgAppAdapter extends TypeAdapter<OrgApp> {
  @override
  final int typeId = 5;

  @override
  OrgApp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrgApp()
      ..appId = fields[1] as int
      ..hash = fields[2] as String
      ..type = fields[3] as int
      ..url = fields[4] as String?
      ..name = fields[5] as String?
      ..desc = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, OrgApp obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.appId)
      ..writeByte(2)
      ..write(obj.hash)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.desc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrgAppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
