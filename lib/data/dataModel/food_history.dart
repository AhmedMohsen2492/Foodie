import 'dart:io';

class FoodHistory{
  String name;
  File image;
  bool healthy;
  double calories;
  double carbs;
  double protein;
  double fats;

  FoodHistory(this.name,this.image, this.healthy, this.calories, this.protein, this.fats,this.carbs);
}