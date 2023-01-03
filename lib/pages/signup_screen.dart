import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_parking/handler/auth_handler.dart';
import 'package:g_parking/handler/signup_provider.dart';
import 'package:g_parking/handler/user_account_handler.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_revised.png',
                  scale: 0.7,
                ),
                const SizedBox(
                  height: 19,
                ),
                const Text(
                  'Create your account',
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
                          controller: firstName,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* Silahkan masukan Nama pertama anda';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: lastName,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* Silahkan masukan Nama terakhir anda';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* Silahkan masukkan Email anda';
                            }
                            if (!EmailValidator.validate(value)) {
                              return '* Masukkan email yang valid';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: phoneNumber,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* Silahkan masukkan nomor telepon anda';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Consumer<SignUpProvider>(
                          builder: (context, value, _) {
                            return TextFormField(
                              controller: password,
                              obscureText: value.obscurePassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: InkWell(
                                  onTap: () => provider.changeObscurePassword(),
                                  child: value.obscurePassword
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined)
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
                        SizedBox(
                          height: 15,
                        ),
                        Consumer<SignUpProvider>(
                          builder: (context, value, _) {
                            return TextFormField(
                              controller: confirmPassword,
                              obscureText: value.obscureConfirmPassword,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                suffixIcon: InkWell(
                                  onTap: () =>
                                      provider.changeObscureConfirmPassword(),
                                  child: value.obscureConfirmPassword
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined)
                                      : const Icon(Icons.remove_red_eye),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '* Silahkan konfirmasi Password';
                                }
                                // if (confirmPassword != password.text) {
                                //   return '* Confirm password tidak sesuai';
                                // }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.account_circle,
                                color: Colors.white),
                            label: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 0, 204, 240),
                              ),
                            ),
                            onPressed: () async {
                              final loginValid =
                                  formKey.currentState!.validate();

                              if (loginValid) {
                                await Authentication()
                                    .signUpManualy(email.text, password.text);
                                await UserAccountHandler().addUser(
                                  firstName.text,
                                  lastName.text,
                                  email.text,
                                  phoneNumber.text,
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Signup Berhasil!!'),
                                    duration: Duration(milliseconds: 800),
                                  ),
                                );

                                await FirebaseAuth.instance.signOut();
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        signInButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signInButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("have account?"),
        TextButton(
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 204, 240),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
