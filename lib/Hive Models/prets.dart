import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'prets.g.dart';

@HiveType(typeId: 3)
class HPrets extends HiveObject {
  @HiveField(0)
  double montant;
  @HiveField(1)
  String date;
  @HiveField(2)
  String userUid = authServices.currentUser.uid;
  HPrets(this.montant, this.date);
}
