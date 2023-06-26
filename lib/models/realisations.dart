class GFRealisation {
  int? uid;
  String? type;
  DateTime? date;
  double? montant;
  int? rubriquesUid;
  int? source;
  String? description;
  String? userUid;
  GFRealisation(
      {this.type, this.source,this.montant,this.date,this.rubriquesUid,this.description, this.userUid,this.uid});
}
