import 'package:gestion_finance/utilities/auth_services.dart';

class GFRubriques {
  int? uid;
  String nomRubrique = "";
  String description = "";
  String userUid = authServices.currentUser.uid;

  GFRubriques(this.nomRubrique, this.description, this.userUid, {this.uid});

  GFRubriques.fromJson(Map<String, dynamic> json) {
    nomRubrique = json["nomRubrique"];
    description = json["description"];
    uid = json["uid"];
    userUid = json["userUid"];
  }
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "nomRubrique": nomRubrique,
      "description": description,
      "userUid": userUid,
    };
  }
}
