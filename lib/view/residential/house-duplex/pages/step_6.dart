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
import 'package:http/http.dart' as http;

import '../../../../const.dart';
import '../../../../controller/api_services.dart';
import '../../bunglow/basement.dart';

class Step_5 extends StatefulWidget {
  // static const namedRoute = "/Basement";
  @override
  State<Step_5> createState() => _Step_5State();
}

var id;

class _Step_5State extends State<Step_5> {
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
        "${dotenv.env['APP_URL']}edit-flat-house-basement/$project_id",
      ),
    );
    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode == SUCCESS) {
      setState(() {
        viewData = jsonResponse;
        print(viewData);
        if (viewData['status'] == SUCCESS) {
          pageId = viewData['flat_house_basement']['id'] != null
              ? viewData['flat_house_basement']['id'].toString()
              : pageId;

          BasementRequirement =
              viewData["flat_house_basement"]['basement_req'] == T_RUE
                  ? true
                  : false;
          BasementNotRequire =
              viewData["flat_house_basement"]['basement_req'] == F_ALSE
                  ? true
                  : false;

          slectedBasement =
              viewData["flat_house_basement"]['basement_type'] != null
                  ? viewData["flat_house_basement"]['basement_type'].toString()
                  : slectedBasement;

          StiltRequirement =
              viewData["flat_house_basement"]['stilt_req'] != null
                  ? viewData["flat_house_basement"]['stilt_req'] == T_RUE
                      ? true
                      : false
                  : false;
          StiltNotRequire = viewData["flat_house_basement"]['stilt_req'] != null
              ? viewData["flat_house_basement"]['stilt_req'] == F_ALSE
                  ? true
                  : false
              : false;
          slectedstilt = viewData["flat_house_basement"]['stilt_type'] != null
              ? viewData["flat_house_basement"]["stilt_type"].toString()
              : slectedstilt;
          officeRequirement =
              viewData["flat_house_basement"]['office_req'] == T_RUE
                  ? true
                  : false;
          officeNotRequire =
              viewData["flat_house_basement"]["office_req"] == F_ALSE
                  ? true
                  : false;
          selectedOfficeLocation =
              viewData["flat_house_basement"]['office_location'] != null
                  ? viewData["flat_house_basement"]['office_location']
                  : "ForParking";

          officeLengthController = viewData["flat_house_basement"]
                      ['office_length'] !=
                  null
              ? int.parse(
                  viewData["flat_house_basement"]['office_length'].toString())
              : INT_ZERO;

          officeWidthController = viewData["flat_house_basement"]
                      ['office_width'] !=
                  null
              ? int.parse(
                  viewData["flat_house_basement"]['office_width'].toString())
              : INT_ZERO;

          otherFacilities = viewData["flat_house_basement"] != null
              ? viewData["flat_house_basement"]['office_facility']
                  .toString()
                  .split(',')
              : [];

          // if (viewData["flat_house_basement"] != null
          //     ? viewData['flat_house_basement']['office_facility'] != null
          //     : officeFac != null) {
          //   for (int i = 0; i < officeFac.length; i++) {
          //     otherFacilities.add(otherItems[int.parse(officeFac[i])]);
          //     // print(otherItems[int.parse(officeFac[i])]);
          //   }
          // }

          barFaci = viewData["flat_house_basement"]["bar_facility"] != null
              ? viewData["flat_house_basement"]["bar_facility"]
                  .toString()
                  .split(',')
              : barFaci;

          barSpecificRequiremrnt =
              viewData["flat_house_basement"]["bar_specific_req"] != null
                  ? viewData["flat_house_basement"]["bar_specific_req"]
                  : barSpecificRequiremrnt;

          officeSpecificReqController =
              viewData["flat_house_basement"]['office_specific_req'] != null
                  ? viewData["flat_house_basement"]['office_specific_req']
                      .toString()
                  : '';

          servantRequirement =
              viewData["flat_house_basement"]['servent_quarter_req'] == STR_ONE
                  ? true
                  : false;
          print('servantRequirement---');
          print(servantRequirement);

          servantNotRequired =
              viewData["flat_house_basement"]['servent_quarter_req'] == STR_ZERO
                  ? true
                  : false;

          serventLengthController =
              viewData["flat_house_basement"]['servent_quarter_length'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['servent_quarter_width']
                      .toString())
                  : INT_ZERO;
          serventWidthController =
              viewData["flat_house_basement"]['servent_quarter_width'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['servent_quarter_width']
                      .toString())
                  : INT_ZERO;
          serventSpecificController = viewData["flat_house_basement"]
                      ['servent_quarter_specific_req'] !=
                  null
              ? viewData["flat_house_basement"]['servent_quarter_specific_req']
                  .toString()
              : '';
          selectedServent =
              viewData["flat_house_basement"]['no_of_servent_quarter'] != null
                  ? viewData["flat_house_basement"]['no_of_servent_quarter']
                      .toString()
                  : '';
          serventLocation = viewData["flat_house_basement"]
                      ['servent_quarter_location'] !=
                  null
              ? viewData["flat_house_basement"]['servent_quarter_location']
                  .toString()
              : '';
          serventFacility = viewData["flat_house_basement"]
                      ['servent_quarter_facility'] !=
                  null
              ? viewData["flat_house_basement"]['servent_quarter_facility']
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
              viewData["flat_house_basement"]['home_theater_req'] == T_RUE
                  ? true
                  : false;
          HomeTheaterNotRequired =
              viewData["flat_house_basement"]['home_theater_req'] == F_ALSE
                  ? true
                  : false;
          homeTheaterLengthController =
              viewData["flat_house_basement"]['servent_quarter_length'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['servent_quarter_length']
                      .toString())
                  : INT_ZERO;
          homeTheaterWidthController =
              viewData["flat_house_basement"]['home_theater_width'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['home_theater_width']
                      .toString())
                  : INT_ZERO;
          homeTheaterFloor =
              viewData["flat_house_basement"]['home_theater_location'] != null
                  ? viewData["flat_house_basement"]['home_theater_location']
                      .toString()
                  : homeTheaterFloor;
          homeTheaterSpecificController = viewData["flat_house_basement"]
                      ['home_theater_specific_req'] !=
                  null
              ? viewData["flat_house_basement"]['home_theater_specific_req']
                  .toString()
              : '';

          selectedSeats = viewData["flat_house_basement"]
                      ['home_theater_seats'] !=
                  null
              ? viewData["flat_house_basement"]['home_theater_seats'].toString()
              : '';

          AdditionalRequirement =
              viewData["flat_house_basement"]['parking_garage_req'] == T_RUE
                  ? true
                  : false;

          AdditionalNotRequired =
              viewData["flat_house_basement"]['parking_garage_req'] == F_ALSE
                  ? true
                  : false;

          additionalParkingLength =
              viewData["flat_house_basement"]['parking_garage_length'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['parking_garage_length']
                      .toString())
                  : INT_ZERO;
          additionalParkingWidth =
              viewData["flat_house_basement"]['parking_garage_width'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['parking_garage_width']
                      .toString())
                  : INT_ZERO;
          additionalCarsController =
              viewData["flat_house_basement"]['no_of_cars'] != null
                  ? int.parse(
                      viewData["flat_house_basement"]['no_of_cars'].toString())
                  : INT_ZERO;

          sepratedShadeController =
              viewData["flat_house_basement"]['saperate_shade'] != null
                  ? viewData["flat_house_basement"]['saperate_shade'].toString()
                  : '';
          selectedParkingLocation =
              viewData["flat_house_basement"]['parking_garage_location'] != null
                  ? viewData["flat_house_basement"]['parking_garage_location']
                      .toString()
                  : selectedParkingLocation;
          additionalParkingSpecificController = viewData["flat_house_basement"]
                      ['parking_garage_specific_req'] !=
                  null
              ? viewData["flat_house_basement"]['parking_garage_specific_req']
              : additionalParkingSpecificController;

          indoorRequirement =
              viewData["flat_house_basement"]['indoor_play_req'] == T_RUE
                  ? true
                  : false;
          indoorNotRequired =
              viewData["flat_house_basement"]['indoor_play_req'] == F_ALSE
                  ? true
                  : false;

          indoorPlayLengthController =
              viewData["flat_house_basement"]['indoor_play_length'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['indoor_play_length']
                      .toString())
                  : INT_ZERO;
          indoorPlayWidtController =
              viewData["flat_house_basement"]['indoor_play_width'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['indoor_play_width']
                      .toString())
                  : INT_ZERO;
          selectedIndoorLocation =
              viewData["flat_house_basement"]['indoor_play_location'] != null
                  ? viewData["flat_house_basement"]['indoor_play_location']
                      .toString()
                  : selectedIndoorLocation;

          barRequirement = viewData["flat_house_basement"]['bar_req'] == T_RUE
              ? true
              : false;

          barNotRequired = viewData["flat_house_basement"]['bar_req'] == F_ALSE
              ? true
              : false;

          barLengthController =
              viewData["flat_house_basement"]['bar_length'] != null
                  ? int.parse(
                      viewData["flat_house_basement"]['bar_length'].toString())
                  : INT_ZERO;
          barWidthController =
              viewData["flat_house_basement"]['bar_width'] != null
                  ? int.parse(
                      viewData["flat_house_basement"]['bar_width'].toString())
                  : INT_ZERO;
          selectedBarLocation =
              viewData["flat_house_basement"]['bar_location'] != null
                  ? viewData["flat_house_basement"]['bar_location'].toString()
                  : selectedBarLocation;
          // barFacility = viewData["flat_house_basement"]["bar_facility"] != null
          //     ? viewData["flat_house_basement"]["bar_facility"]
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
              viewData["flat_house_basement"]['swimming_pool_req'] == T_RUE
                  ? true
                  : false;
          swimmingNotRequired =
              viewData["flat_house_basement"]['swimming_pool_req'] == F_ALSE
                  ? true
                  : false;

          swimmingPoolLengthController =
              viewData["flat_house_basement"]['swimming_pool_length'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['swimming_pool_length']
                      .toString())
                  : INT_ZERO;

          swimmingPoolWidthController =
              viewData["flat_house_basement"]['swimming_pool_width'] != null
                  ? int.parse(viewData["flat_house_basement"]
                          ['swimming_pool_width']
                      .toString())
                  : INT_ZERO;

          swimmingLocation =
              viewData["flat_house_basement"]['swimming_pool_location'] != null
                  ? viewData["flat_house_basement"]['swimming_pool_location']
                      .toString()
                  : swimmingLocation;
          swimmingPoolSpecificRequirement =
              viewData["flat_house_basement"]['swimming_pool_location'] != null
                  ? viewData["flat_house_basement"]['swimming_pool_location']
                      .toString()
                  : swimmingPoolSpecificRequirement;
          gymRequirement = viewData["flat_house_basement"]['gym_req'] == T_RUE
              ? true
              : false;

          gymNotRequired = viewData["flat_house_basement"]['gym_req'] == F_ALSE
              ? true
              : false;

          gymLengthController =
              viewData["flat_house_basement"]['gym_length'] != null
                  ? int.parse(
                      viewData["flat_house_basement"]['gym_length'].toString())
                  : INT_ZERO;

          gymWidthController =
              viewData["flat_house_basement"]['gym_width'] != null
                  ? int.parse(
                      viewData["flat_house_basement"]['gym_width'].toString())
                  : INT_ZERO;
          gymLocation = viewData["flat_house_basement"]['gym_location'] != null
              ? viewData["flat_house_basement"]['gym_location'].toString()
              : gymLocation;
          gymSpecificRequirement = viewData["flat_house_basement"]
                      ['gym_specific_req'] !=
                  null
              ? viewData["flat_house_basement"]['gym_specific_req'].toString()
              : gymSpecificRequirement;
          spaRequirement = viewData["flat_house_basement"]['spa_req'] == T_RUE
              ? true
              : false;

          spaNotRequired = viewData["flat_house_basement"]['spa_req'] == F_ALSE
              ? true
              : false;

          spaLengthController =
              viewData["flat_house_basement"]['spa_length'] != null
                  ? int.parse(
                      viewData["flat_house_basement"]['spa_length'].toString())
                  : INT_ZERO;
          spaWidthController =
              viewData["flat_house_basement"]['spa_width'] != null
                  ? int.parse(
                      viewData["flat_house_basement"]['spa_width'].toString())
                  : INT_ZERO;
          spaLocation = viewData["flat_house_basement"]['spa_location'] != null
              ? viewData["flat_house_basement"]['spa_location'].toString()
              : spaLocation;
          spaSpecificReq = viewData["flat_house_basement"]
                      ['spa_specific_req'] !=
                  null
              ? viewData["flat_house_basement"]['spa_specific_req'].toString()
              : spaSpecificReq;
          gardenRequirement =
              viewData["flat_house_basement"]['garden_req'] == T_RUE
                  ? true
                  : false;

          gardenLocation =
              viewData["flat_house_basement"]['garden_type'] != null
                  ? viewData["flat_house_basement"]['garden_type'].toString()
                  : gardenLocation;
          gardenSpecificRequiremnt =
              viewData["flat_house_basement"]['garden_specific_req'] != null
                  ? viewData["flat_house_basement"]['garden_specific_req']
                      .toString()
                  : gardenSpecificRequiremnt;
          gardenNotRequired =
              viewData["flat_house_basement"]['garden_req'] == F_ALSE
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
                              // hint: viewData["flat_house_basement"] != null
                              //     ? viewData["flat_house_basement"]
                              //                 ["stilt_type"] !=
                              //             null
                              //         ? Text(stiltList[int.parse(
                              //             viewData["flat_house_basement"]
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
                ],
                requirementText("Amenities"),
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
                                    // initialValue: viewData["flat_house_basement"]
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
                                      // if (viewData['flat_house_basement'] != null
                                      //     ? viewData['flat_house_basement']
                                      //             ['office_length'] !=
                                      //         null
                                      //     : false) {
                                      //   viewData['flat_house_basement']
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
                                    // initialValue: viewData["flat_house_basement"]
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

                                      // if (viewData['flat_house_basement'] != null
                                      //     ? viewData['flat_house_basement']
                                      //             ['office_width'] !=
                                      //         null
                                      //     : false) {
                                      //   viewData['flat_house_basement']
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
                                // hint: viewData['flat_house_basement']
                                //             ["office_location"] !=
                                //         null
                                //     ? Text(viewData['flat_house_basement']
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
                                      // if (viewData['flat_house_basement']
                                      //         ["office_location"] !=
                                      //     null) {
                                      //   viewData['flat_house_basement']
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
                            // initialValue: viewData["flat_house_basement"]
                            //             ["office_specific_req"] !=
                            //         null
                            //     ? viewData["flat_house_basement"]
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
                              // if (viewData['flat_house_basement']
                              //         ["office_specific_req"] !=
                              //     null) {
                              //   viewData['flat_house_basement']
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

                                      // value: viewData["flat_house_basement"] !=
                                      //         null
                                      //     ? viewData["flat_house_basement"]
                                      //                 ["parking_garage_req"] ==
                                      //             T_RUE
                                      //         ? true
                                      //         : AdditionalRequirement
                                      //     : AdditionalRequirement,

                                      value: AdditionalRequirement,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            // if (viewData["flat_house_basement"] !=
                                            //     null) {
                                            //   viewData["flat_house_basement"]
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
                                        // if (viewData["flat_house_basement"] !=
                                        //     null) {
                                        //   viewData["flat_house_basement"]
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
                                  // initialValue: viewData["flat_house_basement"]
                                  //             ["parking_garage_length"] !=
                                  //         null
                                  //     ? viewData["flat_house_basement"]
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
                                  // initialValue: viewData["flat_house_basement"]
                                  //             ["parking_garage_width"] !=
                                  //         null
                                  //     ? viewData["flat_house_basement"]
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
                                // hint: viewData['flat_house_basement'] != null
                                //     ? viewData['flat_house_basement']
                                //                 ['parking_garage_location'] !=
                                //             null
                                //         ? Text(viewData['flat_house_basement']
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
                                      // if (viewData['flat_house_basement'] != null
                                      //     ? viewData['flat_house_basement']
                                      //             ['parking_garage_location'] !=
                                      //         null
                                      //     : false) {
                                      //   viewData['flat_house_basement']
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
                            // initialValue: viewData["flat_house_basement"]
                            //             ["saperate_shade"] !=
                            //         null
                            //     ? viewData["flat_house_basement"]
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
                            // initialValue: viewData["flat_house_basement"]
                            //             ["parking_garage_specific_req"] !=
                            //         null
                            //     ? viewData["flat_house_basement"]
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
                        print('data is updating');
                        var status = await BasementHousePut(
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
                          additionalReqInt,
                          additionalParkingLength,
                          additionalParkingWidth,
                          additionalCarsController,
                          selectedParkingLocation,
                          sepratedShadeController,
                          additionalParkingSpecificController,
                        );
                        if (status == SUCCESS) {
                          showToast('Basement Requirement Updated !',
                              Colors.lightGreen, ToastGravity.TOP);
                        }
                      } else {
                        print('data is posting');
                        var status = await BasementHousePost(
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
                          additionalReqInt,
                          additionalParkingLength,
                          additionalParkingWidth,
                          additionalCarsController,
                          selectedParkingLocation,
                          sepratedShadeController,
                          additionalParkingSpecificController,
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
