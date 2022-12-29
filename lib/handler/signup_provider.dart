import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void resetObscure() {
    obscurePassword = true;
  }

  void changeObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void resetObscureConfirm() {
    obscureConfirmPassword = true;
  }
}
