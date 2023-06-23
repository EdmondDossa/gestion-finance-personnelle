import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part "avoirs.g.dart";

@HiveType(typeId: 0)
class HAvoirs extends HiveObject {
  @HiveField(0)
  late double capital = 0;
  @HiveField(1)
  late String userUid = authServices.currentUser.uid;
  HAvoirs(this.capital);
}
