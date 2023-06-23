// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rubriques.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HRubriquesAdapter extends TypeAdapter<HRubriques> {
  @override
  final int typeId = 6;

  @override
  HRubriques read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HRubriques(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HRubriques obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nomRubrique)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HRubriquesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
