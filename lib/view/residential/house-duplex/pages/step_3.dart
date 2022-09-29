import 'dart:convert';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../components/forms.dart';
import '../../../../const.dart';
import '../../../../controller/api_services.dart';
import 'package:http/http.dart' as http;

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

  int livingHallLocation = 1;
  String livingHallArea = "";
  String drawingHallLengthController = " ";
  String drawingHallWidthController = " ";
  String drawingSpecialFeaturesController = " ";
  String livingSpecialFeaturesController = " ";
  String LivingHallWidthController = " ";
  String LivingHallLengthController = " ";
  String KitchenLengthController = " ";
  String attachedLengthController = " ";
  String kitchenWidthController = " ";
  String attachedWidthController = " ";
  String utilityLengthController = " ";
  String utilityWidthController = " ";
  String specificReq = " ";
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

  var printData;

  Future<void> getData() async {
    try {
      // var client = http.Client();

      http: //sdplweb.com/sdpl/api/edit-bungalow-drawing-hall/project_id
      var response = await http.get(Uri.parse(
          "http://192.168.0.99:8080/sdplserver/api/edit-bungalow-drawing-hall/179"));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          printData = jsonResponse;
          print(printData);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool isloading = false;

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
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: printData['bungalow_drawing_hall']
                                                  ['drawing_hall_req'] ==
                                              1
                                          ? true
                                          : livingRequired,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            print(printData['status']);
                                            livingRequired = value;
                                            livingNotRequired = false;
                                            printData['bungalow_drawing_hall']
                                                ['drawing_hall_req'] = 2;
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
                                    value: printData['bungalow_drawing_hall']
                                                ['drawing_hall_req'] ==
                                            0
                                        ? true
                                        : livingNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        livingNotRequired = value;
                                        livingRequired = false;
                                        printData['bungalow_drawing_hall']
                                            ['drawing_hall_req'] = 2;
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
                if (livingRequired == true ||
                    printData['bungalow_drawing_hall']['drawing_hall_req'] ==
                        1) ...[
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
                                hint: printData["bungalow_drawing_hall"]
                                            ["drawing_hall_location"] !=
                                        null
                                    ? Text(
                                        floorItems[
                                            printData["bungalow_drawing_hall"]
                                                ["drawing_hall_location"]],
                                      )
                                    : Text(selectedFloor),
                                // value: selectedFloor,
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
                                onChanged: (it) {
                                  setState(
                                    () {
                                      selectedFloor = it!;

                                      if (selectedFloor == "Select") {
                                        printData["bungalow_drawing_hall"]
                                            ["drawing_hall_location"] = 0;
                                      }
                                      if (selectedFloor == "Ground floor") {
                                        printData["bungalow_drawing_hall"]
                                            ["drawing_hall_location"] = 1;
                                      }
                                      if (selectedFloor == "1st Floor") {
                                        printData["bungalow_drawing_hall"]
                                            ["drawing_hall_location"] = 2;
                                      }
                                      if (selectedFloor == "2nd Floor") {
                                        printData["bungalow_drawing_hall"]
                                            ["drawing_hall_location"] = 3;
                                      }
                                      if (selectedFloor == "3rd Floor") {
                                        printData["bungalow_drawing_hall"]
                                            ["drawing_hall_location"] = 4;
                                      }
                                      if (selectedFloor == "other") {
                                        printData["bungalow_drawing_hall"]
                                            ["drawing_hall_location"] = 5;
                                      }
                                      print(selectedFloor);
                                      print(printData["bungalow_drawing_hall"]
                                          ["drawing_hall_location"]);
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
                            initialValue: printData['bungalow_drawing_hall']
                                ['drawing_hall_length'],
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
                            initialValue: printData['bungalow_drawing_hall']
                                ['drawing_hall_width'],
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
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.2,
                            child: TextFormField(
                              initialValue: printData['bungalow_drawing_hall']
                                  ['drawing_hall_location'],
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.2,
                          child: TextFormField(
                            initialValue: printData['bungalow_drawing_hall']
                                ['drawing_hall_text'],
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
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: printData["bungalow_drawing_hall"]
                                                  ["living_hall_req"] ==
                                              1
                                          ? true
                                          : drawingHallRequired,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            drawingHallRequired = value;
                                            drawingHallNotRequired = false;
                                            printData["bungalow_drawing_hall"]
                                                ["living_hall_req"] = 2;
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
                                      value: printData["bungalow_drawing_hall"]
                                                  ["living_hall_req"] ==
                                              0
                                          ? true
                                          : drawingHallNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          drawingHallNotRequired = value;
                                          drawingHallRequired = false;
                                          value:
                                          printData["bungalow_drawing_hall"]
                                              ["living_hall_req"] = 2;
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
                if (drawingHallRequired == true ||
                    printData["bungalow_drawing_hall"]["living_hall_req"] ==
                        1) ...[
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
                                hint: printData["bungalow_drawing_hall"]
                                            ["living_hall_location"] !=
                                        null
                                    ? Text(
                                        DrawingItems[
                                            printData["bungalow_drawing_hall"]
                                                ["living_hall_location"]],
                                      )
                                    : Text(DrawingSelected),
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
                                onChanged: (it) {
                                  setState(
                                    () {
                                      DrawingSelected = it!;
                                      if (DrawingSelected == "Select") {
                                        // drawingHallLocation = 1;
                                        printData["bungalow_drawing_hall"]
                                            ["living_hall_location"] = 0;
                                      }
                                      if (DrawingSelected == "Ground floor") {
                                        drawingHallLocation = 1;
                                        printData["bungalow_drawing_hall"]
                                            ["living_hall_location"] = 1;
                                      }

                                      if (DrawingSelected == "1st Floor") {
                                        drawingHallLocation = 2;
                                        printData["bungalow_drawing_hall"]
                                            ["living_hall_location"] = 2;
                                      }
                                      if (DrawingSelected == "2nd Floor") {
                                        drawingHallLocation = 3;
                                        printData["bungalow_drawing_hall"]
                                            ["living_hall_location"] = 3;
                                      }

                                      if (DrawingSelected == "3rd Floor") {
                                        drawingHallLocation = 4;
                                        printData["bungalow_drawing_hall"]
                                            ["living_hall_location"] = 4;
                                      }
                                      if (DrawingSelected == "other") {
                                        printData["bungalow_drawing_hall"]
                                            ["living_hall_location"] = 5;
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
                            initialValue: printData['bungalow_drawing_hall']
                                ['living_hall_length'],
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
                            initialValue: printData['bungalow_drawing_hall']
                                ['living_hall_width'],
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
                      requirementText("Special"),
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
                            initialValue: printData['bungalow_drawing_hall']
                                ['living_hall_text'],
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
                          margin: EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                hint: printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] !=
                                        null
                                    ? Text(kitchenItems[
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"]])
                                    : Text(selectedKitchen),

                                //value: selectedKitchen,
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
                                onChanged: (it) {
                                  setState(
                                    () {
                                      selectedKitchen = it!;
                                      print(selectedKitchen);
                                      if (selectedKitchen == "Select") {
                                        KitchenFloor = "0";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 0;
                                      }
                                      if (selectedKitchen == "Ground floor") {
                                        KitchenFloor = "1";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 1;
                                      }
                                      if (selectedKitchen == "1st Floor") {
                                        KitchenFloor = "2";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 2;
                                      }
                                      if (selectedKitchen == "2nd Floor") {
                                        KitchenFloor = "3";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 3;
                                      }
                                      if (selectedKitchen == "3rd Floor") {
                                        KitchenFloor = "4";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 4;
                                      }
                                      if (selectedKitchen == "other") {
                                        KitchenFloor = "4";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 5;
                                      }
                                      print(printData["bungalow_drawing_hall"]
                                          ["kitchen_floor"]);
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
                          initialValue: printData['bungalow_drawing_hall']
                                      ['kitchen_length'] ==
                                  null
                              ? ""
                              : printData['bungalow_drawing_hall']
                                  ['kitchen_length'],
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
                          initialValue: printData['bungalow_drawing_hall']
                              ['kitchen_width'],
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
                      width: width * 0.01,
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
                              hint: printData['bungalow_drawing_hall']
                                          ['kitchen_dining_function'] !=
                                      null
                                  ? Text(kitchenFunctionItems[
                                      printData['bungalow_drawing_hall']
                                          ['kitchen_dining_function']])
                                  : Text(selectedKitchenFunction),
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
                                  if (selectedKitchenFunction ==
                                      "Selecting dining function") {
                                    printData['bungalow_drawing_hall']
                                        ['kitchen_dining_function'] = 0;
                                  }
                                  if (selectedKitchenFunction ==
                                      "full open to dining ") {
                                    printData['bungalow_drawing_hall']
                                        ['kitchen_dining_function'] = 2;
                                  }
                                  if (selectedKitchenFunction ==
                                      "partial open to dining") {
                                    printData['bungalow_drawing_hall']
                                        ['kitchen_dining_function'] = 3;
                                  }
                                  if (selectedKitchenFunction ==
                                      "open with a door") {
                                    printData['bungalow_drawing_hall']
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: printData['bungalow_drawing_hall']
                                ['attach_store_length'],
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
                            initialValue: printData['bungalow_drawing_hall']
                                ['attach_store_width'],
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: printData['bungalow_drawing_hall']
                                ['utility_wash_length'],
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
                            initialValue: printData['bungalow_drawing_hall']
                                ['utility_wash_width'],
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
                          initialValue: printData['bungalow_drawing_hall']
                              ['utility_wash_width'],
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
                  height: height * 0.02,
                ),
                requirementText("Dining Details"),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    requirementText("Floor"),
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
                                hint: printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] !=
                                        null
                                    ? Text(kitchenItems[
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"]])
                                    : Text(selectedKitchen),

                                //value: selectedKitchen,
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
                                onChanged: (it) {
                                  setState(
                                    () {
                                      selectedKitchen = it!;
                                      print(selectedKitchen);
                                      if (selectedKitchen == "Select") {
                                        KitchenFloor = "0";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 0;
                                      }
                                      if (selectedKitchen == "Ground floor") {
                                        KitchenFloor = "1";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 1;
                                      }
                                      if (selectedKitchen == "1st Floor") {
                                        KitchenFloor = "2";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 2;
                                      }
                                      if (selectedKitchen == "2nd Floor") {
                                        KitchenFloor = "3";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 3;
                                      }
                                      if (selectedKitchen == "3rd Floor") {
                                        KitchenFloor = "4";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 4;
                                      }
                                      if (selectedKitchen == "other") {
                                        KitchenFloor = "4";
                                        printData["bungalow_drawing_hall"]
                                            ["kitchen_floor"] = 5;
                                      }
                                      print(printData["bungalow_drawing_hall"]
                                          ["kitchen_floor"]);
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
                    ],
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.36,
                        child: TextFormField(
                          initialValue: printData['bungalow_drawing_hall']
                              ['kitchen_width'],
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
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: width * 0.2),
                      padding: EdgeInsets.all(1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              requirementText("Length"),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(5),
                                elevation: 1,
                                child: Container(
                                    width: width * 0.15,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          hintText: "Length",
                                          hintStyle: TextStyle(fontSize: 14),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(0)),
                                      // initialValue: "dinging",
                                      onChanged: (value) {},
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Row(
                            children: [
                              requirementText("Width"),
                              Material(
                                borderRadius: BorderRadius.circular(5),
                                elevation: 1,
                                child: Container(
                                    width: width * 0.15,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          hintText: "width",
                                          hintStyle: TextStyle(fontSize: 14),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(1)),
                                      // initialValue: porchLength.toString(),
                                      onChanged: (value) {
                                        // porchLength = int.parse(value);
                                      },
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text("Help")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    requirementText("Dining"),
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
                              hint: printData["bungalow_drawing_hall"]
                                          ["drawing_hall_location"] !=
                                      null
                                  ? Text(
                                      floorItems[
                                          printData["bungalow_drawing_hall"]
                                              ["drawing_hall_location"]],
                                    )
                                  : Text(selectedFloor),
                              // value: selectedFloor,
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
                              onChanged: (it) {
                                setState(
                                  () {
                                    selectedFloor = it!;

                                    if (selectedFloor == "Select") {
                                      printData["bungalow_drawing_hall"]
                                          ["drawing_hall_location"] = 0;
                                    }
                                    if (selectedFloor == "Ground floor") {
                                      printData["bungalow_drawing_hall"]
                                          ["drawing_hall_location"] = 1;
                                    }
                                    if (selectedFloor == "1st Floor") {
                                      printData["bungalow_drawing_hall"]
                                          ["drawing_hall_location"] = 2;
                                    }
                                    if (selectedFloor == "2nd Floor") {
                                      printData["bungalow_drawing_hall"]
                                          ["drawing_hall_location"] = 3;
                                    }
                                    if (selectedFloor == "3rd Floor") {
                                      printData["bungalow_drawing_hall"]
                                          ["drawing_hall_location"] = 4;
                                    }
                                    if (selectedFloor == "other") {
                                      printData["bungalow_drawing_hall"]
                                          ["drawing_hall_location"] = 5;
                                    }
                                    print(selectedFloor);
                                    print(printData["bungalow_drawing_hall"]
                                        ["drawing_hall_location"]);
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
                    requirementText("Special requirement"),
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
                          initialValue: printData['bungalow_drawing_hall']
                              ['utility_wash_width'],
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Special requirement",
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
                  height: height * 0.02,
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
                InkWell(
                  onTap: () {
                    setState(() {
                      int kitch = int.parse(KitchenLengthController) *
                          int.parse(kitchenWidthController);
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
                              int.parse(ohterLivingHallController);
                        }
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
                        int utility = int.parse(utilityLengthController) *
                            int.parse(utilityWidthController);
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
                        int attach = int.parse(attachedLengthController) *
                            int.parse(attachedWidthController);
                        attachStoreArea = attach.toString();
                      }

                      if (drawingHallRequired == true) {
                        drawingInt = 1;
                        int drawing = int.parse(drawingHallLengthController) *
                            int.parse(drawingHallWidthController);
                        drawingArea = drawing.toString();
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
                        printData["bungalow_drawing_hall"]
                            ["living_hall_location"] = 5;
                        drawingHallLocation =
                            int.parse(otherDrawingHallLocationController);
                      }
                      if (attachStoreArea == true) {}
                      int kitchen = int.parse(KitchenLengthController) *
                          int.parse(kitchenWidthController);
                      kitchenArea = kitchen.toString();
                    });
                    livingHallPost(
                      drawingInt,
                      drawingHallLocation,
                      drawingHallLengthController,
                      drawingHallWidthController,
                      drawingArea,
                      drawingSpecialFeaturesController,
                      drawingSpecialFeaturesController,
                      livingHallInt,
                      livingHallLocation,
                      LivingHallLengthController,
                      LivingHallWidthController,
                      livingHallArea,
                      livingHall,
                      livingSpecialFeaturesController,
                      kitchenFeatures,
                      KitchenFloor,
                      KitchenLengthController,
                      kitchenWidthController,
                      kitchenArea,
                      kitchenDiningFunction,
                      attachedLengthController,
                      attachedWidthController,
                      attachStoreArea,
                      utilityWidthController,
                      utilityLengthController,
                      utilityWashArea,
                      refrigeratorSize,
                      specificReq,
                    );
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
