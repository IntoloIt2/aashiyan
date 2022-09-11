import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
    } catch (e) {
      print(e.toString());
    }
  }
}
