import 'package:flutter/material.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false ;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          AppAssets.signup_bg,
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
          body: SingleChildScrollView(
            child: Column(
              children: [
               Container(
                 height: MediaQuery.sizeOf(context).height*0.16,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       "Welcome",
                       style: GoogleFonts.abhayaLibre(
                           color: AppColors.prime,
                           fontSize: 30,
                           fontWeight: FontWeight.normal
                       ),
                     ),
                     Text(
                       "Create Your Account",
                       style: GoogleFonts.abhayaLibre(
                           color: AppColors.prime,
                           fontSize: 30,
                           fontWeight: FontWeight.normal
                       ),
                     ),
                   ],
                 ),
               ),
                Container(
                  height: MediaQuery.sizeOf(context).height*0.635,
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.prime,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "Sing-up",
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.simpleGreen,
                          hintText: "Email",
                          hintStyle: GoogleFonts.abhayaLibre(
                            color: Color(0xff9C9C9C),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          contentPadding: EdgeInsets.all(16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: AppColors.simpleGreen,
                              width: 5
                            ),
                          ),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: AppColors.simpleGreen,
                                width: 5
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.simpleGreen,
                          hintText: "Password",
                          hintStyle: GoogleFonts.abhayaLibre(
                            color: Color(0xff9C9C9C),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          contentPadding: EdgeInsets.all(16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: AppColors.simpleGreen,
                                width: 5
                            ),
                          ),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: AppColors.simpleGreen,
                                width: 5
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.simpleGreen,
                          hintText: "Confirm password",
                          hintStyle: GoogleFonts.abhayaLibre(
                            color: Color(0xff9C9C9C),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          contentPadding: EdgeInsets.all(16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: AppColors.simpleGreen,
                                width: 5
                            ),
                          ),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: AppColors.simpleGreen,
                                width: 5
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              side: BorderSide(color: Color(0xff06C62A)),
                              activeColor: Color(0xff06C62A),
                              value: isChecked,
                              onChanged: (newValue){
                                setState(() {
                                  isChecked = newValue ;
                                });
                              }
                          ),
                          Text(
                              "I accept the policy and terms",
                            style: GoogleFonts.abhayaLibre(
                              color: Color(0xff06C62A),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15
                            ),
                            backgroundColor: Color(0xff54D851),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        child: Text(
                          "Sign-up",
                          style: GoogleFonts.abhayaLibre(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.prime,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         FloatingActionButton.small(
                           onPressed: (){},
                           backgroundColor: Color(0xffECE9EC),
                           elevation: 0,
                           child: Image.asset(
                             AppAssets.google_logo,
                           ),
                         ),
                         SizedBox(width: 10,),
                         FloatingActionButton.small(
                           onPressed: (){},
                           backgroundColor: Color(0xffECE9EC),
                           elevation: 0,
                           child: Image.asset(
                             AppAssets.facebook,
                           ),
                         ),
                       ],
                     ),
                    ],
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
