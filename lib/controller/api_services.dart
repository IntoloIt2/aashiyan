import 'dart:convert';
import 'dart:ffi';

import 'package:aashiyan/components/forms.dart';
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
  int apmt,
) async {
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

Future<void> entrancePost(
  int projectid,
  String vastu,
  int floor,
  String entranceGate,
  String oneGate,
  String twoGate,
  String mainCarGate,
  String sidePadestrianGate,
  String diffrentCustomizedLocation,
  int securityKisoqReq,
  String securityKisoqLength,
  String securityKisoqWidth,
  String securityKisoqArea,
  int securityKisoq,
  int porchReq,
  String porchLength,
  String porchWidth,
  String porchArea,
  String porch,
  String visualNature,
  String carPrkingSpace,
  int foyerReq,
  String foyerLength,
  String foyerWidth,
  String foyerArea,
  String foyerlobby,
  int verandahReq,
  String verandahLength,
  String verandahWidth,
  String verandahArea,
  String verandah,
) async {
  var projectData = {
    "project_id": 123,
    "vastu": 5,
    "floor": floor,
    "entrance_gate": entranceGate,
    "one_gate": oneGate,
    "two_gate": twoGate,
    "main_car_gate": mainCarGate,
    "side_padestrian_gate": sidePadestrianGate,
    "different_customized_location": diffrentCustomizedLocation,
    "security_kiosq_req": securityKisoqReq,
    "security_kiosq_length": securityKisoqLength,
    "security_kiosq_width": securityKisoqWidth,
    "security_kiosq_area": securityKisoqArea,
    "security_kiosq": securityKisoq,
    "porch_req": porchReq,
    "porch_length": porchLength,
    "porch_width": porchWidth,
    "porch_area": porchArea,
    "porch": porch,
    "visual_nature": visualNature,
    "car_parking_space": carPrkingSpace,
    "foyer_req": foyerReq,
    "foyer_length": foyerLength,
    "foyer_width": foyerWidth,
    "foyer_area": foyerArea,
    "foyer_lobby": foyerlobby,
    "verandah_length": verandahLength,
    "verandah_width": verandahWidth,
    "verandah_area": verandahArea,
    "verandah": verandah,
    "dimension": dimenInt,
    "verandah_req": verandahReq,
  };

  print(projectData);
  print(verandahReq);

  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('http://192.168.1.99:8080/sdplserver/api/bungalow-entrance'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  print(response.body);
}

Future<void> livingHallPost(
  int projectid,
  int drawingHallRequirement,
  int drawingHallLocation,
  String drawingHallLength,
  String drawingHallWidth,
  String drawingHallArea,
  String drawingHall,
  String drawingHallText,
  int LivingHallReq,
  int livingHallLocation,
  String livingHallLength,
  String livingHallwidth,
  String livingHallArea,
  String livinghall,
  String LivingHallText,
  String kitchenFeatures,
  String kitchenFloor,
  String kitchenLength,
  String kitchenWidth,
  String kitchenArea,
  String kitchenDiningFunction,
  String attachStoreLength,
  String attachStoreWidth,
  String attachStoreArea,
  String utilityWashWidth,
  String utilityWashLength,
  String utilityWashArea,
  String refrigeratorSize,
  String specificReq,
) async {
  var projectData = {
    "project_id": 123,
    "user_id": 123,
    "projec_id": 5,
    "drawing_hall_req": drawingHallRequirement,
    "drawing_hall_location": drawingHallLocation,
    "drwing_hall_length": drawingHallLength,
    "drawing_hall_width": drawingHallWidth,
    "drawing_hall_area": drawingHallArea,
    "drawing_hall": drawingHall,
    "drawing_hall_text": drawingHallText,
    "living_hall_req": LivingHallReq,
    "living_hall_location": livingHallLocation,
    "living_hall_width": livingHallwidth,
    "living_hall_length": livingHallArea,
    "living_hall_area": livingHallArea,
    "living_hall": livinghall,
    "living_hall_text": LivingHallText,
    "kitchen_features": kitchenFeatures,
    "kitchen_floor": kitchenFloor,
    "kitchen_length": kitchenLength,
    "kitchen_width": kitchenWidth,
    "kitchen_area": kitchenArea,
    "kitchen_dining_function": kitchenDiningFunction,
    "attach_store_length": attachStoreLength,
    "attach_store_width": attachStoreWidth,
    "attach_store_area": attachStoreArea,
    "utility_wash_width": utilityWashWidth,
    "utility_wash_length": utilityWashLength,
    "utility_wash_area": utilityWashArea,
    "refrigerator_size": refrigeratorSize,
    "specific_req": specificReq,
    "dimension": dimenInt,
  };

  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('http://192.168.1.99:8080/sdplserver/api/bungalow-drawing-hall'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  print(response.body);
}
