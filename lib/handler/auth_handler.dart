import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  FirebaseAuth authentication = FirebaseAuth.instance;

  Future signUpManualy(String email, String password) async {
    try {
      final signUpManual = await authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      return signUpManual;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  Future signInManualy(String email, String password) async {
    if (authentication.currentUser == null) {
      try {
        final signInManual = await authentication.signInWithEmailAndPassword(
            email: email, password: password);

        return signInManual;
      } on FirebaseAuthException catch (e) {
        return null;
      }
    }
  }

  Future googleSignIn() async {
    if (authentication.currentUser == null) {
      try {
        GoogleSignInAccount? account = await GoogleSignIn().signIn();
        if (account != null) {
          GoogleSignInAuthentication auth = await account.authentication;
          OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken,
            idToken: auth.idToken,
          );
          await FirebaseAuth.instance.signInWithCredential(credential);
        } else {
          return null;
        }
      } on FirebaseAuthException catch (e) {
        return null;
      }
    }
  }
}
