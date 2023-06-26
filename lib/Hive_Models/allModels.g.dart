// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allModels.dart';

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
    return HAvoirs(
      fields[0] as double,
    )..userUid = fields[1] as String;
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

class HDettesAdapter extends TypeAdapter<HDettes> {
  @override
  final int typeId = 1;

  @override
  HDettes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HDettes(
      fields[0] as double,
    )..userUid = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, HDettes obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.montant)
      ..writeByte(1)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HDettesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HLignesPrevisionsAdapter extends TypeAdapter<HLignesPrevisions> {
  @override
  final int typeId = 2;

  @override
  HLignesPrevisions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HLignesPrevisions(
      fields[0] as String?,
      fields[1] as double?,
      fields[3] as int?,
      fields[4] as String?,
      fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HLignesPrevisions obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.montant)
      ..writeByte(2)
      ..write(obj.rubrique)
      ..writeByte(3)
      ..write(obj.prevision)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HLignesPrevisionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HPretsAdapter extends TypeAdapter<HPrets> {
  @override
  final int typeId = 3;

  @override
  HPrets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HPrets(
      fields[0] as double,
    )..userUid = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, HPrets obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.montant)
      ..writeByte(1)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HPretsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HPrevisionsAdapter extends TypeAdapter<HPrevisions> {
  @override
  final int typeId = 4;

  @override
  HPrevisions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HPrevisions(
      fields[0] as String,
      fields[1] as String,
    )..userUid = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, HPrevisions obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.mois)
      ..writeByte(1)
      ..write(obj.annee)
      ..writeByte(3)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HPrevisionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HRealisationsAdapter extends TypeAdapter<HRealisations> {
  @override
  final int typeId = 5;

  @override
  HRealisations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HRealisations(
      type: fields[0] as String,
      date: fields[1] as DateTime,
      montant: fields[2] as double,
      rubrique: fields[3] as int,
      source: fields[4] as int?,
      description: fields[5] as String?,
    )..userUid = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, HRealisations obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.montant)
      ..writeByte(3)
      ..write(obj.rubrique)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.userUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HRealisationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
    )..userUid = fields[2] as String;
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
