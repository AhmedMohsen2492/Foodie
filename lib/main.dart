import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/chatBot/chat_bot_screen.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/screens/foodIngrediets/food_ingredients.dart';
import 'package:foodie/ui/screens/history/history_screen.dart';
import 'package:foodie/ui/screens/info/info_screen.dart';
import 'package:foodie/ui/screens/login/login_screen.dart';
import 'package:foodie/ui/screens/quantitiesOfFood/quantities_of_food.dart';
import 'package:foodie/ui/screens/signup/sign_up_screen.dart';
import 'package:foodie/ui/screens/splash/splash_screen.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
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
        FoodIngredients.routeName: (_) => const FoodIngredients(),
        QuantitiesOfFood.routeName: (_) => QuantitiesOfFood(),
        HistoryScreen.routeName: (_) => HistoryScreen(),
      },
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
