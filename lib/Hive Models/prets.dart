import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'prets.g.dart';

@HiveType(typeId: 3)
class GFPrets extends HiveObject{
  @HiveField(0)
  late double montant; 
  @HiveField(1)
  late String date;
  @HiveField(2)
  late String userUid = authServices.currentUser.uid;
}
