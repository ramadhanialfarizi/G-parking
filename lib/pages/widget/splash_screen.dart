import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final curentUser = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async {
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () {
        if (curentUser.currentUser == null) {
          Navigator.of(context).pushReplacementNamed('/signin');
        } else {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/logo_revised.png',
            scale: 1,
          ),
        ),
      ),
    );
  }
}
