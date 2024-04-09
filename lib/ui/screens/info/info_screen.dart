import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';
import '../../../data/providers/main_provider.dart';
import '../../utils/app_assets.dart';
import '../home/home_screen.dart';

class InfoScreen extends StatefulWidget {
  static String routeName = "info";

  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final MultiSelectController controller = MultiSelectController();
  final formKey = GlobalKey<FormState>();
  late MainProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Form(
      key: formKey,
      child: Scaffold(
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
                                onChanged: (value) {
                                  provider.firstName = value;
                                },
                                validator: (firstNameValue) {
                                  if (firstNameValue == null ||
                                      firstNameValue.isEmpty) {
                                    return 'Please enter First Name';
                                  }
                                  return null;
                                },
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
                                onChanged: (value) {
                                  provider.lastName = value;
                                },
                                validator: (lastNameValue) {
                                  if (lastNameValue == null ||
                                      lastNameValue.isEmpty) {
                                    return 'Please enter Last Name';
                                  }
                                  return null;
                                },
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
                                onChanged: (value) {
                                  provider.height = num.parse(value);
                                },
                                validator: (heightValue) {
                                  if (!isNumeric(heightValue)) {
                                    return 'Please enter Height';
                                  }
                                  return null;
                                },
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
                                onChanged: (value) {
                                  provider.weight = num.parse(value);
                                },
                                validator: (weightValue) {
                                  if (!isNumeric(weightValue)) {
                                    return 'Please enter Weight';
                                  }
                                  return null;
                                },
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
                                onChanged: (value) {
                                  provider.age = num.parse(value);
                                },
                                validator: (ageValue) {
                                  if (!isNumeric(ageValue)) {
                                    return 'Please enter Age';
                                  }
                                  return null;
                                },
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
                                value: provider.gender,
                                onChanged: (value) {
                                  setState(() {
                                    provider.gender = value!;
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
                      controller: controller,
                      onOptionRemoved: (index, option) {},
                      onOptionSelected: (options) {},
                      options: const <ValueItem>[
                        ValueItem(label: 'Diabetes', value: 'Diabetes'),
                        ValueItem(label: 'Hypertension', value: 'Hypertension'),
                      ],
                      maxItems: 2,
                      selectionType: SelectionType.multi,
                      chipConfig: const ChipConfig(
                        wrapType: WrapType.scroll,
                        backgroundColor: AppColors.lightGreen,
                      ),
                      dropdownHeight: 90,
                      optionTextStyle:
                          const TextStyle(fontSize: 16, color: AppColors.black),
                      selectedOptionIcon: const Icon(Icons.check_circle),
                      borderColor: AppColors.lightGreen,
                      hintColor: AppColors.darkGreen,
                      borderWidth: 2,
                      selectedOptionTextColor: AppColors.prime,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          doneButton();
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
      ),
    );
  }

  void doneButton() async {
    if (formKey.currentState!.validate()) {
      if (controller.selectedOptions.isEmpty) {
        provider.hypertension = false;
        provider.diabetes = false;
      }
      for (int i = 0; i < controller.selectedOptions.length; i++) {
        if (controller.selectedOptions[i].value == "Diabetes") {
          provider.diabetes = true;
        } else if (controller.selectedOptions[i].value == "Hypertension") {
          provider.hypertension = true;
        } else {
          provider.hypertension = false;
          provider.diabetes = false;
        }
      }
      num? bmr = (await ApiManager.sendInformation(
          provider.height, provider.weight, provider.age, provider.gender));
      provider.bmr = bmr!;
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    }
  }

  bool isNumeric(String? string) {
    if (string == null || string.isEmpty) {
      return false;
    }
    final number = num.tryParse(string);
    if (number == null) {
      return false;
    }
    return true;
  }
}
