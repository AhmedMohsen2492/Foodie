import 'package:flutter/material.dart';

class FoodIngredients extends StatelessWidget {
  const FoodIngredients({Key? key}) : super(key: key);
  static String routeName = "ingredients" ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("food ingredients soon ...",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),)),
    );
  }
}
