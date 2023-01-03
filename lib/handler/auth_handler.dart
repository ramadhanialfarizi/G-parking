import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth authentication = FirebaseAuth.instance;

  Future signUpManualy(String email, String password) async {
    try {
      final signUpManualy = await authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      return signUpManualy;
    } catch (e) {
      print(e);
    }
  }

  // masih belum bisa dipakai
  Future signInManualy(String email, String password) async {
    if (authentication.currentUser == null) {
      try {
        final signInManual = await authentication.signInWithEmailAndPassword(
            email: email, password: password);

        return signInManual;
      } on FirebaseAuthException catch (e) {
        return e.message;
      }
    }
  }
}