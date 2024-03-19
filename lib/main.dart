import 'package:flutter/material.dart';
import 'package:foodie/ui/screens/chatBot/chat_bot_screen.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/screens/info/info_screen.dart';
import 'package:foodie/ui/screens/login/login_screen.dart';
import 'package:foodie/ui/screens/signup/sign_up_screen.dart';
import 'package:foodie/ui/screens/splash/splash_screen.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';
import 'ui/screens/home/home_screen.dart';

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
        SignUpScreen.routeName : (_) => SignUpScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        InfoScreen.routeName : (_) => InfoScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
        ChatBotScreen.routeName: (_)=> ChatBotScreen(),
        FoodDetailsScreen.routeName : (_) => FoodDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
