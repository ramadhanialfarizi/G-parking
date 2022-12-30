import 'package:flutter/material.dart';

class SignOutAllert extends StatelessWidget {
  const SignOutAllert({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Image.asset('assets/images/logout_ilustration.png'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Are you sure want to sign out?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Text(
                    'Sign out',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/signin', ModalRoute.withName('/'));
                  },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 0, 204, 240),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
