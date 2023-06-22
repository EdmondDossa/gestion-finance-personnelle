import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'previsions.g.dart';

@HiveType(typeId: 4)
class HPrevision extends HiveObject{
  @HiveField(0)
  late String mois;
  @HiveField(1)
  late String annee;
  @HiveField(2)
  late double montant;
  @HiveField(3)
  late String userUid = authServices.currentUser.uid;
}
