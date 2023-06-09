// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SystemAdapter extends TypeAdapter<System> {
  @override
  final int typeId = 6;

  @override
  System read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return System(
      width: fields[1] as double,
      height: fields[2] as double,
      theme: fields[3] as String,
    )..loginAccount = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, System obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.theme)
      ..writeByte(4)
      ..write(obj.loginAccount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
