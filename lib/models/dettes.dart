class GFDettes {
  String? detteUid;
  String? nomDette;
  DateTime? dateDebut;
  DateTime? dateFin;
  double? montantTotal;
  double? montantPaye;
  double? taux;
  String? motif;
  bool? etat;
  GFDettes({this.nomDette, this.dateDebut,this.dateFin,this.montantTotal,this.montantPaye,this.taux,this.motif,this.etat});
  GFDettes.fromJson(Map<String, dynamic> json) {
    detteUid = json["detteUid"];
    nomDette = json["nomDette"];
    dateDebut = json["dateDebut"];
    dateFin = json["dateFin"];
    montantTotal = json["montantTotal"];
    montantPaye = json["montantPaye"];
    taux = json["taux"];
    motif = json["motif"];
    etat = json["etat"];
  }
  Map<String, dynamic> toJson() {
    return {
      "detteUid":detteUid,
      "nomDette":nomDette,
      "dateDebut":dateDebut,
      "dateFin":dateFin,
      "montantPaye":montantPaye,
      "montantTotal":montantTotal,
      "taux":taux,
      "motif":motif,
      "etat":etat,
    };
  }
}
