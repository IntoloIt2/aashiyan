import 'package:aashiyan/components/forms.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../components/app_bar.dart';
import '../../../components/bungalow_steps.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';

class PantryDetail extends StatefulWidget {
  static const namedRoute = "/pantrydetails";
  @override
  State<PantryDetail> createState() => _PantryDetailState();
}

class _PantryDetailState extends State<PantryDetail> {
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

  String? selectedFloor = "select floor";
  List<String> pantryItems = [
    "select floor",
    "Ground floor",
    "1st floor ",
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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Container(
        margin: const EdgeInsets.all(10),
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
                      requirementTextField(
                          height, width, 0.04, 0.25, "other location"),
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
                    requirementTextField(height, width, 0.04, 0.15, "length"),
                    valueContainer(height, width, size, 0.04, 0.05),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementText("Width"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    requirementTextField(height, width, 0.04, 0.15, "Width"),
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
                    requirementTextField(
                        height, width, 0.04, 0.4, "Specific Requirement")
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
                    requirementTextField(
                        height, width, 0.04, 0.25, "other location"),
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
                  requirementTextField(height, width, 0.04, 0.15, "length"),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextField(height, width, 0.04, 0.15, "Width"),
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
                    requirementTextField(
                        height, width, 0.04, 0.3, "dining seat"),
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
                  Expanded(
                    child: Material(
                      elevation: 5,
                      child: GFMultiSelect(
                        items: dropList,
                        onSelect: (value) {
                          print('selected $value ');
                        },
                        dropdownTitleTileText: 'Select feature',

                        dropdownUnderlineBorder: const BorderSide(
                            color: Colors.transparent, width: 2),
                        // dropdownTitleTileBorder:
                        //     Border.all(color: Colors.black, width: 1),
                        dropdownTitleTileBorderRadius: BorderRadius.circular(5),
                        dropdownTitleTileMargin: const EdgeInsets.all(1),
                        dropdownTitleTilePadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        expandedIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black54,
                        ),
                        collapsedIcon: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.black54,
                        ),
                        submitButton: const Text('Submit'),
                        cancelButton: const Text('Cancel'),
                        dropdownTitleTileTextStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                        type: GFCheckboxType.basic,
                        inactiveBorderColor: Colors.grey,
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
                  requirementTextField(
                      height, width, 0.04, 0.4, "special requirement")
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
              Align(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
