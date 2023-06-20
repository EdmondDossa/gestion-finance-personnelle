class GFRevenus {
  String? revenuUid;
  String? source;
  DateTime? date;
  double? montant;

  GFRevenus({
    this.source,
    this.date,
    this.montant,
  });
  GFRevenus.fromJson(Map<String, dynamic> json) {
    this.revenuUid= json["revenuUid"];
    this.source= json["source"];
    this.date= json["date"];
    this.montant= json["montant"];
  }
  Map<String, dynamic> toJson() {
    return {
      "revenuUid" : revenuUid,
      "source" : source,
      "date" : date,
      "montant" : montant,
    };
  }
}
