import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  Future signUpManualy(String email, String password) async {
    try {
      final signUpManual = await _authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      return signUpManual;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future signInManualy(String email, String password) async {
    if (_authentication.currentUser == null) {
      try {
        final signInManual = await _authentication.signInWithEmailAndPassword(
            email: email, password: password);

        return signInManual;
      } on FirebaseAuthException catch (e) {
        return null;
      }
    }
  }

  Future googleSignIn() async {
    if (_authentication.currentUser == null) {
      try {
        GoogleSignInAccount? account = await GoogleSignIn().signIn();
        if (account != null) {
          GoogleSignInAuthentication auth = await account.authentication;
          OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken,
            idToken: auth.idToken,
          );
          return await FirebaseAuth.instance.signInWithCredential(credential);
        } else {
          return null;
        }
      } on FirebaseAuthException catch (e) {
        return null;
      }
    }
  }
}
