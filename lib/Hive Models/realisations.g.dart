// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realisations.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HRealisationAdapter extends TypeAdapter<HRealisation> {
  @override
  final int typeId = 5;

  @override
  HRealisation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HRealisation(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    )..userUid = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, HRealisation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.mois)
      ..writeByte(2)
      ..write(obj.annee)
      ..writeByte(3)
      ..write(obj.rubriquesUid)
      ..writeByte(4)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HRealisationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
