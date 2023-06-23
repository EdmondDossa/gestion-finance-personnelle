import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:hive/hive.dart';

part 'rubriques.g.dart';

@HiveType(typeId: 6)
class HRubriques extends HiveObject {
  @HiveField(0)
  String nomRubrique;
  @HiveField(1)
  String description;
  @HiveField(2)
  String userUid;

  HRubriques(this.nomRubrique, this.description, this.userUid, [String? uid]);
}
