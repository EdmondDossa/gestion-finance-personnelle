class GFObjectifs {
  String? objectifUid;
  String? nomObjectifs;
  String? description;
  double? montant;
  DateTime? dateLimite;
  bool? etat;

  GFObjectifs({this.nomObjectifs, this.description,this.montant,this.dateLimite,this.etat});
  GFObjectifs.fromJson(Map<String, dynamic> json) {
    objectifUid = json["objectifUid"];
    nomObjectifs = json["nomObjectifs"];
    description = json["description"];
    montant = json["montant"];
    dateLimite = json["dateLimite"];
    etat = json["etat"];
  }
  Map<String, dynamic> toJson() {
    return {
      "objectifUid" : objectifUid,
      "nomObjectifs" : nomObjectifs,
      "description" : description,
      "montant" : montant,
      "dateLimite" : dateLimite,
      "etat" : etat,
    };
  }
}
