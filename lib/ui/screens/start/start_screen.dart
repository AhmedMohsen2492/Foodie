import 'package:flutter/material.dart';
import 'package:foodie/ui/screens/login/login_screen.dart';
import 'package:foodie/ui/screens/signup/sign_up_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  static String routeName = "start";
  late final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.start_bg,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(
            toolbarHeight: MediaQuery.sizeOf(context).height / 8,
            title: Row(
              children: [
                Image.asset(
                  AppAssets.heart,
                ),
                SizedBox(
                  width: 14,
                ),
                Text(
                  "Foodie",
                  style: GoogleFonts.abhayaLibre(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = LinearGradient(
                          colors: <Color>[
                            AppColors.prime,
                            AppColors.prime.withOpacity(0.5),
                          ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      ).createShader(Rect.fromLTWH(100.0, 100.0, 100.0, 30.0))
                    ),
                  ),
                ),
              ],
            ),
            elevation: 0,
            backgroundColor: AppColors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.start_photo,
                ),
                SizedBox(
                  height: 20
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: AppColors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  child: Text(
                    "Sign-up",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: AppColors.prime,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: AppColors.darkGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(
                              color: AppColors.lightGreen, width: 1))),
                  child: Text(
                    "Log-in",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: AppColors.prime,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
