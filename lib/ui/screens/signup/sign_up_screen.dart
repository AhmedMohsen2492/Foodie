import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/info/info_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:foodie/ui/utils/dilalog_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "signup";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  String password = "";
  String email = "";
  late MainProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Image.asset(
            AppAssets.signupBg,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: AppColors.transparent,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.white),
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
                                  AppColors.white,
                                  AppColors.white.withOpacity(0.5),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome.",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Create Your Account",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sign-up",
                                style: GoogleFonts.abhayaLibre(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  email=value;
                                },
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
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
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
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                onChanged: (value) => password = value,
                                validator: (passwordValue) {
                                  if (passwordValue == null ||
                                      passwordValue.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  if (passwordValue.length < 6) {
                                    return 'weak password';
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
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
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
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (confirmPasswordValue) {
                                  if (confirmPasswordValue == null ||
                                      confirmPasswordValue.isEmpty) {
                                    return 'Please enter confirm Password';
                                  }
                                  if (password != confirmPasswordValue) {
                                    return 'Password are not matching';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.simpleGreen,
                                  hintText: "Confirm password",
                                  hintStyle: GoogleFonts.abhayaLibre(
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
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
                              Row(
                                children: [
                                  Checkbox(
                                      side: const BorderSide(
                                          color: AppColors.green),
                                      activeColor: AppColors.green,
                                      value: isChecked,
                                      onChanged: (newValue) {
                                        setState(() {
                                          isChecked = newValue;
                                        });
                                      }),
                                  Text(
                                    "I accept the policy and terms",
                                    style: GoogleFonts.abhayaLibre(
                                        color: AppColors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  signUp();
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 10,
                                    ),
                                    backgroundColor: AppColors.lightGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    )),
                                child: Text(
                                  "Sign-up",
                                  style: GoogleFonts.abhayaLibre(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        color: AppColors.offWhite),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        AppAssets.googleLogo,
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
                                        color: AppColors.offWhite),
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

  void signUp() async{
   try{
     showLoading(context);
     UserCredential userCredential =
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email,
         password: password
     );
     provider.currentUserId = userCredential.user!.uid;
     provider.currentUserEmail = userCredential.user!.email!;
     hideLoading(context);
     Navigator.of(context).pushNamedAndRemoveUntil(InfoScreen.routeName, (route) => false);
   }on FirebaseAuthException catch(error)
    {
      hideLoading(context);
      showErrorDialog(context, error.message ?? "Something Went Wrong. please try again!");
    }
    // if (formKey.currentState!.validate() &&
    //     isChecked == true) {}
  }
}
