import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestion_finance/models/users.dart';
import 'package:gestion_finance/utilities/db_services.dart';

class AuthServices {
  
  final _auth = FirebaseAuth.instance;
  User get currentUser => FirebaseAuth.instance.currentUser!;
  Stream<User?> get onChangeUser => _auth.authStateChanges();

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException {
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String username) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
        dbServies.saveUser(GFUsers(email: email, username: username, uid: currentUser.uid));
      return true;
    } on FirebaseException {
      return false;
    }
  }

  signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseException {
      return false;
    }
  }
}
AuthServices authServices = AuthServices();