class GFPrevision {
  String? uid;
  String mois = "";
  String annee = "";
  double montant = 0;
  String userUid="";
  GFPrevision(this.montant, this.mois, this.annee,this.userUid);
  GFPrevision.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    mois = json["mois"];
    annee = json["annee"];
    montant = json["montant"];
    userUid = json["userUid"];
  }
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "mois": mois,
      "annee": annee,
      "montant": montant,
      "userUid": userUid,
    };
  }
}
