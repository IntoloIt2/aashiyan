// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/page_nav_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';
import '../../../components//constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/auth_controller.dart';

void showToast(msg, toastColor, GRAVITY) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 0,
      backgroundColor: toastColor,
      textColor: Colors.white);
}

class FloorStore extends StatefulWidget {
  const FloorStore({Key? key}) : super(key: key);
  static const namedRoute = "/floorstore";
  @override
  State<FloorStore> createState() => _FloorStoreState();
}

class _FloorStoreState extends State<FloorStore> {
  var status;

  String floorStoreArea = "";
  String floorStoreLengthController = '';
  String floorStoreWidthController = '';
  int floorStoreLocationController = 0;
  String liftSpecialRequirementController = '';
  String passengerCapacityControler = '';
  String poojaLengthController = '';
  String poojaWidthController = '';
  String poojaRoomLocationController = '';
  int? project_id;

  String liftArea = "";

  String selectedPoojaPlace = "select room type";
  List<String> poojaPlaceItems = [
    "select room type",
    "proper Room",
    "only place",
  ];

  int poojaRoomLocation = 0;
  String selectedPooja = "select floor";
  List<String> poojaRoomItems = [
    "select floor",
    "Ground floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
  ];

  String selectedStair = "select stair";
  List<String> stairItems = [
    "select stair",
    "U shaped",
    "L saped",
    "Semi circular"
  ];

  String storeFloor = "";
  String poojaRoomArea = "";
  String selectedFloor = "select floor";
  List<String> pantryItems = [
    "select floor",
    "Ground floor",
    "1st floor",
    "2nd floor",
    "3rd floor",
    "other"
  ];

  int passengerCapacity = 0;
  String selectedLift = "select no of passenger";
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
  int floorStoreInt = 0;

  bool requiredLift = false;
  bool? notRequiredLift = false;
  int liftRequirement = 0;

  int poojaRoomReq = 0;
  bool? poojaRoomRequired = false;
  bool? poojaRoomNotRequired = false;
  bool? openHall = false;
  String openingToLiHa = "";

  bool isloading = false;

