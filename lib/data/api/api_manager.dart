import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class ApiManager {

  static String baseUrl = "" ;

  Map m = {
    "Height": 195.5,
    "Weight": 70.2,
    "Age": 30,
    "Gender": "Male"
  };

  static sendImage(String text, File file) async {
      var request = http.MultipartRequest(
          "POST",
          Uri.parse("$baseUrl/image")
      );

      //add text fields
      request.fields["text_field"] = text;

      //create multipart using filepath, string or bytes
      var pic = await http.MultipartFile.fromPath("file_field", file.path);

      //add multipart to request
      request.files.add(pic);

      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      if(response.statusCode >= 200 && response.statusCode < 300)
      {
        print(responseString);
      }
      else
      {
        print("Erooooooooooooooooooor!!!!!!!!!!!!!!");
      }
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
      print("A");
      http.Response response = await http.post(
          uri,
          headers: headers,
          body: body
      );
      print("AAA");
      if(response.statusCode >= 200 && response.statusCode < 300) {
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