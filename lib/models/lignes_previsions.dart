class GFLignesPrevisions {
  int? uid;
  String? type;
  double? montant;
  int? rubrique;
  int? prevision;
  int? source;
  String? description;

  GFLignesPrevisions(
      {this.type,
      this.montant,
      this.rubrique,
      this.prevision,
      this.description,
      this.uid,
      this.source});
  GFLignesPrevisions.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    type = json["type"];
    montant = json["montant"];
    rubrique = json["rubrique"];
    prevision = json["prevision"];
    description = json["description"];
    source = json["source"];
  }
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "type": type,
      "montant": montant,
      "rubrique": rubrique,
      "prevision": prevision,
      "description": description,
      "source": source,
    };
  }
}
