import 'package:flutter/material.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = "details" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29AC81),
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
        ),
      ),
      body: Container(width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.prime,
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width * 0.62,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    AppAssets.nut,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                    "125",
                  style: GoogleFonts.abhayaLibre(
                    color : Color(0xff259E74),
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                    "KCal",
                  style: GoogleFonts.abhayaLibre(
                    color : Color(0xff259E74),
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Carbs",
                  style: GoogleFonts.abhayaLibre(
                    color : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Spacer(),
                Text(
                  "0",
                  style: GoogleFonts.abhayaLibre(
                    color : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "g",
                  style: GoogleFonts.abhayaLibre(
                    color : Colors.black,
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
                    color : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Spacer(),
                Text(
                  "0",
                  style: GoogleFonts.abhayaLibre(
                    color : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "g",
                  style: GoogleFonts.abhayaLibre(
                    color : Colors.black,
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
                    color : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Spacer(),
                Text(
                  "0",
                  style: GoogleFonts.abhayaLibre(
                    color : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "g",
                  style: GoogleFonts.abhayaLibre(
                    color : Colors.black,
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
