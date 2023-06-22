class LignesPrevision {
  String? uid="";
  String type="";
  double montant=0;
  String uidRubrique ="";
  String uidPrevision ="";

  LignesPrevision(this.type,this.montant,this.uidRubrique,this.uidPrevision);
  LignesPrevision.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    type = json["type"];
    montant = json["montant"];
    uidRubrique = json["uidRubrique"];
    uidPrevision = json["uidPrevision ="""];
  }
  Map<String, dynamic> toJson() {
    return {
      "uid" : uid,
      "type" : type,
      "montant" : montant,
      "uidRubrique" : uidRubrique,
      "uidPrevision =""" : uidPrevision ="",
    };
  }
}
