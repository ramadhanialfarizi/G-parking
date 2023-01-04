import 'package:flutter/material.dart';

class SignInFail extends StatelessWidget {
  const SignInFail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Image.asset('assets/images/login_error.png'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Sign in gagal. pastikan email dan password dimasukan dengan benar',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Coba lagi',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 0, 204, 240),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
