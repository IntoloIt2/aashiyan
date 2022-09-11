import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../components/forms.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';

class LivingHall extends StatefulWidget {
  static const namedRoute = "/LivingHall";
  @override
  State<LivingHall> createState() => _LivingHallState();
}

class _LivingHallState extends State<LivingHall> {
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
      setState(() {
        otherFeatures = result;
      });
    }
  }

  List<String> floorItems = [
    "Select",
    "Ground floor",
    "1st Floor ",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];
  String selectedFloor = "Select";

  int livingHallLocation = 1;

  String livingHallArea = "";

  TextEditingController drawingHallLengthController = TextEditingController();
  TextEditingController drawingHallWidthController = TextEditingController();
  TextEditingController drawingSpecialFeaturesController =
      TextEditingController();
  TextEditingController livingSpecialFeaturesController =
      TextEditingController();
  TextEditingController LivingHallWidthController = TextEditingController();
  TextEditingController LivingHallLengthController = TextEditingController();
  TextEditingController KitchenLengthController = TextEditingController();
  TextEditingController attachedLengthController = TextEditingController();
  TextEditingController kitchenWidthController = TextEditingController();
  TextEditingController attachedWidthController = TextEditingController();
  TextEditingController utilityLengthController = TextEditingController();
  TextEditingController utilityWidthController = TextEditingController();
  TextEditingController specificReq = TextEditingController();
  TextEditingController otherDrawingHallLocationController =
      TextEditingController();
  TextEditingController ohterLivingHallController = TextEditingController();

  List<String> kitchenItems = [
    "Select",
    "Ground floor",
    "1st Floor ",
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

  // String selecteDrawingHall = "Select";
  int drawingHallLocation = 0;

  String DrawingSelected = "Select";
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
  String kitchenDiningFunction = "1";

  List<String> refrigeratorItems = [
    "Selecting fridge",
    "Single Door ",
    "Double Door",
  ];
  String selectedRefrigerator = "Selecting fridge";
  String refrigeratorSize = "";

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      LivingHallLengthController),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      LivingHallWidthController),
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
                  // Material(
                  //   elevation: 5,
                  //   borderRadius: BorderRadius.circular(5),
                  //   child: Container(
                  //     height: height * 0.03,
                  //     width: width * 0.25,
                  //     margin: EdgeInsets.all(
                  //       3,
                  //     ),
                  //     child: DropdownButtonHideUnderline(
                  //       child: DropdownButton<String>(
                  //           icon: const Visibility(
                  //               visible: false,
                  //               child: Icon(Icons.arrow_downward)),
                  //           value: selectedFeatures,
                  //           elevation: 16,
                  //           items: selectedItem
                  //               .map((it) => DropdownMenuItem<String>(
                  //                   value: it,
                  //                   child: Text(
                  //                     it,
                  //                     style: TextStyle(
                  //                       color: Colors.black,
                  //                     ),
                  //                   )))
                  //               .toList(),
                  //           onChanged: (it) =>
                  //               setState(() => selectedFeatures = it!)),
                  //     ),
                  //   ),
                  // ),
                  Material(
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
                    requirementTextFieldCont(height, width, 0.04, .2,
                        "other Location", ohterLivingHallController)
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
                  requirementTextFieldCont(height, width, 0.04, 0.5,
                      "special feature", livingSpecialFeaturesController)
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
                    requirementTextFieldCont(height, width, 0.04, 0.25,
                        "other location", otherDrawingHallLocationController),
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      drawingHallLengthController),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      drawingHallWidthController),
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
                  requirementTextFieldCont(height, width, 0.04, 0.5,
                      "special feature", drawingSpecialFeaturesController)
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
                requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                    KitchenLengthController),
                valueContainer(height, width, size, 0.04, 0.05),
                SizedBox(
                  width: width * 0.02,
                ),
                requirementText("Width"),
                SizedBox(
                  width: width * 0.015,
                ),
                requirementTextFieldCont(
                    height, width, 0.04, 0.15, "Width", kitchenWidthController),
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      attachedLengthController),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      attachedWidthController),
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      utilityLengthController),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      utilityWidthController),
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
                requirementTextFieldCont(height, width, 0.04, 0.4,
                    "Specific requirement", specificReq)
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  int kitch = int.parse(KitchenLengthController.text) *
                      int.parse(kitchenWidthController.text);
                  livingHallArea = living.toString();
                  if (selectedRefrigerator == "Single Door ") {
                    refrigeratorSize = "1";
                  }

                  if (selectedRefrigerator == "Double Door") {
                    refrigeratorSize = "2";
                  }

                  // if (selectedRefrigerator ==
                  //     "open with a reasonable opening") {
                  //   refrigeratorSize = "3";
                  // }
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
                      livingHallLocation =
                          int.parse(ohterLivingHallController.text);
                    }
                    int living = int.parse(LivingHallLengthController.text) *
                        int.parse(LivingHallWidthController.text);
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
                  if (selectedKitchen == "1 floor") {
                    KitchenFloor = "1";
                  }

                  if (selectedKitchen == "2 floor") {
                    KitchenFloor = "2";
                  }

                  if (selectedKitchen == "3 floor") {
                    KitchenFloor = "3";
                  }

                  if (selectedKitchen == "other") {
                    KitchenFloor = "4";
                  }

                  if (utilityWash == true) {
                    int utility = int.parse(utilityLengthController.text) *
                        int.parse(utilityWidthController.text);
                    utilityWashArea = utility.toString();
                  }
                  if (attachedStore == true) {
                    kitchenFeatures.add(1);
                  }
                  if (utilityWash == true) {
                    kitchenFeatures.add(2);
                  }

                  if (washArea == true) {
                    kitchenFeatures.add(3);
                  }
                  if (breakFast == true) {
                   kitchenFeatures.add(4);
                  }
                  if (centralIsland == true) {
                   kitchenFeatures.add(5);
                  }

                  if (livingRequired == true) {
                    livingHallInt = 1;
                  }
                  if (attachedStore == true) {
                    int attach = int.parse(attachedLengthController.text) *
                        int.parse(attachedWidthController.text);
                    attachStoreArea = attach.toString();
                  }

                  if (drawingHallRequired == true) {
                    drawingInt = 1;
                    int drawing = int.parse(drawingHallLengthController.text) *
                        int.parse(drawingHallWidthController.text);
                    drawingArea = drawing.toString();
                    if (DrawingSelected == "Ground floor") {
                      drawingHallLocation = 1;
                    }

                    if (DrawingSelected == "1st Floor ") {
                      drawingHallLocation = 2;
                    }

                    if (DrawingSelected == "2nd Floor") {
                      drawingHallLocation = 3;
                    }

                    if (DrawingSelected == "3rd Floor") {
                      drawingHallLocation = 4;
                    }
                    if (DrawingSelected == "other") {
                      drawingHallLocation =
                          int.parse(otherDrawingHallLocationController.text);
                    }
                  }

                  if(selectedKitchenFunction == "full open to dining ") {
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

                  if (attachStoreArea == true) {}
                  int kitchen = int.parse(KitchenLengthController.text) *
                      int.parse(kitchenWidthController.text);
                  kitchenArea = kitchen.toString();
                });
                livingHallPost(
                  drawingInt,
                  drawingHallLocation,
                  drawingHallLengthController.text,
                  drawingHallWidthController.text,
                  drawingArea,
                  drawingSpecialFeaturesController.text,
                  drawingSpecialFeaturesController.text,
                  livingHallInt,
                  livingHallLocation,
                  LivingHallLengthController.text,
                  LivingHallWidthController.text,
                  livingHallArea,
                  livingHall,
                  livingSpecialFeaturesController.text,
                  kitchenFeatures,
                  KitchenFloor,
                  KitchenLengthController.text,
                  kitchenWidthController.text,
                  kitchenArea,
                  kitchenDiningFunction,
                  attachedLengthController.text,
                  attachedWidthController.text,
                  attachStoreArea,
                  utilityWidthController.text,
                  utilityLengthController.text,
                  utilityWashArea,
                  refrigeratorSize,
                  specificReq.text,
                );
              },
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
            ),
          ],
        ),
      ),
    );
  }
}


//  "project_id": 3514, "user_id": 123, "dimension": 1, "drawing_hall_req": 1, "drawing_hall_location": 1, "drwing_hall_length": 30, "drawing_hall_width": 30, "drawing_hall_area": 900, "drawing_hall": "exclusive", "drawing_hall_text": "exclusive", "living_hall_req": 1, "living_hall_location": 0, "living_hall_width": 20, "living_hall_length": 400, "living_hall_area": 400,
//      "living_hall": " 2 1 2 1", "living_hall_text": "nothing", "kitchen_features": "1 2  4  5" , "kitchen_floor": 0, "kitchen_length": 87, "kitchen_width": 87, "kitchen_area": 7569, "kitchen_dining_function": 2, "attach_store_length": 30, "attach_store_width": 30, "attach_store_area": 900, "utility_wash_width": 20, "utility_wash_length": 20, "utility_wash_area": 400, "refrigerator_size": 1, "specific_req": "kj"