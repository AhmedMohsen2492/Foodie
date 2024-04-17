import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/data/dataModel/DetailsResponse.dart';
import 'package:foodie/data/dataModel/food_history.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodDetailsScreen extends StatefulWidget {
  static const String routeName = "details";

  const FoodDetailsScreen({super.key});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late File? scanImage;

  late MainProvider provider;

  bool? healthy;

  double? calories;
  double? carbs;
  double? fats;
  double? protein;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
      backgroundColor: AppColors.prime,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Nutrition",
            style: GoogleFonts.abhayaLibre(
              textStyle: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = LinearGradient(colors: <Color>[
                      AppColors.white,
                      AppColors.white.withOpacity(0.5),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(
                            const Rect.fromLTWH(80.0, 80.0, 100.0, 30.0))),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: provider.detectedImage == null
                      ? Image.asset(AppAssets.addButton)
                      : Image.file(
                          provider.detectedImage!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future:
                    ApiManager.sendQuantities(provider.bmr, provider.details),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    healthy = snapshot.data!.healthy;
                    calories = snapshot.data!.totalCalories;
                    carbs = snapshot.data!.totalCarbohydrates;
                    fats = snapshot.data!.totalFat;
                    protein = snapshot.data!.totalProtein;
                    return buildDetailsWidget(snapshot.data!);
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  saveButton();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 6,
                    ),
                    backgroundColor: const Color(0xff54D851),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: Text(
                  "Save",
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
    );
  }

  buildDetailsWidget(DetailsResponse snapshot) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
              color: snapshot.healthy! ? AppColors.prime : AppColors.darkRed,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(snapshot.healthy! ? "Healthy" : "UnHealthy",
                style: GoogleFonts.abhayaLibre(
                    color: AppColors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "${snapshot.totalCalories?.round()}",
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: GoogleFonts.abhayaLibre(
                  color: AppColors.prime,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "KCAL",
              style: GoogleFonts.abhayaLibre(
                color: AppColors.prime,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Carbs",
              style: GoogleFonts.abhayaLibre(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Spacer(),
            Text(
              "${snapshot.totalCarbohydrates?.round()} g",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abhayaLibre(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Fats",
              style: GoogleFonts.abhayaLibre(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Spacer(),
            Text(
              "${snapshot.totalFat?.round()} g",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abhayaLibre(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Protein",
              style: GoogleFonts.abhayaLibre(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Spacer(),
            Text(
              "${snapshot.totalProtein?.round()} g",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abhayaLibre(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }

  saveButton() {
    FoodHistory history = FoodHistory(provider.classNames[0],
        provider.detectedImage!, healthy!, calories!, protein!, fats!, carbs!);

    provider.addToHistoryList(history);
    provider.deleteImages();
    provider.classNames = [] ;
    Navigator.pop(context);
  }
}
