// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avoirs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HAvoirsAdapter extends TypeAdapter<HAvoirs> {
  @override
  final int typeId = 0;

  @override
  HAvoirs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HAvoirs()
      ..capital = fields[0] as double
      ..userUid = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, HAvoirs obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.capital)
      ..writeByte(1)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HAvoirsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
