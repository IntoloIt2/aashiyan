import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';

class PantryDetail extends StatefulWidget {
  static const namedRoute = "/pantrydetails";
  @override
  State<PantryDetail> createState() => _PantryDetailState();
}

class _PantryDetailState extends State<PantryDetail> {
  List<String> diningFaciltiy = [];
  List diningFeaturesList = [];
  String diningFloor = "";

  String diningLocation = "";

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
  TextEditingController diningLocationController = TextEditingController();
  TextEditingController floorLocationController = TextEditingController();
  TextEditingController pantryLengthController = TextEditingController();
  TextEditingController pantrywidthController = TextEditingController();
  TextEditingController specificRequestController = TextEditingController();
  TextEditingController diningLengthController = TextEditingController();
  TextEditingController diningWidthController = TextEditingController();
  TextEditingController diningFloorLocation = TextEditingController();
  TextEditingController diningRequirements = TextEditingController();

  String? selectedDiningSeats = "select dining seat";
  List<String> diningSeatsItems = [
    "select dining seat",
    "6",
    "8",
    "10",
    "more"
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
    "1st floor ",
    "2nd floor",
    "3rd floor",
    "other"
  ];

  bool? pantryDetails1 = false;
  bool? pantryDetails2 = false;
  int pantryDetailInt = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                              value: selectedFloor,
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
                              onChanged: (it) =>
                                  setState(() => selectedFloor = it!)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  if (selectedFloor == "other") ...[
                    requirementTextFieldCont(height, width, 0.04, 0.25,
                        "other location", floorLocationController),
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      pantryLengthController),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      pantrywidthController),
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
                  requirementTextFieldCont(height, width, 0.04, 0.4,
                      "Specific Requirement", specificRequestController)
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
                            value: selectedDiningFloor,
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
                            onChanged: (it) =>
                                setState(() => selectedDiningFloor = it!)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                if (selectedFloor == "other") ...[
                  requirementTextFieldCont(height, width, 0.04, 0.25,
                      "other location", diningFloorLocation),
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
                requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                    diningLengthController),
                valueContainer(height, width, size, 0.04, 0.05),
                SizedBox(
                  width: width * 0.02,
                ),
                requirementText("Width"),
                SizedBox(
                  width: width * 0.015,
                ),
                requirementTextFieldCont(
                    height, width, 0.04, 0.15, "Width", diningWidthController),
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
                          value: selectedDiningSeats,
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
                          onChanged: (it) =>
                              setState(() => selectedDiningSeats = it!)),
                    ),
                  ),
                ),
                if (selectedDiningSeats == "more") ...[
                  requirementTextFieldCont(height, width, 0.04, 0.3,
                      "dining seat", diningLocationController),
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
                requirementTextFieldCont(height, width, 0.04, 0.4,
                    "special requirement", diningRequirements)
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
                      selectedFloor = floorLocationController.text;
                    }
                    int pantry = int.parse(pantryLengthController.text) *
                        int.parse(pantrywidthController.text);
                    pantryArea = pantry.toString();
                  }

                  int dining = int.parse(diningLengthController.text) *
                      int.parse(diningWidthController.text);
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
                    diningFloor = diningLengthController.text;
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
                    diningLocation = diningFloorLocation.text;
                  }
                });

                pantryPost(
                  pantryDetailInt,
                  pantryFloor,
                  pantryLengthController.text,
                  pantrywidthController.text,
                  pantryArea,
                  specificRequestController.text,
                  diningLengthController.text,
                  diningWidthController.text,
                  diningArea,
                  diningFeaturesList,
                  diningLocation,
                  diningFloor,
                  diningRequirements.text,
                );
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
