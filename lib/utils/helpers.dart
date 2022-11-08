// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';
import 'package:gson/gson.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> setProjectId(id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('projectId');
  var temp = await prefs.setInt('projectId', id);
}

Future<dynamic> setFloorId(id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('floorId');
  var temp = await prefs.setInt('floorId', id);
}

Future<dynamic> setProjectTypeId(id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var temp = await prefs.setInt('projectTypeId', id);
}
Future<dynamic> setProjectTypeIdHouse(id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var temp = await prefs.setInt('projectHouseTypeId', id);
}

Future<dynamic> setInteriorDesignCount(List count) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('InteriorDesignCount');
  Gson gson = new Gson();
  String json = gson.encode(count);
  prefs.setString("InteriorDesignCount", json);
  // print('count---');
  // print(count);
  // var temp = await prefs.setStringList('InteriorDesignCount', count);
}
