import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/data/dataModel/nutrition.dart';
import 'package:foodie/data/dataModel/total_nutrition.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodIngredients extends StatefulWidget {
  static String routeName = "Ingredients";

  const FoodIngredients({super.key});

  @override
  // ignore: library_private_types_in_public_api
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

  double totalCalories = 0;
  double totalCarbs = 0;
  double totalFats = 0;
  double totalSatFats = 0;
  double totalProtein = 0;

  bool isTotal = false;

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
          iconTheme: const IconThemeData(color: AppColors.white),
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
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (name) {
                      if (name == null || name.isEmpty) {
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
                    decoration: const InputDecoration(
                      labelText: 'Enter Food Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      foodNameFocusNode.hasFocus && matchedFoodNames.isNotEmpty,
                  child: SizedBox(
                    height: 120,
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
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (q) {
                      if (q == null || q.isEmpty) {
                        return 'Please enter Quantity';
                      }
                      return null;
                    },
                    controller: quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Quantity (in grams)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        isTotal = false;
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
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final name = foodNameController.text.trim();
                        final quantity =
                            double.tryParse(quantityController.text.trim()) ??
                                0.0;
                        if (name.isNotEmpty && quantity > 0) {
                          addItem(name, quantity);
                          foodNameController.clear();
                          quantityController.clear();
                        }
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
                const SizedBox(height: 10.0),
                Visibility(
                  visible: selectedItems.isNotEmpty,
                  child: SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedItems.length,
                      itemBuilder: (context, index) {
                        final selectedItem = selectedItems[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.prime,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                selectedItem['name'],
                                style: const TextStyle(
                                    color: AppColors.white, fontSize: 14),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '(${selectedItem['quantity']}) g',
                                style: const TextStyle(
                                    color: AppColors.white, fontSize: 14),
                              ),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedItems.remove(selectedItem);
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      isTotal = true;
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
                const SizedBox(height: 20.0),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: AppColors.prime,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 200,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(isTotal ? "Total" : "Nutrition",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(isTotal ? "Total Calories" : "Calories",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(
                              isTotal
                                  ? "${totalCalories.round()} g"
                                  : "${calories.round()} g",
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
                          Text(isTotal ? "Total Carbs" : "Carbs",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(
                              isTotal
                                  ? "${totalCarbs.round()} g"
                                  : "${carbs.round()} g",
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
                          Text(isTotal ? "Total Fats" : "Fats",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(
                              isTotal
                                  ? "${totalFats.round()} g"
                                  : "${fats.round()} g",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              isTotal ? "Total Saturated fat" : "Saturated fat",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(
                              isTotal
                                  ? "${totalSatFats.round()} g"
                                  : "${satFats.round()} g",
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
                          Text(isTotal ? "Total Protein" : "Protein",
                              style: GoogleFonts.abhayaLibre(
                                  color: AppColors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(
                              isTotal
                                  ? "${totalProtein.round()} g"
                                  : "${protein.round()} g",
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
        carbs = 0;
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
        totalCalories = totalNutrition.totalCalories!;
        totalCarbs = totalNutrition.totalCarbohydrates!;
        totalFats = totalNutrition.totalFat!;
        totalSatFats = totalNutrition.totalSaturatedFat!;
        totalProtein = totalNutrition.totalProtein!;
      });
    } else {
      setState(() {
        result = 'Failed to calculate total nutrition.';
      });
    }
  }
}
