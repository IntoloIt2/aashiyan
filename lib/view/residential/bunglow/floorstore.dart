import 'package:aashiyan/components/app_bar.dart';
import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../const.dart';
import '../../../controller/api_services.dart';

class FloorStore extends StatefulWidget {
  const FloorStore({Key? key}) : super(key: key);
  static const namedRoute = "/floorstore";
  @override
  State<FloorStore> createState() => _FloorStoreState();
}

class _FloorStoreState extends State<FloorStore> {
  String selectedPoojaPlace = "select room type";
  List<String> poojaPlaceItems = [
    "select room type",
    "proper Room",
    "only place",
  ];

  String selectedPooja = "select floor";
  List<String> poojaRoomItems = [
    "select floor",
    "Groung floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String selectedStair = "select stair";
  List<String> stairItems = [
    "select stair",
    "U shaped",
    "L saped",
    "Semi circular"
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

  String? selectedLift = "select no of passenger";
  List<String> liftItems = [
    "select no of passenger",
    "4",
    "6",
    "8",
    "10",
    "more",
  ];

  bool? FloorStoreDetail1 = false;
  bool? FloorStoreDetail2 = false;
  bool? requiredLift = false;
  bool? notRequiredLift = false;
  bool? poojaRoomRequired = false;
  bool? poojaRoomNotRequired = false;
  bool? openHall = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar("Floor Store"),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              requirementText("floor store details"),
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
                                    value: FloorStoreDetail1,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          FloorStoreDetail1 = value;
                                          FloorStoreDetail2 = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: FloorStoreDetail2,
                                    onChanged: (value) {
                                      setState(() {
                                        FloorStoreDetail2 = value;
                                        FloorStoreDetail1 = false;
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
              if (FloorStoreDetail1 == true) ...[
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
                        width: width * 0.25,
                        margin: EdgeInsets.all(
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
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )))
                                  .toList(),
                              onChanged: (it) =>
                                  setState(() => selectedFloor = it!)),
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
              ],
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  requirementText("Bunglow staircase"),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Material(
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
                            value: selectedStair,
                            elevation: 16,
                            items: stairItems
                                .map((it) => DropdownMenuItem<String>(
                                    value: it,
                                    child: Text(
                                      it,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )))
                                .toList(),
                            onChanged: (it) =>
                                setState(() => selectedStair = it!)),
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
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Material(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Row(
                            children: const [
                              Icon(Icons.cloud_upload),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Upload a stair image"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.2,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        color: buttonColor,
                        child: const Text(
                          "Preview",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Lift"),
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
                                    value: requiredLift,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          requiredLift = value;
                                          notRequiredLift = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: notRequiredLift,
                                    onChanged: (value) {
                                      setState(() {
                                        notRequiredLift = value;
                                        requiredLift = false;
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
              if (requiredLift == true) ...[
                Row(children: [
                  requirementText("Passenger capacity"),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: height * 0.03,
                      margin: EdgeInsets.all(
                        3,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            icon: const Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
                            value: selectedLift,
                            elevation: 16,
                            items: liftItems
                                .map((it) => DropdownMenuItem<String>(
                                    value: it,
                                    child: Text(
                                      it,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )))
                                .toList(),
                            onChanged: (it) =>
                                setState(() => selectedLift = it!)),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: height * 0.01,
                ),
                if (selectedLift == "more") ...[
                  requirementTextField(
                      height, width, 0.04, 1, "passenger capacity"),
                  SizedBox(
                    height: height * 0.01,
                  )
                ],
                Row(
                  children: [
                    requirementText("specific requirement"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementTextField(
                        height, width, .04, 0.35, "lift Requirement")
                  ],
                ),
              ],
              requirementText("Pooja Room"),
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
                                    value: poojaRoomRequired,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          poojaRoomRequired = value;
                                          poojaRoomNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: poojaRoomNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        poojaRoomNotRequired = value;
                                        poojaRoomRequired = false;
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
              if (poojaRoomRequired == true) ...[
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
                    requirementText("Location"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: height * 0.03,
                        margin: EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: selectedPooja,
                              elevation: 16,
                              items: poojaRoomItems
                                  .map((it) => DropdownMenuItem<String>(
                                      value: it,
                                      child: Text(
                                        it,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )))
                                  .toList(),
                              onChanged: (it) =>
                                  setState(() => selectedPooja = it!)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Type"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: height * 0.03,
                        margin: EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: selectedPoojaPlace,
                              elevation: 16,
                              items: poojaPlaceItems
                                  .map((it) => DropdownMenuItem<String>(
                                      value: it,
                                      child: Text(
                                        it,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )))
                                  .toList(),
                              onChanged: (it) =>
                                  setState(() => selectedPoojaPlace = it!)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                  ],
                )
              ],
              SizedBox(
                height: height * 0.01,
              ),
              if (selectedPooja == "other") ...[
                Material(
                  elevation: 5,
                  child: requirementTextField(
                      height, width, 0.04, 1, "other location"),
                ),
              ],
              SizedBox(
                height: height * 0.01,
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
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Material(
                elevation: 5,
                child: Row(
                  children: [
                    SizedBox(
                      height: height * 0.04,
                      child: Checkbox(
                          activeColor: checkColor,
                          checkColor: Colors.white,
                          value: openHall,
                          onChanged: (value) {
                            setState(
                              () {
                                openHall = value;
                              },
                            );
                          }),
                    ),
                    requirementText("Opening toward hall/ lobby")
                  ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
