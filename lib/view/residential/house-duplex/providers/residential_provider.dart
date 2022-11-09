// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'package:aashiyan/components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResidentialProvider with ChangeNotifier {
  var groupId;
  var projectTypeId;

  Future<dynamic> getProjectGroupData() async {
    var response = await http.get(
      Uri.parse("${dotenv.env['APP_URL']}project-group"),
    );
    final jsonResponse = jsonDecode(response.body);
    // print('jsonResponse==');
    // print(jsonResponse);
    // if (jsonResponse['project_group']['project_group'] == PROJECT_TYPE[4]) {
    groupId = jsonResponse['project_group'][4]['id'];
    // }
    notifyListeners();
    return groupId;
  }

  Future<dynamic> getProjectType(selectedType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    groupId = prefs.getInt('projectGroup');
    var response = await http.get(
      Uri.parse("${dotenv.env['APP_URL']}project-type/$groupId"),
    );
    final jsonResponse = jsonDecode(response.body);
    List Projects_t = jsonResponse['project_type'];
    Projects_t.map((a) => {
          if (a['id'] == selectedType)
            {projectTypeId = a['id']}
          else if (a['id'] == selectedType)
            {projectTypeId = a['id']}
        }).toList();
    // print('projectt');
    // print(projectTypeId);
    notifyListeners();
    return projectTypeId;
  }
}
