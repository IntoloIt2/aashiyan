import 'dart:convert';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';
import 'package:http/http.dart' as http;

import '../house-duplex/providers/page_nav_provider.dart';

class PantryDetail extends StatefulWidget {
  static const namedRoute = "/pantrydetails";
  @override
  State<PantryDetail> createState() => _PantryDetailState();
}

class _PantryDetailState extends State<PantryDetail> {
  List<String> diningFaciltiy = [];
  List diningFeaturesList = [];
  String diningSeats = '0';
  String diningLocation = '0';

  List<String> otherItems = [
    "With crockery storage",
    "Without crockery storage",
    "Double Height",
    "Near By Basin",
  ];

  void multiSelected() async {
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
  String diningSeatsLocation = " ";
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
  int pantryFloor = 0;
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
  int? pageId;
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
          print(printData);
          pageId = printData['bungalow_pantry']['id'];

          if (printData != null) {
            pantryDetails1 =
                printData['bungalow_pantry']['pantry_req'] == 1 ? true : false;
            pantryDetails2 = printData['bungalow_pantry']['pantry_req'] == 0
                ? true
                : pantryDetails2;
            selectedFloor = printData["bungalow_pantry"]["pantry_floor"] != null
                ? pantryItems[printData["bungalow_pantry"]["pantry_floor"]]
                : selectedFloor;
            pantryLengthController = printData["bungalow_pantry"]
                    ["pantry_length"] ??
                pantryLengthController;
            pantrywidthController = printData["bungalow_pantry"]
                    ["pantry_width"] ??
                pantrywidthController;
            specificRequestController = printData["bungalow_pantry"]
                    ["specific_req"] ??
                specificRequestController;
            // selectedDiningFloor =
            //     printData["bungalow_pantry"]["dining_floor"] != null
            //         ? diningItems[printData["bungalow_pantry"]["dining_floor"]]
            //         : selectedDiningFloor;
            diningLengthController = printData["bungalow_pantry"]
                    ["dining_length"] ??
                diningLengthController;
            print(diningLengthController);
            diningWidthController = printData["bungalow_pantry"]
                    ["dining_width"] ??
                diningWidthController;
            selectedDiningFloor =
                printData['bungalow_pantry']['dining_floor'] != null
                    ? diningItems[printData['bungalow_pantry']['dining_floor']]
                    : selectedDiningFloor;
            diningLocationController = printData["bungalow_pantry"]
                    ["dining_seat"] ??
                diningLocationController;
            diningLocation =
                printData['bungalow_pantry']['dining_floor'] != null
                    ? printData['bungalow_pantry']['dining_floor'].toString()
                    : diningLocation;
            print(diningLocation);
            diningSeats = printData['bungalow_pantry']['dining_floor'] != null
                ? printData['bungalow_pantry']['dining_floor'].toString()
                : diningSeats;
            print(diningSeats);
            diningFaciltiy =
                printData["bungalow_pantry"]["dining_features"] != null
                    ? printData["bungalow_pantry"]["dining_features"]
                        .toString()
                        .split(',')
                    : [];
            selectedDiningSeats =
                printData['bungalow_pantry']['dining_seat'] != null
                    ? diningSeatsItems[
                        int.parse(printData['bungalow_pantry']['dining_seat'])]
                    : selectedDiningSeats;
            // print(selectedDiningSeats);
            // print(selectedDiningFloor);
            // print(diningFaciltiy);
            if (diningFaciltiy != null) {
              if (diningFaciltiy.contains("1")) {
                if (!diningFaciltiy.contains("With crockery storage")) {
                  diningFaciltiy.add("With crockery storage");
                }

                if (!diningFaciltiy.contains("Near By Basin")) {
                  diningFaciltiy.add("Near By Basin");
                }
              }
              if (diningFaciltiy.contains("2")) {
                if (!diningFaciltiy.contains("Without crockery storage")) {
                  diningFaciltiy.add("Without crockery storage");
                }
              }
              if (diningFaciltiy.contains("3")) {
                if (!diningFaciltiy.contains("Double Height")) {
                  diningFaciltiy.add("Double Height");
                }
              }
              if (diningFaciltiy.contains("4")) {
                if (!diningFaciltiy.contains("Near By Basin")) {
                  diningFaciltiy.add("Near By Basin");
                }
              }
            }
            diningRequirements = printData['bungalow_pantry']['dining_text'] ??
                diningRequirements;
          }
        });
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
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
    var provider = Provider.of<PageNavProvider>(context, listen: true);
    if (printData != null) {
      isloading = false;
    }
    return Container(
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
                                  value: pantryDetails1,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        pantryDetails1 = value;
                                        pantryDetails2 = false;
                                        // printData['bungalow_pantry']
                                        //     ['pantry_req'] = 5;
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
                                  value: pantryDetails2,
                                  onChanged: (value) {
                                    setState(() {
                                      pantryDetails2 = value;
                                      pantryDetails1 = false;
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
            if (pantryDetails1 == true) ...[
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
                            hint: Text(selectedFloor),
                            // value: selectedFloor,
                            elevation: 16,
                            items: pantryItems.asMap().entries.map((it) {
                              int idx = it.key;
                              String val = it.value;
                              return DropdownMenuItem<String>(
                                  value: it.value,
                                  onTap: () {
                                    pantryFloor = idx;
                                    print(pantryFloor);
                                  },
                                  child: Text(
                                    it.value,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (it) {
                              setState(() {
                                selectedFloor = it!;
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
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.15,
                      child: TextFormField(
                        initialValue: printData != null &&
                                printData["bungalow_pantry"]["pantry_length"] !=
                                    null
                            ? printData["bungalow_pantry"]["pantry_length"]
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
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.15,
                      child: TextFormField(
                        initialValue: printData != null &&
                                printData["bungalow_pantry"]["pantry_width"] !=
                                    null
                            ? printData["bungalow_pantry"]["pantry_width"]
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
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.15,
                      child: TextFormField(
                        initialValue: printData != null &&
                                printData["bungalow_pantry"]["specific_req"] !=
                                    null
                            ? printData["bungalow_pantry"]["specific_req"]
                            : '',
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
                          hint: Text(selectedDiningFloor!),
                          // value: selectedDiningFloor,
                          elevation: 16,
                          items: diningItems.asMap().entries.map((it) {
                            int idx = it.key;
                            String val = it.value;
                            return DropdownMenuItem<String>(
                                value: it.value,
                                onTap: () {
                                  diningLocation = idx.toString();
                                  // print(diningLocation);
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
                                selectedDiningFloor = it;
                                // if (selectedDiningFloor == "select floor") {
                                //   printData["bungalow_pantry"]["dining_floor"] =
                                //       0;
                                // }
                                // if (selectedDiningFloor == "Ground floor") {
                                //   printData["bungalow_pantry"]["dining_floor"] =
                                //       1;
                                // }
                                // if (selectedDiningFloor == "1st floor") {
                                //   printData["bungalow_pantry"]["dining_floor"] =
                                //       2;
                                // }
                                // if (selectedDiningFloor == "2nd floor") {
                                //   printData["bungalow_pantry"]["dining_floor"] =
                                //       3;
                                // }
                                // if (selectedDiningFloor == "3rd floor") {
                                //   printData["bungalow_pantry"]["dining_floor"] =
                                //       4;
                                // }
                                // if (selectedDiningFloor == "other") {
                                //   printData["bungalow_pantry"]["dining_floor"] =
                                //       5;
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
                if (selectedDiningFloor == "other") ...[
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                          diningSeatsLocation = value;
                        }),
                      ),
                    ),
                  ),
                  // requirementTextFieldCont(height, width, 0.04, 0.25,
                  //     "other location", diningSeatsLocation),
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData["bungalow_pantry"]["dining_length"] !=
                                  null
                          ? printData["bungalow_pantry"]["dining_length"]
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData["bungalow_pantry"]["dining_width"] !=
                                  null
                          ? printData["bungalow_pantry"]["dining_width"]
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
                            visible: false, child: Icon(Icons.arrow_downward)),
                        hint: Text(selectedDiningSeats!),
                        // value: selectedDiningFloor,
                        elevation: 16,
                        items: diningSeatsItems.asMap().entries.map((it) {
                          int idx = it.key;
                          String val = it.value;
                          return DropdownMenuItem<String>(
                              value: it.value,
                              onTap: () {
                                diningSeats = idx.toString();
                                print(diningSeats);
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
                              selectedDiningSeats = it;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                if (selectedDiningFloor == "more") ...[
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.15,
                      child: TextFormField(
                        initialValue: printData != null &&
                                printData["bungalow_pantry"]["dining_seat"] !=
                                    null
                            ? printData["bungalow_pantry"]["dining_seat"]
                            : '',
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                              child: Text("Select features"),
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.4,
                    child: TextFormField(
                      initialValue: printData != null &&
                              printData['bungalow_pantry']['dining_text'] !=
                                  null
                          ? printData['bungalow_pantry']['dining_text']
                          : '',
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
                      onChanged: (value) {
                        diningRequirements = value;
                      },
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
              onTap: (() {
                setState(() {
                  if (pantryDetails1 == true) {
                    pantryDetailInt = 1;
                  }
                  //   if (selectedFloor == "Ground floor") {
                  //     pantryFloor = '1';
                  //   }
                  //   if (selectedFloor == "1st floor") {
                  //     pantryFloor = '2';
                  //   }
                  //   if (selectedFloor == "2nd floor") {
                  //     pantryFloor = '3';
                  //   }
                  //   if (selectedFloor == "3rd floor") {
                  //     pantryFloor = '3';
                  //   }
                  //   if (selectedFloor == "other") {
                  //     selectedFloor = floorLocationController;
                  //   }
                  // }

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
                });
                if (pageId != null) {
                  print(pageId);
                  pantryPut(
                    provider.project_id,
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
                    diningSeats,
                    diningRequirements,
                  );
                } else {
                  pantryPost(
                    provider.project_id,
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
                    diningSeats,
                    diningRequirements,
                  );
                }
              }),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: height * 0.04,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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