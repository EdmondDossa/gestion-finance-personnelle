class GFPrets {
  String? pretUid;
  String? nomPret;
  DateTime? dateDebut;
  DateTime? dateFin;
  double? montantTotal;
  double? montantRendu;
  double? taux;
  String? motif;
  bool? etat;
  String? beneficier;
  GFPrets({this.nomPret, this.montantTotal,this.montantRendu,this.dateDebut,this.dateFin,this.taux,this.motif,this.beneficier,this.etat});
  GFPrets.fromJson(Map<String, dynamic> json) {
    pretUid = json["pretUid"];
    nomPret = json["nomPret"];
    dateDebut = json["dateDebut"];
    dateFin = json["dateFin"];
    montantRendu = json["montantRendu"];
    montantTotal = json["montantTotal"];
    taux = json["taux"];
    motif = json["motif"];
    etat = json["etat"];
    beneficier = json["beneficier"];
  }
  Map<String, dynamic> toJson() {
    return {
      "pretUid":pretUid,
      "nomPret":nomPret,
      "dateDebut":dateDebut,
      "dateFin":dateFin,
      "montantRendu":montantRendu,
      "montantTotal":montantTotal,
      "taux":taux,
      "motif":motif,
      "etat":etat,
      "beneficier":beneficier,
    };
  }
}
