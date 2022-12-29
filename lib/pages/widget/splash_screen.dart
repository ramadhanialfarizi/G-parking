import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      // if (userLogin.currentUser == null) {
      //   Navigator.of(context).pushReplacementNamed('/login');
      // } else {
      //   Navigator.of(context).pushReplacementNamed('/home');
      // }

      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            scale: 1,
          ),
        ),
      ),
    );
  }
}
