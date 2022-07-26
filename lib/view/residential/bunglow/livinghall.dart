import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../components/app_bar.dart';
import '../../../components/bungalow_steps.dart';
import '../../../components/forms.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';

class LivingHall extends StatefulWidget {
  static const namedRoute = "/LivingHall";
  @override
  State<LivingHall> createState() => _LivingHallState();
}

class _LivingHallState extends State<LivingHall> {
  List<String> floorItems = [
    "Select",
    "Ground floor",
    "1st Floor ",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];
  String selectedFloor = "Select";

  List<String> kitchenItems = [
    "Select",
    "Ground floor",
    "1st Floor ",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];
  String selectedKitchen = "Select";

  List<String> drawingHallItems = [
    "Select",
    "Ground floor",
    "1st Floor ",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];
  String selecteDrawingHall = "Select";

  List<String> DrawingItems = [
    "Select",
    "Ground floor",
    "1st Floor ",
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

  List<String> refrigeratorItems = [
    "Selecting fridge",
    "Single Door ",
    "Double Door",
  ];
  String selectedRefrigerator = "Selecting fridge";

  String DrawingSelected = "Select";

  List<String> selectedItem = [" ", "Double height", "powder toilet"];

  String selectedFeatures = " ";

  bool? attachedStore = false;
  bool? utilityWash = false;
  bool? washArea = false;
  bool? breakFast = false;
  bool? centralIsland = false;
  bool? livingRequired = false;
  bool? livingNotRequired = false;
  bool? drawingHallRequired = false;
  bool? drawingHallNotRequired = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
   
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
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
                                    }),
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
                                value: selectedFloor,
                                elevation: 16,
                                items: floorItems
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
                    requirementText("Features"),
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
                              value: selectedFeatures,
                              elevation: 16,
                              items: selectedItem
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
                                  setState(() => selectedFeatures = it!)),
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
                    requirementText("Special Feature"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "special feature")
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
                          margin: EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                value: DrawingSelected,
                                elevation: 16,
                                items: DrawingItems.map(
                                    (it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ))).toList(),
                                onChanged: (it) =>
                                    setState(() => DrawingSelected = it!)),
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
                    requirementText("Special"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "special feature")
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
                                  child: Icon(Icons.arrow_downward)),
                              value: selectedKitchen,
                              elevation: 16,
                              items: kitchenItems
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
                              onChanged: (it) =>
                                  setState(() => selectedKitchen = it!)),
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
                      margin: EdgeInsets.all(
                        3,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            icon: const Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
                            value: selectedKitchenFunction,
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
                            onChanged: (it) =>
                                setState(() => selectedKitchenFunction = it!)),
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
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
                            value: selectedRefrigerator,
                            elevation: 16,
                            items: refrigeratorItems
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
                            onChanged: (it) =>
                                setState(() => selectedRefrigerator = it!)),
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
                  requirementTextField(
                      height, width, 0.04, 0.4, "Specific requirement",
                      )
                ],
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
