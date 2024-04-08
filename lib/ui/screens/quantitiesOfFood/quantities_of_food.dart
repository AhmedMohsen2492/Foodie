import 'package:flutter/material.dart';

class QuantitiesOfFood extends StatelessWidget {
  const QuantitiesOfFood({Key? key}) : super(key: key);
  static String routeName = "quantities" ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Quantities of food...",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),)),
    );
  }
}
