class Nutrition {

  double? calories;
  double? protein;
  double? fat;
  double? satFat;
  double? carbs;

  Nutrition({
    this.calories,
    this.protein,
    this.fat,
    this.satFat,
    this.carbs,});

  Nutrition.fromJson(dynamic json) {
    calories = json['calories'];
    protein = json['protein'];
    fat = json['fat'];
    satFat = json['sat_fat'];
    carbs = json['carbs'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['calories'] = calories;
    map['protein'] = protein;
    map['fat'] = fat;
    map['sat_fat'] = satFat;
    map['carbs'] = carbs;
    return map;
  }
}