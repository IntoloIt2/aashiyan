import 'dart:convert';

import 'package:aashiyan/components/contants.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/page_nav_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/forms.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';
import 'package:http/http.dart' as http;

class LivingHall extends StatefulWidget {
  static const namedRoute = "/LivingHall";

  @override
  State<LivingHall> createState() => _LivingHallState();
}

class _LivingHallState extends State<LivingHall> {
  List<String> otherFeatures = [];
  List livingHall = [];

  List<String> floorItems = [
    "Select",
    "Ground floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];
  var project_id;
  String selectedFloor = "Select";
  int livingHallLocation = 1;
  String livingHallArea = "";
  String drawingHallLengthController = "";
  String drawingHallWidthController = "";
  String drawingSpecialFeaturesController = "";
  String livingSpecialFeaturesController = "";
  String LivingHallWidthController = "";
  String LivingHallLengthController = "";
  String KitchenLengthController = "";
  String attachedLengthController = "";
  String kitchenWidthController = "";
  String attachedWidthController = "";
  String utilityLengthController = "";
  String utilityWidthController = "";
  String specificReq = "";
  String otherDrawingHallLocationController = "";
  String ohterLivingHallController = "";

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
  int KitchenFloor = 0;

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
    "other",
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

  List<String> refrigeratorItems = [
    "Selecting fridge",
    "Single Door",
    "Double Door",
  ];
  String selectedRefrigerator = "Selecting fridge";
  String refrigeratorSize = "";

  List<String> selectedItem = [" ", "Double height", "powder toilet"];

  String selectedFeatures = " ";

  List kitchenFeatures = [];

  bool? attachedStore = false;

  bool? utilityWash = false;

  bool? washArea = false;
  bool? breakFast = false;
  bool? centralIsland = false;

  bool? livingRequired = false;
  bool? livingNotRequired = false;
  int livingHallInt = 0;

  bool? drawingHallRequired = false;
  bool? drawingHallNotRequired = false;

  int drawingInt = 0;
  // String drawingArea = "0";
  List<String> otherItems = ["Double Height", "Powder Toilet"];

  var printData;
  int? pageId;
  Future<void> getData(int id) async {
    print('id===');
    print(id);

    try {
      // var client = http.Client();

      var response = await http.get(Uri.parse(
          "http://192.168.0.99:8080/sdplserver/api/edit-bungalow-drawing-hall/$id"));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(
          () {
            printData = jsonResponse;
            print(printData);
            if (printData != null) {
              pageId = printData['bungalow_drawing_hall']['id'] != null
                  ? int.parse(
                      printData['bungalow_drawing_hall']['id'].toString(),
                    )
                  : 0;

              livingRequired = printData['bungalow_drawing_hall']
                          ['drawing_hall_req'] !=
                      null
                  ? printData['bungalow_drawing_hall']['drawing_hall_req'] == 1
                  : false;
              livingNotRequired = printData['bungalow_drawing_hall']
                          ['drawing_hall_req'] !=
                      null
                  ? printData['bungalow_drawing_hall']['drawing_hall_req'] == 0
                  : false;
              drawingHallRequired = printData["bungalow_drawing_hall"]
                          ["living_hall_req"] !=
                      null
                  ? printData["bungalow_drawing_hall"]["living_hall_req"] == 1
                  : false;
              drawingHallNotRequired = printData["bungalow_drawing_hall"]
                          ["living_hall_req"] !=
                      null
                  ? printData["bungalow_drawing_hall"]["living_hall_req"] == 0
                  : false;
              selectedKitchen =
                  printData["bungalow_drawing_hall"]["kitchen_floor"] != null
                      ? kitchenItems[printData["bungalow_drawing_hall"]
                          ["kitchen_floor"]]
                      : selectedKitchen;

              print("kitchen   ${selectedKitchen}");

              selectedKitchenFunction = printData['bungalow_drawing_hall']
                          ['kitchen_dining_function'] !=
                      null
                  ? kitchenFunctionItems[printData['bungalow_drawing_hall']
                      ['kitchen_dining_function']]
                  : selectedKitchenFunction;
              selectedRefrigerator = printData['bungalow_drawing_hall']
                          ['refrigerator_size'] !=
                      null
                  ? refrigeratorItems[printData['bungalow_drawing_hall']
                      ['refrigerator_size']]
                  : selectedRefrigerator;
              selectedFloor = printData["bungalow_drawing_hall"]
                          ["living_hall_location"] !=
                      null
                  ? floorItems[printData["bungalow_drawing_hall"]
                      ["living_hall_location"]]
                  : selectedFloor;
              DrawingSelected = printData["bungalow_drawing_hall"]
                          ["drawing_hall_location"] !=
                      null
                  ? DrawingItems[printData["bungalow_drawing_hall"]
                      ["drawing_hall_location"]]
                  : DrawingSelected;
              print(DrawingSelected);

              LivingHallLengthController = printData['bungalow_drawing_hall']
                          ['living_hall_length'] !=
                      null
                  ? printData['bungalow_drawing_hall']['living_hall_length']
                  : "";

              LivingHallWidthController = printData['bungalow_drawing_hall']
                          ['living_hall_width'] !=
                      null
                  ? printData['bungalow_drawing_hall']['living_hall_width']
                  : "";

              livingSpecialFeaturesController = printData != null &&
                      printData['bungalow_drawing_hall']['drawing_hall_text'] !=
                          null
                  ? printData['bungalow_drawing_hall']['drawing_hall_text']
                  : "";

              drawingHallLengthController = printData['bungalow_drawing_hall']
                          ['drawing_hall_length'] !=
                      null
                  ? printData['bungalow_drawing_hall']['drawing_hall_length']
                  : '';

              drawingHallWidthController = printData['bungalow_drawing_hall']
                          ['drawing_hall_width'] !=
                      null
                  ? printData['bungalow_drawing_hall']['drawing_hall_width']
                  : '';

              drawingSpecialFeaturesController =
                  printData['bungalow_drawing_hall']['living_hall_text'] != null
                      ? printData['bungalow_drawing_hall']['living_hall_text']
                      : '';

              KitchenLengthController =
                  printData['bungalow_drawing_hall']['kitchen_length'] != null
                      ? printData['bungalow_drawing_hall']['kitchen_length']
                          .toString()
                      : '';
              kitchenWidthController =
                  printData['bungalow_drawing_hall']['kitchen_width'] != null
                      ? printData['bungalow_drawing_hall']['kitchen_width']
                          .toString()
                      : '';
              kitchenFeatures =
                  printData['bungalow_drawing_hall']['kitchen_features'] != null
                      ? printData['bungalow_drawing_hall']['kitchen_features']
                          .toString()
                          .split(",")
                      : [];
              attachedLengthController = printData['bungalow_drawing_hall']
                          ['attach_store_length'] !=
                      null
                  ? printData['bungalow_drawing_hall']['attach_store_length']
                      .toString()
                  : '';
              attachedWidthController = printData['bungalow_drawing_hall']
                          ['attach_store_length'] !=
                      null
                  ? printData['bungalow_drawing_hall']['attach_store_length']
                      .toString()
                  : '';
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
              attachedLengthController = printData['bungalow_drawing_hall']
                          ['attach_store_length'] !=
                      null
                  ? printData['bungalow_drawing_hall']['attach_store_length']
                      .toString()
                  : '';
              attachedWidthController = printData['bungalow_drawing_hall']
                          ['attach_store_width'] !=
                      null
                  ? printData['bungalow_drawing_hall']['attach_store_width']
                      .toString()
                  : '';

              utilityLengthController = printData['bungalow_drawing_hall']
                          ['utility_wash_length'] !=
                      null
                  ? printData['bungalow_drawing_hall']['utility_wash_length']
                      .toString()
                  : '';
              utilityWidthController = printData['bungalow_drawing_hall']
                          ['utility_wash_width'] !=
                      null
                  ? printData['bungalow_drawing_hall']['utility_wash_width']
                      .toString()
                  : '';
              specificReq =
                  printData['bungalow_drawing_hall']['specific_req'] != null
                      ? printData['bungalow_drawing_hall']['specific_req']
                      : '';
              livingHall =
                  printData['bungalow_drawing_hall']['living_hall'] != null
                      ? printData['bungalow_drawing_hall']['living_hall']
                          .toString()
                          .split(",")
                      : [];

              // print(livingHall);
              if (livingHall != null) {
                if (livingHall.contains('1') &&
                    !otherFeatures.contains("Double Height")) {
                  print("object 1");
                  otherFeatures.add(otherItems[0]);
                }
                if (livingHall.contains('2') &&
                    !otherFeatures.contains("Powder Toilet")) {
                  print("object 2");
                  otherFeatures.add(otherItems[1]);
                }
              }
            }
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool isloading = false;

  // Future<dynamic> getUserId() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userData = prefs.getString('userData');
  //   project_id = prefs.getString('projectId');

  //   getData(project_id);
  //   var decJson;
  //   if (userData != null) {
  //     decJson = jsonDecode(userData);
  //   }
  //   user_id = decJson['data']['id'];
  // }

  @override
  void initState() {
    super.initState();
    // getUserId();
    getData(179);
    final store = Provider.of<PageNavProvider>(context, listen: false);
  }

  void multiSelected() async {
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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final provider = Provider.of<PageNavProvider>(context, listen: true);

    return SingleChildScrollView(
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
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.04,
                            child: Checkbox(
                                activeColor: checkColor,
                                checkColor: Colors.white,
                                value: livingRequired,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      livingRequired = value;
                                      livingNotRequired = false;
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
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.04,
                            child: Checkbox(
                              activeColor: checkColor,
                              checkColor: Colors.white,
                              value: livingNotRequired,
                              onChanged: (value) {
                                setState(() {
                                  livingNotRequired = value;
                                  livingRequired = false;
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
                      margin: EdgeInsets.all(
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
                          items: floorItems.asMap().entries.map((it) {
                            int idx = it.key;
                            String val = it.value;

                            return DropdownMenuItem<String>(
                              value: it.value,
                              onTap: () {
                                drawingHallLocation = idx;
                              },
                              child: Text(
                                it.value,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (it) {
                            setState(
                              () {
                                selectedFloor = it!;
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['living_hall_length'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['living_hall_length']
                          : "",
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
                        LivingHallLengthController = value;
                        print(LivingHallLengthController);
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
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['living_hall_width'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['living_hall_width']
                          : "",
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
            Row(
              children: [
                requirementText("Features"),
                SizedBox(
                  width: width * 0.02,
                ),
                Material(
                  borderRadius: BorderRadius.circular(5),
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => multiSelected(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text("Office features"),
                          ),
                        ),
                        Wrap(
                          children: otherFeatures
                              .map((e) => Chip(
                                    label: Text(e),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
                if (selectedFeatures == "other") ...[
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.2,
                      child: TextFormField(
                        initialValue: printData != null &&
                                printData['bungalow_drawing_hall']
                                        ['drawing_hall_location'] !=
                                    null
                            ? printData['bungalow_drawing_hall']
                                    ['drawing_hall_location']
                                .toString()
                            : '',
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: "other Location",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green
                            ),
                        onChanged: (value) {
                          ohterLivingHallController = value;
                        },
                      ),
                    ),
                  ),
                ]
              ],
            ),
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.2,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['drawing_hall_text'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['drawing_hall_text']
                          : "",
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
                //  "special feature", livingSpecialFeaturesController)
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Material(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
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
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.04,
                            child: Checkbox(
                                activeColor: checkColor,
                                checkColor: Colors.white,
                                value: drawingHallRequired,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      drawingHallRequired = value;
                                      drawingHallNotRequired = false;
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
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.04,
                            child: Checkbox(
                                activeColor: checkColor,
                                checkColor: Colors.white,
                                value: drawingHallNotRequired,
                                onChanged: (value) {
                                  setState(() {
                                    drawingHallNotRequired = value;
                                    drawingHallRequired = false;
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
                          hint: Text(DrawingSelected),
                          elevation: 16,
                          items: DrawingItems.asMap().entries.map((it) {
                            int idx = it.key;
                            String val = it.value;
                            return DropdownMenuItem<String>(
                                value: it.value,
                                onTap: () {
                                  drawingHallLocation = idx;
                                  print(drawingHallLocation);
                                },
                                child: Text(
                                  it.value,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (it) {
                            setState(
                              () {
                                DrawingSelected = it!;
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
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['drawing_hall_length'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['drawing_hall_length']
                          : '',
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
                        print(drawingHallLengthController);
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['drawing_hall_width'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['drawing_hall_width']
                          : '',
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
                        print(drawingHallWidthController);
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
                requirementText("Special"),
                SizedBox(
                  width: width * 0.02,
                ),
                Material(
                  elevation: 5,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['living_hall_text'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['living_hall_text']
                          : '',
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
                // "special feature", drawingSpecialFeaturesController)
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Material(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
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
                    margin: EdgeInsets.all(
                      3,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          icon: const Visibility(
                            visible: false,
                            child: Icon(Icons.arrow_downward),
                          ),
                          hint: Text(selectedKitchen),
                          elevation: 16,
                          items: kitchenItems.asMap().entries.map((it) {
                            int idx = it.key;
                            String val = it.value;
                            return DropdownMenuItem<String>(
                              value: it.value,
                              onTap: () {
                                KitchenFloor = idx;
                              },
                              child: Text(
                                it.value,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (it) {
                            setState(
                              () {
                                selectedKitchen = it!;
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
                    // initialValue: "45",

                    initialValue: printData != null &&
                            printData['bungalow_drawing_hall'] != null
                        ? printData['bungalow_drawing_hall']
                                    ['kitchen_length'] !=
                                null
                            ? printData['bungalow_drawing_hall']
                                    ['kitchen_length']
                                .toString()
                            : ''
                        : '',
                    // initialValue: printData != null
                    //     ? printData['bungalow_drawing_hall'] != null &&
                    //             printData['bungalow_drawing_hall']
                    //                     ['living_hall_length'] !=
                    //                 null
                    //         ? printData['bungalow_drawing_hall']
                    //             ['living_hall_length']
                    //         : ""
                    //     : "",
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
                    initialValue: printData != null
                        ? printData['bungalow_drawing_hall']['kitchen_width'] !=
                                null
                            ? printData['bungalow_drawing_hall']
                                    ['kitchen_width']
                                .toString()
                            : ''
                        : '',
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
                        hint: Text(selectedKitchenFunction),
                        // value: selectedKitchenFunction,
                        elevation: 16,
                        items: kitchenFunctionItems
                            .map(
                              (it) => DropdownMenuItem<String>(
                                value: it,
                                child: Text(
                                  it,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (it) {
                          // "Selecting dining function",
                          // "full open to dining ",
                          // "partial open to dining",
                          // "open with a reasonable opening",
                          // "open with a door",
                          setState(() {
                            selectedKitchenFunction = it!;
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
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: SizedBox(
                width: width * 9,
                height: height * 0.3,
                child: FutureBuilder(
                  future: getRecent(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                              imageUrl + bunglowPageRecentList[i]["img_path"],
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
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              requirementText("Refrigerator type"),
              SizedBox(
                width: width * 0.02,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: height * 0.03,
                  width: width * 0.4,
                  margin: EdgeInsets.all(
                    3,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: const Visibility(
                          visible: false, child: Icon(Icons.arrow_downward)),
                      hint: Text(selectedRefrigerator),

                      // value: selectedRefrigerator,
                      elevation: 16,
                      items: refrigeratorItems.asMap().entries.map((it) {
                        int idx = it.key;
                        String val = it.value;
                        return DropdownMenuItem<String>(
                          value: it.value,
                          child: Text(
                            it.value,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (it) => setState(
                        () {
                          selectedRefrigerator = it!;
                        },
                      ),
                    ),
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
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: SizedBox(
                width: width * 9,
                height: height * 0.3,
                child: FutureBuilder(
                    future: getRecent(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                                imageUrl + bunglowPageRecentList[i]["img_path"],
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
          Row(
            children: [
              Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.only(right: 10),
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['attach_store_length'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['attach_store_length']
                          : '',
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['attach_store_width'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['attach_store_width']
                          : '',
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
                  padding: EdgeInsets.only(right: 10),
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['utility_wash_length'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['utility_wash_length']
                          : '',
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_drawing_hall']
                                      ['utility_wash_width'] !=
                                  null
                          ? printData['bungalow_drawing_hall']
                              ['utility_wash_width']
                          : '',
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
                  padding: EdgeInsets.only(right: 10),
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
                  padding: EdgeInsets.only(right: 10),
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
                  padding: EdgeInsets.only(right: 10),
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
                    initialValue: printData != null &&
                            printData['bungalow_drawing_hall']
                                    ['specific_req'] !=
                                null
                        ? printData['bungalow_drawing_hall']['specific_req']
                        : '',
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
          InkWell(
            onTap: () {
              setState(
                () {
                  if (selectedRefrigerator == "Single Door ") {
                    refrigeratorSize = "1";
                  }

                  if (selectedRefrigerator == "Double Door") {
                    refrigeratorSize = "2";
                  }

                  if (selectedRefrigerator ==
                      "open with a reasonable opening") {
                    refrigeratorSize = "3";
                  }
                  if (livingRequired == true) {
                    if (selectedFloor == "1 floor") {
                      livingHallLocation = 1;
                    }

                    if (selectedFloor == "2 floor") {
                      livingHallLocation = 2;
                    }

                    if (selectedFloor == "3 floor") {
                      livingHallLocation = 3;
                    }

                    if (selectedFloor == "other") {
                      livingHallLocation = int.parse(ohterLivingHallController);
                    }

                    // for (int i = 0; i < otherFeatures.length; i++) {
                    //   if (otherFeatures[i] == "Powder Toilet") {
                    //     livingHall.add(1);
                    //   }
                    //   if (otherFeatures[i] == "Double Height") {
                    //     livingHall.add(2);
                    //   }
                    // }
                  }

                  if (livingRequired == true) {
                    livingHallInt = 1;
                  }
                  if (utilityWash == true) {
                    // int utility = int.parse(utilityLengthController) *
                    //     int.parse(utilityWidthController);
                    // utilityWashArea = utility.toString();
                  }

                  kitchenFeatures = [];

                  if (attachedStore == true) {
                    kitchenFeatures.add("1");
                  }
                  if (utilityWash == true) {
                    kitchenFeatures.add("2");
                  }

                  if (washArea == true) {
                    kitchenFeatures.add("3");
                  }
                  if (breakFast == true) {
                    kitchenFeatures.add("4");
                  }
                  if (centralIsland == true) {
                    kitchenFeatures.add("5");
                  }

                  if (livingRequired == true) {}
                  if (attachedStore == true) {}

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

                  if (DrawingSelected == "other") {
                    drawingHallLocation =
                        int.parse(otherDrawingHallLocationController);
                  }
                  // if (attachStoreArea == true) {}
                  // int kitchen = int.parse(KitchenLengthController) *
                  //    int.parse(kitchenWidthController);
                  // kitchenArea = kitchen.toString();
                },
              );

              if (pageId != null) {
                print(pageId);
                print(drawingHallLengthController);
                print(LivingHallWidthController);

                livingHallput(
                  project_id,
                  drawingInt,
                  drawingHallLocation,
                  drawingHallLengthController,
                  drawingHallWidthController,
                  drawingSpecialFeaturesController,
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
                  refrigeratorSize,
                  specificReq,
                );
              } else {
                livingHallPost(
                  project_id,
                  drawingInt,
                  drawingHallLocation,
                  drawingHallLengthController,
                  drawingHallWidthController,
                  drawingSpecialFeaturesController,
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
                  refrigeratorSize,
                  specificReq,
                );
              }
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: height * 0.04,
                decoration: BoxDecoration(
                    color: buttonColor, borderRadius: BorderRadius.circular(4)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
