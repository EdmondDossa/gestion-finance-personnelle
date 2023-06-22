import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'dettes.g.dart';

@HiveType(typeId: 1)
class HDettes extends HiveObject{
  @HiveField(0)
  late double montant; 
  @HiveField(1)
  late String date;
  @HiveField(2)
  late String userUid = authServices.currentUser.uid;
}
