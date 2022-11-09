// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:core';
import 'dart:ffi';

// import 'dart:html';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var baseUrl = 'http://sdplweb.com/sdpl/api/';
var baseUrlLocal = 'http://192.168.0.99:8080/sdplserver/api/';
var imageUrl = 'http://sdplweb.com/sdpl/storage/app/public/';
var bunglowPage =
    "http://sdplweb.com/sdpl/api/get-bungalow-prestigious-recent-image";
var residentPage = "http://sdplweb.com/sdpl/api/get-residential-image";
var homePage = "http://sdplweb.com/sdpl/api/get-project-image";
List bunglowPagePrestigiousList = [];
List bunglowPageRecentList = [];
int project_id = 0;

Future<void> getPrestigious() async {
  try {
    var url = Uri.parse(bunglowPage);
    var response = await http.get(url);
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
  bool plotType,
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
    "user_id": userId,
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

  print('projectData==');
  print(projectData);

  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse("${dotenv.env['APP_URL']}project"),
    // Uri.parse('http://192.168.0.99:8080/sdplserver/api/project'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var temp = jsonDecode(response.body);
  return project_id = temp['project_id'];
}

Future<dynamic> entrancePost(
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
  var porch,
  String visualNature,
  String carPrkingSpace,
  bool foyerReq,
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
    "project_id": projectid,
    "vastu": vastu,
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

  print('entrance projectData===');
  print(projectData);

  final response = await http.post(
    Uri.parse("${dotenv.env['APP_URL']}bungalow-entrance"),
    // Uri.parse('http://192.168.0.99:8080/sdplserver/api/bungalow-entrance'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var resp = jsonDecode(response.body);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('floorCount', resp['floor']);
  return resp["status"];
}

Future<dynamic> entrancePut(
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
  var porch,
  String visualNature,
  String carPrkingSpace,
  bool foyerReq,
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
    "project_id": projectid,
    "vastu": vastu,
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

  print('projectData==');
  print(projectData);

  final response = await http.post(
    Uri.parse("${dotenv.env['APP_URL']}update-bungalow-entrance/$projectid"),
    // 'http://192.168.0.99:8080/sdplserver/api/update-bungalow-entrance/$projectid'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var resp = jsonDecode(response.body);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('floorCount', resp['floor']);
  return resp["status"];
}

Future<dynamic> livingHallPost(
  int user_id,
  int projectId,
  int drawingHallRequirement,
  int drawingHallLocation,
  String drawingHallLength,
  String drawingHallWidth,
  String drawingHall,
  String drawingHallText,
  int LivingHallReq,
  int livingHallLocation,
  String livingHallLength,
  String livingHallwidth,
  List livinghall,
  String LivingHallText,
  List kitchenFeatures,
  int kitchenFloor,
  String kitchenLength,
  String kitchenWidth,
  String kitchenDiningFunction,
  String attachStoreLength,
  String attachStoreWidth,
  String utilityWashWidth,
  String utilityWashLength,
  int refrigeratorSize,
  String specificReq,
) async {
  print(specificReq);
  var projectData = {
    "project_id": projectId,
    "user_id": user_id,
    "dimension": dimenInt,
    "drawing_hall_req": drawingHallRequirement,
    "drawing_hall_location": drawingHallLocation,
    "drwing_hall_length": drawingHallLength,
    "drawing_hall_width": drawingHallWidth,
    "drawing_hall": drawingHall,
    "drawing_hall_text": drawingHallText,
    "living_hall_req": LivingHallReq,
    "living_hall_location": livingHallLocation,
    "living_hall_width": livingHallwidth,
    "living_hall_length": livingHallLength,
    "living_hall": livinghall,
    "living_hall_text": LivingHallText,
    "kitchen_features": kitchenFeatures,
    "kitchen_floor": kitchenFloor,
    "kitchen_length": kitchenLength,
    "kitchen_width": kitchenWidth,
    "kitchen_dining_function": kitchenDiningFunction,
    "attach_store_length": attachStoreLength,
    "attach_store_width": attachStoreWidth,
    "utility_wash_width": utilityWashWidth,
    "utility_wash_length": utilityWashLength,
    "refrigerator_size": refrigeratorSize,
    "specific_req": specificReq,
  };

  // print(projectData);
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse("${dotenv.env['APP_URL']}bungalow-drawing-hall"),
    // Uri.parse('http://192.168.0.99:8080/sdplserver/api/bungalow-drawing-hall'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  // print(response.body);
  var temp = jsonDecode(response.body);

  return temp['status'];
}

Future<dynamic> livingHallput(
  int user_id,
  int projectId,
  int drawingHallRequirement,
  int drawingHallLocation,
  String drawingHallLength,
  String drawingHallWidth,
  String drawingHall,
  String drawingHallText,
  int LivingHallReq,
  int livingHallLocation,
  String livingHallLength,
  String livingHallwidth,
  List livinghall,
  String LivingHallText,
  List kitchenFeatures,
  int kitchenFloor,
  String kitchenLength,
  String kitchenWidth,
  String kitchenDiningFunction,
  String attachStoreLength,
  String attachStoreWidth,
  String utilityWashWidth,
  String utilityWashLength,
  int refrigeratorSize,
  String specificReq,
) async {
  // print(drawingHallLength);
  // print(drawingHallWidth);

  // print(livingHallLength);
  // print(livingHallwidth);

  var projectData = {
    "project_id": projectId,
    "user_id": user_id,
    "dimension": dimenInt,
    "drawing_hall_req": drawingHallRequirement,
    "drawing_hall_location": drawingHallLocation,
    "drawing_hall_length": drawingHallLength,
    "drawing_hall_width": drawingHallWidth,
    "drawing_hall": drawingHall,
    "drawing_hall_text": drawingHallText,
    "living_hall_req": LivingHallReq,
    "living_hall_location": livingHallLocation,
    "living_hall_width": livingHallwidth,
    "living_hall_length": livingHallLength,
    "living_hall": livinghall,
    "living_hall_text": LivingHallText,
    "kitchen_features": kitchenFeatures,
    "kitchen_floor": kitchenFloor,
    "kitchen_length": kitchenLength,
    "kitchen_width": kitchenWidth,
    "kitchen_dining_function": kitchenDiningFunction,
    "attach_store_length": attachStoreLength,
    "attach_store_width": attachStoreWidth,
    "utility_wash_width": utilityWashWidth,
    "utility_wash_length": utilityWashLength,
    "refrigerator_size": refrigeratorSize,
    "specific_req": specificReq,
  };

  print(projectData);

  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse(
        "${dotenv.env['APP_URL']}update-bungalow-drawing-hall/$projectId"),
    // 'http://192.168.0.99:8080/sdplserver/api/update-bungalow-drawing-hall/$projectId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  print(response.body);
  var temp = jsonDecode(response.body);
  return temp['status'];
}

Future<dynamic> pantryPost(
  int projectId,
  int user_id,
  int pantryRequest,
  int pantryFloor,
  String pantryLength,
  String pantryWidth,
  String specificRequest,
  String diningLength,
  String diningWidth,
  List diningFeatures,
  String diningLocation,
  String diningSeat,
  String diningText,
) async {
  var projectData = {
    "project_id": projectId,
    "user_id": user_id,
    "dimension": dimenInt,
    "pantry_req": pantryRequest,
    "pantry_floor": pantryFloor,
    "pantry_length": pantryLength,
    "pantry_width": pantryWidth,
    "specific_req": specificRequest,
    "dining_length": diningLength,
    "dining_width": diningWidth,
    "dining_features": diningFeatures,
    "dining_floor": diningLocation,
    "dining_seat": diningSeat,
    "dining_text": diningText,
  };

  // print("pantry bodyData==");
  // print(projectData);
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse("${dotenv.env['APP_URL']}bungalow-pantry"),
    // Uri.parse('http://192.168.0.99:8080/sdplserver/api/bungalow-pantry'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var resp = jsonDecode(response.body);
  return resp['status'];
}

Future<dynamic> pantryPut(
  int projectId,
  int user_id,
  int pantryRequest,
  int pantryFloor,
  String pantryLength,
  String pantryWidth,
  String specificRequest,
  String diningLength,
  String diningWidth,
  List diningFeatures,
  String diningLocation,
  String diningSeat,
  String diningText,
) async {
  var projectData = {
    "project_id": projectId,
    "user_id": user_id,
    "dimension": dimenInt,
    "pantry_req": pantryRequest,
    "pantry_floor": pantryFloor,
    "pantry_length": pantryLength,
    "pantry_width": pantryWidth,
    "specific_req": specificRequest,
    "dining_length": diningLength,
    "dining_width": diningWidth,
    "dining_features": diningFeatures,
    "dining_floor": diningLocation,
    "dining_seat": diningSeat,
    "dining_text": diningText,
  };

  print('projectData===');
  print(projectData);
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse("${dotenv.env['APP_URL']}update-bungalow-pantry/$projectId"),
    // 'http://192.168.0.99:8080/sdplserver/api/update-bungalow-pantry/$projectId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var resp = jsonDecode(response.body);

  return resp['status'];
}

Future<dynamic> flooreStorePost(
  int projectId,
  int floorStoreRequirement,
  String floorStoreLength,
  String floorStoreWidth,
  String storeFloor,
  String stairCase,
  int liftRequirement,
  String liftSpecialRequirement,
  int passengerCapacity,
  int poojaRoomReq,
  String poojaRoomLength,
  String poojaRoomWidth,
  int poojaRoomFloor,
  String poojaRoomType,
  String openingToLiHa,
) async {
  var projectData = {
    "project_id": projectId,
    "dimension": dimenInt,
    "floor_store_req": floorStoreRequirement,
    "floor_store_length": floorStoreLength,
    "floor_store_width": floorStoreWidth,
    "store_floor": storeFloor,
    "stair_case": stairCase,
    "stair_case_image": "",
    "lift_req": liftRequirement,
    "passanger_capacity": passengerCapacity,
    "pooja_room_req": poojaRoomReq,
    "pooja_room_length": poojaRoomLength,
    "pooja_room_width": poojaRoomWidth,
    "pooja_room_floor": poojaRoomFloor,
    "pooja_room_type": poojaRoomType,
    "opening_to_li_ha": openingToLiHa,
    "lift_special_req": liftRequirement,
  };

  print(projectData);
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),

    Uri.parse("${dotenv.env['APP_URL']}bungalow-floor-store"),
    // Uri.parse('http://192.168.0.99:8080/sdplserver/api/bungalow-floor-store'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );

  print(response.body);
  var resp = jsonDecode(response.body);
  var temp = resp["status"];
  return temp;
}

Future<dynamic> flooreStorePut(
  int projectId,
  int floorStoreRequirement,
  String floorStoreLength,
  String floorStoreWidth,
  String storeFloor,
  String stairCase,
  int liftRequirement,
  String liftSpecialRequirement,
  int passengerCapacity,
  int poojaRoomReq,
  String poojaRoomLength,
  String poojaRoomWidth,
  int poojaRoomFloor,
  String poojaRoomType,
  String openingToLiHa,
) async {
  var projectData = {
    "dimension": dimenInt,
    "floor_store_req": floorStoreRequirement,
    "floor_store_length": floorStoreLength,
    "floor_store_width": floorStoreWidth,
    "store_floor": storeFloor,
    "stair_case": stairCase,
    "stair_case_image": null,
    "lift_req": liftRequirement,
    "passanger_capacity": passengerCapacity,
    "pooja_room_req": poojaRoomReq,
    "pooja_room_length": poojaRoomLength,
    "pooja_room_width": poojaRoomWidth,
    "pooja_room_floor": poojaRoomFloor,
    "pooja_room_type": poojaRoomType,
    "opening_to_li_ha": openingToLiHa,
    "lift_special_req": liftSpecialRequirement,
  };

  // print("projectData===");
  // print(projectData);
  // print("projectId===");
  // print(projectId);
  // print('${dotenv.env['APP_URL']}update-bungalow-floor-store/$projectId}');
  final response = await http.post(
    Uri.parse('${dotenv.env['APP_URL']}update-bungalow-floor-store/$projectId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var resp = jsonDecode(response.body);
  return resp['status'];
}

Future<dynamic> BedRoomPost(
  int bedRoom,
  int bedRoomFloor,
  String bedRoomLength,
  String bedRoomWidth,
  String bedRoomArea,
  String bedRoomToiletLength,
  String bedRoomToiletWidth,
  String bedRoomToiletArea,
  String bedRoomToiletReqText,
  int bedroomDressRequirment,
  String bedroomDressLength,
  String bedroomDressWidth,
  String bedroomDressArea,
  String bedroomDressFacility,
  String bedroomDressRequirmentText,
  String bedroomImg,
  String bedroomFacility,
  String bedroom,
  String bedroomFacilityRequirementText,
) async {
  var projectData = {
    "project_id": 5456,
    "dimension": 1,
    "bedroom": bedroom,
    "bedroom_floor": bedRoomFloor,
    "bedroom_width": bedRoomWidth,
    "bedroom_length": bedRoomLength,
    "bedroom_area": bedRoomArea,
    "bedroom_toilet_length": bedRoomToiletLength,
    "bedroom_toilet_width": bedRoomToiletWidth,
    "bedroom_toilet_area": bedRoomToiletArea,
    "bedroom_toilet_req_text": bedRoomToiletReqText,
    "bedroom_dress_req": bedroomDressRequirment,
    "bedroom_dress_length": bedroomDressLength,
    "bedroom_dress_width": bedroomDressWidth,
    "bedroom_dress_area": bedroomDressArea,
    "bedroom_dress_facility": bedroomDressFacility,
    "bedroom_dress_req_text": bedroomDressRequirmentText,
    "bedroom_img": bedroomImg,
    "bedroom_facility": bedroomFacility,
    "bedroom_facility_req_text": bedroomFacilityRequirementText,
  };

  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('${dotenv.env['APP_URL']}bungalow-bedroom'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  print(response.body);
  var temp = jsonDecode(response.body);
  return temp['status'];
}

Future<dynamic> BasementPost(
  int projectId,
  int basementReq,
  String basementType,
  int StiltRequirement,
  String StiltType,
  int officeRequirement,
  int officeLength,
  int officeWidth,
  String officeLocation,
  List officeFacility,
  String officeSpecificReq,
  int serventQuaterReq,
  int serventQuaterLength,
  int serventQuaterWidth,
  String serventQuaterSpecificReq,
  String noOfServentsQuater,
  List serventQuaterFacility,
  String serventQuaterLocation,
  String servantQuaterSpecificReq,
  int parkingGarageReq,
  int parkingGarageLength,
  int parkingGarageWidth,
  int noOfCar,
  String parkingGarageLocation,
  String saperateShade,
  String parkingGarageSpecificReq,
  int homeTheaterReq,
  int homeTheaterLength,
  int homeTheaterWidth,
  String homeTheaterLocation,
  String homeTheaterSeats,
  String homeTheaterSpecificReq,
  int indoorPlayReq,
  String indoorPlayLocation,
  int indoorPlayLength,
  int indoorPlayWidth,
  String indorPlaySpecificReq,
  int barReq,
  String barLocaion,
  List barFacility,
  int barLength,
  int barWidth,
  String barSpecificReq,
  int swimmingPoolReq,
  String swimmingPoolLocation,
  int swimmingPoollength,
  int swimmingPoolWidth,
  String swimmingPoolSpecificReq,
  int gymReq,
  String gymlocation,
  int gymLength,
  int gymWidth,
  String gymSpecificReq,
  int spaReq,
  String spaLocation,
  int spaLength,
  int spaWidth,
  String spaSpecificReq,
  int gardenReq,
  String gardenType,
  String gardenSpecificReq,
) async {
  var projectData = {
    "project_id": projectId,
    "dimension": 1,
    "basement_req": 0,
    "basement_type": basementType,
    "stilt_req": StiltRequirement,
    "stilt_type": StiltType,
    "office_req": officeRequirement,
    "office_length": officeLength,
    "office_width": officeWidth,
    "office_location": officeLocation,
    "office_facility": officeFacility,
    "office_specific_req": officeSpecificReq,
    "servent_quarter_req": serventQuaterReq,
    "servent_quarter_length": serventQuaterLength,
    "servent_quarter_width": serventQuaterWidth,
    "no_of_servent_quarter": noOfServentsQuater,
    "servent_quarter_facility": serventQuaterFacility,
    "servent_quarter_location": serventQuaterLocation,
    "servent_quarter_specific_req": serventQuaterSpecificReq,
    "parking_garage_req": parkingGarageReq,
    "parking_garage_length": parkingGarageLength,
    "parking_garage_width": parkingGarageWidth,
    "no_of_cars": noOfCar,
    "parking_garage_location": parkingGarageLocation,
    "saperate_shade": saperateShade,
    "parking_garage_specific_req": parkingGarageSpecificReq,
    "home_theater_req": homeTheaterReq,
    "home_theater_length": homeTheaterLength,
    "home_theater_width": homeTheaterWidth,
    "home_theater_location": homeTheaterLocation,
    "home_theater_seats": homeTheaterSeats,
    "home_theater_specific_req": homeTheaterSpecificReq,
    "indoor_play_req": indoorPlayReq,
    "indoor_play_location": indoorPlayLocation,
    "indoor_play_length": indoorPlayLength,
    "indoor_play_width": indoorPlayWidth,
    "indoor_play_specific_req": indorPlaySpecificReq,
    "bar_req": barReq,
    "bar_location": barLocaion,
    "bar_facility": barFacility,
    "bar_length": barLength,
    "bar_width": barWidth,
    "bar_specific_req": barSpecificReq,
    "swimming_pool_req": swimmingPoolReq,
    "swimming_pool_location": swimmingPoolLocation,
    "swimming_pool_length": swimmingPoollength,
    "swimming_pool_width": swimmingPoolWidth,
    "swimming_pool_specific_req": swimmingPoolSpecificReq,
    "gym_req": gymReq,
    "gym_location": gymlocation,
    "gym_length": gymLength,
    "gym_width": gymWidth,
    "gym_specific_req": gymSpecificReq,
    "spa_req": spaReq,
    "spa_location": spaLocation,
    "spa_length": spaLength,
    "spa_width": spaWidth,
    "spa_specific_req": spaSpecificReq,
    "garden_req": gardenReq,
    "garden_type": gardenType,
    "garden_specific_req": gardenSpecificReq,
  };

  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('${dotenv.env['APP_URL']}bungalow-basement'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var temp = jsonDecode(response.body);
  return temp['status'];
}

Future<dynamic> getGalleryAPI(int category) async {
  print(category);
  var response = await http.get(Uri.parse(baseUrl + "get-gallery/$category"));
  final jsonResponse = jsonDecode(response.body);

  final finalArt = jsonResponse['gallery'] as List;
  return finalArt;
}

Future<dynamic> BasementPut(
  int projectId,
  int basementReq,
  String basementType,
  int StiltRequirement,
  String StiltType,
  bool officeRequirement,
  int officeLength,
  int officeWidth,
  String officeLocation,
  List officeFacility,
  String officeSpecificReq,
  bool serventQuaterReq,
  int serventQuaterLength,
  int serventQuaterWidth,
  String serventQuaterSpecificReq,
  String noOfServentsQuater,
  List serventQuaterFacility,
  String serventQuaterLocation,
  String servantQuaterSpecificReq,
  bool parkingGarageReq,
  int parkingGarageLength,
  int parkingGarageWidth,
  int noOfCar,
  String parkingGarageLocation,
  String saperateShade,
  String parkingGarageSpecificReq,
  int homeTheaterReq,
  int homeTheaterLength,
  int homeTheaterWidth,
  String homeTheaterLocation,
  String homeTheaterSeats,
  String homeTheaterSpecificReq,
  bool indoorPlayReq,
  String indoorPlayLocation,
  int indoorPlayLength,
  int indoorPlayWidth,
  String indorPlaySpecificReq,
  int barReq,
  String barLocaion,
  List barFacility,
  int barLength,
  int barWidth,
  String barSpecificReq,
  int swimmingPoolReq,
  String swimmingPoolLocation,
  int swimmingPoollength,
  int swimmingPoolWidth,
  String swimmingPoolSpecificReq,
  bool gymReq,
  String gymlocation,
  int gymLength,
  int gymWidth,
  String gymSpecificReq,
  int spaReq,
  String spaLocation,
  int spaLength,
  int spaWidth,
  String spaSpecificReq,
  int gardenReq,
  String gardenType,
  String gardenSpecificReq,
) async {
  var projectData = {
    "project_id": projectId,
    "dimension": 1,
    "basement_req": basementReq,
    "basement_type": basementType,
    "stilt_req": StiltRequirement,
    "stilt_type": StiltType,
    "office_req": officeRequirement,
    "office_length": officeLength,
    "office_width": officeWidth,
    "office_location": officeLocation,
    "office_facility": officeFacility,
    "office_specific_req": officeSpecificReq,
    "servent_quarter_req": serventQuaterReq,
    "servent_quarter_length": serventQuaterLength,
    "servent_quarter_width": serventQuaterWidth,
    "no_of_servent_quarter": noOfServentsQuater,
    "servent_quarter_facility": serventQuaterFacility,
    "servent_quarter_location": serventQuaterLocation,
    "servent_quarter_specific_req": serventQuaterSpecificReq,
    "parking_garage_req": parkingGarageReq,
    "parking_garage_length": parkingGarageLength,
    "parking_garage_width": parkingGarageWidth,
    "no_of_cars": noOfCar,
    "parking_garage_location": parkingGarageLocation,
    "saperate_shade": saperateShade,
    "parking_garage_specific_req": parkingGarageSpecificReq,
    "home_theater_req": homeTheaterReq,
    "home_theater_length": homeTheaterLength,
    "home_theater_width": homeTheaterWidth,
    "home_theater_location": homeTheaterLocation,
    "home_theater_seats": homeTheaterSeats,
    "home_theater_specific_req": homeTheaterSpecificReq,
    "indoor_play_req": indoorPlayReq,
    "indoor_play_location": indoorPlayLocation,
    "indoor_play_length": indoorPlayLength,
    "indoor_play_width": indoorPlayWidth,
    "indoor_play_specific_req": indorPlaySpecificReq,
    "bar_req": barReq,
    "bar_location": barLocaion,
    "bar_facility": barFacility,
    "bar_length": barLength,
    "bar_width": barWidth,
    "bar_specific_req": barSpecificReq,
    "swimming_pool_req": swimmingPoolReq,
    "swimming_pool_location": swimmingPoolLocation,
    "swimming_pool_length": swimmingPoollength,
    "swimming_pool_width": swimmingPoolWidth,
    "swimming_pool_specific_req": swimmingPoolSpecificReq,
    "gym_req": gymReq,
    "gym_location": gymlocation,
    "gym_length": gymLength,
    "gym_width": gymWidth,
    "gym_specific_req": gymSpecificReq,
    "spa_req": spaReq,
    "spa_location": spaLocation,
    "spa_length": spaLength,
    "spa_width": spaWidth,
    "spa_specific_req": spaSpecificReq,
    "garden_req": gardenReq,
    "garden_type": gardenType,
    "garden_specific_req": gardenSpecificReq,
  };
  // print("postdata===");
  print(jsonEncode(projectData));
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('${dotenv.env['APP_URL']}update-bungalow-basement/$projectId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );

  var temp = jsonDecode(response.body);
  return temp['status'];
}

Future<void> HouseDuplexFloorPost(
    int? projectId,
    int? staircase,
    String? stairCaseImage,
    bool? poojaRoomReq,
    int? poojaRoomLength,
    int? poojaRoomWidth,
    int? poojaRoomFloor,
    String? poojaRoomType,
    String? OpeningToLivingHall) async {
  var bodyData = {
    "project_id": 179,
    "dimension": 1,
    "stair_case": staircase,
    "stair_case_image": stairCaseImage,
    "pooja_room_req": poojaRoomReq,
    "pooja_room_length": poojaRoomLength,
    "pooja_room_width": poojaRoomWidth,
    "pooja_room_floor": poojaRoomFloor,
    "pooja_room_type": poojaRoomType,
    "opening_to_li_ha": OpeningToLivingHall
  };

  print("bodyData=");
  print(bodyData);

  final resp = await http.post(
    Uri.parse("${dotenv.env['APP_URL']}flat-house-floor-store"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(bodyData),
  );
  print('resp.body--');
  print(resp.body);
}

Future<dynamic> step2Put(
  int projectid,
  String vastu,
  int floor,
  int porchReq,
  String porchLength,
  String porchWidth,
) async {
  var projectData = {
    "vastu": vastu,
    "floor": floor,
    "porch_req": porchReq,
    "porch_length": porchLength,
    "porch_width": porchWidth,
    "dimension": dimenInt,
  };

  print('projectData==');
  print(projectid);
  print(projectData);

  final response = await http.post(
    Uri.parse("${dotenv.env['APP_URL']}update-flat-house-entrance/$projectid"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var resp = jsonDecode(response.body);

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('floorCount', resp['floor']);
  return resp["status"];
}

Future<dynamic> step2Post(
  int projectid,
  String vastu,
  int floor,
  int porchReq,
  String porchLength,
  String porchWidth,
) async {
  var projectData = {
    "project_id": projectid,
    "vastu": vastu,
    "floor": floor,
    "porch_req": porchReq,
    "porch_length": porchLength,
    "porch_width": porchWidth,
    "dimension": dimenInt,
  };

  print('entrance projectData===');
  print(projectData);

  final response = await http.post(
    Uri.parse("${dotenv.env['APP_URL']}flat-house-entrance"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  var resp = jsonDecode(response.body);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('floorCount', resp['floor']);
  return resp["status"];
}

Future<dynamic> livingHallDuplexPost(
  int ProjectId,
  int drawingInt,
  int drawingHallLocation,
  String drawingHallLengthController,
  String drawingHallWidthController,
  String drawingSpecialFeaturesController,
  int livingHallInt,
  int livingHallLocation,
  String livingHallLengthController,
  String livingHallWidthController,
  List livingHall,
  String livingSpecialFeaturesController,
  List kitchenFeatures,
  String kitchenFloor,
  String kitchenLengthController,
  String kitchenWidthController,
  String kitchenDiningFunction,
  String attachedLengthController,
  String attachedWidthController,
  String utilityWidthController,
  String utilityLengthController,
  String utilityWashArea,
  String specificReq,
  String diningHallLengthController,
  String diningHallWidthController,
  String diningSpecialFeaturesController,
  int diningFloorInt,
  int diningSeatsInt,
) async {
  print("drawingHallLocation");
  print(drawingHallLocation);
  print("drawingHallLengthController");
  print(drawingHallLengthController);
  var projectData = {
    "project_id": ProjectId,
    "dimension": dimenInt,
    "drawing_hall_req": drawingInt,
    "drawing_hall_location": drawingHallLocation,
    "drawing_hall_length": drawingHallLengthController,
    "drawing_hall_width": drawingHallWidthController,
    "drawing_hall_text": drawingSpecialFeaturesController,
    "living_hall_req": livingHallInt,
    "living_hall_location": livingHallLocation,
    "living_hall_width": livingHallWidthController,
    "living_hall_length": livingHallLengthController,
    "living_hall_text": livingSpecialFeaturesController,
    "kitchen_floor": kitchenFloor,
    "kitchen_length": kitchenLengthController,
    "kitchen_width": kitchenWidthController,
    "kitchen_dining_function": kitchenDiningFunction,
    "attach_store_length": attachedLengthController,
    "attach_store_width": attachedWidthController,
    "utility_wash_width": utilityWidthController,
    "utility_wash_length": utilityLengthController,
    "specific_req": specificReq,
    "dining_floor": diningFloorInt,
    "dining_length": diningHallLengthController,
    "dining_width": diningHallWidthController,
    "dining_seat": diningSeatsInt,
    "dining_text": diningSpecialFeaturesController,
    "kitchen_features": kitchenFeatures
  };

  print(projectData);
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse("${dotenv.env['APP_URL']}flat-house-drawing-hall"),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  print(response.body);
  var temp = jsonDecode(response.body);

  return temp['status'];
}

Future<dynamic> livingHallDuplexPut(
  int ProjectId,
  int drawingInt,
  int drawingHallLocation,
  String drawingHallLengthController,
  String drawingHallWidthController,
  String drawingSpecialFeaturesController,
  int livingHallInt,
  int livingHallLocation,
  String livingHallLengthController,
  String livingHallWidthController,
  List livingHall,
  String livingSpecialFeaturesController,
  List kitchenFeatures,
  String kitchenFloor,
  String kitchenLengthController,
  String kitchenWidthController,
  String kitchenDiningFunction,
  String attachedLengthController,
  String attachedWidthController,
  String utilityWidthController,
  String utilityLengthController,
  String utilityWashArea,
  String specificReq,
  String diningHallLengthController,
  String diningHallWidthController,
  String diningSpecialFeaturesController,
  int diningFloorInt,
  int diningSeatsInt,
) async {
  var projectData = {
    "dimension": dimenInt,
    "drawing_hall_req": drawingInt,
    "drawing_hall_location": drawingHallLocation,
    "drawing_hall_length": drawingHallLengthController,
    "drawing_hall_width": drawingHallWidthController,
    "drawing_hall_text": drawingSpecialFeaturesController,
    "living_hall_req": livingHallInt,
    "living_hall_location": livingHallLocation,
    "living_hall_width": livingHallWidthController,
    "living_hall_length": livingHallLengthController,
    "living_hall_text": livingSpecialFeaturesController,
    "kitchen_floor": kitchenFloor,
    "kitchen_length": kitchenLengthController,
    "kitchen_width": kitchenWidthController,
    "kitchen_dining_function": kitchenDiningFunction,
    "attach_store_length": attachedLengthController,
    "attach_store_width": attachedWidthController,
    "utility_wash_width": utilityWidthController,
    "utility_wash_length": utilityLengthController,
    "kitchen_text": specificReq,
    "dining_floor": diningFloorInt,
    "dining_length": diningHallLengthController,
    "dining_width": diningHallWidthController,
    "dining_seat": diningSeatsInt,
    "dining_text": diningSpecialFeaturesController,
    "kitchen_features": kitchenFeatures
  };

  print(projectData);
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse(
        "${dotenv.env['APP_URL']}update-flat-house-drawing-hall/$ProjectId"),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  print(response.body);
  var temp = jsonDecode(response.body);

  return temp['status'];
}

Future<dynamic> flooreStoreHousePost(
    int i,
    String selectedStair,
    int poojaRoomReq,
    String poojaLengthController,
    String poojaWidthController,
    int poojaRoomLocation,
    String selectedPoojaPlace,
    String openingToLiHa) async {
  var projectData = {
    "project_id": i,
    "dimension": dimenInt,
    "stair_case": selectedStair,
    "stair_case_image": "",
    "pooja_room_req": poojaRoomReq,
    "pooja_room_length": poojaLengthController,
    "pooja_room_width": poojaWidthController,
    "pooja_room_floor": poojaRoomLocation,
    "pooja_room_type": selectedPoojaPlace,
    "opening_to_li_ha": openingToLiHa,
  };
  print(projectData);
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('${dotenv.env['APP_URL']}flat-house-floor-store'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );

  print(response.body);
  var resp = jsonDecode(response.body);
  var temp = resp["status"];
  return temp;
}

Future<dynamic> flooreStoreHousePut(
    int i,
    String selectedStair,
    int poojaRoomReq,
    String poojaLengthController,
    String poojaWidthController,
    int poojaRoomLocation,
    String selectedPoojaPlace,
    String openingToLiHa) async {
  var projectData = {
    "dimension": dimenInt,
    "stair_case": selectedStair,
    "stair_case_image": "",
    "pooja_room_req": poojaRoomReq,
    "pooja_room_length": poojaLengthController,
    "pooja_room_width": poojaWidthController,
    "pooja_room_floor": poojaRoomLocation,
    "pooja_room_type": selectedPoojaPlace,
    "opening_to_li_ha": openingToLiHa,
  };

  print(projectData);
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('${dotenv.env['APP_URL']}update-flat-house-floor-store/$i'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );

  print(response.body);
  var resp = jsonDecode(response.body);
  var temp = resp["status"];
  return temp;
}

Future<dynamic> BasementHousePost(
  int project_id,
  int basementReqInt,
  String slectedBasement,
  int stilitReqInt,
  String slectedstilt,
  int officeReqInt,
  int officeLengthController,
  int officeWidthController,
  String selectedOfficeLocation,
  List<String> otherFacilities,
  String officeSpecificReqController,
  int additionalReqInt,
  int additionalParkingLength,
  int additionalParkingWidth,
  int additionalCarsController,
  String selectedParkingLocation,
  String sepratedShadeController,
  String additionalParkingSpecificController,
) async {
  var projectData = {
    "project_id": project_id,
    "dimension": dimenInt,
    "basement_req": basementReqInt,
    "basement_type": slectedBasement,
    "stilt_req": stilitReqInt,
    "stilt_type": slectedstilt,
    "office_req": officeReqInt,
    "office_length": officeLengthController,
    "office_width": officeWidthController,
    "office_location": selectedOfficeLocation,
    "office_facility": otherFacilities,
    "office_specific_req": officeSpecificReqController,
    "parking_garage_req": additionalReqInt,
    "parking_garage_length": additionalParkingLength,
    "parking_garage_width": additionalParkingWidth,
    "no_of_cars": additionalCarsController,
    "parking_garage_location": selectedParkingLocation,
    "saperate_shade": sepratedShadeController,
    "parking_garage_specific_req": additionalParkingSpecificController,
  };
  print(jsonEncode(projectData));
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('${dotenv.env['APP_URL']}flat-house-basement'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  print(response.body);
  var temp = jsonDecode(response.body);
  return temp['status'];
}

Future<dynamic> BasementHousePut(
  int project_id,
  int basementReqInt,
  String slectedBasement,
  int stilitReqInt,
  String slectedstilt,
  int officeReqInt,
  int officeLengthController,
  int officeWidthController,
  String selectedOfficeLocation,
  List<String> otherFacilities,
  String officeSpecificReqController,
  int additionalReqInt,
  int additionalParkingLength,
  int additionalParkingWidth,
  int additionalCarsController,
  String selectedParkingLocation,
  String sepratedShadeController,
  String additionalParkingSpecificController,
) async {
  var projectData = {
    "dimension": dimenInt,
    "basement_req": basementReqInt,
    "basement_type": slectedBasement,
    "stilt_req": stilitReqInt,
    "stilt_type": slectedstilt,
    "office_req": officeReqInt,
    "office_length": officeLengthController,
    "office_width": officeWidthController,
    "office_location": selectedOfficeLocation,
    "office_facility": otherFacilities,
    "office_specific_req": officeSpecificReqController,
    "parking_garage_req": additionalReqInt,
    "parking_garage_length": additionalParkingLength,
    "parking_garage_width": additionalParkingWidth,
    "no_of_cars": additionalCarsController,
    "parking_garage_location": selectedParkingLocation,
    "saperate_shade": sepratedShadeController,
    "parking_garage_specific_req": additionalParkingSpecificController,
  };
  print(jsonEncode(projectData));
  final response = await http.post(
    // Uri.parse(baseUrlLocal + "project"),
    Uri.parse('${dotenv.env['APP_URL']}update-flat-house-basement/$project_id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(projectData),
  );
  print(response.body);
  var temp = jsonDecode(response.body);
  return temp['status'];
}

Future<dynamic> getAreaSuggest(area_id, segment_id) async {
  var response = await http.get(Uri.parse(
      'https://sdplweb.com/sdpl/api/area-suggest/$area_id/$segment_id'));
  final jsonResponse = jsonDecode(response.body);
  final finalart = jsonResponse['areas'] as List;
  print(finalart);

  return finalart;
}
