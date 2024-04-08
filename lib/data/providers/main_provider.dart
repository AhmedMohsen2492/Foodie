import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class MainProvider extends ChangeNotifier {
  File? pickedImage ;
  File? detectedImage ;
  bool hypertension = false;
  bool diabetes = false;
  String firstName = "First Name";
  String lastName = "Mohsen";
  num height = 176.0;
  num weight = 106.8;
  num age = 21;
  String gender = "male";
  num bmr = 2700 ;
  List? foodElements = [] ;

  void cameraPicker(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return null ;
    pickedImage = File(image.path);
    notifyListeners();
    Navigator.of(context).pop();
    return null;
  }

  void galleryPicker(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return null ;

    pickedImage = File(image.path);
    Navigator.of(context).pop();
    notifyListeners();
  }

}