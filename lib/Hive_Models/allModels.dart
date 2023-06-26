import 'package:gestion_finance/models/previsions.dart';
import 'package:gestion_finance/models/rubriques.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'allModels.g.dart';

@HiveType(typeId: 0)
class HAvoirs extends HiveObject {
  @HiveField(0)
  late double capital = 0;
  @HiveField(1)
  late String userUid = authServices.currentUser.uid;
  HAvoirs(this.capital);
}

@HiveType(typeId: 1)
class HDettes extends HiveObject {
  @HiveField(0)
  late double montant;
  @HiveField(1)
  late String userUid = authServices.currentUser.uid;

  HDettes(this.montant);
}

@HiveType(typeId: 2)
class HLignesPrevisions extends HiveObject {
  @HiveField(0)
  String? type;
  @HiveField(1)
  double? montant;
  @HiveField(2)
  int? rubrique;
  @HiveField(3)
  int? prevision;
  @HiveField(4)
  String? description;
  HLignesPrevisions(
      this.type, this.montant, this.prevision, this.description, this.rubrique);
}

@HiveType(typeId: 3)
class HPrets extends HiveObject {
  @HiveField(0)
  double montant;
  @HiveField(1)
  String userUid = authServices.currentUser.uid;
  HPrets(this.montant);
}

@HiveType(typeId: 4)
class HPrevisions extends HiveObject {
  @HiveField(0)
  String mois;
  @HiveField(1)
  String annee;
  @HiveField(3)
  String userUid = authServices.currentUser.uid;
  HPrevisions(this.mois, this.annee);
}

@HiveType(typeId: 5)
class HRealisations extends HiveObject {
  @HiveField(0)
  String type;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  double montant;
  @HiveField(3)
  int rubrique;
  @HiveField(4)
  int? source;
  @HiveField(5)
  String? description;
  @HiveField(6)
  String userUid = authServices.currentUser.uid;
  HRealisations({required this.type, required this.date, required this.montant,required this.rubrique,this.source,this.description});
}

@HiveType(typeId: 6)
class HRubriques extends HiveObject {
  @HiveField(0)
  String nomRubrique;
  @HiveField(1)
  String description;
  @HiveField(2)
  String userUid = authServices.currentUser.uid;

  HRubriques(this.nomRubrique, this.description);
}
