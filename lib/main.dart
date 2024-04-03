import 'package:flutter/material.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/chatBot/chat_bot_screen.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/screens/info/info_screen.dart';
import 'package:foodie/ui/screens/login/login_screen.dart';
import 'package:foodie/ui/screens/signup/sign_up_screen.dart';
import 'package:foodie/ui/screens/splash/splash_screen.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screens/home/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) {
        return MainProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        StartScreen.routeName: (_) => const StartScreen(),
        SignUpScreen.routeName: (_) => const SignUpScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        InfoScreen.routeName: (_) => const InfoScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        ChatBotScreen.routeName: (_) => const ChatBotScreen(),
        FoodDetailsScreen.routeName: (_) => const FoodDetailsScreen(),
      },
      initialRoute: InfoScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
