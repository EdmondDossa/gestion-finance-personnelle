// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lignes_previsions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HLignesPrevisionAdapter extends TypeAdapter<HLignesPrevision> {
  @override
  final int typeId = 2;

  @override
  HLignesPrevision read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HLignesPrevision(
      fields[0] as String,
      fields[1] as double,
      fields[3] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HLignesPrevision obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.montant)
      ..writeByte(2)
      ..write(obj.uidRubrique)
      ..writeByte(3)
      ..write(obj.uidPrevision);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HLignesPrevisionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
