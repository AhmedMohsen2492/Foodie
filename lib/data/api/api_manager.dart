import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';


abstract class ApiManager {
  static String baseUrl = "http://10.0.2.2:5000/food";

  Map m = {"Height": 195.5, "Weight": 70.2, "Age": 30, "Gender": "Male"};

  static Future<void> sendImageResponseList(String imagePath) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://10.0.2.2:5000/food"),
    );

    var file = await http.MultipartFile.fromPath(
      'file',
      imagePath,
    );

    request.files.add(file);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print(response);
        var responseData = await response.stream.bytesToString();
        print(responseData);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  // static Future<void> sendImageResponseList(String imagePath) async {
  //     FormData formData = FormData();
  //     formData.files.add(
  //       MapEntry('file', await MultipartFile.fromFile(imagePath)),
  //     );
  //     Dio().post(
  //       "http://10.0.2.2:5000/food",
  //       data: formData,
  //     ).then((value) {
  //       print(value.data);
  //     }).catchError((e)=>print("EXceptionnnn!!!!!!! $e"));
  // }

  static Future<File?> sendImageResponseImage(String imagePath) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://10.0.2.2:5000/image"),
    );

    // Attach the image file
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        imagePath,
      ),
    );

    // Send the request
    var response = await request.send();

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Get the directory for the app
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/response_image.jpg';

      // Save the response image
      final File file = File(filePath);
      await file.writeAsBytes(await response.stream.toBytes());
      print('Response image saved successfully');
      return file ;
    } else {
      // Handle error
      print('Error: ${response.reasonPhrase}');
    }
  }

  // static Future<void> sendImageResponseImage(String imagePath) async {
  //   var request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse("http://10.0.2.2:5000/image"),
  //   );
  //
  //   var file = await http.MultipartFile.fromPath(
  //     'image',
  //     imagePath,
  //   );
  //
  //   request.files.add(file);
  //
  //   try {
  //     var response = await request.send();
  //     if (response.statusCode == 200) {
  //       print(response);
  //       var responseData = await response.stream.bytesToString();
  //       print(responseData);
  //     } else {
  //       print('Error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //   }
  // }

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
