import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_parking/handler/signin_provider.dart';
import 'package:g_parking/handler/signup_provider.dart';
import 'package:g_parking/pages/edit_account.dart';
import 'package:g_parking/pages/home_screen.dart';
import 'package:g_parking/pages/signin_screen.dart';
import 'package:g_parking/pages/signup_screen.dart';
import 'package:g_parking/pages/widget/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => const SplashScreen(), settings: settings);
          case '/signin':
            return CupertinoPageRoute(
                builder: (_) => const SigninScreen(), settings: settings);
          case '/signup':
            return CupertinoPageRoute(
                builder: (_) => const SignUpScreen(), settings: settings);
          case '/home':
            return CupertinoPageRoute(
                builder: (_) => const HomeScreen(), settings: settings);
          case '/edit-account':
            return CupertinoPageRoute(
                builder: (_) => const EditAccountScreen(), settings: settings);
        }
        return null;
      },
    );
  }
}
