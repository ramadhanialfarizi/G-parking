import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  bool obscurePassword = true;

  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void resetObscure() {
    obscurePassword = true;
  }
}
