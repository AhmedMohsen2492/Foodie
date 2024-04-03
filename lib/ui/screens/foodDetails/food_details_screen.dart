import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailsScreen extends StatefulWidget {
  static const String routeName = "details";

  const FoodDetailsScreen({super.key});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late File? scanImage ;

  @override
  Widget build(BuildContext context) {
    scanImage = ModalRoute.of(context)?.settings.arguments as File? ;
    return Scaffold(
      backgroundColor: AppColors.prime,
      appBar: AppBar(
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
              child: Text(
                "Salad",
                style: GoogleFonts.abhayaLibre(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(900000),
                  child: scanImage == null ? Image.asset(AppAssets.addButton)
                      : Image.file(scanImage!,fit: BoxFit.fill,),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                  color: AppColors.prime,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text("Healthy",
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
                Text(
                  "125",
                  style: GoogleFonts.abhayaLibre(
                    color: AppColors.prime,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "KCal",
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
                  "0",
                  style: GoogleFonts.abhayaLibre(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "g",
                  style: GoogleFonts.abhayaLibre(
                    color: Colors.black,
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
                  "0",
                  style: GoogleFonts.abhayaLibre(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "g",
                  style: GoogleFonts.abhayaLibre(
                    color: Colors.black,
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
                  "0",
                  style: GoogleFonts.abhayaLibre(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "g",
                  style: GoogleFonts.abhayaLibre(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
