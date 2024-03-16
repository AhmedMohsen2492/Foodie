import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_assets.dart';

class InfoScreen extends StatefulWidget {
  static String routeName = "info";

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.info_bg,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Image.asset(
                  AppAssets.heart,
                  width: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Foodie",
                  style: GoogleFonts.abhayaLibre(
                    textStyle: TextStyle(
                        fontSize: 35,
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
                                  80.0, 80.0, 100.0, 30.0))),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.prime,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                          color: Color(0xff1E7D58),
                          width: 1.5, // Underline thickness
                        ))
                    ),
                    child: Text(
                      "Your Info :",
                      style: GoogleFonts.abhayaLibre(
                          color: Color(0xff1E7D58),
                          fontSize: 30,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              "First Name",
                            style: GoogleFonts.abhayaLibre(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.prime,
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xff54D851), width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:  Color(0xff54D851), width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                              "Last Name",
                              style: GoogleFonts.abhayaLibre(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.prime,
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xff54D851), width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:  Color(0xff54D851), width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              "Height (cm)",
                              style: GoogleFonts.abhayaLibre(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.prime,
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xff54D851), width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:  Color(0xff54D851), width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                              "Weight (kg)",
                              style: GoogleFonts.abhayaLibre(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.prime,
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xff54D851), width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:  Color(0xff54D851), width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              "Age",
                              style: GoogleFonts.abhayaLibre(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.prime,
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xff54D851), width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:  Color(0xff54D851), width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                              "Gender",
                              style: GoogleFonts.abhayaLibre(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                          DropdownButtonFormField(
                            items: [
                              DropdownMenuItem(
                                child: Text("male",
                                    style: GoogleFonts.abhayaLibre(
                                      color: Colors.black,
                                      fontSize: 18,
                                    )),
                                value: "male",
                              ),
                              DropdownMenuItem(
                                child: Text("female",
                                    style: GoogleFonts.abhayaLibre(
                                      color: Colors.black,
                                      fontSize: 18,
                                    )),
                                value: "female",
                              ),
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xff54D851), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xff54D851), width: 2),
                              ),
                            ),
                            isExpanded: true,
                            value: gender,
                            onChanged: (value) {
                             setState(() {
                               gender = value!;
                             });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Choose the disease you suffer from ."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
