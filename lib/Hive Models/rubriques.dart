import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'rubriques.g.dart';

@HiveType(typeId: 6)
class GFRubriques extends HiveObject{
  @HiveField(0)
  late String nomRubrique = "";
  @HiveField(1)
  late String description = "";
  @HiveField(2)
  late String userUid = authServices.currentUser.uid;
  
}
