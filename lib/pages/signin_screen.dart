import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../handler/signin_provider.dart';

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
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignInProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
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
                'Hi, Welcome to G-Parking :)',
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
                        height: 15,
                      ),
                      Consumer<SignInProvider>(
                        builder: (context, value, _) {
                          return TextFormField(
                            controller: password,
                            obscureText: value.obscurePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: InkWell(
                                onTap: () => provider.changeObscurePassword(),
                                child: value.obscurePassword
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(Icons.remove_red_eye),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '* Silahkan memasukkan Password';
                              } else if (value.length < 8) {
                                return '* Password harus minimal 8 karakter';
                              }
                              return null;
                            },
                          );
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
                            final loginValid = formKey.currentState!.validate();

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
                            Navigator.of(context).pushReplacementNamed('/home');
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
    );
  }

  Widget signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("don't have account?"),
        TextButton(
          child: const Text(
            'Sign Up',
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
