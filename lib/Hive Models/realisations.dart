import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'realisations.g.dart';

@HiveType(typeId: 5)
class HRealisation extends HiveObject {
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
  HRealisation(this.type, this.mois, this.annee, this.rubriquesUid);
}
