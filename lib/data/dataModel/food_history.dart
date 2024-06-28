import 'dart:io';

class FoodHistory {
  static const String collectionName = "foods";
  String? id;

  late String name;
  late File image;

  String? imgUrl;

  late bool healthy;
  late double calories;
  late double carbs;
  late double protein;
  late double fats;

  FoodHistory(this.name, this.image, this.healthy, this.calories, this.protein,
      this.fats, this.carbs);

  FoodHistory.fromJson(Map json) {
    name = json["name"];
    image = json["image"];
    healthy = json["healthy"];
    calories = json["calories"];
    carbs = json["carbs"];
    protein = json["protein"];
    fats = json["fats"];
  }

  FoodHistory.withImgUrl(Map json) {
    id = json["id"];
    name = json["name"];
    imgUrl = json["imgUrl"];
    healthy = json["healthy"];
    calories = json["calories"];
    carbs = json["carbs"];
    protein = json["protein"];
    fats = json["fats"];
  }

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
