class GFUsers {
  String? uid;
  String? username;
  String? email;
  String? password;

  GFUsers({this.email, this.username, this.uid});
  GFUsers.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    username = json["username"];
    uid = json["uid"];
  }
  Map<String, dynamic> toJson() {
    return {"uid": uid, "email": email, "username": username};
  }
}
