import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/data/dataModel/app_user.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/home/home_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:foodie/ui/utils/dilalog_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = false;
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  late MainProvider provider;
  String password = "";
  String email = "";

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
                                "Hello..",
                                style: GoogleFonts.abhayaLibre(
                                    color: AppColors.white,
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
                            color: AppColors.white,
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
                                onChanged: (value) {
                                  email = value;
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
                              TextFormField(
                                onChanged: (value) {
                                  password = value;
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
                              ElevatedButton(
                                onPressed: () {
                                  login();
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
                                  "Log-in",
                                  style: GoogleFonts.abhayaLibre(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
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

  void login() async {
    try {
      showLoading(context);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AppUser currentUser =
          await getUserFromFireStore(userCredential.user!.uid);
      AppUser.currentUser = currentUser;

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

      hideLoading(context);

      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    } on FirebaseAuthException catch (error) {
      hideLoading(context);
      showErrorDialog(
          context, error.message ?? "Something Went Wrong. please try again!");
    }

  }

  Future<AppUser> getUserFromFireStore(String id) async {
    CollectionReference<AppUser> userCollection = AppUser.collection();
    DocumentSnapshot<AppUser> documentSnapshot =
        await userCollection.doc(id).get();
    return documentSnapshot.data()!;
  }
}
