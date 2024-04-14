import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:image_picker/image_picker.dart';
import '../dataModel/food_history.dart';

class MainProvider extends ChangeNotifier {
  File? pickedImage;

  File? detectedImage;

  bool hypertension = false;
  bool diabetes = false;
  String firstName = "First Name";
  String lastName = "Mohsen";
  num height = 176.0;
  num weight = 106.8;
  num age = 21;
  String gender = "male";
  num bmr = 2700;

  List values = [];

  List classNames = [];

  Map details = {};
  List<FoodHistory> history = [];

  //todo edit values
  double maxTotalCalories = 3000;
  double maxTotalCarbs = 150;
  double maxTotalFats = 100;
  double maxTotalProtein = 160;

  bool historyHealthy = false;
  double historyTotalCalories = 0;
  double historyTotalCarbs = 0;
  double historyTotalFats = 0;
  double historyTotalProtein = 0;

  void cameraPicker(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return null;
    pickedImage = File(image.path);
    notifyListeners();
    Navigator.of(context).pop();
    return null;
  }

  void galleryPicker(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    pickedImage = File(image.path);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void addToHistoryList(FoodHistory foodHistory) {
    historyTotalCalories += foodHistory.calories;
    historyTotalCarbs += foodHistory.carbs;
    historyTotalFats += foodHistory.fats;
    historyTotalProtein += foodHistory.protein;
    history.add(foodHistory);
    notifyListeners();
  }

  void deleteFromHistoryList(FoodHistory foodHistory) {
    historyTotalCalories -= foodHistory.calories;
    historyTotalCarbs -= foodHistory.carbs;
    historyTotalFats -= foodHistory.fats;
    historyTotalProtein -= foodHistory.protein;
    history.remove(foodHistory);
    notifyListeners();
  }

  Future<void> addDetectedImage() async {
    detectedImage = await ApiManager.sendImageResponseImage(pickedImage!.path);
    print(detectedImage!.path);
    notifyListeners();
  }

  void deleteImages() {
    detectedImage = null;
    pickedImage = null;
    notifyListeners();
  }
}
