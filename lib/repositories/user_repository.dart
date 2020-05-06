import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseAuth _auth;

  UserRepository() {
    _auth = FirebaseAuth.instance;
  }

  Future<FirebaseUser> createUser(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FirebaseUser> signInUser(String email, String password) async {
    var result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> isSignedIn() async {
    var currentUser = await _auth.currentUser();
    return currentUser != null;
  }

  Future<FirebaseUser> getCurrentUser() async {
    return await _auth.currentUser();
  }
}
