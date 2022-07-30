import 'dart:convert';
import 'dart:ffi';

import 'package:aashiyan/model/citiesmodel.dart';
import 'package:aashiyan/model/requirementmodel.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'http://sdplweb.com/sdpl/api/';
var baseUrlLocal = 'http://192.168.1.99:8080/sdplserver/api/';
var imageUrl = 'http://sdplweb.com/sdpl/storage/app/public/';
var bunglowPage =
    "http://sdplweb.com/sdpl/api/get-bungalow-prestigious-recent-image";
var residentPage = "http://sdplweb.com/sdpl/api/get-residential-image";
var homePage = "http://sdplweb.com/sdpl/api/get-project-image";

List bunglowPagePrestigiousList = [];
List bunglowPageRecentList = [];

Future<void> getPrestigious() async {
  try {
    var url = Uri.parse(bunglowPage);
    var response = await http.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      bunglowPagePrestigiousList =
          jsonDecode(response.body)["prestigious_image"];
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> getRecent() async {
  try {
    var url = Uri.parse(bunglowPage);
    var response = await http.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      bunglowPageRecentList = jsonDecode(response.body)["recent_project_image"];
    }
  } catch (e) {
    print(e.toString());
  }
}

List homePrestigiousList = [];
List homeRecentList = [];

Future<void> homePrestigious() async {
  try {
    var url = Uri.parse(homePage);
    var response = await http.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      homePrestigiousList =
          jsonDecode(response.body)["project_prestigious_img"];
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> homeRecent() async {
  try {
    var url = Uri.parse(homePage);
    var response = await http.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      homeRecentList = jsonDecode(response.body)["project_recent_project_img"];
    }
  } catch (e) {
    print(e.toString());
  }
}

List ResidentialPrestigiousList = [];
List ResidentialdataRecentList = [];

Future<void> residentialPrestigious() async {
  try {
    var url = Uri.parse(residentPage);
    var response = await http.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      ResidentialPrestigiousList =
          jsonDecode(response.body)["residential_prestigious_img"];
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> residentailRecent() async {
  try {
    var url = Uri.parse(residentPage);
    var response = await http.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      ResidentialdataRecentList =
          jsonDecode(response.body)["residential_recent_project_img"];
    }
  } catch (e) {
    print(e.toString());
  }
}

// Future<List?> getCity() async {
//   try {
//     var url = Uri.parse("https://sdplweb.com/sdpl/api/city/5");
//     var response = await http.get(url);
//     // print(response.body.toString());
//     if (response.statusCode == 200) {
//       List cityList = jsonDecode(response.body)["cities"];
//       print(cityList);
//       return jsonDecode(response.body)["cities"];
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

// List data = [];

// Future<List?> getCities() async {
//   try {
//     var client = http.Client();
//     var response =  await http.get(Uri.parse("https://sdplweb.com/sdpl/api/city/5"));
//     if (response.statusCode == 200) {

//       final jsonResponse = jsonDecode(response.body);
//       final cityList = jsonResponse['cities'] as List;
//       print(cityList);
//       return cityList;
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

// Future<RequirementModel>? requirementPost(
//     String user,
//     String prefix,
//     String first,
//     String last,
//     String phone,
//     String country,
//     String state,
//     String city,
//     String address) async {
//   final response = await http.post(
//     Uri.parse("http://sdplweb.com/sdpl/api/project"),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       "user_id": user,
//       "prefix": prefix,
//       "first_name": first,
//       "last_name": last,
//       "phone": phone,
//       "country": country,
//       "state": state,
//       "city": city,
//       "address": address
//     }),
//   );

//   return RequirementModel.fromJson(jsonDecode(response.body));
// }

Future<RequirementModel> requirementPost(
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
    String plotSize,
    String handSketch,
    int plotOrientation,
    String handSketchOrientation,
    String eastProperty,
    String eastRoadWidth,
    String westProperty,
    String westRoadWidth,
    String northProperty,
    String northRoadWidth,
    String southProperty,
    String southRoadWidth,
    int level,
    String levelValue,
    int apmt) async {
  var projectData = {
    "user_id": 123,
    "project_group_id": 5,
    "prefix": prefix,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "country": country,
    "state": state,
    "city": city,
    "dimension": dimension,
    "project_type_id": ProjectTypeId,
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

  print(projectData);

  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('http://192.168.1.99:8080/sdplserver/api/project'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );

  print(response.body);

  return RequirementModel.fromJson(jsonDecode(response.body));
}
