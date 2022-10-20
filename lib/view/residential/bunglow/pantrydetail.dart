// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_typing_uninitialized_variables, empty_catches, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';
import 'package:http/http.dart' as http;

class PantryDetail extends StatefulWidget {
  static const namedRoute = "/pantrydetails";
  @override
  State<PantryDetail> createState() => _PantryDetailState();
}

class _PantryDetailState extends State<PantryDetail> {
  List<String> diningFaciltiy = [];
  List diningFeaturesList = [];
  String diningFloor = " ";
  String diningLocation = " ";

  void multiSelected() async {
    final List<String> otherItems = [
      "With crockery storage",
      "Without crockery storage",
      "Double Height",
      "Near By Basin",
    ];

    final List<String> result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: otherItems);
        });
    if (result != null) {
      setState(() {
        diningFaciltiy = result;
      });
    }
  }

  String pantryArea = "";
  String diningArea = "";
  String diningLocationController = " ";
  String floorLocationController = " ";
  String pantryLengthController = " ";
  String pantrywidthController = " ";
  String specificRequestController = " ";
  String diningLengthController = " ";
  String diningWidthController = " ";
  String diningFloorLocation = " ";
  String diningRequirements = " ";

  String? selectedDiningSeats = "select dining seat";
  List<String> diningSeatsItems = [
    "select dining seat",
    "6",
    "8",
    "10",
    "more",
  ];

  List<String> dropList = [
    "with crockery storage",
    "without crockery storage",
    "Double Height",
    "near by basin",
  ];

  String selectedFloor = "select floor";
  String pantryFloor = "";
  List<String> pantryItems = [
    "select floor",
    "Ground floor",
    "1st floor",
    "2nd floor",
    "3rd floor",
    "other"
  ];

  String? selectedDiningFloor = "select floor";
  List<String> diningItems = [
    "select floor",
    "Ground floor",
    "1st floor",
    "2nd floor",
    "3rd floor",
    "other"
  ];

  bool? pantryDetails1 = false;
  bool? pantryDetails2 = false;
  int pantryDetailInt = 0;

