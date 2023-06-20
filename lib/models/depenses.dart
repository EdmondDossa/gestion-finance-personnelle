class GFDepenses {
  String? depenseUid;
  DateTime? date;
  double? montant;
  GFDepenses({this.montant, this.date});
  GFDepenses.fromJson(Map<String, dynamic> json) {
    depenseUid = json["depenseUid"];
    date = json["date"];
    montant = json["montant"];
  }
  Map<String, dynamic> toJson() {
    return {
      "depenseUid" : depenseUid,
      "date" : date,
      "montant" : montant,
      };
  }
}
