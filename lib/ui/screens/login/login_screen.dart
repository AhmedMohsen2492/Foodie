import 'package:flutter/material.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = false;
  bool isVisible = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Image.asset(
            AppAssets.signup_bg,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: AppColors.transparent,
            appBar: AppBar(
              toolbarHeight: MediaQuery.sizeOf(context).height / 10,
              title: Row(
                children: [
                  Image.asset(
                    AppAssets.heart,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Foodie",
                    style: GoogleFonts.abhayaLibre(
                      textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = LinearGradient(
                                    colors: <Color>[
                                  AppColors.prime,
                                  AppColors.prime.withOpacity(0.5),
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)
                                .createShader(const Rect.fromLTWH(
                                    100.0, 100.0, 100.0, 30.0))),
                    ),
                  ),
                ],
              ),
              elevation: 0,
              backgroundColor: AppColors.transparent,
            ),
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hello...",
                                style: GoogleFonts.abhayaLibre(
                                    color: AppColors.prime,
                                    fontSize: 35,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.prime,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Log-in",
                                style: GoogleFonts.abhayaLibre(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                              ),
                              TextFormField(
                                validator: (emailValue) {
                                  if (emailValue == null ||
                                      emailValue.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  if (!emailValue.contains('@') ||
                                      !emailValue.contains('.')) {
                                    return 'wrong input';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.simpleGreen,
                                  hintText: "Email",
                                  hintStyle: GoogleFonts.abhayaLibre(
                                    color: const Color(0xff9C9C9C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  //contentPadding: EdgeInsets.all(14),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: AppColors.simpleGreen, width: 5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: AppColors.simpleGreen, width: 5),
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator: (passwordValue) {
                                  if (passwordValue == null ||
                                      passwordValue.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                obscureText: isVisible,
                                decoration: InputDecoration(
                                  suffixIcon: isVisible
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isVisible = !isVisible;
                                                });
                                              },
                                              icon:
                                                  const Icon(Icons.visibility)),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isVisible = !isVisible;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.visibility_off)),
                                        ),
                                  filled: true,
                                  fillColor: AppColors.simpleGreen,
                                  hintText: "Password",
                                  hintStyle: GoogleFonts.abhayaLibre(
                                    color: const Color(0xff9C9C9C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  //contentPadding: EdgeInsets.all(14),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: AppColors.simpleGreen, width: 5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: AppColors.simpleGreen, width: 5),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate() &&
                                      isChecked == true) {}
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 10,
                                    ),
                                    backgroundColor: const Color(0xff54D851),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    )),
                                child: Text(
                                  "Log-in",
                                  style: GoogleFonts.abhayaLibre(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.prime,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xffECE9EC)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        AppAssets.google_logo,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xffECE9EC)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        AppAssets.facebook,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
