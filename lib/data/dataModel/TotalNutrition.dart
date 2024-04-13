class TotalNutrition {
  double? totalCalories;
  double? totalProtein;
  double? totalFat;
  double? totalSaturatedFat;
  double? totalCarbohydrates;

  TotalNutrition({
      this.totalCalories, 
      this.totalProtein, 
      this.totalFat, 
      this.totalSaturatedFat, 
      this.totalCarbohydrates,});

  TotalNutrition.fromJson(dynamic json) {
    totalCalories = json['total_calories'];
    totalProtein = json['total_protein'];
    totalFat = json['total_fat'];
    totalSaturatedFat = json['total_saturated_fat'];
    totalCarbohydrates = json['total_carbohydrates'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_calories'] = totalCalories;
    map['total_protein'] = totalProtein;
    map['total_fat'] = totalFat;
    map['total_saturated_fat'] = totalSaturatedFat;
    map['total_carbohydrates'] = totalCarbohydrates;
    return map;
  }
}