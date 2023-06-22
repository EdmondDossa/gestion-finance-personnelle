// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rubriques.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GFRubriquesAdapter extends TypeAdapter<GFRubriques> {
  @override
  final int typeId = 6;

  @override
  GFRubriques read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GFRubriques()
      ..nomRubrique = fields[0] as String
      ..description = fields[1] as String
      ..userUid = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, GFRubriques obj) {
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
      other is GFRubriquesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