  // ignore: prefer_typing_uninitialized_variables
  var printData;
  int? pageId;
  Future<void> getData(int? id) async {
    try {
      var response = await http.get(
        Uri.parse(
          "${dotenv.env['APP_URL']}edit-bungalow-floor-store/$id",
          // "http://192.168.0.99:8080/sdplserver/api/edit-bungalow-floor-store/$id",
        ),
      );

      if (response.statusCode == SUCCESS) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          printData = jsonResponse;
          print(printData);
          if (printData != null) {
            storeFloor = printData['bungalow_floor_store']['store_floor'] !=
                    null
                ? printData['bungalow_floor_store']['store_floor'].toString()
                : storeFloor;
            print(storeFloor);
            poojaRoomLocation =
                printData['bungalow_floor_store']['pooja_room_floor'] != null
                    ? int.parse(printData['bungalow_floor_store']
                            ['pooja_room_floor']
                        .toString())
                    : poojaRoomLocation;
            passengerCapacity =
                printData['bungalow_floor_store']['passanger_capacity'] != null
                    ? int.parse(printData['bungalow_floor_store']
                            ['passanger_capacity']
                        .toString())
                    : passengerCapacity;
            print(passengerCapacity);
            selectedLift =
                printData['bungalow_floor_store']['passanger_capacity'] != null
                    ? printData['bungalow_floor_store']['passanger_capacity']
                        .toString()
                    : selectedLift;
            print(selectedLift);
            FloorStoreDetail1 =
                printData["bungalow_floor_store"]["floor_store_req"] == 1
                    ? true
                    : FloorStoreDetail1;
            print("passengerCapacity ===");
            print(FloorStoreDetail1);
            pageId = printData['bungalow_floor_store']['id'];

            FloorStoreDetail2 =
                printData["bungalow_floor_store"]["floor_store_req"] == 0
                ? true
                    : FloorStoreDetail2;
            selectedFloor =
                printData['bungalow_floor_store']['store_floor'] != null
                    ? pantryItems[int.parse(printData['bungalow_floor_store']
                            ['store_floor']
                        .toString())]
                    : (selectedFloor);
            floorStoreLocationController = printData["bungalow_floor_store"]
                        ["store_floor"] !=
                    null
                ? int.parse(
                    printData["bungalow_floor_store"]["store_floor"].toString())
                : floorStoreLocationController;

            floorStoreLengthController =
                printData["bungalow_floor_store"]["floor_store_length"] != null
                    ? printData["bungalow_floor_store"]["floor_store_length"]
                    : floorStoreLengthController;

            floorStoreWidthController = printData["bungalow_floor_store"]
                    ["floor_store_width"] ??
                floorStoreWidthController;
            selectedStair = printData['bungalow_floor_store']['stair_case'] ??
                selectedStair;
            requiredLift = printData["bungalow_floor_store"]["lift_req"] == 1
                ? true
                : requiredLift;

            notRequiredLift = printData["bungalow_floor_store"]["lift_req"] == 0
                ? true
                : notRequiredLift;

            liftSpecialRequirementController =
                printData["bungalow_floor_store"]["lift_special_req"] != null
                    ? printData["bungalow_floor_store"]["lift_special_req"]
                        .toString()
                    : liftSpecialRequirementController;

            poojaRoomRequired =
                printData["bungalow_floor_store"]["pooja_room_req"] == 1
                    ? true
                    : poojaRoomRequired;
            poojaRoomNotRequired =
                printData["bungalow_floor_store"]["pooja_room_req"] == 0
                    ? true
                    : poojaRoomNotRequired;

            selectedPooja =
                printData['bungalow_floor_store']['pooja_room_floor'] != null
                    ? poojaRoomItems[int.parse(printData['bungalow_floor_store']
                            ['pooja_room_floor']
                        .toString())]
                    : (selectedPooja);
            selectedPoojaPlace =
                printData['bungalow_floor_store']['pooja_room_type'] != null
                    ? printData['bungalow_floor_store']['pooja_room_type']
                        .toString()
                    : selectedPoojaPlace;
            poojaLengthController = printData["bungalow_floor_store"]
                    ["pooja_room_length"] ??
                poojaLengthController;

            poojaWidthController = printData["bungalow_floor_store"]
                    ["pooja_room_width"] ??
                poojaWidthController;

            openHall =
                printData["bungalow_floor_store"]["opening_to_li_ha"] != null
                    ? true
                    : openHall;
          }
        });
      }
    } catch (e) {
      // print(e.toString());
    }
  }

  Future<dynamic> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    project_id = prefs.getInt('projectId');

    getData(project_id);
    var decJson;
    if (userData != null) {
      decJson = jsonDecode(userData);
    }
    user_id = decJson['data']['id'];
  }

  late var timer;

  @override
  void initState() {
    super.initState();
    getUserId();

    // Future.delayed(Duration(seconds: 1), () {
    //   setState(() {
    //     isloading = true;
    //   });
    // });
    timer = Timer.periodic(
        Duration(seconds: 2),
        (Timer t) => setState(() {
              isloading = true;
            }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<PageNavProvider>(context, listen: true);

    return isloading == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
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
                            padding: const EdgeInsets.only(right: 10),
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
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: FloorStoreDetail2,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          FloorStoreDetail2 = value;
                                          FloorStoreDetail1 = false;
                                        },
                                      );
                                    },
                                  ),
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
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              hint: Text(selectedFloor),
                              elevation: 16,
                              items: pantryItems.asMap().entries.map((it) {
                                int idx = it.key;
                                String val = it.value;
                                return DropdownMenuItem<String>(
                                  value: it.value,
                                  onTap: () {
                                    storeFloor = idx.toString();
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
                                    selectedFloor = it!;
                                    // printData['bungalow_floor_store']
                                    //     ['store_floor'] = '';
                                    // if (selectedFloor == "select floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['store_floor'] = 0;
                                    // }
                                    // if (selectedFloor == "Ground floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['store_floor'] = 1;
                                    // }
                                    // if (selectedFloor == "1st floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['store_floor'] = 2;
                                    // }
                                    // if (selectedFloor == "2nd floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['store_floor'] = 3;
                                    // }
                                    // if (selectedFloor == "3rd floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['store_floor'] = 4;
                                    // }
                                    // if (selectedFloor == "other") {
                                    //   printData['bungalow_floor_store']
                                    //       ['store_floor'] = 5;
                                    // }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      if (selectedFloor == OTHER_FLOOR) ...[
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.25,
                            child: TextFormField(
                              // controller: txt,
                              initialValue:
                                  floorStoreLocationController.toString(),
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
                                setState(() {
                                  floorStoreLocationController =
                                      int.parse(value);
                                });
                              }),
                            ),
                          ),
                        ),
                        // requirementTextFieldCont(height, width, 0.04, 0.25,
                        //     "other location", floorStoreLocationController),
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
                      //
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            // controller: txt,
                            // initialValue: printData != null &&
                            //         printData["bungalow_floor_store"]
                            //                 ["floor_store_length"] !=
                            //             null
                            //     ? printData["bungalow_floor_store"]
                            //         ["floor_store_length"]
                            //     : '',
                            initialValue: floorStoreLengthController,
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
                              setState(
                                () {
                                  floorStoreLengthController = value;
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15,
                      //     "length", floorStoreLengthController),
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
                            // controller: txt,
                            // initialValue: printData != null &&
                            //         printData["bungalow_floor_store"]
                            //                 ["floor_store_width"] !=
                            //             null
                            //     ? printData["bungalow_floor_store"]
                            //         ["floor_store_width"]
                            //     : '',
                            initialValue: floorStoreWidthController,
                            // initialValue: printData != null
                            //     ? printData["bungalow_floor_store"]
                            //                 ['floor_store_width'] !=
                            //             null
                            //         ? printData["bungalow_floor_store"]
                            //                 ['floor_store_width']
                            //             .toString()
                            //         : ""
                            //     : "",
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
                              setState(() {
                                floorStoreWidthController = value;
                              });
                            }),
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15,
                      //     "Width", floorStoreWidthController),
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
                        margin: const EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: const Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
                            hint: Text(selectedStair),
                            // value: selectedStair,
                            elevation: 16,
                            items: stairItems.asMap().entries.map((it) {
                              int idx = it.key;
                              return DropdownMenuItem<String>(
                                  value: it.value,
                                  onTap: () {
                                    selectedStair = it.key.toString();
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
                                  // "select stair",
                                  // "U shaped",
                                  // "L saped",
                                  // "Semi circular"
                                  selectedStair = it!;
                                },
                              );
                            },
                          ),
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
                                return SizedBox(
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
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Material(
                  elevation: 5,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          elevation: 3,
                          child: Container(
                            margin: const EdgeInsets.all(5),
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
                            padding: const EdgeInsets.only(right: 10),
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
                                            requiredLift = value!;
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
                            padding: const EdgeInsets.only(right: 10),
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
                  Row(
                    children: [
                      requirementText("Passenger capacity"),
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
                                hint: Text(selectedLift),
                                // value: selectedLift,
                                elevation: 16,
                                items: liftItems.asMap().entries.map((it) {
                                  int idx = it.key;
                                  String val = it.value;
                                  return DropdownMenuItem<String>(
                                    value: it.value,
                                    onTap: () {
                                      passengerCapacity = int.parse(it.value);
                                      print(passengerCapacity);
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
                                  setState(() {
                                    selectedLift = it!;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
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

                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.35,
                          child: TextFormField(
                            // controller: txt,
                            // initialValue: printData != null &&
                            //         printData["bungalow_floor_store"]
                            //                 ["lift_special_req"] !=
                            //             null
                            //     ? printData["bungalow_floor_store"]
                            //         ["lift_special_req"]
                            //     : '',

                            initialValue: liftSpecialRequirementController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "lift Requirement",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green

                                ),
                            onChanged: ((value) {
                              setState(() {
                                liftSpecialRequirementController = value;
                              });
                            }),
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, .04, 0.35,
                      //     "lift Requirement", liftSpecialRequirementController)
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
                            padding: const EdgeInsets.only(right: 10),
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
                            padding: const EdgeInsets.only(right: 10),
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
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            // controller: txt,
                            // initialValue: printData != null &&
                            //         printData["bungalow_floor_store"]
                            //                 ["pooja_room_length"] !=
                            //             null
                            //     ? printData["bungalow_floor_store"]
                            //         ["pooja_room_length"]
                            //     : '',
                            initialValue: poojaLengthController,
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
                              setState(() {
                                poojaLengthController = value;
                              });
                            }),
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15,
                      //     "length", poojaLengthController),
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
                            // controller: txt,
                            // initialValue: printData != null &&
                            //         printData["bungalow_floor_store"]
                            //                 ["pooja_room_width"] !=
                            //             null
                            //     ? printData["bungalow_floor_store"]
                            //         ["pooja_room_width"]
                            //     : '',
                            initialValue: poojaWidthController,
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
                              setState(() {
                                poojaWidthController = value;
                              });
                            }),
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15,
                      //     "Width", poojaWidthController),
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
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                hint: Text(selectedPooja),

                                // value: selectedPooja,
                                elevation: 16,
                                items: poojaRoomItems.asMap().entries.map((it) {
                                  int idx = it.key;
                                  return DropdownMenuItem<String>(
                                    value: it.value,
                                    onTap: () {
                                      poojaRoomLocation = idx;
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
                                  setState(() {
                                    selectedPooja = it!;
                                    // if (selectedPooja == "select floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['pooja_room_floor'] = 0;
                                    // }
                                    // if (selectedPooja == "Groung floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['pooja_room_floor'] = 1;
                                    // }
                                    // if (selectedPooja == "1st Floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['pooja_room_floor'] = 2;
                                    // }
                                    // if (selectedPooja == "2nd Floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['pooja_room_floor'] = 3;
                                    // }
                                    // if (selectedPooja == "3rd Floor") {
                                    //   printData['bungalow_floor_store']
                                    //       ['pooja_room_floor'] = 4;
                                    // }
                                    // if (selectedPooja == "other") {
                                    //   printData['bungalow_floor_store']
                                    //       ['pooja_room_floor'] = 5;
                                    // }
                                  });
                                }),
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
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              hint: Text(selectedPoojaPlace),
                              // value: selectedPoojaPlace,
                              elevation: 16,
                              items: poojaPlaceItems.asMap().entries.map((it) {
                                int idx = it.key;
                                return DropdownMenuItem<String>(
                                  value: it.value,
                                  onTap: () {},
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
                                    selectedPoojaPlace = it!;
                                  },
                                );
                              },
                            ),
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
                if (selectedPooja == OTHER_FLOOR) ...[
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.15,
                      child: TextFormField(
                        // controller: txt,
                        // initialValue: printData != null &&
                        //         printData["bungalow_floor_store"]
                        //                 ["pooja_room_floor"] !=
                        //             null
                        //     ? printData["bungalow_floor_store"]["pooja_room_floor"]
                        //     : poojaLengthController,

                        initialValue: printData != null
                            ? printData["project"] != null
                                ? printData["project"]['pooja_room_length']
                                    .toString()
                                : poojaLengthController
                            : poojaLengthController,
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
                          setState(() {
                            poojaLengthController = value;
                          });
                        }),
                      ),
                    ),
                  ),
                  // Material(
                  //   elevation: 5,
                  //   child: requirementTextFieldCont(height, width, 0.04, 1,
                  //       "other location", poojaLengthController),
                  // ),
                ],
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
                                  return SizedBox(
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
                      requirementText("Opening toward hall/ lobby"),
                      const Card(),
                      Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                GestureDetector(
                  onTap: () => {
                    setState(
                      () {
                        if (FloorStoreDetail1 == true) {
                          floorStoreInt = T_RUE;

                          // if (selectedFloor == G_FLOOR_TEXT) {
                          //   storeFloor = G_FLOOR.toString();
                          // }
                          // if (selectedFloor == G_1_FLOOR_TEXT) {
                          //   storeFloor = G_1_FLOOR.toString();
                          // }
                          // if (selectedFloor == G_2_FLOOR_TEXT) {
                          //   storeFloor = G_2_FLOOR.toString();
                          // }
                          // if (selectedFloor == G_3_FLOOR_TEXT) {
                          //   storeFloor = G_3_FLOOR.toString();
                          // }
                          // if (selectedFloor == OTHER_FLOOR_TEXT) {
                          //   storeFloor = floorStoreLocationController.toString();
                          // }
                        }
                        if (requiredLift == true) {
                          liftRequirement = T_RUE;

                          // passengerCapacity = int.parse(selectedFloor);
                          // if (selectedFloor == "4") {
                          //   passengerCapacity = 1;
                          // }
                          // if (selectedFloor == "6") {
                          //   passengerCapacity = 2;
                          // }
                          // if (selectedFloor == "8") {
                          //  passengerCapacity = 3;
                          // }
                          // if (selectedFloor == "10") {
                          //   passengerCapacity = 4;
                          // }
                          // if (selectedFloor == "more") {
                          //   passengerCapacity =int.parse(passengerCapacityControler.text);
                          // }
                          // passengerCapacity = int.parse(selectedLift);

                        } else {
                          liftRequirement = F_ALSE;
                        }

                        if (poojaRoomRequired == true) {
                          poojaRoomReq = T_RUE;

                          // if (selectedPooja == G_FLOOR_TEXT) {
                          //   poojaRoomLocation = STR_ZERO;
                          // }
                          // if (selectedPooja == G_1_FLOOR_TEXT) {
                          //   poojaRoomLocation = STR_ONE;
                          // }
                          // if (selectedPooja == G_2_FLOOR_TEXT) {
                          //   poojaRoomLocation = STR_TWO;
                          // }
                          // if (selectedPooja == G_3_FLOOR_TEXT) {
                          //   poojaRoomLocation = STR_THREE;
                          // }
                          // if (selectedPooja == OTHER_FLOOR) {
                          //   poojaRoomLocation = poojaRoomLocationController;
                          // }
                        } else {
                          poojaRoomReq = F_ALSE;
                        }
                        if (openHall == true) {
                          openingToLiHa = OPENING_TO_LIVING_HALL;
                        } else {
                          openingToLiHa = '';
                        }
                      },
                    ),
                    print("project_id"),
                    print(project_id),
                    if (pageId != null)
                      {
                        // print("updating a data "),
                        status = flooreStorePut(
                          project_id!,
                          floorStoreInt,
                          floorStoreLengthController,
                          floorStoreWidthController,
                          storeFloor,
                          selectedStair,
                          liftRequirement,
                          liftSpecialRequirementController,
                          passengerCapacity,
                          poojaRoomReq,
                          poojaLengthController,
                          poojaWidthController,
                          poojaRoomLocation,
                          selectedPoojaPlace,
                          openingToLiHa,
                        ),
                        if (status == SUCCESS)
                          {
                            showToast('Pantry Requirement submitted !',
                                Colors.lightGreen, ToastGravity.TOP)
                          }
                      }
                    else
                      {
                       status = flooreStorePost(
                          project_id!,
                          floorStoreInt,
                          floorStoreLengthController,
                          floorStoreWidthController,
                          storeFloor,
                          selectedStair,
                          liftRequirement,
                          liftSpecialRequirementController,
                          passengerCapacity,
                          poojaRoomReq,
                          poojaLengthController,
                          poojaWidthController,
                          poojaRoomLocation,
                          selectedPoojaPlace,
                          openingToLiHa,
                        ),
                        if (status == SUCCESS)
                          {
                            showToast('Pantry Requirement submitted !',
                                Colors.lightGreen, ToastGravity.TOP)
                          }
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
