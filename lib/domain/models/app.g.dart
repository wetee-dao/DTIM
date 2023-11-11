// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppAdapter extends TypeAdapter<App> {
  @override
  final int typeId = 5;

  @override
  App read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return App(
      hash: fields[2] as String,
      type: fields[3] as int,
      url: fields[4] as String?,
      name: fields[5] as String?,
      desc: fields[6] as String?,
      icon: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, App obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
