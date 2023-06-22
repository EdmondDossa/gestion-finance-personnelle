// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prets.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GFPretsAdapter extends TypeAdapter<GFPrets> {
  @override
  final int typeId = 3;

  @override
  GFPrets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GFPrets()
      ..montant = fields[0] as double
      ..date = fields[1] as String
      ..userUid = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, GFPrets obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.montant)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GFPretsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
