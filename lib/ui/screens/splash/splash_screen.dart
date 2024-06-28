import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/data/dataModel/app_user.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/home/home_screen.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late MainProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of(context);

    animationController = AnimationController(vsync: this);

    Future.delayed(const Duration(seconds: 3), () async {
      AppUser? user = await provider.getFromSharedPreferences();

      if (user != null) {
        AppUser.currentUser = user;

        DocumentReference<AppUser> documentReference =
            AppUser.collection().doc(AppUser.currentUser!.id);
        DocumentSnapshot<AppUser> snapshot = await documentReference.get();
        snapshot.data();
        provider.age = snapshot.data()!.age;
        provider.currentUserEmail = snapshot.data()!.email;
        provider.firstName = snapshot.data()!.firstName;
        provider.gender = snapshot.data()!.gender;
        provider.height = snapshot.data()!.height;
        provider.currentUserId = snapshot.data()!.id;
        provider.lastName = snapshot.data()!.lastName;
        provider.weight = snapshot.data()!.weight;

        num? bmr = (await ApiManager.sendInformation(
            provider.height, provider.weight, provider.age, provider.gender));
        provider.bmr = bmr!;

        provider.calculateMacronutrients(provider.bmr as double);

        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, StartScreen.routeName);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          width: MediaQuery.sizeOf(context).width,
          AppAssets.splash,
          fit: BoxFit.fill,
        ),
        Lottie.asset(
          AppAssets.splashLoading,
          width: MediaQuery.sizeOf(context).width / 4,
          height: MediaQuery.sizeOf(context).height / 3,
        ),
      ],
    );
  }
}
