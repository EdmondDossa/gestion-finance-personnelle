import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_finance/models/users.dart';
import 'package:gestion_finance/utilities/auth_services.dart';

class DBServies {
  
  var userCollection = FirebaseFirestore.instance.collection("Users");

  saveUser(GFUsers user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
    } on FirebaseException {}
  }

  Stream<List<GFUsers>> getDiscussionUser() {
    return userCollection
        .where('uid', isNotEqualTo: AuthServices().currentUser.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((doc) => GFUsers.fromJson(doc.data())).toList());
  }

  /* Stream<List<CChat>> getMessage(String receiverUid, [bool myMessage = true]) {
    return chatCollection
        .where('senderUid',
            isEqualTo: myMessage ? AuthServices().currentUser.uid : receiverUid)
        .where('receiverUid',
            isEqualTo: myMessage ? receiverUid : AuthServices().currentUser.uid)
        .snapshots()
        .map((event) => event.docs
            .map((doc) => CChat.fromJson(doc.data(), doc.id))
            .toList());
  } */

  Stream<List<GFUsers>> getUser() {
    return userCollection
        .where('uid', isEqualTo: AuthServices().currentUser.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((doc) => GFUsers.fromJson(doc.data())).toList());
  }

  /* Future<bool> sendMessage(CChat message) async {
    try {
      await chatCollection.doc().set(message.toJson());
      return true;
    } on FirebaseException {
      return false;
    }
  } */
}

DBServies dbServies = DBServies();
