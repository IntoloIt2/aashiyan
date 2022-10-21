import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> setProjectId(id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var temp = await prefs.setInt('projectId', id);
}
