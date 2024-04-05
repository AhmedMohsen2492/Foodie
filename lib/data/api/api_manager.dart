import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class ApiManager {
  static String baseUrl = "http://10.0.2.2:5000/food";

  Map m = {"Height": 195.5, "Weight": 70.2, "Age": 30, "Gender": "Male"};

  static Future<void> sendImageResponseList(String imagePath) async {
      FormData formData = FormData();
      formData.files.add(
        MapEntry('file', await MultipartFile.fromFile(imagePath)),
      );
      Dio().post(
        "http://10.0.2.2:5000/food",
        data: formData,
      ).then((value) {
        print(value.data);
      }).catchError((e)=>print("EXceptionnnn!!!!!!! $e"));
  }

  static Future<void> sendImageResponseImage(String imagePath) async {
      FormData formData = FormData();
      formData.files.add(
        MapEntry('image', await MultipartFile.fromFile(imagePath)),
      );
      Dio().post(
        "http://10.0.2.2:5000/image",
        data: formData,
      ).then((value) {
        print(value.data);
      }).catchError((e)=>print("EXceptionnnn!!!!!!! $e"));
  }

  static Future<void> sendInformation() async {
    try {
      final headers = {'Content-Type': 'application/json'};
      var uri = Uri.parse("http://10.0.2.2:5000/items");
      String body = jsonEncode(
          {"Height": 195.5, "Weight": 70.2, "Age": 30, "Gender": "Male"});
      print("Loading....");
      http.Response response =
          await http.post(uri, headers: headers, body: body);
      print("done");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Upload successful');
        print(response.body);
      } else {
        print("Erorrrr!!!!");
      }
    } catch (e) {
      print("Exception : $e");
    }
  }
}
