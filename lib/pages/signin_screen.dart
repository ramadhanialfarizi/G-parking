import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_revised.png',
                  scale: 0.7,
                ),
                const SizedBox(
                  height: 19,
                ),
                const Text(
                  'Hi, Welcome back :)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* Silahkan memasukkan Email';
                            }
                            if (!EmailValidator.validate(value)) {
                              return '* Masukkan email yang valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton.icon(
                            icon: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 0, 204, 240),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  //side: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              final loginValid =
                                  formKey.currentState!.validate();

                              String userEmail = email.text;
                              String userPassword = password.text;

                              if (loginValid) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        const Text(
                          'or',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton.icon(
                            icon: Image.asset(
                              'assets/images/logo_google.png',
                              scale: 7,
                            ),
                            label: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 0, 204, 240),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  //side: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                signUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("don't have account?"),
        TextButton(
          child: const Text(
            'SignUp',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 204, 240),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/signup');
          },
        ),
      ],
    );
  }
}
