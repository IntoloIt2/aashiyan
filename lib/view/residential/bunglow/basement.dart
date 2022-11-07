// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unnecessary_null_comparison, non_constant_identifier_names, avoid_print, prefer_if_null_operators, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable

import 'dart:async';
import 'dart:convert';
import 'package:aashiyan/components/constant.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';
import 'package:http/http.dart' as http;

class Basement extends StatefulWidget {
  static const namedRoute = "/Basement";
  @override
  State<Basement> createState() => _BasementState();
}

var id;

class _BasementState extends State<Basement> {
  final List<String> otherItems = ["Pantry", "Staff Toilet", "Toilet"];

  var pageId;
  var viewData;
  var barFaci = [];
  var officeFac = [];
  var project_id = 0;
  late var timer;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();

    timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              isloading = true;
            }));
    // print(id);
    getData();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  List<String> otherFacilities = [];

  void multiSelected() async {
    final List<String> otherItems = ["Pantry", "Staff Toilet", "Toilet"];

    final List<String> result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: otherItems);
        });

    if (result != null) {
      setState(() {
        otherFacilities = result;
      });
    }
  }

  void showToast(msg, toastColor, GRAVITY) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 0,
        backgroundColor: toastColor,
        textColor: Colors.white);
  }

  int officeLengthController = 0;
  int officeWidthController = 0;
  String officeSpecificReqController = '';
  int serventLengthController = 0;
  int serventWidthController = 0;
  String serventSpecificController = '';
  int serventController = 0;
  int homeTheaterLengthController = 0;
  int homeTheaterWidthController = 0;
  String homeTheaterSpecificController = "";
  int additionalParkingLength = 0;
  int additionalParkingWidth = 0;
  int additionalCarsController = 0;
  int indoorPlayLengthController = 0;
  int indoorPlayWidtController = 0;
  String additionalParkingSpecificController = '';
  String indoorPlaySpecificRequirement = '';
  int barLengthController = 0;
  int barWidthController = 0;
  String barSpecificRequiremrnt = '';
  int swimmingPoolLengthController = 0;
  String swimmingPoolSpecificRequirement = '';
  int swimmingPoolWidthController = 0;
  int gymLengthController = 0;
  int gymWidthController = 0;
  String gymSpecificRequirement = '';
  int spaLengthController = 0;
  int spaWidthController = 0;
  String spaSpecificReq = '';
  String gardenSpecificRequiremnt = '';
  String sepratedShadeController = '';
  int NoOfserventController = 0;

  String slectedBasement = "For parking";
  List<String> basementList = ["For parking", "For amenites", "Both"];

  String slectedstilt = "For parking";
  List<String> stiltList = ["For parking", "For amenites", "Both"];

  String selectedOfficeLocation = "Select Location";
  List<String> listOfficeLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area"
  ];

  String serventLocation = "Select Location";
  List<String> serventItems = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area"
  ];

  String homeTheaterFloor = "Select Floor";

  List<String> homeTheaterFloorItems = [
    "Select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "Basement",
    "Stilt",
    "Terrace",
    "other"
  ];
  int noServents = 0;
  String selectedServent = "Select";
  List<String> noOfServents = ["Select", "1", "2", "3"];

  String selectedSeats = "Select";
  List<String> seatsItems = ["Select", "8", "10", "12", "more"];

  String selectedIndoorLocation = "Select Location";
  List<String> itemsIndoorLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area"
  ];

  String selectedBarLocation = "Select Location";
  List<String> itemsBarLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area"
  ];

  String swimmingLocation = "Select Location";
  List<String> itemsSwimmingLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area",
  ];

  String gymLocation = "Select Location";
  List<String> itemsGymLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area",
  ];

  String spaLocation = "Select Location";
  List<String> itemsSpaLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area",
  ];

  String gardenLocation = "Select Location";
  List<String> gardenItems = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area",
  ];

  String selectedParkingLocation = "Select Location";
  List<String> parkingLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area",
  ];

  bool? serventFacility1 = false;
  bool? serventFacility2 = false;

  bool? BasementRequirement = false;
  bool? BasementNotRequire = false;
  int basementReqInt = 0;

  bool? StiltRequirement = false;
  bool? StiltNotRequire = false;
  int stilitReqInt = 0;

  bool? officeRequirement = false;
  bool? officeNotRequire = false;
  int officeReqInt = 0;
  String officeArea = '';
  List officeFacility = [];

  bool? servantNotRequired = false;
  bool? servantRequirement = false;
  int servantReqInt = 0;
  String serventArea = '';
  List serventFacility = [];

  bool? HomeTheaterNotRequired = false;
  bool? HomeTheaterRequirement = false;
  int homeReqInt = 0;
  String homeArea = '';

  bool? AdditionalNotRequired = false;
  bool? AdditionalRequirement = false;
  int additionalReqInt = 0;
  String additionalArea = '';

  bool? indoorNotRequired = false;
  bool? indoorRequirement = false;
  int indoorReqInt = 0;
  String indoorArea = '';

  bool? barNotRequired = false;
  bool? barRequirement = false;

  bool? barFacility1 = false;
  bool? barFacility2 = false;
  int barReqInt = 0;
  String barArea = '';
  List barFacility = [];

  bool? swimmingNotRequired = false;
  bool? swimmingRequirement = false;
  int swimmingReqInt = 0;
  String swimmingPoolArea = '';

  bool? gymNotRequired = false;
  bool? gymRequirement = false;
  int gymReqInt = 0;
  String gymArea = '';

  bool? spaNotRequired = false;
  bool? spaRequirement = false;
  int spaRequiredInt = 0;
  String spArea = '';

  bool? gardenNotRequired = false;
  bool? gardenRequirement = false;
  int gardenRequirementInt = 0;

  bool isloading = false;

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    project_id = prefs.getInt('projectId')!;

    var response = await http.get(
      Uri.parse(
        "${dotenv.env['APP_URL']}edit-bungalow-basement/$project_id",
      ),
    );
    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode == SUCCESS) {
      setState(() {
        viewData = jsonResponse;

        if (viewData['status'] == SUCCESS) {
          pageId = viewData['bungalow_basement']['id'] != null
              ? viewData['bungalow_basement']['id'].toString()
              : pageId;

          BasementRequirement =
              viewData["bungalow_basement"]['basement_req'] == T_RUE
                  ? true
                  : false;
          BasementNotRequire =
              viewData["bungalow_basement"]['basement_req'] == F_ALSE
                  ? true
                  : false;

          slectedBasement =
              viewData["bungalow_basement"]['basement_type'] != null
                  ? viewData["bungalow_basement"]['basement_type'].toString()
                  : slectedBasement;

          StiltRequirement = viewData["bungalow_basement"]['stilt_req'] != null
              ? viewData["bungalow_basement"]['stilt_req'] == T_RUE
                  ? true
                  : false
              : false;
          StiltNotRequire = viewData["bungalow_basement"]['stilt_req'] != null
              ? viewData["bungalow_basement"]['stilt_req'] == F_ALSE
                  ? true
                  : false
              : false;
          slectedstilt = viewData["bungalow_basement"]['stilt_type'] != null
              ? viewData["bungalow_basement"]["stilt_type"].toString()
              : slectedstilt;
          officeRequirement =
              viewData["bungalow_basement"]['office_req'] == T_RUE
                  ? true
                  : false;
          officeNotRequire =
              viewData["bungalow_basement"]["office_req"] == F_ALSE
                  ? true
                  : false;
          selectedOfficeLocation =
              viewData["bungalow_basement"]['office_location'] != null
                  ? viewData["bungalow_basement"]['office_location']
                  : "ForParking";

          officeLengthController =
              viewData["bungalow_basement"]['office_length'] != null
                  ? int.parse(
                      viewData["bungalow_basement"]['office_length'].toString())
                  : INT_ZERO;

          officeWidthController =
              viewData["bungalow_basement"]['office_width'] != null
                  ? int.parse(
                      viewData["bungalow_basement"]['office_width'].toString())
                  : INT_ZERO;

          otherFacilities = viewData["bungalow_basement"] != null
              ? viewData["bungalow_basement"]['office_facility']
                  .toString()
                  .split(',')
              : [];

          // if (viewData["bungalow_basement"] != null
          //     ? viewData['bungalow_basement']['office_facility'] != null
          //     : officeFac != null) {
          //   for (int i = 0; i < officeFac.length; i++) {
          //     otherFacilities.add(otherItems[int.parse(officeFac[i])]);
          //     // print(otherItems[int.parse(officeFac[i])]);
          //   }
          // }

          barFaci = viewData["bungalow_basement"]["bar_facility"] != null
              ? viewData["bungalow_basement"]["bar_facility"]
                  .toString()
                  .split(',')
              : barFaci;

          barSpecificRequiremrnt =
              viewData["bungalow_basement"]["bar_specific_req"] != null
                  ? viewData["bungalow_basement"]["bar_specific_req"]
                  : barSpecificRequiremrnt;

          officeSpecificReqController = viewData["bungalow_basement"]
                      ['office_specific_req'] !=
                  null
              ? viewData["bungalow_basement"]['office_specific_req'].toString()
              : '';

          servantRequirement =
              viewData["bungalow_basement"]['servent_quarter_req'] == STR_ONE
                  ? true
                  : false;
          print('servantRequirement---');
          print(servantRequirement);

          servantNotRequired =
              viewData["bungalow_basement"]['servent_quarter_req'] == STR_ZERO
                  ? true
                  : false;

          serventLengthController =
              viewData["bungalow_basement"]['servent_quarter_length'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['servent_quarter_width']
                      .toString())
                  : INT_ZERO;
          serventWidthController =
              viewData["bungalow_basement"]['servent_quarter_width'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['servent_quarter_width']
                      .toString())
                  : INT_ZERO;
          serventSpecificController = viewData["bungalow_basement"]
                      ['servent_quarter_specific_req'] !=
                  null
              ? viewData["bungalow_basement"]['servent_quarter_specific_req']
                  .toString()
              : '';
          selectedServent =
              viewData["bungalow_basement"]['no_of_servent_quarter'] != null
                  ? viewData["bungalow_basement"]['no_of_servent_quarter']
                      .toString()
                  : '';
          serventLocation =
              viewData["bungalow_basement"]['servent_quarter_location'] != null
                  ? viewData["bungalow_basement"]['servent_quarter_location']
                      .toString()
                  : '';
          serventFacility =
              viewData["bungalow_basement"]['servent_quarter_facility'] != null
                  ? viewData["bungalow_basement"]['servent_quarter_facility']
                      .toString()
                      .split(',')
                  : [];
          if (serventFacility.contains('1')) {
            serventFacility1 = true;
          }
          if (serventFacility.contains('2')) {
            serventFacility2 = true;
          }

          HomeTheaterRequirement =
              viewData["bungalow_basement"]['home_theater_req'] == T_RUE
                  ? true
                  : false;
          HomeTheaterNotRequired =
              viewData["bungalow_basement"]['home_theater_req'] == F_ALSE
                  ? true
                  : false;
          homeTheaterLengthController =
              viewData["bungalow_basement"]['servent_quarter_length'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['servent_quarter_length']
                      .toString())
                  : INT_ZERO;
          homeTheaterWidthController =
              viewData["bungalow_basement"]['home_theater_width'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['home_theater_width']
                      .toString())
                  : INT_ZERO;
          homeTheaterFloor =
              viewData["bungalow_basement"]['home_theater_location'] != null
                  ? viewData["bungalow_basement"]['home_theater_location']
                      .toString()
                  : homeTheaterFloor;
          homeTheaterSpecificController =
              viewData["bungalow_basement"]['home_theater_specific_req'] != null
                  ? viewData["bungalow_basement"]['home_theater_specific_req']
                      .toString()
                  : '';

          selectedSeats = viewData["bungalow_basement"]['home_theater_seats'] !=
                  null
              ? viewData["bungalow_basement"]['home_theater_seats'].toString()
              : '';

          AdditionalRequirement =
              viewData["bungalow_basement"]['parking_garage_req'] == T_RUE
                  ? true
                  : false;

          AdditionalNotRequired =
              viewData["bungalow_basement"]['parking_garage_req'] == F_ALSE
                  ? true
                  : false;

          additionalParkingLength =
              viewData["bungalow_basement"]['parking_garage_length'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['parking_garage_length']
                      .toString())
                  : INT_ZERO;
          additionalParkingWidth =
              viewData["bungalow_basement"]['parking_garage_width'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['parking_garage_width']
                      .toString())
                  : INT_ZERO;
          additionalCarsController =
              viewData["bungalow_basement"]['no_of_cars'] != null
                  ? int.parse(
                      viewData["bungalow_basement"]['no_of_cars'].toString())
                  : INT_ZERO;

          sepratedShadeController =
              viewData["bungalow_basement"]['saperate_shade'] != null
                  ? viewData["bungalow_basement"]['saperate_shade'].toString()
                  : '';
          selectedParkingLocation =
              viewData["bungalow_basement"]['parking_garage_location'] != null
                  ? viewData["bungalow_basement"]['parking_garage_location']
                      .toString()
                  : selectedParkingLocation;
          additionalParkingSpecificController = viewData["bungalow_basement"]
                      ['parking_garage_specific_req'] !=
                  null
              ? viewData["bungalow_basement"]['parking_garage_specific_req']
              : additionalParkingSpecificController;

          indoorRequirement =
              viewData["bungalow_basement"]['indoor_play_req'] == T_RUE
                  ? true
                  : false;
          indoorNotRequired =
              viewData["bungalow_basement"]['indoor_play_req'] == F_ALSE
                  ? true
                  : false;

          indoorPlayLengthController =
              viewData["bungalow_basement"]['indoor_play_length'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['indoor_play_length']
                      .toString())
                  : INT_ZERO;
          indoorPlayWidtController = viewData["bungalow_basement"]
                      ['indoor_play_width'] !=
                  null
              ? int.parse(
                  viewData["bungalow_basement"]['indoor_play_width'].toString())
              : INT_ZERO;
          selectedIndoorLocation = viewData["bungalow_basement"]
                      ['indoor_play_location'] !=
                  null
              ? viewData["bungalow_basement"]['indoor_play_location'].toString()
              : selectedIndoorLocation;

          barRequirement =
              viewData["bungalow_basement"]['bar_req'] == T_RUE ? true : false;

          barNotRequired =
              viewData["bungalow_basement"]['bar_req'] == F_ALSE ? true : false;

          barLengthController =
              viewData["bungalow_basement"]['bar_length'] != null
                  ? int.parse(
                      viewData["bungalow_basement"]['bar_length'].toString())
                  : INT_ZERO;
          barWidthController = viewData["bungalow_basement"]['bar_width'] !=
                  null
              ? int.parse(viewData["bungalow_basement"]['bar_width'].toString())
              : INT_ZERO;
          selectedBarLocation =
              viewData["bungalow_basement"]['bar_location'] != null
                  ? viewData["bungalow_basement"]['bar_location'].toString()
                  : selectedBarLocation;
          // barFacility = viewData["bungalow_basement"]["bar_facility"] != null
          //     ? viewData["bungalow_basement"]["bar_facility"]
          //     : [];

          // print("inside--");
          // print(barFaci.isNotEmpty);

          // if (barFaci != null && barFaci != [] && barFaci.isNotEmpty) {
          //   print("empty--");
          //   if (barFaci.asMap().containsKey(0)) {
          //     if (barFaci[0] == STR_ONE) barFacility1 = true;
          //   }

          //   if (barFaci.asMap().containsKey(1)) {
          //     if (barFaci[1] == STR_TWO) barFacility2 = true;
          //   }
          // }
          if (barFaci.length > 0) {
            if (barFaci.contains(STR_ONE)) {
              barFacility1 = true;
            }
            if (barFaci.contains(STR_TWO)) {
              barFacility2 = true;
            }
          }

          swimmingRequirement =
              viewData["bungalow_basement"]['swimming_pool_req'] == T_RUE
                  ? true
                  : false;
          swimmingNotRequired =
              viewData["bungalow_basement"]['swimming_pool_req'] == F_ALSE
                  ? true
                  : false;

          swimmingPoolLengthController =
              viewData["bungalow_basement"]['swimming_pool_length'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['swimming_pool_length']
                      .toString())
                  : INT_ZERO;

          swimmingPoolWidthController =
              viewData["bungalow_basement"]['swimming_pool_width'] != null
                  ? int.parse(viewData["bungalow_basement"]
                          ['swimming_pool_width']
                      .toString())
                  : INT_ZERO;

          swimmingLocation =
              viewData["bungalow_basement"]['swimming_pool_location'] != null
                  ? viewData["bungalow_basement"]['swimming_pool_location']
                      .toString()
                  : swimmingLocation;
          swimmingPoolSpecificRequirement =
              viewData["bungalow_basement"]['swimming_pool_location'] != null
                  ? viewData["bungalow_basement"]['swimming_pool_location']
                      .toString()
                  : swimmingPoolSpecificRequirement;
          gymRequirement =
              viewData["bungalow_basement"]['gym_req'] == T_RUE ? true : false;

          gymNotRequired =
              viewData["bungalow_basement"]['gym_req'] == F_ALSE ? true : false;

          gymLengthController =
              viewData["bungalow_basement"]['gym_length'] != null
                  ? int.parse(
                      viewData["bungalow_basement"]['gym_length'].toString())
                  : INT_ZERO;

          gymWidthController = viewData["bungalow_basement"]['gym_width'] !=
                  null
              ? int.parse(viewData["bungalow_basement"]['gym_width'].toString())
              : INT_ZERO;
          gymLocation = viewData["bungalow_basement"]['gym_location'] != null
              ? viewData["bungalow_basement"]['gym_location'].toString()
              : gymLocation;
          gymSpecificRequirement =
              viewData["bungalow_basement"]['gym_specific_req'] != null
                  ? viewData["bungalow_basement"]['gym_specific_req'].toString()
                  : gymSpecificRequirement;
          spaRequirement =
              viewData["bungalow_basement"]['spa_req'] == T_RUE ? true : false;

          spaNotRequired =
              viewData["bungalow_basement"]['spa_req'] == F_ALSE ? true : false;

          spaLengthController =
              viewData["bungalow_basement"]['spa_length'] != null
                  ? int.parse(
                      viewData["bungalow_basement"]['spa_length'].toString())
                  : INT_ZERO;
          spaWidthController = viewData["bungalow_basement"]['spa_width'] !=
                  null
              ? int.parse(viewData["bungalow_basement"]['spa_width'].toString())
              : INT_ZERO;
          spaLocation = viewData["bungalow_basement"]['spa_location'] != null
              ? viewData["bungalow_basement"]['spa_location'].toString()
              : spaLocation;
          spaSpecificReq =
              viewData["bungalow_basement"]['spa_specific_req'] != null
                  ? viewData["bungalow_basement"]['spa_specific_req'].toString()
                  : spaSpecificReq;
          gardenRequirement =
              viewData["bungalow_basement"]['garden_req'] == T_RUE
                  ? true
                  : false;

          gardenLocation = viewData["bungalow_basement"]['garden_type'] != null
              ? viewData["bungalow_basement"]['garden_type'].toString()
              : gardenLocation;
          gardenSpecificRequiremnt = viewData["bungalow_basement"]
                      ['garden_specific_req'] !=
                  null
              ? viewData["bungalow_basement"]['garden_specific_req'].toString()
              : gardenSpecificRequiremnt;
          gardenNotRequired =
              viewData["bungalow_basement"]['garden_req'] == F_ALSE
                  ? true
                  : false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return isloading == false
        ? Container(child: const CircularProgressIndicator())
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                requirementText("Basement Detail"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: BasementRequirement,
                                      // value: BasementRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            // if (viewData["bungalow_basement"] !=
                                            //         null
                                            //     ? viewData["bungalow_basement"]
                                            //             ["basement_req"] !=
                                            //         null
                                            //     : false) {
                                            //   viewData["bungalow_basement"]
                                            //       ["basement_req"] = null;
                                            // }
                                            BasementRequirement = value;
                                            BasementNotRequire = false;
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: BasementNotRequire,
                                      // value: BasementNotRequire,
                                      onChanged: (value) {
                                        setState(() {
                                          // if (viewData["bungalow_basement"] !=
                                          //         null
                                          //     ? viewData["bungalow_basement"]
                                          //             ["basement_req"] !=
                                          //         null
                                          //     : false) {
                                          //   viewData["bungalow_basement"]
                                          //       ["basement_req"] = null;
                                          // }
                                          BasementNotRequire = value;
                                          BasementRequirement = false;
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (BasementRequirement == true) ...[
                  Row(
                    children: [
                      requirementText("Basement"),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * .04,
                          width: width * 0.4,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                hint: Text(slectedBasement),

                                //  viewData['bungalow_basement'] != null
                                //     ? viewData['bungalow_basement']
                                //                 ['basement_type'] !=
                                //             null
                                //         ? Text(basementList[
                                //             viewData['bungalow_basement']
                                //                 ['basement_type']])
                                //         : Text(slectedBasement)
                                //     : Text(slectedBasement),
                                // value:  slectedBasement,
                                items: basementList
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it, child: Text(it)))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      slectedBasement = it!;
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Stilt Details"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: StiltRequirement,
                                      // value: StiltRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            StiltRequirement = value;
                                            StiltNotRequire = false;
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: StiltNotRequire,
                                      // value: StiltNotRequire,
                                      onChanged: (value) {
                                        setState(() {
                                          StiltNotRequire = value;
                                          StiltRequirement = false;
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (StiltRequirement == true) ...[
                  Row(
                    children: [
                      requirementText("Basement"),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * .04,
                          width: width * 0.4,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              // hint: viewData["bungalow_basement"] != null
                              //     ? viewData["bungalow_basement"]
                              //                 ["stilt_type"] !=
                              //             null
                              //         ? Text(stiltList[int.parse(
                              //             viewData["bungalow_basement"]
                              //                 ["basement_type"])])
                              //         : Text(slectedstilt)
                              //     : Text(slectedstilt),
                              hint: Text(slectedstilt),
                              // hint:Text(),
                              items: stiltList
                                  .map((it) => DropdownMenuItem<String>(
                                      value: it, child: Text(it)))
                                  .toList(),
                              onChanged: (it) => setState(
                                () {
                                  slectedstilt = it!;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  requirementText("Amenities"),
                ],
                requirementText("office"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: officeRequirement,
                                      // value: officeRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            officeRequirement = value;
                                            officeNotRequire = false;
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: officeNotRequire,
                                      // value: officeNotRequire,
                                      onChanged: (value) {
                                        setState(() {
                                          officeNotRequire = value;
                                          officeRequirement = false;
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (officeRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(
                              //   height, width, 0.04, 0.15,
                              //     "length", officeLengthController
                              //     ),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue: viewData["bungalow_basement"]
                                    //     ["office_length"],
                                    initialValue:
                                        officeLengthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "length",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      officeLengthController = value != ''
                                          ? int.parse(value)
                                          : officeLengthController;
                                      // if (viewData['bungalow_basement'] != null
                                      //     ? viewData['bungalow_basement']
                                      //             ['office_length'] !=
                                      //         null
                                      //     : false) {
                                      //   viewData['bungalow_basement']
                                      //           ['office_length'] =
                                      //       int.parse(value);
                                      // }
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Width")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04, 0.15,
                              //     "Width", officeWidthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue: viewData["bungalow_basement"]
                                    //     ["office_width"],
                                    initialValue:
                                        officeWidthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "width",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      // officeWidthController = int.parse(value);
                                      officeWidthController = value != ''
                                          ? int.parse(value)
                                          : officeWidthController;
                                      // officeWidthController =
                                      //     int.tryParse(value) ??
                                      //         officeWidthController;
                                      // officeWidthController =
                                      //     int.tryParse(value)!;

                                      // if (viewData['bungalow_basement'] != null
                                      //     ? viewData['bungalow_basement']
                                      //             ['office_width'] !=
                                      //         null
                                      //     : false) {
                                      //   viewData['bungalow_basement']
                                      //           ['office_width'] =
                                      //       officeWidthController.toString();
                                      // }
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  size: height * 0.03,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Location"),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      // DropDown(width, height, listOfficeLocation,
                      //     selectedOfficeLocation, 0.6, .035),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.6,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                // hint: viewData['bungalow_basement']
                                //             ["office_location"] !=
                                //         null
                                //     ? Text(viewData['bungalow_basement']
                                //         ["office_location"])
                                //     : Text(selectedOfficeLocation),
                                hint: Text(selectedOfficeLocation),
                                // value: selectedOfficeLocation,
                                elevation: 16,
                                items: listOfficeLocation
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      selectedOfficeLocation = it!;
                                      // if (viewData['bungalow_basement']
                                      //         ["office_location"] !=
                                      //     null) {
                                      //   viewData['bungalow_basement']
                                      //           ["office_location"] =
                                      //       selectedOfficeLocation;
                                      // }
                                    })),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Other Requirement"),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Flexible(
                        child: Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final List<String> result =
                                        await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return MultiSelect(
                                                  items: otherItems);
                                            });

                                    if (result != null) {
                                      setState(
                                        () {
                                          otherFacilities = result;
                                          print(otherFacilities);
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text("Office Facility"),
                                  ),
                                ),
                                Wrap(
                                  children: otherFacilities
                                      .map((e) => Chip(
                                            label: Text(e),
                                          ))
                                      .toList(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("other Requirements"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,"Other requirement", officeSpecificReqController)
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            // initialValue: viewData["bungalow_basement"]
                            //             ["office_specific_req"] !=
                            //         null
                            //     ? viewData["bungalow_basement"]
                            //         ["office_specific_req"]
                            //     : '',
                            initialValue: officeSpecificReqController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Other requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              officeSpecificReqController = value;
                              // if (viewData['bungalow_basement']
                              //         ["office_specific_req"] !=
                              //     null) {
                              //   viewData['bungalow_basement']
                              //           ["office_specific_req"] =
                              //       officeSpecificReqController;
                              // }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("servant requirement"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: servantRequirement,
                                      // value: servantRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            // if (viewData["bungalow_basement"]
                                            //         ["servent_quarter_req"] !=
                                            //     null) {
                                            //   viewData["bungalow_basement"]
                                            //           ["servent_quarter_req"] =
                                            //       null;
                                            // }

                                            servantRequirement = value;
                                            servantNotRequired = false;
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      // value: viewData != null
                                      //     ? viewData["bungalow_basement"] !=
                                      //             null
                                      //         ? viewData["bungalow_basement"][
                                      //                     "servent_quarter_req"] ==
                                      //                 STR_ZERO
                                      //             ? true
                                      //             : servantNotRequired
                                      //         : servantNotRequired
                                      //     : servantNotRequired,
                                      value: servantNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          // if (viewData["bungalow_basement"]
                                          //         ["servent_quarter_req"] !=
                                          //     null) {
                                          //   viewData["bungalow_basement"]
                                          //       ["servent_quarter_req"] = null;
                                          // }
                                          servantNotRequired = value;
                                          servantRequirement = false;
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (servantRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            // requirementTextFieldCont(height, width, 0.04,
                            //     0.15, "length", serventLengthController),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width * 0.15,
                                child: TextFormField(
                                  // initialValue: viewData["bungalow_basement"]
                                  //             ["servent_quarter_length"] !=
                                  //         null
                                  //     ? viewData["bungalow_basement"]
                                  //         ["servent_quarter_length"]
                                  //     : '',
                                  initialValue:
                                      serventLengthController.toString(),
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                      hintText: "Length",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8)),
                                  onChanged: (value) {
                                    serventLengthController = value != ''
                                        ? int.parse(value)
                                        : serventLengthController;
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        ),
                      ),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Width")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    initialValue:
                                        serventWidthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "width",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      serventWidthController = value != ''
                                          ? int.parse(value)
                                          : serventWidthController;
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  size: height * 0.03,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Location"),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.6,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                // hint: viewData['bungalow_basement'] != null
                                //     ? viewData['bungalow_basement']
                                //                 ['servent_quarter_location'] !=
                                //             null
                                //         ? Text(viewData['bungalow_basement']
                                //                 ['servent_quarter_location']
                                //             .toString())
                                //         : Text(serventLocation)
                                //     : Text(serventLocation),
                                // value: serventLocation,
                                hint: Text(serventLocation),
                                elevation: 16,
                                items: serventItems
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      serventLocation = it!;
                                      // if (viewData['bungalow_basement']
                                      //         ['servent_quarter_location'] !=
                                      //     null) {
                                      //   viewData['bungalow_basement']
                                      //           ['servent_quarter_location'] =
                                      //       serventLocation;
                                      // }
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("No Of Servent"),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.2,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                // hint: viewData['bungalow_basement'] != null
                                //     ? viewData['bungalow_basement']
                                //                 ['no_of_servent_quarter'] !=
                                //             null
                                //         ? Text(viewData['bungalow_basement']
                                //                 ['no_of_servent_quarter']
                                //             .toString())
                                //         : Text(selectedServent)
                                //     : Text(selectedServent),
                                hint: Text(selectedServent),
                                // value: selectedServent,
                                elevation: 16,
                                items: noOfServents
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      selectedServent = it!;
                                      // if (viewData['bungalow_basement']
                                      //         ['no_of_servent_quarter'] !=
                                      //     null) {
                                      //   viewData['bungalow_basement']
                                      //           ['no_of_servent_quarter'] =
                                      //       selectedServent;
                                      // }
                                    })),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Facilities"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Checkbox(
                        activeColor: checkColor,
                        checkColor: Colors.white,
                        value: serventFacility1,
                        onChanged: (value) => setState(
                          () {
                            serventFacility1 = value;
                          },
                        ),
                      ),
                      requirementText("One room + small kit + toilet")
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.14,
                      ),
                      SizedBox(
                        height: 20,
                        child: Checkbox(
                          activeColor: checkColor,
                          checkColor: Colors.white,
                          value: serventFacility2,
                          onChanged: (value) => setState(
                            () {
                              serventFacility2 = value;
                            },
                          ),
                        ),
                      ),
                      requirementText("One room + small kit + common toilet")
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Other Facilities"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,
                      //     "Other Requirement", serventSpecificController)

                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            // initialValue: viewData["bungalow_basement"]
                            //             ["servent_quarter_specific_req"] !=
                            //         null
                            //     ? viewData["bungalow_basement"]
                            //         ["servent_quarter_specific_req"]
                            //     : '',
                            initialValue: serventSpecificController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "specific requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              serventSpecificController = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Home Theater"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      // value: viewData["bungalow_basement"] !=
                                      //         null
                                      //     ? viewData["bungalow_basement"]
                                      //                 ["home_theater_req"] ==
                                      //             T_RUE
                                      //         ? true
                                      //         : HomeTheaterRequirement
                                      //     : HomeTheaterRequirement,
                                      value: HomeTheaterRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            // if (viewData["bungalow_basement"]
                                            //         ["home_theater_req"] !=
                                            //     null) {
                                            //   viewData["bungalow_basement"]
                                            //       ["home_theater_req"] = null;
                                            // }
                                            HomeTheaterRequirement = value;
                                            HomeTheaterNotRequired = false;
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      // value: viewData["bungalow_basement"] !=
                                      //         null
                                      //     ? viewData["bungalow_basement"]
                                      //                 ["home_theater_req"] ==
                                      //             F_ALSE
                                      //         ? true
                                      //         : HomeTheaterNotRequired
                                      //     : HomeTheaterNotRequired,
                                      value: HomeTheaterNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          HomeTheaterNotRequired = value;
                                          HomeTheaterRequirement = false;
                                          // if (viewData["bungalow_basement"]
                                          //         ["home_theater_req"] !=
                                          //     null) {
                                          //   viewData["bungalow_basement"]
                                          //       ["home_theater_req"] = null;
                                          // }
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (HomeTheaterRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "length", homeTheaterLengthController),

                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue: viewData["bungalow_basement"]
                                    //             ["home_theater_length"] !=
                                    //         null
                                    //     ? viewData["bungalow_basement"]
                                    //         ["home_theater_length"]
                                    //     : '',
                                    initialValue:
                                        homeTheaterLengthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "length",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      homeTheaterLengthController = value != ''
                                          ? int.parse(value)
                                          : homeTheaterLengthController;
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Width")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "Width", homeTheaterWidthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue: viewData["bungalow_basement"]
                                    //             ["home_theater_width"] !=
                                    //         null
                                    //     ? viewData["bungalow_basement"]
                                    //         ["home_theater_width"]
                                    //     : ''
                                    initialValue:
                                        homeTheaterWidthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "width",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      homeTheaterWidthController = value != ''
                                          ? int.parse(value)
                                          : homeTheaterWidthController;
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  size: height * 0.03,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("floor"),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.6,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                // hint: viewData["bungalow_basement"] != null
                                //     ? viewData["bungalow_basement"]
                                //                 ["home_theater_location"] !=
                                //             null
                                //         ? Text(viewData["bungalow_basement"]
                                //                 ["home_theater_location"]
                                //             .toString())
                                //         : Text(homeTheaterFloor)
                                //     : Text(homeTheaterFloor),
                                hint: Text(homeTheaterFloor),
                                // value: homeTheaterFloor
                                elevation: 16,
                                items: homeTheaterFloorItems
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      homeTheaterFloor = it!;
                                      // viewData["bungalow_basement"]
                                      //         ["home_theater_location"] =
                                      //     homeTheaterFloor;
                                    })),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      requirementText("Seats"),
                      // DropDown(
                      //   width,
                      //   height,
                      //   seatsItems,
                      //   selectedSeats,
                      //   0.2,
                      //   0.03,
                      // ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.2,
                          margin: const EdgeInsets.all(3),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward),
                              ),
                              // hint: viewData["bungalow_basement"] != null
                              //     ? viewData["bungalow_basement"]
                              //                 ["home_theater_seats"] !=
                              //             null
                              //         ? Text(viewData["bungalow_basement"]
                              //                 ["home_theater_seats"]
                              //             .toString())
                              //         : Text(selectedSeats)
                              //     : Text(selectedSeats),
                              // value: selectedSeats,
                              hint: Text(selectedSeats),
                              elevation: 16,
                              items: seatsItems
                                  .map((it) => DropdownMenuItem<String>(
                                      value: it,
                                      child: Text(
                                        it,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      )))
                                  .toList(),
                              onChanged: (it) => setState(() {
                                selectedSeats = it!;
                                // if (viewData["bungalow_basement"] != null
                                //     ? viewData["bungalow_basement"]
                                //             ["home_theater_seats"] !=
                                //         null
                                //     : false) {
                                //   viewData["bungalow_basement"]
                                //       ["home_theater_seats"] = selectedSeats;
                                // }
                              }),
                            ),
                          ),
                        ),
                      ),
                      if (selectedSeats == MORE) ...[
                        requirementTextField(height, width, 0.04, 0.2, "more")
                      ]
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Special Requiremnt"),
                      SizedBox(
                        width: width * 0.01,
                      ),

                      // requirementTextFieldCont(
                      //   height,
                      //   width,
                      //   0.04,
                      //   0.5,
                      //   "Special Requirement",
                      //   homeTheaterSpecificController,
                      // ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            // initialValue: viewData["bungalow_basement"] != null
                            //     ? viewData["bungalow_basement"]
                            //             ["home_theater_specific_req"] ??
                            //         ''
                            //     : '',
                            initialValue: homeTheaterSpecificController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Special Requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              homeTheaterSpecificController = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Additional Parking Garage"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,

                                      // value: viewData["bungalow_basement"] !=
                                      //         null
                                      //     ? viewData["bungalow_basement"]
                                      //                 ["parking_garage_req"] ==
                                      //             T_RUE
                                      //         ? true
                                      //         : AdditionalRequirement
                                      //     : AdditionalRequirement,

                                      value: AdditionalRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            // if (viewData["bungalow_basement"] !=
                                            //     null) {
                                            //   viewData["bungalow_basement"]
                                            //       ["parking_garage_req"] = null;
                                            // }
                                            AdditionalRequirement = value;
                                            AdditionalNotRequired = false;
                                            // print(AdditionalRequirement);
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: AdditionalNotRequired,
                                    // value: AdditionalNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        AdditionalNotRequired = value;
                                        AdditionalRequirement = false;
                                        // print(AdditionalRequirement);
                                        // if (viewData["bungalow_basement"] !=
                                        //     null) {
                                        //   viewData["bungalow_basement"]
                                        //       ["parking_garage_req"] = null;
                                        // }
                                      });
                                    },
                                  ),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (
                //   AdditionalRequirement == true
                // ||
                AdditionalRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            // requirementTextFieldCont(height, width, 0.04,
                            //     0.15, "length", additionalParkingLength),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width * 0.15,
                                child: TextFormField(
                                  // initialValue: viewData["bungalow_basement"]
                                  //             ["parking_garage_length"] !=
                                  //         null
                                  //     ? viewData["bungalow_basement"]
                                  //         ["parking_garage_length"]
                                  //     : '',
                                  initialValue:
                                      additionalParkingLength.toString(),
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                      hintText: "Length",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8)),
                                  onChanged: (value) {
                                    additionalParkingLength = value != ''
                                        ? int.parse(value)
                                        : additionalParkingLength;

                                    // additionalParkingLength =
                                    //     int.parse(value.toString());
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width"),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            // requirementTextFieldCont(height, width, 0.04,
                            //     0.15, "Width", additionalParkingWidth),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width * 0.15,
                                child: TextFormField(
                                  // initialValue: viewData["bungalow_basement"]
                                  //             ["parking_garage_width"] !=
                                  //         null
                                  //     ? viewData["bungalow_basement"]
                                  //         ["parking_garage_width"]
                                  //     : '',
                                  initialValue:
                                      additionalParkingWidth.toString(),
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                      hintText: "Length",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8)),
                                  onChanged: (value) {
                                    additionalParkingWidth = value != ''
                                        ? int.parse(value)
                                        : additionalParkingWidth;
                                    // additionalParkingWidth =
                                    //     int.parse(value.toString());
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  size: height * 0.03,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Cars"),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      // requirementTextFieldCont(height, width, .04, .5,
                      //     "no. of cars", additionalCarsController)
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            initialValue: additionalCarsController.toString(),
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "no. of cars",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              additionalCarsController = value != ''
                                  ? int.parse(value)
                                  : additionalCarsController;

                              // additionalCarsController =
                              //     int.parse(value.toString());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("location"),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      // DropDown(
                      //   width,
                      //   height,
                      //   parkingLocation,
                      //   selectedParkingLocation,
                      //   0.5,
                      //   0.03,
                      // ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.55,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                // value: selectedParkingLocation,
                                elevation: 16,
                                // hint: viewData['bungalow_basement'] != null
                                //     ? viewData['bungalow_basement']
                                //                 ['parking_garage_location'] !=
                                //             null
                                //         ? Text(viewData['bungalow_basement']
                                //             ['parking_garage_location'])
                                //         : Text(selectedParkingLocation)
                                //     : Text(selectedParkingLocation),
                                hint: Text(selectedParkingLocation),
                                items: parkingLocation
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      selectedParkingLocation = it!;
                                      // if (viewData['bungalow_basement'] != null
                                      //     ? viewData['bungalow_basement']
                                      //             ['parking_garage_location'] !=
                                      //         null
                                      //     : false) {
                                      //   viewData['bungalow_basement']
                                      //       ['parking_garage_location'] = null;
                                      // }
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("seprated Shade"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,
                      //     "Special Requirement", sepratedShadeController),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            // initialValue: viewData["bungalow_basement"]
                            //             ["saperate_shade"] !=
                            //         null
                            //     ? viewData["bungalow_basement"]
                            //         ["saperate_shade"]
                            //     : '',
                            initialValue: sepratedShadeController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Special Requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              sepratedShadeController = value.toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Special Requiremnt"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(
                      //     height,
                      //     width,
                      //     0.04,
                      //     0.5,
                      //     "Special Requirement",
                      //     additionalParkingSpecificController),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            // initialValue: viewData["bungalow_basement"]
                            //             ["parking_garage_specific_req"] !=
                            //         null
                            //     ? viewData["bungalow_basement"]
                            //         ["parking_garage_specific_req"]
                            //     : '',
                            initialValue: additionalParkingSpecificController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Special Requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              additionalParkingSpecificController =
                                  value.toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Indoor play area"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: indoorRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            // if (viewData['bungalow_basement'] !=
                                            //     null) {
                                            //   viewData['bungalow_basement']
                                            //           ['indoor_play_req'] ==
                                            //       INT_THREE;
                                            // }
                                            indoorRequirement = value;
                                            indoorNotRequired = false;
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: indoorNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          indoorNotRequired = value;
                                          indoorRequirement = false;
                                          // if (viewData['bungalow_basement'] !=
                                          //     null) {
                                          //   viewData['bungalow_basement']
                                          //       ['indoor_play_req'] = INT_THREE;
                                          // }
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                if (indoorRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "length", indoorPlayLengthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    initialValue:
                                        indoorPlayLengthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "Length",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      indoorPlayLengthController = value != ''
                                          ? int.parse(value)
                                          : indoorPlayLengthController;

                                      // indoorPlayLengthController =
                                      //     int.parse(value.toString());
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Width")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,0.15, "Width", indoorPlayWidtController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    initialValue:
                                        indoorPlayWidtController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "Width",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      indoorPlayWidtController = value != ''
                                          ? int.parse(value)
                                          : indoorPlayWidtController;
                                      // indoorPlayWidtController =
                                      //     int.parse(value.toString());
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  size: height * 0.03,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Location"),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.55,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward),
                                ),
                                hint: Text(selectedIndoorLocation),
                                // value: selectedIndoorLocation,
                                elevation: 16,
                                items: itemsIndoorLocation
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      selectedIndoorLocation = it!;
                                      // if (viewData["bungalow_basement"] !=
                                      //     null) {
                                      //   viewData["bungalow_basement"]
                                      //           ["indoor_play_location"] =
                                      //       selectedIndoorLocation;
                                      // }
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Special Requirement"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,
                      //     "Special Requirement", indoorPlaySpecificRequirement)
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            initialValue:
                                indoorPlaySpecificRequirement.toString(),
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Special Requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              indoorPlaySpecificRequirement = value.toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Bar"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor:
                                          Color.fromRGBO(255, 255, 255, 1),
                                      value: barRequirement,
                                      // value: barRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            barRequirement = value;
                                            barNotRequired = false;
                                            // if (viewData['bungalow_basement'] !=
                                            //     null) {
                                            //   viewData['bungalow_basement']
                                            //       ['bar_req'] = null;
                                            // }
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: barNotRequired,
                                      // value: barNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          // if (viewData['bungalow_basement'] !=
                                          //     null) {
                                          //   viewData['bungalow_basement']
                                          //       ['bar_req'] = null;
                                          // }
                                          barNotRequired = value;
                                          barRequirement = false;
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (barRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "length", barLengthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue: viewData["bungalow_basement"]
                                    //             ["bar_length"] !=
                                    //         null
                                    //     ? viewData["bungalow_basement"]
                                    //         ["bar_length"]
                                    //     : '',
                                    initialValue:
                                        barLengthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "Length",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      barLengthController = value != ''
                                          ? int.parse(value)
                                          : barLengthController;

                                      // barLengthController =
                                      //     int.parse(value.toString());
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Width")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "Width", barWidthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue:
                                    //     viewData["bungalow_basement"] != null
                                    //         ? viewData["bungalow_basement"]
                                    //                     ["bar_width"] !=
                                    //                 null
                                    //             ? viewData["bungalow_basement"]
                                    //                 ["bar_width"]
                                    //             : ''
                                    //         : '',
                                    initialValue: barWidthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "width",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      barWidthController = value != ''
                                          ? int.parse(value)
                                          : barWidthController;

                                      // barWidthController =
                                      //     int.parse(value.toString());
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  size: height * 0.03,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Location"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.55,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                // hint: viewData["bungalow_basement"] != null
                                //     ? viewData["bungalow_basement"]
                                //                 ["bar_location"] !=
                                //             null
                                //         ? Text(viewData["bungalow_basement"]
                                //             ["bar_location"])
                                //         : Text(selectedBarLocation)
                                //     : Text(selectedBarLocation),
                                hint: Text(selectedBarLocation),
                                elevation: 16,
                                items: itemsBarLocation
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) =>
                                    setState(() => selectedBarLocation = it!)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  requirementText(
                    "Bar Facility",
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(5),
                            elevation: 5,
                            child: Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: height * 0.04,
                                    child: Checkbox(
                                        activeColor: checkColor,
                                        checkColor: Colors.white,
                                        // value:
                                        //     barFaci != [] && barFaci.length > 0
                                        //         ? barFaci[0] == STR_ONE
                                        //             ? true
                                        //             : barFacility1
                                        //         : barFacility1,
                                        value: barFacility1,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              barFacility1 = value;
                                              // if (barFaci != [] &&
                                              //     barFaci.isEmpty) {
                                              //   barFaci[0] = STR_THREE;
                                              // }
                                            },
                                          );
                                        }),
                                  ),
                                  requirementText("With bar room")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(5),
                            elevation: 5,
                            child: Container(
                              padding: const EdgeInsets.only(right: 1),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: height * 0.04,
                                    width: width * 0.03,
                                    child: Checkbox(
                                        activeColor: checkColor,
                                        checkColor: Colors.white,
                                        // value: barFaci != [] && barFaci.isEmpty
                                        //     ? barFaci[1] == STR_TWO
                                        //         ? true
                                        //         : barFacility2
                                        //     : barFacility2,
                                        value: barFacility2,
                                        onChanged: (value) {
                                          setState(() {
                                            barFacility2 = value;
                                            // if (barFaci != null &&
                                            //     barFaci.isEmpty) {
                                            //   barFaci[1] = STR_THREE;
                                            // }
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  requirementText("With bar counter and lobby"),
                                  SizedBox(
                                    height: height * 0.01,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Special Requirement"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,
                      // "Special requirement", barSpecificRequiremrnt),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            initialValue: barSpecificRequiremrnt,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Special Requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              barSpecificRequiremrnt = value;

                              // barSpecificRequiremrnt =
                              //     int.parse(value.toString());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
                requirementText("Swimming pool"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: swimmingRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            swimmingRequirement = value;
                                            swimmingNotRequired = false;
                                            // if (viewData != null
                                            //     ? viewData['bungalow_basement']
                                            //             ["swimming_pool_req"] !=
                                            //         null
                                            //     : false) {
                                            //   viewData['bungalow_basement']
                                            //           ['swimming_pool_req'] =
                                            //       INT_THREE;
                                            // }
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: swimmingNotRequired,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            swimmingNotRequired = value;
                                            swimmingRequirement = false;
                                            // if (viewData != null
                                            //     ? viewData['bungalow_basement']
                                            //             ["swimming_pool_req"] !=
                                            //         null
                                            //     : false) {
                                            //   viewData['bungalow_basement']
                                            //           ['swimming_pool_req'] =
                                            //       INT_THREE;
                                            // }
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                if (swimmingRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            // requirementTextFieldCont(height, width, 0.04,
                            //     0.15, "length", swimmingPoolLengthController),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width * 0.15,
                                child: TextFormField(
                                  initialValue:
                                      swimmingPoolLengthController.toString(),
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                      hintText: "Length",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8)),
                                  onChanged: (value) {
                                    swimmingPoolLengthController = value != ''
                                        ? int.parse(value)
                                        : swimmingPoolLengthController;
                                    // swimmingPoolLengthController =
                                    //     int.parse(value.toString());
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        ),
                      ),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Width")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "Width", swimmingPoolWidthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    initialValue:
                                        swimmingPoolWidthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "Width",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      // swimmingPoolWidthController =
                                      //     int.parse(value.toString());
                                      swimmingPoolWidthController = value != ''
                                          ? int.parse(value)
                                          : swimmingPoolWidthController;
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  size: height * 0.03,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Location"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.55,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              hint: Text(swimmingLocation),
                              elevation: 16,
                              items: itemsSwimmingLocation
                                  .map((it) => DropdownMenuItem<String>(
                                      value: it,
                                      child: Text(
                                        it,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      )))
                                  .toList(),
                              onChanged: (it) => setState(
                                () {
                                  swimmingLocation = it!;
                                  // if (viewData != null
                                  //     ? viewData["bungalow_basement"]
                                  //                 ["swimming_pool_location"] !=
                                  //             null
                                  //         ? true
                                  //         : false
                                  //     : false) {
                                  //   viewData["bungalow_basement"]
                                  //           ["swimming_pool_location"] =
                                  //       swimmingLocation;
                                  // }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Special Requirement"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(
                      //     height,
                      //     width,
                      //     0.04,
                      //     0.5,
                      //     "Special Requirement",
                      //     swimmingPoolSpecificRequirement);

                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            initialValue: swimmingPoolSpecificRequirement,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Special Requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              swimmingPoolSpecificRequirement = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
                requirementText("Gym"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: gymRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            gymRequirement = value;
                                            gymNotRequired = false;
                                            // if (viewData != null
                                            //     ? viewData['bungalow_basement']
                                            //             ["gym_req"] !=
                                            //         null
                                            //     : false) {
                                            //   viewData['bungalow_basement']
                                            //       ['gym_req'] = INT_THREE;
                                            // }
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: gymNotRequired,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          gymNotRequired = value;
                                          gymRequirement = false;
                                          // if (viewData != null
                                          //     ? viewData['bungalow_basement']
                                          //             ["gym_req"] !=
                                          //         null
                                          //     : false) {
                                          //   viewData['bungalow_basement']
                                          //       ['gym_req'] = INT_THREE;
                                          // }
                                        },
                                      );
                                    },
                                  ),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                if (gymRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "length", gymLengthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue: viewData["bungalow_basement"]
                                    //             ["gym_length"] !=
                                    //         null
                                    //     ? viewData["bungalow_basement"]
                                    //         ["gym_length"]
                                    //     : '',
                                    initialValue:
                                        gymLengthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "Length",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      // gymLengthController =
                                      //     int.parse(value.toString());

                                      gymLengthController = value != ''
                                          ? int.parse(value)
                                          : gymLengthController;
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Width")),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            // requirementTextFieldCont(height, width, 0.04,
                            //     0.15, "Width", gymWidthController),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width * 0.15,
                                child: TextFormField(
                                  initialValue: gymWidthController.toString(),
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                      hintText: "Width",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8)),
                                  onChanged: (value) {
                                    // gymWidthController =
                                    //     int.parse(value.toString());

                                    gymWidthController = value != ''
                                        ? int.parse(value)
                                        : gymWidthController;
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  size: height * 0.03,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Location"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.55,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                hint: Text(gymLocation),
                                elevation: 16,
                                items: itemsGymLocation
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      gymLocation = it!;
                                      // if (viewData != null
                                      //     ? viewData["bungalow_basement"]
                                      //             ["gym_location"] !=
                                      //         null
                                      //     : false) {
                                      //   viewData["bungalow_basement"]
                                      //       ["gym_location"] = gymLocation;
                                      // }
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Special Requirement"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,
                      //     "Special Requirement ", gymSpecificRequirement)
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            // initialValue: viewData["bungalow_basement"]
                            //             ["gym_specific_req"] !=
                            //         null
                            //     ? viewData["bungalow_basement"]
                            //         ["gym_specific_req"]
                            //     : '',
                            initialValue: gymSpecificRequirement.toString(),
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "specific requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              // swimmingPoolLengthController =
                              //     int.parse(value.toString());

                              gymSpecificRequirement = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("spa"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: spaRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            spaRequirement = value;
                                            spaNotRequired = false;
                                            // if (viewData != null
                                            //     ? viewData['bungalow_basement']
                                            //             ["spa_req"] !=
                                            //         null
                                            //     : false) {
                                            //   viewData['bungalow_basement']
                                            //       ['spa_req'] = INT_THREE;
                                            // }
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: spaNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          spaNotRequired = value;
                                          spaRequirement = false;
                                          // if (viewData != null
                                          //     ? viewData['bungalow_basement']
                                          //             ["spa_req"] !=
                                          //         null
                                          //     : false) {
                                          //   viewData['bungalow_basement']
                                          //       ['spa_req'] = INT_THREE;
                                          // }
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                if (spaRequirement == true) ...[
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Length")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "length", spaLengthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue: viewData["bungalow_basement"]
                                    //             ["home_theater_specific_req"] !=
                                    //         null
                                    //     ? viewData["bungalow_basement"]
                                    //         ["home_theater_specific_req"]
                                    //     : '',
                                    initialValue:
                                        spaLengthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "Length",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      // spaLengthController =
                                      //     int.parse(value.toString());

                                      spaLengthController = value != ''
                                          ? int.parse(value)
                                          : spaLengthController;
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 15,
                          child: requirementText("Width")),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 30,
                          child: Row(
                            children: [
                              // requirementTextFieldCont(height, width, 0.04,
                              //     0.15, "Width", spaWidthController),
                              Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.15,
                                  child: TextFormField(
                                    // initialValue: viewData["bungalow_basement"]
                                    //             ["home_theater_specific_req"] !=
                                    //         null
                                    //     ? viewData["bungalow_basement"]
                                    //         ["home_theater_specific_req"]
                                    //     : '',
                                    initialValue: spaWidthController.toString(),
                                    style: const TextStyle(fontSize: 14),
                                    decoration: const InputDecoration(
                                        hintText: "Width",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8)),
                                    onChanged: (value) {
                                      // spaWidthController =
                                      //     int.parse(value.toString());

                                      spaWidthController = value != ''
                                          ? int.parse(value)
                                          : spaWidthController;
                                    },
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.04, 0.05),
                            ],
                          )),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 20,
                        child: Row(
                          children: [
                            requirementText("help"),
                            IconButton(
                              padding: const EdgeInsets.all(5),
                              constraints: const BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Location"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.55,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                hint: Text(spaLocation),
                                elevation: 16,
                                items: itemsSpaLocation
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      spaLocation = it!;
                                      // if (viewData != null
                                      //     ? viewData["bungalow_basement"]
                                      //             ["spa_location"] !=
                                      //         null
                                      //     : false) {
                                      //   viewData["bungalow_basement"]
                                      //       ["spa_location"] = spaLocation;
                                      // }
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Special Requirement"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,
                      //     "Special Requirement", spaSpecificReq)
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            // initialValue: viewData["bungalow_basement"]
                            //             ["spa_specific_req"] !=
                            //         null
                            //     ? viewData["bungalow_basement"]
                            //         ["spa_specific_req"]
                            //     : '',
                            initialValue: spaSpecificReq,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Special Requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              // spaLengthController = int.parse(value.toString());
                              spaSpecificReq =
                                  value != '' ? value : spaSpecificReq;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Garden"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: gardenRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            // if (viewData != null
                                            //     ? viewData['bungalow_basement']
                                            //             ["garden_req"] !=
                                            //         null
                                            //     : false) {
                                            //   viewData['bungalow_basement']
                                            //       ['garden_req'] = value;
                                            // }
                                            gardenRequirement = value;
                                            gardenNotRequired = false;
                                          },
                                        );
                                      }),
                                ),
                                requirementText("Required")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: gardenNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          // if (viewData != null
                                          //     ? viewData['bungalow_basement']
                                          //             ["garden_req"] !=
                                          //         null
                                          //     : false) {
                                          //   viewData['bungalow_basement']
                                          //       ['garden_req'] = INT_THREE;
                                          // }
                                          gardenNotRequired = value;
                                          gardenRequirement = false;
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (gardenRequirement == true) ...[
                  Row(
                    children: [
                      requirementText("Garden Type"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.55,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                hint: Text(gardenLocation),
                                // value: gardenLocation,
                                elevation: 16,
                                items: gardenItems
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) => setState(() {
                                      gardenLocation = it!;
                                      // if (viewData != null
                                      //     ? viewData["bungalow_basement"]
                                      //             ["garden_type"] !=
                                      //         null
                                      //     : false) {
                                      //   viewData["bungalow_basement"]
                                      //       ["garden_type"] = gardenLocation;
                                      // }
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText('Special Requirement'),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      // requirementTextFieldCont(height, width, .04, .5,
                      //     "Special requirement", gardenSpecificRequiremnt)
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.5,
                          child: TextFormField(
                            initialValue: gardenSpecificRequiremnt,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Special requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              gardenSpecificRequiremnt = value.toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Material(
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.white,
                      child: SizedBox(
                        width: width * 9,
                        height: height * 0.3,
                        child: FutureBuilder(
                          future: getRecent(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              return CarouselSlider.builder(
                                itemCount: bunglowPageRecentList.length,
                                itemBuilder: (context, i, id) {
                                  return Container(
                                    height: height * 0.4,
                                    width: width * 0.9,
                                    child: Image.network(
                                      imageUrl +
                                          bunglowPageRecentList[i]["img_path"],
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  viewportFraction: 1,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        if (BasementRequirement == true) {
                          basementReqInt = INT_ONE;
                        }
                        if (StiltRequirement == true) {
                          stilitReqInt = INT_ONE;
                        }
                        if (officeRequirement == true) {
                          officeReqInt = INT_ONE;

                          // for (int i = 0; i < otherFacilities.length; i++) {
                          //   if (otherFacilities[i] == BASE_PANTRY) {
                          //     officeFacility.add('1');
                          //   }
                          //   if (otherFacilities[i] == BASE_STAFF_TOILET) {
                          //     officeFacility.add('2');
                          //   }
                          //   if (otherFacilities[i] == BASE_TOILET) {
                          //     officeFacility.add('3');
                          //   }
                          // }
                        }
                        if (spaRequirement == true) {
                          spaRequiredInt = 1;
                          int area = spaLengthController * spaWidthController;
                          spArea = area.toString();
                        }
                        if (gymRequirement == true) {
                          gymReqInt = INT_ONE;
                        }
                        if (swimmingRequirement == true) {
                          swimmingReqInt = INT_ONE;
                        }
                        if (barRequirement == true) {
                          barReqInt = INT_ONE;

                          if (barFacility1 == true) {
                            barFacility.add(1);
                          }
                          if (barFacility2 == true) {
                            barFacility.add(2);
                          }
                          // print("barfacility-------------");
                          // print(barFacility);
                        }
                        if (indoorRequirement == true) {
                          indoorReqInt = INT_ONE;
                        }
                        if (HomeTheaterRequirement == true) {
                          homeReqInt = INT_ONE;
                        }
                        if (servantRequirement == true) {
                          servantReqInt = INT_ONE;
                          noServents = INT_ONE;
                          serventFacility = [];
                          if (serventFacility1 == true) {
                            if (!serventFacility.contains("1")) {
                              serventFacility.add("1");
                            }
                          }
                          if (serventFacility2 == true) {
                            if (!serventFacility.contains("2")) {
                              serventFacility.add("2");
                            }
                          }
                        }
                        if (AdditionalRequirement == true) {
                          additionalReqInt = INT_ONE;
                        }
                        if (gardenRequirement == true) {
                          gardenRequirementInt = INT_ONE;
                        }
                        // print(
                        //     "indoor play width controller ${indoorPlayWidtController}");
                        // print(
                        //     "bar  specific requirement ${barSpecificRequiremrnt}");
                        // print("bar  width requirement ${barWidthController}");
                        // print("bar  length controler ${barLengthController}");
                      });
                      print("serventFacility==");
                      print(serventFacility);
                      if (pageId != null) {
                        print('basementReqInt==');
                        print(basementReqInt);
                        var status = await BasementPut(
                          project_id,
                          basementReqInt,
                          slectedBasement,
                          stilitReqInt,
                          slectedstilt,
                          officeRequirement!,
                          officeLengthController,
                          officeWidthController,
                          selectedOfficeLocation,
                          otherFacilities,
                          officeSpecificReqController,
                          servantRequirement!,
                          serventLengthController,
                          serventWidthController,
                          serventSpecificController,
                          selectedServent,
                          serventFacility,
                          serventLocation,
                          serventSpecificController,
                          AdditionalRequirement!,
                          additionalParkingLength,
                          additionalParkingWidth,
                          additionalCarsController,
                          selectedParkingLocation,
                          sepratedShadeController,
                          additionalParkingSpecificController,
                          homeReqInt,
                          homeTheaterLengthController,
                          homeTheaterWidthController,
                          homeTheaterFloor,
                          selectedSeats,
                          homeTheaterSpecificController,
                          indoorRequirement!,
                          selectedIndoorLocation,
                          indoorPlayLengthController,
                          indoorPlayWidtController,
                          indoorPlaySpecificRequirement,
                          barReqInt,
                          selectedBarLocation,
                          barFacility,
                          barLengthController,
                          barWidthController,
                          barSpecificRequiremrnt,
                          swimmingReqInt,
                          swimmingLocation,
                          swimmingPoolLengthController,
                          swimmingPoolWidthController,
                          swimmingPoolSpecificRequirement,
                          gymRequirement!,
                          gymLocation,
                          gymLengthController,
                          gymWidthController,
                          gymSpecificRequirement,
                          spaRequiredInt,
                          spaLocation,
                          spaLengthController,
                          spaWidthController,
                          spaSpecificReq,
                          gardenRequirementInt,
                          gardenLocation,
                          gardenSpecificRequiremnt,
                        );
                        if (status == SUCCESS) {
                          showToast('Basement Requirement Updated !',
                              Colors.lightGreen, ToastGravity.TOP);
                        }
                      } else {
                        var status = await BasementPost(
                          project_id,
                          basementReqInt,
                          slectedBasement,
                          stilitReqInt,
                          slectedstilt,
                          officeReqInt,
                          officeLengthController,
                          officeWidthController,
                          selectedOfficeLocation,
                          otherFacilities,
                          officeSpecificReqController,
                          servantReqInt,
                          serventLengthController,
                          serventWidthController,
                          serventSpecificController,
                          selectedServent,
                          serventFacility,
                          serventLocation,
                          serventSpecificController,
                          additionalReqInt,
                          additionalParkingLength,
                          additionalParkingWidth,
                          additionalCarsController,
                          selectedParkingLocation,
                          sepratedShadeController,
                          additionalParkingSpecificController,
                          homeReqInt,
                          homeTheaterLengthController,
                          homeTheaterWidthController,
                          homeTheaterFloor,
                          selectedSeats,
                          homeTheaterSpecificController,
                          indoorReqInt,
                          selectedIndoorLocation,
                          indoorPlayLengthController,
                          indoorPlayWidtController,
                          indoorPlaySpecificRequirement,
                          barReqInt,
                          selectedBarLocation,
                          barFacility,
                          barLengthController,
                          barWidthController,
                          barSpecificRequiremrnt,
                          swimmingReqInt,
                          swimmingLocation,
                          swimmingPoolLengthController,
                          swimmingPoolWidthController,
                          swimmingPoolSpecificRequirement,
                          gymReqInt,
                          gymLocation,
                          gymLengthController,
                          gymWidthController,
                          gymSpecificRequirement,
                          spaRequiredInt,
                          spaLocation,
                          spaLengthController,
                          spaWidthController,
                          spaSpecificReq,
                          gardenRequirementInt,
                          gardenLocation,
                          gardenSpecificRequiremnt,
                        );
                        if (status == SUCCESS) {
                          showToast('Basement Requirement Submitted !',
                              Colors.lightGreen, ToastGravity.TOP);
                        }
                      }
                    },
                    child: Container(
                      height: height * 0.04,
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        "save and continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class MultiSelect extends StatefulWidget {
  List<String> items;

  MultiSelect({required this.items});
  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> selectedItems = [];

  void itemChanges(bool isSelected, String itemValue) {
    setState(() {
      if (isSelected) {
        selectedItems.add(itemValue);
      } else {
        selectedItems.remove(itemValue);
      }
    });
  }

  void cancel() {
    Navigator.pop(context);
  }

  void submit() {
    Navigator.pop(context, selectedItems);
  }

  void clear() {
    setState(() {
      selectedItems = [];
      Navigator.pop(context, selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("office facility"),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map(
                (item) => CheckboxListTile(
                  value: selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => itemChanges(isChecked!, item),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: clear,
          child: const Text('clear all'),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
