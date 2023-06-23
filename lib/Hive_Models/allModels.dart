
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
  late String type;
  @HiveField(1)
  late double montant;
  @HiveField(2)
  late String uidRubrique;
  @HiveField(3)
  late String uidPrevision;
  HLignesPrevisions(
      this.type, this.montant, this.uidPrevision, this.uidRubrique);
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
class HPrevisions extends HiveObject{
  @HiveField(0)
  late String mois;
  @HiveField(1)
  late String annee;
  @HiveField(2)
  late double montant;
  @HiveField(3)
  late String userUid = authServices.currentUser.uid;
  HPrevisions(this.mois, this.annee, this.montant);
}

@HiveType(typeId: 5)
class HRealisations extends HiveObject {
  @HiveField(0)
  String type;
  @HiveField(1)
  String mois;
  @HiveField(2)
  String annee;
  @HiveField(3)
  String rubriquesUid;
  @HiveField(4)
  String userUid = authServices.currentUser.uid;
  HRealisations(this.type, this.mois, this.annee, this.rubriquesUid);
}

@HiveType(typeId: 6)
class HRubriques extends HiveObject {
  @HiveField(0)
  String nomRubrique;
  @HiveField(1)
  String description;
  @HiveField(2)
  String userUid =authServices.currentUser.uid;

  HRubriques(this.nomRubrique, this.description);
}