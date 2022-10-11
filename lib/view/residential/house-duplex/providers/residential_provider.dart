import 'dart:convert';
import 'package:aashiyan/view/residential.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../components/contants.dart';

import 'package:http/http.dart' as http;

class ResidentialProvider with ChangeNotifier {
  var groupId;
  var projectTypeId;

  Future<dynamic> getProjectGroupData() async {
    var response = await http.get(
      Uri.parse("${dotenv.env['APP_URL']}project-group"),
    );
    final jsonResponse = jsonDecode(response.body);
    // if (jsonResponse['project_group']['project_group'] == PROJECT_TYPE[4]) {
    groupId = jsonResponse['project_group'][4]['id'];
    // print('groupId');
    // print(groupId);
    // }
    notifyListeners();
    return groupId;
  }

  Future<dynamic> getProjectType() async {
    var response = await http.get(
      Uri.parse("${dotenv.env['APP_URL']}project-type/$groupId"),
    );
    final jsonResponse = jsonDecode(response.body);
    List Projects_t = jsonResponse['project_type'];
    Projects_t.map((a) => {
          if (a['project_type'] == "house/duplex") {projectTypeId = a['id']}
        }).toList();
    // print('projectt');
    // print(projectTypeId);
    notifyListeners();
    return projectTypeId;
  }
}
