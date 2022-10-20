// ignore_for_file: unnecessary_cast, empty_catches

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// var bungalow_count;

class ApiController extends GetxController {
  Map<dynamic, dynamic> printData = {}.obs as Map<dynamic, dynamic>;

  Future<void> getData() async {
    try {
      // var client = http.Client();
      var response = await http.get(Uri.parse(
          "http://192.168.1.99:8080/sdplserver/api/edit-project/179"));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        printData = jsonResponse;
        // print(printData);
      }
    } catch (e) {}
  }

  Future<dynamic> projectCount(data, id) async {
    try {
      if (data != null) {
        final temp = await http
            .get(Uri.parse("${dotenv.env['APP_URL']}project-count/$id"));
        final response = json.decode(temp.body);
        return response["bungalow_count"];
      }
    } catch (e) {}
  }
}
