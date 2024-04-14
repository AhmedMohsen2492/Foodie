import 'package:flutter/material.dart';
import 'package:foodie/data/dataModel/food_history.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HistoryScreen extends StatelessWidget {
  static const String routeName = "history";
  late MainProvider provider;

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FoodHistory args =
        ModalRoute.of(context)!.settings.arguments as FoodHistory;
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
                  child: Image.file(
                    args.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                      color: args.healthy ? AppColors.prime : AppColors.darkRed,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(args.healthy ? "Healthy" : "UnHealthy",
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
                        "${args.calories.round()}",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.abhayaLibre(
                          color: AppColors.prime,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
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
                      "${args.carbs.round()} g",
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
                      "${args.fats.round()} g",
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
                      "${args.protein.round()} g",
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
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  provider.deleteFromHistoryList(args);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 6,
                    ),
                    backgroundColor: AppColors.darkRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: Text(
                  "Delete",
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
}
