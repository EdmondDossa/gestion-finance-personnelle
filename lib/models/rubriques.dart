class GFRubriques {
  String? uid;
  String nomRubrique = "";
  String description = "";
  String userUid = "";

  GFRubriques(this.nomRubrique, this.description,this.userUid);

  GFRubriques.fromJson(Map<String, dynamic> json) {
    nomRubrique = json["nomRubrique"];
    description = json["description"];
    uid = json["uid"];
    userUid = json["userUid"];
  }
  Map<String, dynamic> toJson() {
    return {"uid": uid, "nomRubrique": nomRubrique, "description": description,"userUid": userUid,};
  }
}
