import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class ApiManager {

  static String baseUrl = "http://10.0.2.2:5000/endpoint" ;
  Map m = {
    "Height": 195.5,
    "Weight": 70.2,
    "Age": 30,
    "Gender": "Male"
  };

  static Future<void> sendImage(String text, File file) async {
      // var request = http.MultipartRequest(
      //     "POST",
      //     Uri.parse("http://10.0.2.2:5000/image")
      // );
      //
      // Map<String, dynamic> formData = {
      //   'file' : file
      // };
      //
      // formData.forEach((key, value) async {
      //     var fileStream = http.ByteStream(value.openRead());
      //     var length = await value.length();
      //     var multipartFile = http.MultipartFile(key, fileStream, length,
      //         filename: value.path.split('/').last);
      //     request.files.add(multipartFile);
      // });
      //
      // // Send the request
      // var response = await request.send();
      //
      // //Get the response from the server
      // var responseData = await response.stream.toBytes();
      // var responseString = String.fromCharCodes(responseData);
      //
      // // Check the response status
      // if(response.statusCode >= 200 && response.statusCode < 300) {
      //   print('Upload successful');
      // } else {
      //   print('Upload failed with status ${response.statusCode}');
      // }
  }

  static Future<void> sendInformation() async{
    try
    {
      final headers = {'Content-Type': 'application/json'};
      var uri = Uri.parse("http://10.0.2.2:5000/items");
      String body = jsonEncode({
        "Height": 195.5,
        "Weight": 70.2,
        "Age": 30,
        "Gender": "Male"
      });
      print("Loading....");
      http.Response response = await http.post(
          uri,
          headers: headers,
          body: body
      );
      print("done");
      if(response.statusCode >= 200 && response.statusCode < 300) {
        print('Upload successful');
        print(response.body);
      } else {
        print("Erorrrr!!!!");
      }
    }
    catch(e){
      print("Exception : $e");
    }
  }
}