// ignore_for_file: camel_case_types, use_key_in_widget_constructors, unnecessary_null_comparison, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_catches, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_if_null_operators, unused_local_variable, unrelated_type_equality_checks

import 'dart:convert';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../components/forms.dart';
import '../../../../components/constant.dart';
import '../../../../const.dart';
import '../../../../controller/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Step_3 extends StatefulWidget {
  static const namedRoute = "/LivingHall";

  @override
  State<Step_3> createState() => _Step_3State();
}

class _Step_3State extends State<Step_3> {
  List<String> otherFeatures = [];
  List livingHall = [];

  void multiSelected() async {
    final List<String> otherItems = ["Double Height", "Powder Toilet"];

    final List<String> result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: otherItems);
        });

    if (result != null) {
      setState(
        () {
          otherFeatures = result;
        },
      );
    }
  }

  List<String> floorItems = [
    "Select",
    "Ground floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String selectedFloor = "Select";

  String selectedDiningFloor = "Select";
  int DiningFloorInt = 0;
  List<String> DiningFloor = [
    "Select",
    "Ground floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String selectedDiningSeats = "Select";
  int DiningSeatsInt = 0;
  List<String> DiningSeatsItems = [
    "Select dining seats",
    "6",
    "8",
  ];

  int livingHallLocation = 1;
  String livingHallArea = "";
  String drawingHallLengthController = "";
  String drawingHallWidthController = "";
  String drawingSpecialFeaturesController = "";
  String livingSpecialFeaturesController = "";
  String LivingHallWidthController = "";
  String LivingHallLengthController = "";
  String diningSpecialFeaturesController = "";
  String diningHallWidthController = "";
  String diningHallLengthController = "";
  String KitchenLengthController = "";
  String attachedLengthController = "";
  String kitchenWidthController = "";
  String attachedWidthController = "";
  String utilityLengthController = "";
  String utilityWidthController = "";
  String specificReq = "";
  String otherDrawingHallLocationController = " ";
  String ohterLivingHallController = " ";

  List<String> kitchenItems = [
    "Select",
    "Ground floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];
  String selectedKitchen = "Select";
  String kitchenArea = "";
  String KitchenFloor = "1";

  // List<String> drawingHallItems = [
  //   "Select",
  //   "Ground floor",
  //   "1st Floor ",
  //   "2nd Floor",
  //   "3rd Floor",
  //   "other"
  // ];

  String selecteDrawingHall = "Select";

  int drawingHallLocation = 0;

  String DrawingSelected = "Select";

  List<String> DrawingItems = [
    "Select",
    "Ground floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  List<String> kitchenFunctionItems = [
    "Selecting dining function",
    "full open to dining ",
    "partial open to dining",
    "open with a reasonable opening",
    "open with a door",
  ];
  String selectedKitchenFunction = "Selecting dining function";
  String kitchenDiningFunction = "1";

  List<String> selectedItem = [" ", "Double height", "powder toilet"];

  String selectedFeatures = " ";

  List kitchenFeatures = [];

  bool? attachedStore = false;
  String attachStoreArea = "";

  bool? utilityWash = false;
  String utilityWashArea = "";

  bool? washArea = false;
  bool? breakFast = false;
  bool? centralIsland = false;
  bool? livingRequired = false;
  bool? livingNotRequired = false;
  int livingHallInt = 0;
  bool? drawingHallRequired = false;
  bool? drawingHallNotRequired = false;
  int drawingInt = 0;
  String drawingArea = "0";

  var project_id;
  var printData;
  var pageId;

  Future<dynamic> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    project_id = prefs.getInt('projectId')!;

    getData(project_id);
    var decJson;
    if (userData != null) {
      decJson = jsonDecode(userData);
    }
    // user_id = decJson['data']['id'];
  }

  Future<void> getData(int project_id) async {
    try {
      var response = await http.get(Uri.parse(
          "${dotenv.env['APP_URL']}edit-flat-house-drawing-hall/$project_id"));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        setState(() {
          printData = jsonResponse;
          print("printData === ");
          print(printData);
          if (printData != null) {
            pageId = printData['flat_house_drawing_hall']['id'] != null
                ? int.parse(
                    printData['flat_house_drawing_hall']['id'].toString(),
                  )
                : INT_ZERO;

            livingRequired =
                printData['flat_house_drawing_hall']['drawing_hall_req'] != null
                    ? printData['flat_house_drawing_hall']
                            ['drawing_hall_req'] ==
                        T_RUE
                    : false;

            livingNotRequired =
                printData['flat_house_drawing_hall']['drawing_hall_req'] != null
                    ? printData['flat_house_drawing_hall']
                            ['drawing_hall_req'] ==
                        F_ALSE
                    : false;
            drawingHallRequired =
                printData["flat_house_drawing_hall"]["living_hall_req"] != null
                    ? printData["flat_house_drawing_hall"]["living_hall_req"] ==
                        T_RUE
                    : false;
            drawingHallNotRequired =
                printData["flat_house_drawing_hall"]["living_hall_req"] != null
                    ? printData["flat_house_drawing_hall"]["living_hall_req"] ==
                        F_ALSE
                    : false;

            selectedKitchen =
                printData["flat_house_drawing_hall"]["kitchen_floor"] != null
                    ? kitchenItems[int.parse(
                        printData["flat_house_drawing_hall"]["kitchen_floor"]
                            .toString())]
                    : selectedKitchen;

            KitchenFloor =
                printData["flat_house_drawing_hall"]["kitchen_floor"] != null
                    ? printData["flat_house_drawing_hall"]["kitchen_floor"]
                        .toString()
                    : KitchenFloor;

            // print("kitchen   ${selectedKitchen}");

            selectedKitchenFunction = printData['flat_house_drawing_hall']
                        ['kitchen_dining_function'] !=
                    null
                ? kitchenFunctionItems[int.parse(
                    printData['flat_house_drawing_hall']
                            ['kitchen_dining_function']
                        .toString())]
                : selectedKitchenFunction;

            // selectedRefrigerator = printData['flat_house_drawing_hall']
            //             ['refrigerator_size'] !=
            //         null
            //     ? refrigeratorItems[printData['flat_house_drawing_hall']
            //         ['refrigerator_size']]
            //     : selectedRefrigerator;
            selectedFloor = printData["flat_house_drawing_hall"]
                        ["living_hall_location"] !=
                    null
                ? floorItems[printData["flat_house_drawing_hall"]
                    ["living_hall_location"]]
                : selectedFloor;
            DrawingSelected = printData["flat_house_drawing_hall"]
                        ["drawing_hall_location"] !=
                    null
                ? DrawingItems[int.parse(printData["flat_house_drawing_hall"]
                        ["drawing_hall_location"]
                    .toString())]
                : DrawingSelected;

            LivingHallLengthController = printData['flat_house_drawing_hall']
                        ['living_hall_length'] !=
                    null
                ? printData['flat_house_drawing_hall']['living_hall_length']
                    .toString()
                : LivingHallLengthController;

            LivingHallWidthController = printData['flat_house_drawing_hall']
                        ['living_hall_width'] !=
                    null
                ? printData['flat_house_drawing_hall']['living_hall_width']
                : LivingHallWidthController;

            livingSpecialFeaturesController = printData != null &&
                    printData['flat_house_drawing_hall']['drawing_hall_text'] !=
                        null
                ? printData['flat_house_drawing_hall']['drawing_hall_text']
                : livingSpecialFeaturesController;

            drawingHallLengthController = printData['flat_house_drawing_hall']
                        ['drawing_hall_length'] !=
                    null
                ? printData['flat_house_drawing_hall']['drawing_hall_length']
                    .toString()
                : drawingHallLengthController;

            drawingHallWidthController = printData['flat_house_drawing_hall']
                        ['drawing_hall_width'] !=
                    null
                ? printData['flat_house_drawing_hall']['drawing_hall_width']
                : drawingHallWidthController;
            drawingHallLocation = printData['flat_house_drawing_hall']
                        ['drawing_hall_location'] !=
                    null
                ? printData['flat_house_drawing_hall']['drawing_hall_location']
                : drawingHallLocation;

            drawingSpecialFeaturesController =
                printData['flat_house_drawing_hall']['living_hall_text'] != null
                    ? printData['flat_house_drawing_hall']['living_hall_text']
                    : drawingSpecialFeaturesController;

            KitchenLengthController =
                printData['flat_house_drawing_hall']['kitchen_length'] != null
                    ? printData['flat_house_drawing_hall']['kitchen_length']
                        .toString()
                    : KitchenLengthController;
            kitchenWidthController =
                printData['flat_house_drawing_hall']['kitchen_width'] != null
                    ? printData['flat_house_drawing_hall']['kitchen_width']
                        .toString()
                    : kitchenWidthController;
            kitchenFeatures =
                printData['flat_house_drawing_hall']['kitchen_features'] != null
                    ? printData['flat_house_drawing_hall']['kitchen_features']
                        .toString()
                        .split(",")
                    : [];
            print("kitchenFeatures");
            print(kitchenFeatures);

            if (kitchenFeatures != null) {
              if (kitchenFeatures.contains('1')) {
                attachedStore = true;
              }
              if (kitchenFeatures.contains('2')) {
                utilityWash = true;
              }
              if (kitchenFeatures.contains('3')) {
                washArea = true;
              }
              if (kitchenFeatures.contains('4')) {
                breakFast = true;
              }
              if (kitchenFeatures.contains('5')) {
                centralIsland = true;
              }
            }
            attachedLengthController = printData['flat_house_drawing_hall']
                        ['attach_store_length'] !=
                    null
                ? printData['flat_house_drawing_hall']['attach_store_length']
                    .toString()
                : attachedLengthController;
            attachedWidthController = printData['flat_house_drawing_hall']
                        ['attach_store_length'] !=
                    null
                ? printData['flat_house_drawing_hall']['attach_store_length']
                    .toString()
                : attachedWidthController;

            // attachedLengthController = printData['flat_house_drawing_hall']
            //             ['attach_store_length'] !=
            //         null
            //     ? printData['flat_house_drawing_hall']['attach_store_length']
            //         .toString()
            //     : '';
            attachedWidthController = printData['flat_house_drawing_hall']
                        ['attach_store_width'] !=
                    null
                ? printData['flat_house_drawing_hall']['attach_store_width']
                    .toString()
                : attachedWidthController;

            utilityLengthController = printData['flat_house_drawing_hall']
                        ['utility_wash_length'] !=
                    null
                ? printData['flat_house_drawing_hall']['utility_wash_length']
                    .toString()
                : utilityLengthController;
            utilityWidthController = printData['flat_house_drawing_hall']
                        ['utility_wash_width'] !=
                    null
                ? printData['flat_house_drawing_hall']['utility_wash_width']
                    .toString()
                : utilityWidthController;
            specificReq =
                printData['flat_house_drawing_hall']['kitchen_text'] != null
                    ? printData['flat_house_drawing_hall']['kitchen_text']
                        .toString()
                    : specificReq;
            print("specificReq === ");
            print(specificReq);

            selectedDiningSeats =
                printData["flat_house_drawing_hall"]["dining_seat"] != null
                    ? DiningSeatsItems[int.parse(
                        printData["flat_house_drawing_hall"]["dining_seat"]
                            .toString())]
                    : selectedDiningSeats;
            diningHallLengthController =
                printData['flat_house_drawing_hall']['dining_length'] != null
                    ? printData['flat_house_drawing_hall']['dining_length']
                        .toString()
                    : diningHallLengthController;
            diningHallWidthController =
                printData['flat_house_drawing_hall']['dining_width'] != null
                    ? printData['flat_house_drawing_hall']['dining_width']
                        .toString()
                    : diningHallWidthController;
            diningSpecialFeaturesController =
                printData['flat_house_drawing_hall']['dining_text'] != null
                    ? printData['flat_house_drawing_hall']['dining_text']
                        .toString()
                    : diningSpecialFeaturesController;
            selectedDiningFloor =
                printData["flat_house_drawing_hall"]["dining_floor"] != null
                    ? DiningFloor[int.parse(printData["flat_house_drawing_hall"]
                            ["dining_floor"]
                        .toString())]
                    : selectedDiningFloor;
            DiningFloorInt =
                printData["flat_house_drawing_hall"]["dining_floor"] != null
                    ? int.parse(printData["flat_house_drawing_hall"]
                            ["dining_floor"]
                        .toString())
                    : DiningFloorInt;
            DiningSeatsInt =
                printData["flat_house_drawing_hall"]["dining_seat"] != null
                    ? int.parse(printData["flat_house_drawing_hall"]
                            ["dining_seat"]
                        .toString())
                    : DiningSeatsInt;
            // diningSpecialFeaturesController =
            //     printData['flat_house_drawing_hall']['dining_features'] != null
            //         ? printData['flat_house_drawing_hall']['dining_features']
            //             .toString()
            //         : diningSpecialFeaturesController;
            // print("livingHall");
            // print(livingHall);
            // if (livingHall != null) {
            //   if (livingHall.contains('1') &&
            //       !otherFeatures.contains("Double Height")) {
            //     // print("object 1");
            //     otherFeatures.add(otherItems[0]);
            //   }
            //   if (livingHall.contains('2') &&
            //       !otherFeatures.contains("Powder Toilet")) {
            //     // print("object 2");
            //     otherFeatures.add(otherItems[1]);
            //   }
            // }
          }
        });
      }
    } catch (e) {}
  }

  bool isloading = false;

  @override
  void initState() {
    super.initState();
    getUserId();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isloading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return isloading == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: requirementText("Living hall/family lounge"),
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
                                      // value: livingRequired,
                                      value: livingRequired,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            // print(printData['status']);
                                            livingRequired = value;
                                            livingNotRequired = false;
                                            // printData['flat_house_drawing_hall']
                                            //     ['drawing_hall_req'] = 2;
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
                                    // value: livingNotRequired,
                                    value: livingNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        livingNotRequired = value;
                                        livingRequired = false;
                                        // printData['flat_house_drawing_hall']
                                        //     ['drawing_hall_req'] = 2;
                                      });
                                    },
                                  ),
                                ),
                                requirementText("Not Required")
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
                if (livingRequired == true) ...[
                  Row(
                    children: [
                      requirementText("Location"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: height * 0.03,
                            width: width * 0.25,
                            margin: const EdgeInsets.all(
                              3,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                hint: Text(selectedFloor),
                                // value: selectedFloor,
                                elevation: 16,
                                items: floorItems
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) {
                                  setState(
                                    () {
                                      selectedFloor = it!;

                                      // if (selectedFloor == "Select") {
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = '0';
                                      // }
                                      // if (selectedFloor == "Ground floor") {
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = "1";
                                      // }
                                      // if (selectedFloor == "1st Floor") {
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = "2";
                                      // }
                                      // if (selectedFloor == "2nd Floor") {
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = "3";
                                      // }
                                      // if (selectedFloor == "3rd Floor") {
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = "4";
                                      // }
                                      // if (selectedFloor == "other") {
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = "5";
                                      // }
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      if (selectedFloor == "other") ...[
                        requirementTextField(
                            height, width, 0.04, 0.25, "other location"),
                      ]
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      requirementText("Length"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: LivingHallLengthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "length",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              // "Selecting fridge",
                              // "Single Door",
                              // "Double Door",
                              LivingHallLengthController = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      requirementText("Width"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: LivingHallWidthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              LivingHallWidthController = value;
                            },
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      requirementText("help ?"),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  // Row(
                  //   children: [
                  //     requirementText("Features"),
                  //     SizedBox(
                  //       width: width * 0.02,
                  //     ),
                  //     // Material(
                  //     //   elevation: 5,
                  //     //   borderRadius: BorderRadius.circular(5),
                  //     //   child: Container(
                  //     //     height: height * 0.03,
                  //     //     width: width * 0.25,
                  //     //     margin: EdgeInsets.all(
                  //     //       3,
                  //     //     ),
                  //     //     child: DropdownButtonHideUnderline(
                  //     //       child: DropdownButton<String>(
                  //     //           icon: const Visibility(
                  //     //               visible: false,
                  //     //               child: Icon(Icons.arrow_downward)),
                  //     //           value: selectedFeatures,
                  //     //           elevation: 16,
                  //     //           items: selectedItem
                  //     //               .map((it) => DropdownMenuItem<String>(
                  //     //                   value: it,
                  //     //                   child: Text(
                  //     //                     it,
                  //     //                     style: TextStyle(
                  //     //                       color: Colors.black,
                  //     //                     ),
                  //     //                   )))
                  //     //               .toList(),
                  //     //           onChanged: (it) =>
                  //     //               setState(() => selectedFeatures = it!)),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     Material(
                  //       borderRadius: BorderRadius.circular(5),
                  //       elevation: 5,
                  //       child: Container(
                  //         padding:
                  //             EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //         ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             InkWell(
                  //               onTap: () => multiSelected(),
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(5),
                  //                 ),
                  //                 child: Text("Office features"),
                  //               ),
                  //             ),
                  //             Wrap(
                  //               children: otherFeatures
                  //                   .map((e) => Chip(
                  //                         label: Text(e),
                  //                       ))
                  //                   .toList(),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     if (selectedFeatures == "other") ...[
                  //       Material(
                  //         elevation: 5,
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(5)),
                  //         child: SizedBox(
                  //           height: height * 0.04,
                  //           width: width * 0.2,
                  //           child: TextFormField(
                  //             // initialValue: printData['flat_house_drawing_hall']
                  //             //     ['drawing_hall_location'],
                  //             style: const TextStyle(fontSize: 14),
                  //             decoration: const InputDecoration(
                  //                 hintText: "other Location",
                  //                 hintStyle: TextStyle(fontSize: 14),
                  //                 border: OutlineInputBorder(
                  //                   borderSide: BorderSide.none,
                  //                 ),
                  //                 isDense: true,
                  //                 contentPadding: EdgeInsets.all(8)
                  //                 //fillColor: Colors.green
                  //                 ),
                  //             onChanged: (value) {
                  //               ohterLivingHallController = value;
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //     ]
                  //   ],
                  // ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Special Feature"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.2,
                          child: TextFormField(
                            initialValue: livingSpecialFeaturesController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "special features",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              livingSpecialFeaturesController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,
                      //     "special feature", livingSpecialFeaturesController)
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
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
                                            bunglowPageRecentList[i]
                                                ["img_path"],
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
                            }),
                      ),
                    ),
                  )
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Exclusive Drawing hall"),
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
                                      // value: drawingHallRequired,
                                      value: drawingHallRequired,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            drawingHallRequired = value;
                                            drawingHallNotRequired = false;
                                            // printData["flat_house_drawing_hall"]
                                            //     ["drawing_hall_req"] = 2;
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
                                      // value: drawingHallNotRequired,
                                      value: drawingHallNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          drawingHallNotRequired = value;
                                          drawingHallRequired = false;
                                          // value:
                                        });
                                      }),
                                ),
                                requirementText("Not Required"),
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
                if (drawingHallRequired == true) ...[
                  Row(
                    children: [
                      requirementText("Location"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: height * 0.03,
                            width: width * 0.25,
                            margin: const EdgeInsets.all(
                              3,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Visibility(
                                  visible: false,
                                  child: Icon(
                                    Icons.arrow_downward,
                                  ),
                                ),
                                // hint: Text(DrawingSelected),
                                hint: Text(DrawingSelected),
                                elevation: 16,
                                items: DrawingItems.asMap().entries.map((it) {
                                  int idx = it.key;
                                  String value = it.value;
                                  return DropdownMenuItem<String>(
                                      value: it.value,
                                      onTap: () {
                                        drawingHallLocation = it.key;
                                        print(drawingHallLocation);
                                      },
                                      child: Text(
                                        it.value,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ));
                                }).toList(),
                                onChanged: (it) {
                                  setState(
                                    () {
                                      DrawingSelected = it!;
                                      // if (DrawingSelected == "Select") {
                                      //   // drawingHallLocation = 1;
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = 0;
                                      // }
                                      // if (DrawingSelected == "Ground floor") {
                                      //   drawingHallLocation = 1;
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = 1;
                                      // }

                                      // if (DrawingSelected == "1st Floor") {
                                      //   drawingHallLocation = 2;
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = 2;
                                      // }
                                      // if (DrawingSelected == "2nd Floor") {
                                      //   drawingHallLocation = 3;
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = 3;
                                      // }

                                      // if (DrawingSelected == "3rd Floor") {
                                      //   drawingHallLocation = 4;
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = 4;
                                      // }
                                      // if (DrawingSelected == "other") {
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["drawing_hall_location"] = 5;
                                      // }
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      if (DrawingSelected == "other") ...[
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.2,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  hintText: "other location",
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8)
                                  //fillColor: Colors.green
                                  ),
                              onChanged: (value) {
                                otherDrawingHallLocationController = value;
                              },
                            ),
                          ),
                        ),
                        // requirementTextFieldCont(height, width, 0.04, 0.25,
                        //     "other location", otherDrawingHallLocationController),
                      ]
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Length"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue:
                                drawingHallLengthController.toString(),
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "length",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              drawingHallLengthController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      //     drawingHallLengthController),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      requirementText("Width"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: drawingHallWidthController.toString(),
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              drawingHallWidthController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      //     drawingHallWidthController),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      requirementText("help ?"),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Features"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue:
                                drawingSpecialFeaturesController.toString(),
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "special feature",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              drawingSpecialFeaturesController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.5,
                      //     "special feature", drawingSpecialFeaturesController)
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
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
                                            bunglowPageRecentList[i]
                                                ["img_path"],
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
                            }),
                      ),
                    ),
                  )
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Kitchen details"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Location"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.25,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                // hint: Text(selectedKitchen),
                                hint: Text(selectedKitchen),

                                //value: selectedKitchen,
                                elevation: 16,
                                items: kitchenItems.asMap().entries.map((it) {
                                  return DropdownMenuItem<String>(
                                    value: it.value,
                                    onTap: () {
                                      KitchenFloor = it.key.toString();
                                    },
                                    child: Text(
                                      it.value,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (it) {
                                  setState(
                                    () {
                                      selectedKitchen = it!;
                                      // print(selectedKitchen);
                                      // if (selectedKitchen == "Select") {
                                      //   KitchenFloor = "0";
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["kitchen_floor"] = 0;
                                      // }
                                      // if (selectedKitchen == "Ground floor") {
                                      //   KitchenFloor = "1";
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["kitchen_floor"] = 1;
                                      // }
                                      // if (selectedKitchen == "1st Floor") {
                                      //   KitchenFloor = "2";
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["kitchen_floor"] = 2;
                                      // }
                                      // if (selectedKitchen == "2nd Floor") {
                                      //   KitchenFloor = "3";
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["kitchen_floor"] = 3;
                                      // }
                                      // if (selectedKitchen == "3rd Floor") {
                                      //   KitchenFloor = "4";
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["kitchen_floor"] = 4;
                                      // }
                                      // if (selectedKitchen == "other") {
                                      //   KitchenFloor = "4";
                                      //   printData["flat_house_drawing_hall"]
                                      //       ["kitchen_floor"] = 5;
                                      // }
                                    },
                                  );
                                }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    if (selectedFloor == "other") ...[
                      requirementTextField(
                          height, width, 0.04, 0.25, "other location"),
                    ]
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    requirementText("Length"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.15,
                        child: TextFormField(
                          initialValue: KitchenLengthController,
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "length",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          onChanged: (value) {
                            KitchenLengthController = value;
                          },
                        ),
                      ),
                    ),
                    // requirementTextFieldCont(
                    //     height, width, 0.04, 0.15, "length", KitchenLengthController),
                    valueContainer(height, width, size, 0.04, 0.05),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementText("Width"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.15,
                        child: TextFormField(
                          initialValue: kitchenWidthController,
                          // initialValue: printData != null &&
                          //         printData['flat_house_drawing_hall']
                          //                 ['attach_store_width'] !=
                          //             null
                          //     ? kitchenWidthController
                          //     : kitchenWidthController,
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          onChanged: (value) {
                            kitchenWidthController = value;
                          },
                        ),
                      ),
                    ),
                    // requirementTextFieldCont(
                    //     height, width, 0.04, 0.15, "Width", kitchenWidthController),
                    valueContainer(height, width, size, 0.04, 0.05),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementText("help ?"),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Kitchen funtion"),
                    SizedBox(
                      width: width * 0.02,
                    ),
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
                                child: Icon(
                                  Icons.arrow_downward,
                                ),
                              ),
                              // hint: Text(selectedKitchenFunction),
                              hint: Text(selectedKitchenFunction),
                              // value: selectedKitchenFunction,
                              elevation: 16,
                              items: kitchenFunctionItems
                                  .map(
                                    (it) => DropdownMenuItem<String>(
                                      value: it,
                                      child: Text(
                                        it,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (it) {
                                setState(() {
                                  selectedKitchenFunction = it!;
                                  if (selectedKitchenFunction ==
                                      "Selecting dining function") {
                                    printData['flat_house_drawing_hall']
                                        ['kitchen_dining_function'] = 0;
                                  }
                                  if (selectedKitchenFunction ==
                                      "full open to dining ") {
                                    printData['flat_house_drawing_hall']
                                        ['kitchen_dining_function'] = 2;
                                  }
                                  if (selectedKitchenFunction ==
                                      "partial open to dining") {
                                    printData['flat_house_drawing_hall']
                                        ['kitchen_dining_function'] = 3;
                                  }
                                  if (selectedKitchenFunction ==
                                      "open with a door") {
                                    printData['flat_house_drawing_hall']
                                        ['kitchen_dining_function'] = 4;
                                  }
                                });
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
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
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                // Row(
                //   children: [
                //     requirementText("Refrigerator type"),
                //     SizedBox(
                //       width: width * 0.02,
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: height * 0.02,
                // ),
                // Material(
                //   elevation: 10,
                //   child: Container(
                //     padding: EdgeInsets.symmetric(vertical: 10),
                //     color: Colors.white,
                //     child: SizedBox(
                //       width: width * 9,
                //       height: height * 0.3,
                //       child: FutureBuilder(
                //           future: getRecent(),
                //           builder: (context, snapshot) {
                //             if (snapshot.connectionState ==
                //                 ConnectionState.waiting) {
                //               return Container(
                //                 child: const Center(
                //                   child: CircularProgressIndicator(),
                //                 ),
                //               );
                //             } else {
                //               return CarouselSlider.builder(
                //                 itemCount: bunglowPageRecentList.length,
                //                 itemBuilder: (context, i, id) {
                //                   return Container(
                //                     height: height * 0.4,
                //                     width: width * 0.9,
                //                     child: Image.network(
                //                       imageUrl +
                //                           bunglowPageRecentList[i]["img_path"],
                //                       fit: BoxFit.fill,
                //                     ),
                //                   );
                //                 },
                //                 options: CarouselOptions(
                //                   autoPlay: true,
                //                   enableInfiniteScroll: true,
                //                   autoPlayAnimationDuration:
                //                       const Duration(milliseconds: 800),
                //                   viewportFraction: 1,
                //                 ),
                //               );
                //             }
                //           }),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: height * 0.01,
                ),
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
                                  value: attachedStore,
                                  onChanged: (value) {
                                    setState(() {
                                      attachedStore = value;
                                    });
                                  }),
                            ),
                            requirementText("Attached store area"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (attachedStore == true) ...[
                  Row(
                    children: [
                      requirementText("Length"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: attachedLengthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "length",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              attachedLengthController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      //     attachedLengthController),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      requirementText("Width"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: attachedWidthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              attachedWidthController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      //     attachedWidthController),
                      valueContainer(height, width, size, 0.04, 0.05),
                    ],
                  ),
                ],
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
                                  value: utilityWash,
                                  onChanged: (value) {
                                    setState(() {
                                      utilityWash = value;
                                    });
                                  }),
                            ),
                            requirementText("Uitility wash area"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (utilityWash == true) ...[
                  Row(
                    children: [
                      requirementText("Length"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: utilityLengthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "length",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              utilityLengthController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      //     utilityLengthController),

                      valueContainer(height, width, size, 0.04, 0.05),

                      SizedBox(
                        width: width * 0.02,
                      ),
                      requirementText("Width"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: utilityWidthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              utilityWidthController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(
                      //     height, width, 0.04, 0.15, "Width", utilityWidthController),

                      valueContainer(height, width, size, 0.04, 0.05),

                      SizedBox(
                        width: width * 0.01,
                      ),
                    ],
                  ),
                ],
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
                                  value: washArea,
                                  onChanged: (value) {
                                    setState(() {
                                      washArea = value;
                                    });
                                  }),
                            ),
                            requirementText("wash area open"),
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
                                  value: breakFast,
                                  onChanged: (value) {
                                    setState(() {
                                      breakFast = value;
                                    });
                                  }),
                            ),
                            requirementText("brealfast table are inside"),
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
                                  value: centralIsland,
                                  onChanged: (value) {
                                    setState(() {
                                      centralIsland = value;
                                    });
                                  }),
                            ),
                            requirementText("Central island"),
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
                    requirementText("Specific requirement"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.4,
                        child: TextFormField(
                          initialValue: specificReq.toString(),
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Specific requirement",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          onChanged: (value) {
                            specificReq = value;
                          },
                        ),
                      ),
                    ),
                    // requirementTextFieldCont(
                    //     height, width, 0.04, 0.4, "Specific requirement", specificReq)
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText("Dining Details"),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        requirementText("Floor"),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: height * 0.03,
                              width: width * 0.25,
                              margin: const EdgeInsets.all(
                                3,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    // hint: Text(selectedKitchen),
                                    hint: Text(selectedDiningFloor),

                                    //value: selectedKitchen,
                                    elevation: 16,
                                    items:
                                        DiningFloor.asMap().entries.map((it) {
                                      int idx = it.key;
                                      String value = it.value;
                                      return DropdownMenuItem<String>(
                                        value: it.value,
                                        onTap: () {
                                          DiningFloorInt = it.key;
                                        },
                                        child: Text(
                                          it.value,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (it) {
                                      setState(
                                        () {
                                          selectedDiningFloor = it!;
                                        },
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // SizedBox(
                //   height: height * 0.02,
                // ),
                Row(
                  children: [
                    requirementText("Length"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.15,
                        child: TextFormField(
                          initialValue: diningHallLengthController.toString(),
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "length",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          onChanged: (value) {
                            // "Selecting fridge",
                            // "Single Door",
                            // "Double Door",
                            diningHallLengthController = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementText("Width"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.15,
                        child: TextFormField(
                          initialValue: diningHallWidthController.toString(),
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          onChanged: (value) {
                            diningHallWidthController = value;
                          },
                        ),
                      ),
                    ),
                    valueContainer(height, width, size, 0.04, 0.05),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementText("help ?"),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        requirementText("Dining"),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: height * 0.03,
                              width: width * 0.5,
                              margin: const EdgeInsets.all(
                                3,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    // hint: Text(selectedKitchen),
                                    hint: Text(selectedDiningSeats),

                                    //value: selectedKitchen,
                                    elevation: 16,
                                    items: DiningSeatsItems.asMap()
                                        .entries
                                        .map((it) {
                                      int idx = it.key;
                                      String value = it.value;
                                      return DropdownMenuItem<String>(
                                        value: it.value,
                                        onTap: () {
                                          DiningSeatsInt = it.key;
                                        },
                                        child: Text(
                                          it.value,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (it) {
                                      setState(
                                        () {
                                          selectedDiningSeats = it!;
                                        },
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    requirementText("Specific requirement"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.4,
                        child: TextFormField(
                          initialValue: diningSpecialFeaturesController,
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Specific requirement",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          onChanged: (value) {
                            diningSpecialFeaturesController = value;
                          },
                        ),
                      ),
                    ),
                  ],
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
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),

                InkWell(
                  onTap: () {
                    setState(() {
                      int kitch = int.parse(KitchenLengthController) *
                          int.parse(kitchenWidthController);
                      livingHallArea = living.toString();
                      // if (selectedRefrigerator == "Single Door ") {
                      //   refrigeratorSize = "1";
                      // }

                      // if (selectedRefrigerator == "Double Door") {
                      //   refrigeratorSize = "2";
                      // }

                      // if (selectedRefrigerator ==
                      //     "open with a reasonable opening") {
                      //   refrigeratorSize = "3";
                      // }
                      if (livingRequired == true) {
                        // if (selectedFloor == "1 floor") {
                        //   livingHallLocation = 1;
                        // }

                        // if (selectedFloor == "2 floor") {
                        //   livingHallLocation = 2;
                        // }

                        // if (selectedFloor == "3 floor") {
                        //   livingHallLocation = 3;
                        // }

                        // if (selectedFloor == "other") {
                        //   livingHallLocation =
                        //       int.parse(ohterLivingHallController);
                        // }
                        int living = int.parse(LivingHallLengthController) *
                            int.parse(LivingHallWidthController);
                        livingHallArea = living.toString();
                        for (int i = 0; i < otherFeatures.length; i++) {
                          if (otherFeatures[i] == "Powder Toilet") {
                            livingHall.add(1);
                          }
                          if (otherFeatures[i] == "Double Height") {
                            livingHall.add(2);
                          }
                        }
                      }
                      // if (selectedKitchen == "1 floor") {
                      //   KitchenFloor = "1";
                      // }

                      // if (selectedKitchen == "2 floor") {
                      //   KitchenFloor = "2";
                      // }

                      // if (selectedKitchen == "3 floor") {
                      //   KitchenFloor = "3";
                      // }

                      // if (selectedKitchen == "other") {
                      //   KitchenFloor = "4";
                      // }

                      if (utilityWash == true) {
                        int utility = int.parse(utilityLengthController) *
                            int.parse(utilityWidthController);
                        utilityWashArea = utility.toString();
                      }
                      kitchenFeatures = [];
                      if (attachedStore == true) {
                        kitchenFeatures.add("1");
                      } else {
                        kitchenFeatures.remove("1");
                      }
                      if (utilityWash == true) {
                        kitchenFeatures.add("2");
                      } else {
                        kitchenFeatures.remove("2");
                      }
                      if (washArea == true) {
                        kitchenFeatures.add("3");
                      } else {
                        kitchenFeatures.remove("3");
                      }
                      if (breakFast == true) {
                        kitchenFeatures.add("4");
                      } else {
                        kitchenFeatures.remove("4");
                      }
                      if (centralIsland == true) {
                        kitchenFeatures.add("5");
                      } else {
                        kitchenFeatures.remove("5");
                      }

                      print("kitchen Features");
                      print(kitchenFeatures);

                      if (livingRequired == true) {
                        livingHallInt = 1;
                      }
                      if (attachedStore == true) {
                        int attach = int.parse(attachedLengthController) *
                            int.parse(attachedWidthController);
                        attachStoreArea = attach.toString();
                      }

                      if (drawingHallRequired == true) {
                        drawingInt = 1;
                      }

                      if (selectedKitchenFunction == "full open to dining ") {
                        kitchenDiningFunction = "1";
                      }

                      if (selectedKitchenFunction == "partial open to dining") {
                        kitchenDiningFunction = "2";
                      }
                      if (selectedKitchenFunction ==
                          "open with a reasonable opening") {
                        kitchenDiningFunction = "3";
                      }

                      if (selectedKitchenFunction == "open with a door") {
                        KitchenFloor = "4";
                      }
                      if (DrawingSelected == "other") {
                        printData["flat_house_drawing_hall"]
                            ["living_hall_location"] = 5;
                        drawingHallLocation =
                            int.parse(otherDrawingHallLocationController);
                      }
                      if (attachStoreArea == true) {}
                      int kitchen = int.parse(KitchenLengthController) *
                          int.parse(kitchenWidthController);
                      kitchenArea = kitchen.toString();
                    });
                    print("projectId");
                    print(drawingHallLengthController);

                    if (pageId != null) {
                      livingHallDuplexPut(
                        project_id,
                        drawingInt,
                        drawingHallLocation,
                        drawingHallLengthController,
                        drawingHallWidthController,
                        drawingSpecialFeaturesController,
                        livingHallInt,
                        livingHallLocation,
                        LivingHallLengthController,
                        LivingHallWidthController,
                        livingHall,
                        livingSpecialFeaturesController,
                        kitchenFeatures,
                        KitchenFloor,
                        KitchenLengthController,
                        kitchenWidthController,
                        kitchenDiningFunction,
                        attachedLengthController,
                        attachedWidthController,
                        utilityWidthController,
                        utilityLengthController,
                        utilityWashArea,
                        specificReq,
                        diningHallLengthController,
                        diningHallWidthController,
                        diningSpecialFeaturesController,
                        DiningFloorInt,
                        DiningSeatsInt,
                      );
                    } else {
                      livingHallDuplexPost(
                        project_id,
                        drawingInt,
                        drawingHallLocation,
                        drawingHallLengthController,
                        drawingHallWidthController,
                        drawingSpecialFeaturesController,
                        livingHallInt,
                        livingHallLocation,
                        LivingHallLengthController,
                        LivingHallWidthController,
                        livingHall,
                        livingSpecialFeaturesController,
                        kitchenFeatures,
                        KitchenFloor,
                        KitchenLengthController,
                        kitchenWidthController,
                        kitchenDiningFunction,
                        attachedLengthController,
                        attachedWidthController,
                        utilityWidthController,
                        utilityLengthController,
                        utilityWashArea,
                        specificReq,
                        diningHallLengthController,
                        diningHallWidthController,
                        diningSpecialFeaturesController,
                        DiningFloorInt,
                        DiningSeatsInt,
                      );
                    }
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: height * 0.04,
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        "save and continue",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
