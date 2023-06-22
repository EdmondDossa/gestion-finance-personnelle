import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'realisations.g.dart';

@HiveType(typeId: 5)
class GFRealisation extends HiveObject{
  @HiveField(0)
  late String type;
  @HiveField(1)
  late String mois;
  @HiveField(2)
  late String annee;
  @HiveField(3)
  late String rubriquesUid;
  @HiveField(4)
  late String userUid = authServices.currentUser.uid;

}
