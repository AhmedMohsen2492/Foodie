import 'dart:convert';
import 'dart:io';
import 'package:foodie/data/dataModel/ClassNames.dart';
import 'package:foodie/data/dataModel/DetailsResponse.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

abstract class ApiManager {
  static String baseUrl = "http://10.0.2.2:5000/food";
  static int c = 0;

  static Future<File?> sendImageResponseImage(String imagePath) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://10.0.2.2:5000/image"),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        imagePath,
      ),
    );
    var response = await request.send();
    if (response.statusCode == 200) {
      // Get the directory for the app
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/response_image$c.jpg';
      c++;
      // Save the response image
      final File file = File(filePath);
      await file.writeAsBytes(await response.stream.toBytes());
      return file;
    } else {
      print('Error: ${response.reasonPhrase}');
    }
    return null;
  }

  static Future<List<String>?> sendImageResponseList(String imagePath) async {
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
        var responseData = await response.stream.bytesToString();
        Map json = jsonDecode(responseData);
        ClassNames names = ClassNames.fromJson(json);
        return names.classNames;
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }

  static Future<num?> sendInformation(
      num Height, num Weight, num Age, String Gender) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      var uri = Uri.parse("http://10.0.2.2:5000/items");
      String body = jsonEncode(
          {"Height": Height, "Weight": Weight, "Age": Age, "Gender": Gender});
      http.Response response =
          await http.post(uri, headers: headers, body: body);

      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          response.body.isNotEmpty) {
        Map json = jsonDecode(response.body);
        num bmr = json["bmr"];
        print("bmr  = $bmr");
        return bmr;
      } else {
        print("Erorrrr!!!!");
      }
    } catch (e) {
      print("Exception : $e");
    }
    return null;
  }

  static Future<DetailsResponse?> sendQuantities(num bmr, Map details) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      var uri = Uri.parse("http://10.0.2.2:5000/details");
      String body = jsonEncode({"bmr": bmr, "elements": details});
      http.Response response =
          await http.post(uri, headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map json = jsonDecode(response.body);
        DetailsResponse detailsResponse = DetailsResponse.fromJson(json);
        return detailsResponse;
      } else {
        print("Erorrrr!!!!");
      }
    } catch (e) {
      print("Exception : $e");
    }
    return null;
  }

  static Future<List?> searchFoodNames(String input) async {
    final url = Uri.parse('http://10.0.2.2:5000/search_food');

    final response = await http.post(
      url,
      body: jsonEncode({'input': input}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List foodNames = jsonDecode(response.body);
      return foodNames;
    } else {
      print('Failed to fetch food names: ${response.statusCode}');
    }
    return null;
  }

  static Future<String?> calculateNutrition(
      String foodName, String quantity) async {
    final Uri url = Uri.parse('http://10.0.2.2:5000/calculate_nutrition');
    final response = await http.post(
      url,
      body: jsonEncode({
        'name': foodName,
        'quantity': quantity,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      String result = jsonDecode(response.body)['result'];
      return result;
    } else {
      print('Failed to fetch food names: ${response.statusCode}');
    }
    return null;
  }

  static Future<String?> calculateTotalNutrition(
      List<Map<String, dynamic>> selectedItems) async {
    final url = Uri.parse('http://10.0.2.2:5000/calculate_total_nutrition');
    final response = await http.post(
      url,
      body: jsonEncode({"total": selectedItems}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
      String result = jsonDecode(response.body)['result'];
      return result;
    } else {
      print('Failed to fetch food names: ${response.statusCode}');
    }
    return null;
  }

  static Future<GenerateContentResponse> chatBotResponse(String message) async {
    //gemini-pro
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: 'AIzaSyAAqYQv_QbBnmEdxzscvSWZ2H0rjdVxTY8');
    final content = [Content.text('$message')];
    final response = await model.generateContent(content);
    return response ;
  }
}
