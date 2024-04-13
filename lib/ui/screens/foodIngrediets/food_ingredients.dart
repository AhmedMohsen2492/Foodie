import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:foodie/data/dataModel/Nutrition.dart';
import 'package:foodie/data/dataModel/TotalNutrition.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodIngredients extends StatefulWidget {
  static String routeName = "Ingredients";

  @override
  _FoodIngredientsState createState() => _FoodIngredientsState();
}

class _FoodIngredientsState extends State<FoodIngredients> {
  TextEditingController foodNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  FocusNode foodNameFocusNode = FocusNode();
  String foodName = "";
  String result = '';
  List<String> matchedFoodNames = [];
  List<Map<String, dynamic>> selectedItems = [];

  double calories = 0;
  double carbs = 0;
  double fats = 0;
  double satFats = 0;
  double protein = 0;

  double total_calories = 0;
  double total_carbs = 0;
  double total_fats = 0;
  double total_satFats = 0;
  double total_protein = 0;

  bool isTotal= false ;
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    foodNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.prime,
        appBar: AppBar(
          backgroundColor: AppColors.prime,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Ingredient",
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (name) {
                      if (name == null||
                          name.isEmpty ) {
                        return 'Please enter food name';
                      }
                      return null;
                    },
                    controller: foodNameController,
                    focusNode: foodNameFocusNode,
                    onChanged: (value) {
                      searchFoodNames(value);
                    },
                    onTap: () {
                      setState(() {
                        if (!foodNameFocusNode.hasFocus) {
                          foodNameFocusNode.requestFocus();
                        }
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Food Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      foodNameFocusNode.hasFocus && matchedFoodNames.isNotEmpty,
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: matchedFoodNames.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(matchedFoodNames[index]),
                          onTap: () {
                            setState(() {
                              foodNameController.text = matchedFoodNames[index];
                              matchedFoodNames.clear();
                              foodNameFocusNode.unfocus();
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (q) {
                      if (q == null ||
                          q.isEmpty) {
                        return 'Please enter Quantity';
                      }
                      return null;
                    },
                    controller: quantityController,
                    decoration: InputDecoration(
                      labelText: 'Enter Quantity (in grams)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        isTotal = false ;
                        calculateNutrition();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        backgroundColor: const Color(0xff54D851),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    child: Text(
                      "Calculate Nutrition",
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      final name = foodNameController.text.trim();
                      final quantity =
                          double.tryParse(quantityController.text.trim()) ?? 0.0;
                      if (name.isNotEmpty && quantity > 0) {
                        addItem(name, quantity);
                        foodNameController.clear();
                        quantityController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        backgroundColor: const Color(0xff54D851),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    child: Text(
                      "Add item",
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      isTotal = true ;
                      calculateTotalNutrition();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        backgroundColor: const Color(0xff54D851),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    child: Text(
                      "Calculate Total Nutrition",
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: AppColors.prime,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(isTotal ? "Total":"Nutrition",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(isTotal ? "Total Calories" : "Calories",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(isTotal ? "${total_calories.round()} g" :"${calories.round()} g",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(isTotal ? "Total Carbs" :"Carbs",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(isTotal ? "${total_carbs.round()} g" :"${carbs.round()} g",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(isTotal ? "Total Fats" :"Fats",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(isTotal ? "${total_fats.round()} g":"${fats.round()} g",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(isTotal ? "Total SaSaturated fat" :"Saturated fat",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(isTotal ? "${total_satFats.round()} g" :"${satFats.round()} g",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(isTotal ? "Total Protein" :"Protein",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(isTotal ?  "${total_protein.round()} g":"${protein.round()} g",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addItem(String name, double quantity) {
    setState(() {
      selectedItems.add({'name': name, 'quantity': quantity});
    });
  }

  void searchFoodNames(String input) async {
    final url = Uri.parse('http://10.0.2.2:5000/search_food');
    final response = await http.post(
      url,
      body: jsonEncode({'input': input}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> foodNames = jsonDecode(response.body);
      setState(() {
        matchedFoodNames = foodNames.cast<String>();
      });
    } else {
      print('Failed to fetch food names: ${response.statusCode}');
    }
  }

  Future<void> calculateNutrition() async {

    String foodName = foodNameController.text.trim().toLowerCase();
    String quantity = quantityController.text.trim();

    if (foodName.isEmpty || quantity.isEmpty) {
      setState(() {
        calories = 0;
        carbs =0;
        fats = 0;
        satFats = 0;
        protein = 0;
      });
    }

    final Uri url = Uri.parse('http://10.0.2.2:5000/calculate_nutrition');
    final response = await http.post(
      url,
      body: jsonEncode({
        'name': foodName,
        'quantity': quantity,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      Nutrition nutrition = Nutrition.fromJson(json);

     setState(() {
       calories = nutrition.calories!;
       carbs = nutrition.carbs!;
       fats = nutrition.fat!;
       satFats = nutrition.satFat!;
       protein = nutrition.protein!;
     });
    } else {
      setState(() {
        result = 'Failed to calculate nutrition.';
      });
    }
  }

  Future<void> calculateTotalNutrition() async {
    final url = Uri.parse('http://10.0.2.2:5000/calculate_total_nutrition');
    final response = await http.post(
      url,
      body: jsonEncode({'total': selectedItems}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      TotalNutrition totalNutrition = TotalNutrition.fromJson(json);
      setState(() {
        total_calories = totalNutrition.totalCalories!;
        total_carbs = totalNutrition.totalCarbohydrates!;
        total_fats = totalNutrition.totalFat!;
        total_satFats = totalNutrition.totalSaturatedFat!;
        total_protein = totalNutrition.totalProtein!;
      });
    } else {
      setState(() {
        result = 'Failed to calculate total nutrition.';
      });
    }
  }
}
