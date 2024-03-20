import 'package:flutter/material.dart';
import 'package:foodie/ui/screens/home/home_screen.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '../../utils/app_assets.dart';

class InfoScreen extends StatefulWidget {
  static String routeName = "info";

  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String gender = "male";
  final MultiSelectController _controller = MultiSelectController();
  List<ValueItem> disease = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.prime,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                            AppColors.white,
                            AppColors.white.withOpacity(0.5),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(
                              const Rect.fromLTWH(80.0, 80.0, 100.0, 30.0))),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: AppColors.prime,
                        width: 1.5, // Underline thickness
                      ))),
                      child: Text(
                        "Your Info :",
                        style: GoogleFonts.abhayaLibre(
                            color: AppColors.prime,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: AppColors.lightGreen,
                                    width: 2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: AppColors.lightGreen,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Last Name",
                                style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Height (cm)",
                                style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Weight (kg)",
                                style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Age",
                                style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Gender",
                                style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            DropdownButtonFormField(
                              items: [
                                DropdownMenuItem(
                                  value: "male",
                                  child: Text("male",
                                      style: GoogleFonts.abhayaLibre(
                                        color: AppColors.black,
                                        fontSize: 18,
                                      )),
                                ),
                                DropdownMenuItem(
                                  value: "female",
                                  child: Text("female",
                                      style: GoogleFonts.abhayaLibre(
                                        color: AppColors.black,
                                        fontSize: 18,
                                      )),
                                ),
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightGreen, width: 2),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose the disease you suffer from : ",
                    style: GoogleFonts.abhayaLibre(
                        color: AppColors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MultiSelectDropDown(
                    controller: _controller,
                    onOptionSelected: (options) {},
                    options: const <ValueItem>[
                      ValueItem(label: 'Diabetes', value: 'Diabetes'),
                      ValueItem(label: 'heart', value: 'heart'),
                      ValueItem(label: 'Hypertension', value: 'Hypertension'),
                      ValueItem(label: 'Hypotension', value: 'Hypotension'),
                    ],
                    maxItems: 3,
                    disabledOptions: const [
                      ValueItem(label: 'Diabetes', value: 'Diabetes')
                    ],
                    selectionType: SelectionType.multi,
                    chipConfig: const ChipConfig(
                      wrapType: WrapType.scroll,
                      backgroundColor: AppColors.lightGreen,
                    ),
                    dropdownHeight: 130,
                    optionTextStyle:
                        const TextStyle(fontSize: 16, color: AppColors.black),
                    selectedOptionIcon: const Icon(Icons.check_circle),
                    borderColor: AppColors.lightGreen,
                    hintColor: AppColors.darkGreen,
                    borderWidth: 2,
                    selectedOptionTextColor: AppColors.prime,
                    selectedOptions: disease,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            HomeScreen.routeName, (route) => false);
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
                        "Done",
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
