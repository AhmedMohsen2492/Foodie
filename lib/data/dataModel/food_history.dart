import 'dart:io';

class FoodHistory {
  String name;
  File image;
  bool healthy;
  double calories;
  double carbs;
  double protein;
  double fats;

  FoodHistory(this.name, this.image, this.healthy, this.calories, this.protein,
      this.fats, this.carbs);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['healthy'] = healthy;
    map['calories'] = calories;
    map['carbs'] = carbs;
    map['protein'] = protein;
    map['fats'] = fats;
    return map;
  }
}
