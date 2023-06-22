// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previsions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HPrevisionAdapter extends TypeAdapter<HPrevision> {
  @override
  final int typeId = 4;

  @override
  HPrevision read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HPrevision()
      ..mois = fields[0] as String
      ..annee = fields[1] as String
      ..montant = fields[2] as double
      ..userUid = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, HPrevision obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.mois)
      ..writeByte(1)
      ..write(obj.annee)
      ..writeByte(2)
      ..write(obj.montant)
      ..writeByte(3)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HPrevisionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
