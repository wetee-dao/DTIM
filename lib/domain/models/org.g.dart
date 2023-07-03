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
      purpose: fields[8] as String?,
      imApi: fields[10] as String?,
      bg: fields[11] as String?,
      logo: fields[12] as String?,
      img: fields[13] as String?,
      homeUrl: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Org obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.hash)
      ..writeByte(2)
      ..write(obj.daoId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.desc)
      ..writeByte(8)
      ..write(obj.purpose)
      ..writeByte(10)
      ..write(obj.imApi)
      ..writeByte(11)
      ..write(obj.bg)
      ..writeByte(12)
      ..write(obj.logo)
      ..writeByte(13)
      ..write(obj.img)
      ..writeByte(14)
      ..write(obj.homeUrl);
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

class OrgAppAdapter extends TypeAdapter<OrgApp> {
  @override
  final int typeId = 5;

  @override
  OrgApp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrgApp(
      hash: fields[2] as String,
      type: fields[3] as int,
      url: fields[4] as String?,
      name: fields[5] as String?,
      desc: fields[6] as String?,
      meta: (fields[7] as Map?)?.cast<String, String>(),
      icon: fields[8] as String?,
      appId: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OrgApp obj) {
    writer
      ..writeByte(8)
      ..writeByte(2)
      ..write(obj.hash)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.desc)
      ..writeByte(8)
      ..write(obj.icon)
      ..writeByte(9)
      ..write(obj.appId)
      ..writeByte(7)
      ..write(obj.meta);
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
