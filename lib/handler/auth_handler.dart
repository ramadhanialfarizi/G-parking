import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  FirebaseAuth authentication = FirebaseAuth.instance;

  BuildContext? get context => null;

  Future signUpManualy(String email, String password) async {
    try {
      final signUpManualy = await authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      return signUpManualy;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  // masih belum bisa dipakai
  Future signInManualy(String email, String password) async {
    if (authentication.currentUser == null) {
      try {
        await authentication.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.of(context!).pushReplacementNamed('/home');
        return ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(
            content: Text('Signin success'),
            duration: Duration(milliseconds: 800),
          ),
        );
      } on FirebaseAuthException catch (e) {
        return ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(
            content: Text('sign in failed'),
            duration: Duration(milliseconds: 800),
          ),
        );
      }
    }
  }

  Future googleSignIn() async {}
}
