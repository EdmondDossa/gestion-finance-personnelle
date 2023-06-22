class GFRealisation {
  String? uid;
  String type="";
  String mois="";
  String annee ="";
  String rubriquesUid ="";
  String userUid="";

  GFRealisation(
    this.type,
    this.mois,
    this.annee,
    this.rubriquesUid,
    this.userUid
  );
  GFRealisation.fromJson(Map<String, dynamic> json) {
    this.uid = json["uid"];
    this.type = json["type"];
    this.mois = json["mois"];
    this.annee = json["annee"];
    this.rubriquesUid = json["rubriquesUid"];
    this.userUid = json["userUid"];
  }
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "type": type,
      "mois": mois,
      "annee": annee,
      "rubriquesUid": rubriquesUid,
      "userUid": userUid,
    };
  }
}
