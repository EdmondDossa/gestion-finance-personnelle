class GFAvoirs {
  String? uid;
  double capital = 0;
  String userUid = "";
  
  GFAvoirs(this.capital,this.userUid);

  GFAvoirs.fromJson(Map<String, dynamic> json) {
    capital = json["capital"];
    uid = json["uid"];
    userUid = json["userUid"];
  }
  Map<String, dynamic> toJson() {
    return {"uid": uid, "capital": capital,"userUid": userUid,};
  }
}