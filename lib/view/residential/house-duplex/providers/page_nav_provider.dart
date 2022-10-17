import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PageNavProvider with ChangeNotifier {
  // bool loading = false;
  int project_id = 179;
  var temp ;
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

    print("projectData====");
    print(projectData);

    final response = await http.post(
      // Uri.parse(baseUrlLocal + "project"),
      Uri.parse('http://192.168.0.99:8080/sdplserver/api/project'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(projectData),
    );
    temp = jsonDecode(response.body);
  }

  int getId() {
    if (temp != null) {
      project_id = temp['project_id'];
    }
    // notifyListeners();
    return project_id;
  }
}
