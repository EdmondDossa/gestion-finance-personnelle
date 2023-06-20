class GFDevises {
  String? deviseId;
  String? nomDevise;
  
  GFDevises({this.deviseId, this.nomDevise});
  GFDevises.fromJson(Map<String, dynamic> json) {
    deviseId = json["deviseId"];
    nomDevise = json["nomDevise"];
  }
  Map<String, dynamic> toJson() {
    return {"deviseId": deviseId, "nomDevise": nomDevise};
  }
}
