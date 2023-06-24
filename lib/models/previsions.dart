import 'package:gestion_finance/utilities/auth_services.dart';

class GFPrevisions {
  int? uid;
  String mois = "";
  String annee = "";
  String userUid = authServices.currentUser.uid;
  GFPrevisions(this.mois, this.annee, year, {this.uid});
  GFPrevisions.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    mois = json["mois"];
    annee = json["annee"];
  }
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "mois": mois,
      "annee": annee,
    };
  }
}
