import 'package:flutter/material.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, StartScreen.routeName);
    });
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
