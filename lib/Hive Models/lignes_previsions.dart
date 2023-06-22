import 'package:hive/hive.dart';

part 'lignes_previsions.g.dart';

@HiveType(typeId: 2)

class HLignesPrevision extends HiveObject{
  @HiveField(0)
  late String type;
  @HiveField(1)
  late double montant;
  @HiveField(2)
  late String uidRubrique;
  @HiveField(3)
  late String uidPrevision;
}
