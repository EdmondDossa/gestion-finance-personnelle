class GFCategories {
  String? categorieUid;
  String? nomCategorie;
  String? description;
  GFCategories({this.categorieUid, this.nomCategorie, this.description});
  GFCategories.fromJson(Map<String, dynamic> json) {
    nomCategorie = json["nomCategorie"];
    description = json["description"];
    categorieUid = json["categorieUid"];
  }
  Map<String, dynamic> toJson() {
    return {"categorieUid": categorieUid, "nomCategorie": nomCategorie, "description": description};
  }
}
