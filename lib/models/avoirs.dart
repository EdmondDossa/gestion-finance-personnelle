import 'package:gestion_finance/utilities/auth_services.dart';

class GFAvoirs {
  String? uid;
  double capital = 0;
  String? userUid = authServices.currentUser.uid;
  
  GFAvoirs(this.capital);

  GFAvoirs.fromJson(Map<String, dynamic> json) {
    capital = json["capital"];
    uid = json["uid"];
    userUid = json["userUid"];
  }
  Map<String, dynamic> toJson() {
    return {"uid": uid, "capital": capital,"userUid": userUid,};
  }
}