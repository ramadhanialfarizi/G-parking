import 'package:flutter/material.dart';

class SignInCanceled extends StatelessWidget {
  const SignInCanceled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Image.asset(
            'assets/images/login_canceled.png',
            scale: 1.8,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Sign in dibatalkan',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 0, 204, 240),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
