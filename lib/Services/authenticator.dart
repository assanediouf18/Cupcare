import 'package:firebase_auth/firebase_auth.dart';
import 'package:cupcare/Model/user_model.dart';

class Authenticator {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  UserModel _userFromFirebaseUser(User? user) {
    return user != null
        ? UserModel(
            email: user.email ?? "error",
            firstName: user.displayName ?? "",
            isConnected: true,
            uid: user.uid)
        : UserModel(email: "", firstName: "", isConnected: false, uid: '');
  }

  Future signInWithEmailPassword(String email, String password) async {
    try {
      dynamic result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailPassword(String email, String password) async {
    try {
      dynamic result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  void updateDisplayName(String displayName) {
    _auth.authStateChanges().listen((event) {
      event!.updateDisplayName(displayName);
    });
  }
}
