import 'dart:async';
import 'dart:convert';
import 'package:aashiyan/components/constant.dart';
import 'package:aashiyan/controller/auth_controller.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/page_nav_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  var user_id;

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
  var floor_id;
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
  int refrigeratorSize = 0;

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

  void showToast(msg, toastColor, GRAVITY) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 0,
        backgroundColor: toastColor,
        textColor: Colors.white);
  }

  Future<void> getData(int id) async {
    try {
      var response = await http.get(
          Uri.parse("${dotenv.env['APP_URL']}edit-bungalow-drawing-hall/$id"));

      if (response.statusCode == SUCCESS) {
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
                  : INT_ZERO;

              livingRequired =
                  printData['bungalow_drawing_hall']['drawing_hall_req'] != null
                      ? printData['bungalow_drawing_hall']
                              ['drawing_hall_req'] ==
                          T_RUE
                      : false;
              livingNotRequired =
                  printData['bungalow_drawing_hall']['drawing_hall_req'] != null
                      ? printData['bungalow_drawing_hall']
                              ['drawing_hall_req'] ==
                          F_ALSE
                      : false;
              drawingHallRequired =
                  printData["bungalow_drawing_hall"]["living_hall_req"] != null
                      ? printData["bungalow_drawing_hall"]["living_hall_req"] ==
                          T_RUE
                      : false;
              drawingHallNotRequired =
                  printData["bungalow_drawing_hall"]["living_hall_req"] != null
                      ? printData["bungalow_drawing_hall"]["living_hall_req"] ==
                          F_ALSE
                      : false;
              selectedKitchen =
                  printData["bungalow_drawing_hall"]["kitchen_floor"] != null
                      ? kitchenItems[printData["bungalow_drawing_hall"]
                          ["kitchen_floor"]]
                      : selectedKitchen;

              KitchenFloor =
                  printData["bungalow_drawing_hall"]["kitchen_floor"] != null
                      ? int.parse(printData["bungalow_drawing_hall"]
                              ["kitchen_floor"]
                          .toString())
                      : KitchenFloor;

              print("kitchen   ${selectedKitchen}");

              selectedKitchenFunction = printData['bungalow_drawing_hall']
                          ['kitchen_dining_function'] !=
                      null
                  ? kitchenFunctionItems[printData['bungalow_drawing_hall']
                      ['kitchen_dining_function']]
                  : selectedKitchenFunction;
              kitchenDiningFunction = printData['bungalow_drawing_hall']
                          ['kitchen_dining_function'] !=
                      null
                  ? printData['bungalow_drawing_hall']
                          ['kitchen_dining_function']
                      .toString()
                  : kitchenDiningFunction;
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
              livingHallLocation = printData["bungalow_drawing_hall"]
                          ["living_hall_location"] !=
                      null
                  ? int.parse(printData["bungalow_drawing_hall"]
                          ["living_hall_location"]
                      .toString())
                  : livingHallLocation;

              DrawingSelected = printData["bungalow_drawing_hall"]
                          ["drawing_hall_location"] !=
                      null
                  ? DrawingItems[printData["bungalow_drawing_hall"]
                      ["drawing_hall_location"]]
                  : DrawingSelected;

              drawingHallLocation = printData["bungalow_drawing_hall"]
                          ["drawing_hall_location"] !=
                      null
                  ? int.parse(printData["bungalow_drawing_hall"]
                          ["drawing_hall_location"]
                      .toString())
                  : drawingHallLocation;

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
              // attachedLengthController = printData['bungalow_drawing_hall']
              //             ['attach_store_length'] !=
              //         null
              //     ? printData['bungalow_drawing_hall']['attach_store_length']
              //         .toString()
              //     : '';
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
                          .toString()
                      : '';
              livingHall =
                  printData['bungalow_drawing_hall']['living_hall'] != null
                      ? printData['bungalow_drawing_hall']['living_hall']
                          .toString()
                          .split(",")
                      : [];

              // print("livingHall");
              // print(livingHall);
              if (livingHall != null) {
                if (livingHall.contains('1') &&
                    !otherFeatures.contains("Double Height")) {
                  // print("object 1");
                  otherFeatures.add(otherItems[0]);
                }
                if (livingHall.contains('2') &&
                    !otherFeatures.contains("Powder Toilet")) {
                  // print("object 2");
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

  Future<dynamic> getFloorId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    floor_id = prefs.getInt('floorId')!;

    print("floor_id == ");
    print(floor_id);

    // getData(project_id);
    // var decJson;
    // if (userData != null) {
    //   decJson = jsonDecode(userData);
    // }
    // user_id = decJson['data']['id'];
  }

  Future<dynamic> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    project_id = prefs.getInt('projectId')!;

    getData(project_id);
    var decJson;
    if (userData != null) {
      decJson = jsonDecode(userData);
    }
    user_id = decJson['data']['id'];
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

  late var timer;

  @override
  void initState() {
    super.initState();
    getFloorId();
    final store = Provider.of<PageNavProvider>(context, listen: false);

    getUserId();

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

    return isloading == false
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
                                items: floorItems.asMap().entries.map((it) {
                                  int idx = it.key;
                                  String val = it.value;

                                  return DropdownMenuItem<String>(
                                    value: it.value,
                                    onTap: () async {
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();

                                      livingHallLocation = it.key;
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
                      // if (selectedFloor == OTHER_FLOOR) ...[
                      //   requirementTextField(
                      //       height, width, 0.04, 0.25, "other location"),
                      // ]
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
                            // initialValue: printData != null &&
                            //         printData['bungalow_drawing_hall']
                            //                 ['living_hall_length'] !=
                            //             null
                            //     ? printData['bungalow_drawing_hall']
                            //         ['living_hall_length']
                            //     : LivingHallLengthController,
                            initialValue: LivingHallLengthController,

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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            // initialValue: printData != null &&
                            //         printData['bungalow_drawing_hall']
                            //                 ['living_hall_width'] !=
                            //             null
                            //     ? printData['bungalow_drawing_hall']
                            //         ['living_hall_width']
                            //     : "",

                            initialValue: LivingHallWidthController,

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
                      if (selectedFeatures == OTHER_FLOOR) ...[
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.2,
                            child: TextFormField(
                              initialValue: ohterLivingHallController,
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
                            // initialValue: printData != null &&
                            //         printData['bungalow_drawing_hall']
                            //                 ['drawing_hall_text'] !=
                            //             null
                            //     ? printData['bungalow_drawing_hall']
                            //         ['drawing_hall_text']
                            //     : "",
                            initialValue: livingSpecialFeaturesController,
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
                                        drawingHallLocation = it.key;
                                        // print(drawingHallLocation);
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
                      if (DrawingSelected == CONST_OTHER_OPEN) ...[
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
                            initialValue: drawingHallLengthController,
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
                              // print(drawingHallLengthController);
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
                            initialValue: drawingHallWidthController,
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
                              // print(drawingHallWidthController);
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
                          width: width * 0.3,
                          child: TextFormField(
                            initialValue: drawingSpecialFeaturesController,
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
                                  child: Icon(Icons.arrow_downward),
                                ),
                                hint: Text(selectedKitchen),
                                elevation: 16,
                                items: kitchenItems.asMap().entries.map((it) {
                                  int idx = it.key;
                                  String val = it.value;
                                  return DropdownMenuItem<String>(
                                    value: it.value,
                                    onTap: () async {
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      var floorCount =
                                          prefs.getInt('floorCount')!;
                                      if (idx <= floorCount) {
                                        KitchenFloor = it.key;
                                      } else {
                                        KitchenFloor = INT_ZERO;
                                      }
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
                    // if (selectedFloor == OTHER_FLOOR) ...[
                    //   requirementTextField(
                    //       height, width, 0.04, 0.25, "other location"),
                    // ]
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

                          // initialValue: printData != null &&
                          //         printData['bungalow_drawing_hall']
                          //                 ['kitchen_length'] !=
                          //             null
                          //     ? printData['bungalow_drawing_hall']
                          //         ['kitchen_length']
                          //     : '',
                          initialValue: KitchenLengthController,
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
                          // initialValue: printData != null
                          //     ? printData['bungalow_drawing_hall']
                          //                 ['kitchen_width'] !=
                          //             null
                          //         ? printData['bungalow_drawing_hall']
                          //                 ['kitchen_width']
                          //             .toString()
                          //         : ''
                          //     : '',
                          initialValue: kitchenWidthController,
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
                        width: width * 0.65,
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
                                  .asMap()
                                  .entries
                                  .map((it) {
                                int idx = it.key;
                                String value = it.value;
                                return DropdownMenuItem<String>(
                                  value: it.value,
                                  onTap: () {
                                    kitchenDiningFunction = it.key.toString();
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
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
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
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            initialValue: attachedLengthController,
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
                            initialValue: attachedWidthController,
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
                            initialValue: utilityLengthController,
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
                            initialValue: utilityWidthController,
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
                          initialValue: specificReq,
                          // initialValue: printData != null &&
                          //         printData['bungalow_drawing_hall']
                          //                 ['specific_req'] !=
                          //             null
                          //     ? printData['bungalow_drawing_hall']
                          //             ['specific_req']
                          //         .toString()
                          //     : specificReq,
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
                            // print("spc");
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
                  onTap: () async {
                    setState(
                      () {
                        if (selectedRefrigerator == REFRI_SINGLE_DOOR) {
                          refrigeratorSize = INT_ONE;
                        }

                        if (selectedRefrigerator == REFRI_DOUBLE_DOOR) {
                          refrigeratorSize = INT_TWO;
                        }

                        if (selectedRefrigerator == KITCHEN_REASONABLE_OPEN) {
                          refrigeratorSize = INT_THREE;
                        }
                        if (livingRequired == true) {
                          if (selectedFloor == G_1_FLOOR_TEXT) {
                            livingHallLocation = G_FLOOR;
                          }

                          if (selectedFloor == G_2_FLOOR_TEXT) {
                            livingHallLocation = FIRST_FLOOR;
                          }

                          if (selectedFloor == G_3_FLOOR_TEXT) {
                            livingHallLocation = SECOND_FLOOR;
                          }

                          if (selectedFloor == OTHER_FLOOR_TEXT) {
                            livingHallLocation =
                                int.parse(ohterLivingHallController);
                          }
                          livingHall = [];

                          for (int i = 0; i < otherFeatures.length; i++) {
                            if (otherFeatures[i] == LIV_POWDER_TOILET &&
                                !livingHall.contains('1')) {
                              livingHall.add("1");
                            }
                            if (otherFeatures[i] == LIV_DOUBLE_HEIGHT &&
                                !livingHall.contains('2')) {
                              livingHall.add("2");
                            }
                          }
                        }

                        if (livingRequired == true) {
                          livingHallInt = INT_ONE;
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

                        if(drawingHallRequired == true) {
                          drawingInt = INT_ONE;
                        }

                        // if (selectedKitchenFunction == KITCHEN_FULL_OPEN) {
                        //   kitchenDiningFunction = CONST_FULL_OPEN;
                        // }

                        // if (selectedKitchenFunction == KITCHEN_PARTIAL_OPEN) {
                        //   kitchenDiningFunction = CONST_PARTIAL_OPEN;
                        // }
                        // if (selectedKitchenFunction ==
                        //     KITCHEN_REASONABLE_OPEN) {
                        //   kitchenDiningFunction = CONST_REASONABLE_OPEN;
                        // }

                        // if (selectedKitchen == G_FLOOR_TEXT) {
                        //   KitchenFloor = G_FLOOR;
                        // } else if (selectedKitchen == G_1_FLOOR_TEXT) {
                        //   KitchenFloor = G_1_FLOOR;
                        // } else if (selectedKitchen == G_2_FLOOR_TEXT) {
                        //   KitchenFloor = G_2_FLOOR;
                        // } else if (selectedKitchen == G_3_FLOOR_TEXT) {
                        //   KitchenFloor = G_3_FLOOR;
                        // } else if (selectedKitchen == G_4_FLOOR_TEXT) {
                        //   KitchenFloor = MORE_FLOOR;
                        // }

                        if (DrawingSelected == CONST_OTHER_OPEN) {
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
                      // print(pageId);
                      // print(drawingHallLengthController);
                      // print(LivingHallWidthController);
                      // print("update===");

                      var status = await livingHallput(
                        user_id,
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

                      if (status == SUCCESS) {
                        showToast('Living Hall Requirement Updated !',
                            Colors.lightGreen, ToastGravity.TOP);
                      }
                    } else {
                      print("post==");
                      var status = await livingHallPost(
                        user_id,
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
                      if (status == SUCCESS) {
                        showToast('Living Hall Requirement submitted!',
                            Colors.lightGreen, ToastGravity.TOP);
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
