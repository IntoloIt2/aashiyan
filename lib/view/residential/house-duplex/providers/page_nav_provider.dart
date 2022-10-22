// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:aashiyan/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PageNavProvider with ChangeNotifier {
  int project_id = 0;
  var temp;

  Future<dynamic> requirementPost(
    int userId,
    int projectGroupId,
    int ProjectTypeId,
    String prefix,
    String firstName,
    String lastName,
    String email,
    int country,
    int state,
    int city,
    String address,
    int plotType,
    int dimension,
    String plotLenght,
    String plotWidth,
    String diagonal1,
    String diagonal2,
    var plotSize,
    String handSketch,
    int plotOrientation,
    String handSketchOrientation,
    int eastProperty,
    String eastRoadWidth,
    int westProperty,
    String westRoadWidth,
    int northProperty,
    String northRoadWidth,
    int southProperty,
    String southRoadWidth,
    int level,
    String levelValue,
    int apmt,
  ) async {
    // loading = true;
    // notifyListeners();

    var projectData = {
      "user_id": userId,
      "project_group_id": projectGroupId,
      "project_type_id": ProjectTypeId,
      "prefix": prefix,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "country": country,
      "state": state,
      "city": city,
      "dimension": dimension,
      "address": address,
      "plot_type": plotType,
      "plot_length": plotLenght,
      "plot_width": plotWidth,
      "plot_size": plotSize,
      "plot_orientation": plotOrientation,
      "apmt": apmt,
      "east_property": eastProperty,
      "west_property": westProperty,
      "north_property": northProperty,
      "south_property": southProperty,
      "level": level,
      "level_value": levelValue,
      "diagonal_1": diagonal1,
      "diagonal_2": diagonal2,
      "east_road_width": eastRoadWidth,
      "west_road_width": westRoadWidth,
      "north_road_width": northRoadWidth,
      "south_road_width": southRoadWidth,
    };

    final response = await http.post(
      Uri.parse('${dotenv.env['APP_URL']}project'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(projectData),
    );
    temp = jsonDecode(response.body);
    if (temp != null) {
      project_id = temp['project_id'];
      setProjectId(project_id);
    }

    return temp['status'];
  }

  // int getId() {
  //   // if (temp != null) {
  //   //   project_id = temp['project_id'];
  //   // }
  //   notifyListeners();
  //   return project_id;
  // }
}
