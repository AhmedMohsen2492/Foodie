class DetailsResponse {
  double? totalCalories;
  double? totalProtein;
  double? totalFat;
  double? totalCarbohydrates;
  bool? healthy;

  DetailsResponse({
      this.totalCalories, 
      this.totalProtein, 
      this.totalFat, 
      this.totalCarbohydrates, 
      this.healthy,});

  DetailsResponse.fromJson(dynamic json) {
    totalCalories = json['total_calories'];
    totalProtein = json['total_protein'];
    totalFat = json['total_fat'];
    totalCarbohydrates = json['total_carbohydrates'];
    healthy = json['healthy'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_calories'] = totalCalories;
    map['total_protein'] = totalProtein;
    map['total_fat'] = totalFat;
    map['total_carbohydrates'] = totalCarbohydrates;
    map['healthy'] = healthy;
    return map;
  }
}