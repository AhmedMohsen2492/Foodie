import 'package:flutter/material.dart';
import 'package:foodie/ui/screens/login/login_screen.dart';
import 'package:foodie/ui/screens/signup/sign_up_screen.dart';
import 'package:foodie/ui/screens/splash/splash_screen.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        StartScreen.routeName : (_) => StartScreen(),
        SignUpScreen.routeName :(_) => SignUpScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
      },
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
