// ignore_for_file: prefer_final_fields, unnecessary_overrides, empty_catches, no_leading_underscores_for_local_identifiers, null_check_always_fails

import 'dart:convert';

import 'package:aashiyan/view/residential/bunglow/bedroom.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StateManagement extends GetxController {
  List users = [].obs;
  List printData = [].obs;
  var _user = User();
  bool isMaintain = false;

  @override
  void onInit() async {
    super.onInit();
    // getData();
    // await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> getData() async {
    try {
      // var client = http.Client();
      // http://sdplweb.com/sdpl/api/edit-bungalow-bedroom/project_id

      var response = await http.get(
        Uri.parse(
            "http://192.168.0.99:8080/sdplserver/api/edit-bungalow-bedroom/179"),
      );
      // print(response);
      // print("response");
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        printData = jsonResponse['bungalow_bedroom'];
        // print(modelBedroomFromJson(jsonResponse['bungalow_bedroom']));
        // return modelBedroomFromJson(jsonResponse['bungalow_bedroom']);

        if (users.isEmpty) {
          for (int i = 0; i < printData.length; i++) {
            users.add(
              BedRoom(
                user: _user,
                onDelete: () => onDlete(_user),
              ),
            );
          }
        }
      }
    } catch (e) {}
  }

  // printData = getData();

  void onAddForm() {
    // index++;
    // var _user = User();
    // printData["bungalow_bedroom"].add(
    //   BedRoom(
    //     user: _user,
    //     onDelete: () => onDelete(_user),
    //     index: index,
    //   ),
    // );
    users.add(
      BedRoom(
        user: _user,
        onDelete: () => onDlete(_user),
      ),
    );
    // print(users.map((e) => print(e)));
  }

  void onDlete(User _user) {
    // temp.map((item, K) => {print(item)});
    // setState(() {
    // users.removeAt(0);
    // print(users);
    // print(printData);
    // if (findApi != null)
    //   printData.removeAt(
    //     printData["bungalow_bedroom"].indexOf(find),
    //   );});
    var find = users.firstWhere(
      (it) => it.user == _user,
      orElse: () => null!,
    );

    if (find != null) {
      users.removeAt(
        users.indexOf(find),
      );
    }
  }
}