// http://sdplweb.com/sdpl/api/edit-bungalow-pantry/project_id

  bool isloading = false;
  var printData;
  Future<void> getData() async {
    try {
      // var client = http.Client();
      var response = await http.get(
        Uri.parse(
          "http://192.168.0.99:8080/sdplserver/api/edit-bungalow-pantry/179",
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          printData = jsonResponse;
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getData();
    if (printData == null) {
      isloading = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (printData != null) {
      isloading = false;
    }
    return isloading == true
        ? Center(
            child: Column(
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          )
        : Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  requirementText("pantry Detail"),
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
                                        value: printData['bungalow_pantry']
                                                    ['pantry_req'] ==
                                                1
                                            ? true
                                            : pantryDetails1,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              pantryDetails1 = value;
                                              pantryDetails2 = false;
                                              printData['bungalow_pantry']
                                                  ['pantry_req'] = 5;
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
                                        value: printData['bungalow_pantry']
                                                    ['pantry_req'] ==
                                                0
                                            ? true
                                            : pantryDetails2,
                                        onChanged: (value) {
                                          setState(() {
                                            pantryDetails2 = value;
                                            pantryDetails1 = false;
                                            printData['bungalow_pantry']
                                                ['pantry_req'] = 5;
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
                  if (pantryDetails1 == true ||
                      printData['bungalow_pantry']['pantry_req'] == 1) ...[
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        requirementText("floor"),
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
                                  hint: printData["bungalow_pantry"]
                                              ["pantry_floor"] !=
                                          null
                                      ? Text(
                                          pantryItems[
                                              printData["bungalow_pantry"]
                                                  ["pantry_floor"]],
                                        )
                                      : Text(selectedFloor),
                                  // value: selectedFloor,
                                  elevation: 16,
                                  items: pantryItems
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
                                    setState(() {
                                      selectedFloor = it!;
                                      if (selectedFloor == "select floor") {
                                        printData["bungalow_pantry"]
                                            ["pantry_floor"] = 0;
                                      }
                                      if (selectedFloor == "Ground floor") {
                                        printData["bungalow_pantry"]
                                            ["pantry_floor"] = 1;
                                      }
                                      if (selectedFloor == "1st floor") {
                                        printData["bungalow_pantry"]
                                            ["pantry_floor"] = 2;
                                      }
                                      if (selectedFloor == "2nd floor") {
                                        printData["bungalow_pantry"]
                                            ["pantry_floor"] = 3;
                                      }
                                      if (selectedFloor == "3rd floor") {
                                        printData["bungalow_pantry"]
                                            ["pantry_floor"] = 4;
                                      }
                                      if (selectedFloor == "other") {
                                        printData["bungalow_pantry"]
                                            ["pantry_floor"] = 5;
                                      }
                                    });
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
                          Material(
                            elevation: 5,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: SizedBox(
                              height: height * 0.04,
                              width: width * 0.25,
                              child: TextFormField(
                                // initialValue: printData["bungalow_pantry"]
                                //         ["pantry_floor"].toString(),
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
                                onChanged: ((value) {
                                  floorLocationController = value;
                                }),
                              ),
                            ),
                          ),
                          // requirementTextFieldCont(height, width, 0.04, 0.25,
                          //     "other location", floorLocationController),
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
                              initialValue: printData["bungalow_pantry"]
                                  ["pantry_length"],
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
                              onChanged: ((value) {
                                pantryLengthController = value;
                              }),
                            ),
                          ),
                        ),
                        // requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                        //     pantryLengthController),
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
                              initialValue: printData["bungalow_pantry"]
                                  ["pantry_width"],
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
                              onChanged: ((value) {
                                pantrywidthController = value;
                              }),
                            ),
                          ),
                        ),
                        // requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                        //     pantrywidthController),
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
                        requirementText("specific requirement"),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.15,
                            child: TextFormField(
                              initialValue: printData["bungalow_pantry"]
                                  ["specific_req"],
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  hintText: "Specific Requirement",
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8)
                                  //fillColor: Colors.green
                                  ),
                              onChanged: ((value) {
                                specificRequestController = value;
                              }),
                            ),
                          ),
                        ),
                        // requirementTextFieldCont(height, width, 0.04, 0.4,
                        //     "Specific Requirement", specificRequestController)
                      ],
                    )
                  ],
                  SizedBox(
                    height: height * 0.01,
                  ),
                  requirementText("Dining Details"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("floor"),
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
                                hint: printData["bungalow_pantry"]
                                            ["dining_floor"] !=
                                        null
                                    ? Text(diningItems[
                                        printData["bungalow_pantry"]
                                            ["dining_floor"]])
                                    : Text(selectedDiningFloor!),
                                // value: selectedDiningFloor,
                                elevation: 16,
                                items: diningItems
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
                                      selectedDiningFloor = it;
                                      if (selectedDiningFloor ==
                                          "select floor") {
                                        printData["bungalow_pantry"]
                                            ["dining_floor"] = 0;
                                      }
                                      if (selectedDiningFloor ==
                                          "Ground floor") {
                                        printData["bungalow_pantry"]
                                            ["dining_floor"] = 1;
                                      }
                                      if (selectedDiningFloor == "1st floor") {
                                        printData["bungalow_pantry"]
                                            ["dining_floor"] = 2;
                                      }
                                      if (selectedDiningFloor == "2nd floor") {
                                        printData["bungalow_pantry"]
                                            ["dining_floor"] = 3;
                                      }
                                      if (selectedDiningFloor == "3rd floor") {
                                        printData["bungalow_pantry"]
                                            ["dining_floor"] = 4;
                                      }
                                      if (selectedDiningFloor == "other") {
                                        printData["bungalow_pantry"]
                                            ["dining_floor"] = 5;
                                      }
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
                      if (selectedDiningFloor == "other") ...[
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.15,
                            child: TextFormField(
                              // initialValue: printData["bungalow_pantry"]
                              //     ["dining_floor"],
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  hintText: "Other Location",
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8)
                                  //fillColor: Colors.green
                                  ),
                              onChanged: ((value) {
                                diningFloorLocation = value;
                              }),
                            ),
                          ),
                        ),
                        // requirementTextFieldCont(height, width, 0.04, 0.25,
                        //     "other location", diningFloorLocation),
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
                            initialValue: printData["bungalow_pantry"]
                                ["dining_length"],
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
                            onChanged: ((value) {
                              diningLengthController = value;
                            }),
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      //     diningLengthController),
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
                            initialValue: printData["bungalow_pantry"]
                                ["dining_width"],
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
                            onChanged: ((value) {
                              diningWidthController = value;
                            }),
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(
                      //     height, width, 0.04, 0.15, "Width", diningWidthController),
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
                      requirementText("Dining seat"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              hint: printData['bungalow_pantry']
                                          ['dining_seat'] !=
                                      null
                                  ? Text(printData['bungalow_pantry']
                                      ['dining_seat'])
                                  : const Text(' '),
                              // value: selectedDiningSeats,
                              elevation: 16,
                              items: diningSeatsItems
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
                                    selectedDiningSeats = it;

                                    // if (selectedDiningSeats ==
                                    //     "select dining seat") {
                                    //   printData["bungalow_pantry"]
                                    //       ["dining_floor"] = 0;
                                    // }
                                    // if (selectedDiningSeats == "6") {
                                    //   printData["bungalow_pantry"]
                                    //       ["dining_floor"] = 1;
                                    // }
                                    // if (selectedDiningSeats == "8") {
                                    //   printData["bungalow_pantry"]
                                    //       ["dining_floor"] = 2;
                                    // }
                                    // if (selectedDiningSeats == "10") {
                                    //   printData["bungalow_pantry"]
                                    //       ["dining_floor"] = 3;
                                    // }
                                    // if (selectedDiningSeats == "more") {
                                    //   printData["bungalow_pantry"]
                                    //   ["dining_floor"] = 4;
                                    // }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      if (selectedDiningSeats == "more") ...[
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.15,
                            child: TextFormField(
                              initialValue: printData["bungalow_pantry"]
                                  ["dining_seat"],
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  hintText: "dining seat",
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8)
                                  //fillColor: Colors.green
                                  ),
                              onChanged: ((value) {
                                diningLocationController = value;
                              }),
                            ),
                          ),
                        ),
                        // requirementTextFieldCont(height, width, 0.04, 0.3,
                        //     "dining seat", diningLocationController),
                      ],
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Dining facilities"),
                      SizedBox(
                        width: width * 0.02,
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
                                  onTap: () => multiSelected(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text("Select features"),
                                  ),
                                ),
                                Wrap(
                                  children: diningFaciltiy
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
                      requirementText("specific requirement"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.4,
                          child: TextFormField(
                            initialValue: printData['bungalow_pantry']
                                ['dining_text'],
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              hintText: "special requirement",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                      ), // requirementTextFieldCont(height, width, 0.04, 0.4,"special requirement", diningRequirements)
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
                                return const Center(
                                  child: CircularProgressIndicator(),
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
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  InkWell(
                    onTap: (() {
                      setState(() {
                        if (pantryDetails1 == true) {
                          pantryDetailInt = 1;
                          if (selectedFloor == "Ground floor") {
                            pantryFloor = '1';
                          }
                          if (selectedFloor == "1st floor") {
                            pantryFloor = '2';
                          }
                          if (selectedFloor == "2nd floor") {
                            pantryFloor = '3';
                          }
                          if (selectedFloor == "3rd floor") {
                            pantryFloor = '3';
                          }
                          if (selectedFloor == "other") {
                            selectedFloor = floorLocationController;
                          }
                          int pantry = int.parse(pantryLengthController) *
                              int.parse(pantrywidthController);
                          pantryArea = pantry.toString();
                        }

                        int dining = int.parse(diningLengthController) *
                            int.parse(diningWidthController);
                        diningArea = dining.toString();
                        for (int i = 0; i < diningFaciltiy.length; i++) {
                          if (diningFaciltiy[i] == "With crockery storage") {
                            diningFeaturesList.add("1");
                          }
                          if (diningFaciltiy[i] == "Without crockery storage") {
                            diningFeaturesList.add("2");
                          }
                          if (diningFaciltiy[i] == "Double Height") {
                            diningFeaturesList.add("3");
                          }
                          if (diningFaciltiy[i] == "Near By Basin") {
                            diningFeaturesList.add("4");
                          }
                        }
                        if (selectedDiningSeats == "6") {
                          diningFloor = "1";
                        }
                        if (selectedDiningSeats == "8") {
                          diningFloor = "2";
                        }
                        if (selectedDiningSeats == "10") {
                          diningFloor = "3";
                        }
                        if (selectedDiningSeats == "more") {
                          diningFloor = "3";
                        }

                        if (selectedDiningFloor == "more") {
                          diningFloor = diningLengthController;
                        }
                        if (selectedDiningFloor == "Ground floor") {
                          diningLocation = "1";
                        }
                        if (selectedDiningFloor == "1st floor ") {
                          diningLocation = "2";
                        }
                        if (selectedDiningFloor == "2nd floor") {
                          diningLocation = "3";
                        }
                        if (selectedDiningFloor == "3rd floor") {
                          diningLocation = "4";
                        }
                        if (selectedDiningFloor == "other") {
                          diningLocation = diningFloorLocation;
                        }
                      });

                      pantryPost(
                        pantryDetailInt,
                        pantryFloor,
                        pantryLengthController,
                        pantrywidthController,
                        pantryArea,
                        specificRequestController,
                        diningLengthController,
                        diningWidthController,
                        diningArea,
                        diningFeaturesList,
                        diningLocation,
                        diningFloor,
                        diningRequirements,
                      );
                    }),
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
                  )
                ],
              ),
            ),
          );
  }
}
