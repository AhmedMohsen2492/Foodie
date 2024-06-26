import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/data/dataModel/app_user.dart';
import 'package:foodie/ui/utils/dilalog_utils.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../dataModel/food_history.dart';

class MainProvider extends ChangeNotifier {
  String currentUserId= "";
  String currentUserEmail= "";

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
  Map<String, List<double>> safety = {};

  bool historyHealthy = true;
  double historyTotalCalories = 0;
  double historyTotalCarbs = 0;
  double historyTotalFats = 0;
  double historyTotalProtein = 0;
  static int i=-1;
  bool loading = true ;

  void deleteFromFireStore(FoodHistory history){
    CollectionReference foodCollectionRef = AppUser.collection().doc(AppUser.currentUser!.id)
        .collection(FoodHistory.collectionName);
    foodCollectionRef.doc(history.id).delete();
    notifyListeners();
  }

  Future<File> urlToFile(String imageUrl) async {
    final response = await get(Uri.parse(imageUrl));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File('${documentDirectory.path}/filename${i++}.png');

    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }

  refreshHistoryList(BuildContext context) async {
    loading = true ;
    CollectionReference<FoodHistory> historyCollection =
    AppUser.collection().doc(AppUser.currentUser!.id)
        .collection(FoodHistory.collectionName)
    .withConverter<FoodHistory>(
        fromFirestore: (snapshot, _) {
          FoodHistory food = FoodHistory.withImgUrl(snapshot.data()!);
          return food;
        },
        toFirestore: (value, _) {
          return value.toJson();
        });

    QuerySnapshot<FoodHistory> foodSnapshot = await historyCollection.get();

    List<QueryDocumentSnapshot<FoodHistory>> docs = foodSnapshot.docs;
    history = docs.map((docSnapshot){
      return docSnapshot.data();
    }).toList();

    for(int i=0 ; i<history.length ; i++)
      {
        history[i].image = await urlToFile(history[i].imgUrl!);
      }
    loading = false ;
    notifyListeners();
  }

  void calculateMacronutrients(double bmr) {
    Map<String, double> caloriesPerGram = {
      'Carbohydrates': 4,
      'Fat': 9,
      'Protein': 4
    };

    Map<String, List<double>> percentageRanges = {
      'Carbohydrates': [0.45, 0.55],
      'Fat': [0.30, 0.35],
      'Protein': [0.15, 0.20]
    };

    Map<String, List<double>> macronutrientGrams = {};
    percentageRanges.forEach((nutrient, range) {
      double lowerRangeCalories = bmr * range[0];
      double upperRangeCalories = bmr * range[1];

      double lowerRangeGrams = lowerRangeCalories / caloriesPerGram[nutrient]!;
      double upperRangeGrams = upperRangeCalories / caloriesPerGram[nutrient]!;

      macronutrientGrams[nutrient] = [lowerRangeGrams, upperRangeGrams];
    });
    safety = macronutrientGrams;
  }

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
    print("addToHistoryList =  ${foodHistory.image.path}");
    history.add(foodHistory);

    historyHealthy = (historyTotalCalories < bmr &&
        historyTotalCarbs <= safety['Carbohydrates']![1] &&
        historyTotalProtein <= safety['Protein']![1] &&
        historyTotalFats <= safety['Fat']![1]) ;
    notifyListeners();
  }

  void deleteFromHistoryList(FoodHistory foodHistory) {
    historyTotalCalories -= foodHistory.calories;
    historyTotalCarbs -= foodHistory.carbs;
    historyTotalFats -= foodHistory.fats;
    historyTotalProtein -= foodHistory.protein;
    history.remove(foodHistory);
    historyHealthy = (historyTotalCalories < bmr &&
        historyTotalCarbs <= safety['Carbohydrates']![1] &&
        historyTotalProtein <= safety['Protein']![1] &&
        historyTotalFats <= safety['Fat']![1]) ;
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
