class GFLignesPrevisions {
  int? uid;
  String? type;
  double? montant;
  int? rubrique;
  int? prevision;

  GFLignesPrevisions({this.type, this.montant, this.rubrique, this.prevision,this.uid});
  GFLignesPrevisions.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    type = json["type"];
    montant = json["montant"];
    rubrique = json["rubrique"];
    prevision = json["prevision"];
  }
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "type": type,
      "montant": montant,
      "rubrique": rubrique,
      "prevision": prevision,
    };
  }
}
