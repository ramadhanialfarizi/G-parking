import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccountHandler {
  CollectionReference collectionUser =
      FirebaseFirestore.instance.collection('user_data');

  Future addUser(String firstName, String lastName, String email,
      String phoneNumber) async {
    try {
      final userAdd = await collectionUser.add({
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "profil_picture": 'empty',
      });
      return userAdd;
    } catch (e) {
      print(e);
    }
  }

  Future userEdit() async {}
}
