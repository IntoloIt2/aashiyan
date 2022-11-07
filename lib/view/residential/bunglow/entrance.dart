import 'dart:convert';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/page_nav_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/constant.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';
import 'package:http/http.dart' as http;

import '../../../utils/helpers.dart';

class HintDailog extends StatefulWidget {
  int segment_id;
  HintDailog({required this.segment_id});
  @override
  _HintDailogState createState() => _HintDailogState();
}

class _HintDailogState extends State<HintDailog> {
  var data;
  Future futureCall() async {
    var plotArea = plotValue.text;
    var area_id;
    if ((int.parse(plotArea) >= 800) && (int.parse(plotArea) <= 1200)) {
      area_id = AREA_800_1200;
    } else if ((int.parse(plotArea) >= 1201) && (int.parse(plotArea) <= 2000)) {
      area_id = AREA_1200_2000;
    } else if ((int.parse(plotArea) >= 2001) && (int.parse(plotArea) <= 5000)) {
      area_id = AREA_2000_5000;
    } else if ((int.parse(plotArea) >= 5001) &&
        (int.parse(plotArea) <= 10000)) {
      area_id = AREA_5000_10000;
    } else if ((int.parse(plotArea) >= 10001) &&
        (int.parse(plotArea) <= 50000)) {
      area_id = AREA_10000_50000;
    }

    var response = await http.get(Uri.parse(
        'https://sdplweb.com/sdpl/api/area-suggest/$area_id/${widget.segment_id}'));
    print("$area_id======");
    final jsonResponse = jsonDecode(response.body);
    final finalart = jsonResponse['areas'] as List;
    print(finalart);
    setState(() {
      data = finalart;
      print(data);
      // if(data != null) {
      //   hasData = true;
      //   print("hasData");
      //   print(hasData);
      // }
    });

    // await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCall(),
      builder: (_, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          Future(() {
            // Future Callback
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Employee Data'),
                content: Container(
                  padding: EdgeInsets.only(top: 15),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: requirementText(
                              "${data[index]['suggest_length_ft']} X ${data[index]['suggest_width_ft']} ft",
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          });
          return Container();
        }
      },
    );
  }
}

class Entrance extends StatefulWidget {
  const Entrance({Key? key}) : super(key: key);
  static const namedRoute = "/entrance";

  @override
  State<Entrance> createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  List<String> floors = [
    "Select",
    "1(G)",
    "2(G+1)",
    "3(G+2)",
    "4(G+3)",
    // "more"
  ];

  String selectedFloor = "Select";
  int floorInt = 1;
  String twoGateType = '';

  String floorController = " ";
  String gateWidthController = " ";
  TextEditingController selectedCarGateController = TextEditingController();
  TextEditingController selectedSidePadestController = TextEditingController();
  String diffrentCustomizedLocationController = " ";
  String securityKioskLengthController = " ";
  String securityKioskWidthController = " ";
  String porchLengthController = " ";
  String porchWidthController = ' ';
  String noOfCar = ' ';
  String foyerWidthController = ' ';
  String foyerLengthController = ' ';
  String verandaWidthController = ' ';
  String verandaLengthController = ' ';
  List porchRequiredFaci = [];

  var project_id;

  void floor() {
    setState(() {
      if (selectedFloor == ENT_FIRST_FLOOR) {
        floorInt = FIRST_FLOOR;
      }
      if (selectedFloor == ENT_SECOND_FLOOR) {
        floorInt = SECOND_FLOOR;
      }
      if (selectedFloor == ENT_THIRD_FLOOR) {
        floorInt = THIRD_FLOOR;
      }
      // if (selectedFloor == ENT_MORE_FLOOR) {
      //   floorInt = int.parse(floorController);
      // }
    });
  }

  List<String> lobbyDesign = [
    "Select",
    "Hilighter/welcome wall",
    "shoe rack space"
  ];

  String SelectedLobbyDesign = "Select";

  List<String> entranceGates = ["Select", "10", "12", "14", "more"];
  String entranceSelectedGates = "Select";

  List<String> noOfCars = ["Select", "1", "2", "3", "4", "5", "more"];
  String SelectedCar = "Select";

  List<String> carGate = ["Select", "10", "12", "14", "more"];
  String selectedCarGate = "Select";

  List<String> sidePadest = ["Select", "3", "4", "more"];
  String selectedSidePadest = "Select";

  String securityKiosqArea = "";

  List<String> visualItems = [
    "Select",
    "single height",
    "Double height",
  ];
  String selectedVisual = "Select";

  // List<String> carParkingItems = ["Select", "1", "2", "3", "4", "5", "more"];
  // String selectedCarParking = "Select";

  bool? outSideOpen = false;
  bool? outSideClosed = false;

  bool? requiredVeranda = false;
  bool? notReqiredVeranda = false;
  int requiredVerandaInt = 0;
  String verandaArea = "0";

  bool? requiredWelcomeLobyy = false;
  int? requiredWelcomeLobyyInt = 0;
  String foyerArea = "0";
  String veranda = '0';

  bool? notReqiredWelcomeLobby = false;

  bool? carparking = false;
  String carParkingString = "0";

  bool? visualNature = false;
  String visualNaturString = "0";

  bool? securityRequired = false;
  int securityReqInt = 0;

  bool? securityNotRequired = false;

  bool? adjascent = false;
  bool? diffrentCustom = false;

  bool moderate = false;
  String moderateString = "0";

  bool? consult = false;

  bool? oneGate = false;
  String gate = "OneGate";

  bool? twoGate = false;

  bool? porchRequired = false;
  int porchReqInt = 0;

  bool? porchNotRequired = false;
  String porchArea = "";

  String porch = "";

  var printData;
  bool isloading = false;
  var pageId;

  Future<void> getData(int id) async {
    try {
      // print(id);
      var response = await http.get(
        Uri.parse("${dotenv.env['APP_URL']}edit-bungalow-entrance/$id"),
      );

      if (response.statusCode == SUCCESS) {
        final jsonResponse = jsonDecode(response.body);

        setState(
          () {
            printData = jsonResponse;
            print('printData===');
            print(printData);
            if (printData != null) {
              pageId = printData['bungalow_entrance']['id'] != null
                  ? int.parse(printData['bungalow_entrance']['id'].toString())
                  : pageId;
              // print(pageId);
              selectedFloor = printData['bungalow_entrance']['floor'] != null
                  ? floors[int.parse(
                      printData['bungalow_entrance']['floor'].toString())]
                  : entranceSelectedGates;
              entranceSelectedGates =
                  printData['bungalow_entrance']['id'] != null
                      ? printData['bungalow_entrance']['one_gate'].toString()
                      : entranceSelectedGates;
              floorController = printData['bungalow_entrance']['floor'] != null
                  ? printData['bungalow_entrance']['floor'].toString()
                  : '';
              moderate = printData['bungalow_entrance']['vastu'] != null
                  ? printData['bungalow_entrance']['vastu'] == "1"
                  : false;

              oneGate = printData['bungalow_entrance']['entrance_gate'] != null
                  ? printData['bungalow_entrance']['entrance_gate'] == ONE_GATE
                  : false;

              gateWidthController =
                  printData['bungalow_entrance']['one_gate'] != null
                      ? printData['bungalow_entrance']['one_gate'].toString()
                      : gateWidthController;

              oneGate = printData['bungalow_entrance']['entrance_gate'] != null
                  ? printData['bungalow_entrance']['entrance_gate'] == ONE_GATE
                  : false;

              twoGate = printData['bungalow_entrance']['entrance_gate'] != null
                  ? printData['bungalow_entrance']['entrance_gate'] == TWO_GATE
                  : false;

              adjascent = printData["bungalow_entrance"]["two_gate"] != null
                  ? printData["bungalow_entrance"]["two_gate"] ==
                      ENT_ADJACENTONE
                  : false;
              diffrentCustom = printData["bungalow_entrance"]["two_gate"] !=
                      null
                  ? printData["bungalow_entrance"]["two_gate"] == ENT_ADJACENTWO
                  : false;
              // diffrentCustom = printData["bungalow_entrance"]["two_gate"] !=
              //         null
              //     ? printData["bungalow_entrance"]["two_gate"] == ENT_ADJACENT
              //     : false;
              selectedCarGate = printData['bungalow_entrance']
                          ['main_car_gate'] !=
                      null
                  ? printData['bungalow_entrance']['main_car_gate'].toString()
                  : selectedCarGate;
              selectedSidePadest =
                  printData['bungalow_entrance']['side_padestrian_gate'] != null
                      ? printData['bungalow_entrance']['side_padestrian_gate']
                          .toString()
                      : selectedSidePadest;
              securityRequired =
                  printData['bungalow_entrance']['security_kiosq_req'] != null
                      ? printData['bungalow_entrance']['security_kiosq_req'] ==
                          T_RUE
                      : false;
              securityNotRequired =
                  printData['bungalow_entrance']['security_kiosq_req'] != null
                      ? printData['bungalow_entrance']['security_kiosq_req'] ==
                          F_ALSE
                      : false;
              porchRequired =
                  printData["bungalow_entrance"]['porch_req'] != null
                      ? printData["bungalow_entrance"]['porch_req'] == T_RUE
                      : false;
              visualNature =
                  printData['bungalow_entrance']['visual_nature'] != null
                      ? printData['bungalow_entrance']['visual_nature'] !=
                          INT_ZERO.toString()
                      : false;
              // print("visual nature");
              // print(visualNature);
              porchNotRequired =
                  printData["bungalow_entrance"]['porch_req'] != null
                      ? printData["bungalow_entrance"]['porch_req'] == F_ALSE
                      : false;
              SelectedLobbyDesign =
                  printData['bungalow_entrance']['foyer_lobby'] != null
                      ? printData['bungalow_entrance']['foyer_lobby'].toString()
                      : SelectedLobbyDesign;
              notReqiredWelcomeLobby =
                  printData['bungalow_entrance']['foyer_req'] != null
                      ? printData['bungalow_entrance']['foyer_req'] == F_ALSE
                      : false;
              requiredWelcomeLobyy =
                  printData['bungalow_entrance']['foyer_req'] != null
                      ? printData['bungalow_entrance']['foyer_req'] == T_RUE
                      : false;
              requiredVeranda =
                  printData["bungalow_entrance"]["verandah_req"] != null
                      ? printData["bungalow_entrance"]["verandah_req"] == T_RUE
                      : false;
              notReqiredVeranda =
                  printData["bungalow_entrance"]["verandah_req"] != null
                      ? printData["bungalow_entrance"]["verandah_req"] == F_ALSE
                      : false;
              outSideOpen = printData["bungalow_entrance"]["verandah"] != null
                  ? printData["bungalow_entrance"]["verandah"] == OutSideOpen
                  : false;

              outSideClosed = printData["bungalow_entrance"]["verandah"] != null
                  ? printData["bungalow_entrance"]["verandah"] == OutSideClosed
                  : false;
              // ignore: prefer_if_null_operators
              securityKioskLengthController = printData["bungalow_entrance"]
                          ["security_kiosq_length"] !=
                      null
                  ? printData["bungalow_entrance"]["security_kiosq_length"]
                  : '';
              securityKioskWidthController =
                  printData["bungalow_entrance"]["security_kiosq_width"] ?? '';
              porchLengthController =
                  printData['bungalow_entrance']['porch_length'] ?? '';
              porchWidthController =
                  printData['bungalow_entrance']['porch_width'] ?? '';
              foyerLengthController =
                  printData['bungalow_entrance']['foyer_length'] ?? '';
              foyerWidthController =
                  printData['bungalow_entrance']['foyer_width'] ?? '';

              verandaLengthController =
                  printData['bungalow_entrance']['verandah_length'] != null
                      ? printData['bungalow_entrance']['verandah_length']
                      : '';

              verandaWidthController =
                  printData['bungalow_entrance']['verandah_width'] != null
                      ? printData['bungalow_entrance']['verandah_width']
                      : '';

              porchRequiredFaci = printData['bungalow_entrance'] != null
                  ? printData['bungalow_entrance']['porch'] != null
                      ? printData['bungalow_entrance']['porch']
                          .toString()
                          .split(",")
                      : []
                  : [];
              // print(porchRequiredFaci);

              if (porchRequiredFaci != null) {
                if (porchRequiredFaci.contains('1')) {
                  visualNature = true;
                }
                if (porchRequiredFaci.contains('2')) {
                  carparking = true;
                }
              }
              selectedVisual =
                  printData['bungalow_entrance']['visual_nature'] != null
                      ? visualItems[int.parse(printData['bungalow_entrance']
                              ['visual_nature']
                          .toString())]
                      : selectedVisual;

              SelectedCar =
                  printData['bungalow_entrance']['car_parking_space'] != null
                      ? noOfCars[int.parse(printData['bungalow_entrance']
                              ['car_parking_space']
                          .toString())]
                      : SelectedCar;

              visualNaturString = printData['bungalow_entrance']
                          ['visual_nature'] !=
                      null
                  ? (printData['bungalow_entrance']['visual_nature'].toString())
                  : visualNaturString;
              // print('visual nature string');
              // print(visualNaturString);

              // visualNaturString = printData['bungalow_entrance']
              //             ['visual_nature'] !=
              //         null
              //     ? (printData['bungalow_entrance']['visual_nature'].toString())
              //     : visualNaturString;

              carParkingString =
                  printData['bungalow_entrance']['car_parking_space'] != null
                      ? (printData['bungalow_entrance']['car_parking_space']
                          .toString())
                      : carParkingString;
              // print(carParkingString);

            }
          },
        );
      }
    } catch (e) {
      print(e.toString());
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

  void showToast(msg, toastColor, GRAVITY) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 0,
        backgroundColor: toastColor,
        textColor: Colors.white);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();

    final store = Provider.of<PageNavProvider>(context, listen: false);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (store.getId() == 0) {
    //     printData = {"project": null};
    //   } else {
    //     getData(store.getId());
    //   }
    // });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isloading = true;
      });
    });
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
                Row(
                  children: [
                    requirementText("No. of\nFloors"),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: height * 0.03,
                        width: width * 0.2,
                        margin: const EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: const Visibility(
                              visible: false,
                              child: Icon(Icons.arrow_downward),
                            ),
                            // hint: printData != null &&
                            //         printData["bungalow_entrance"] != null
                            //     ? Text(floors[printData["bungalow_entrance"]["floor"]]
                            //         .toString())
                            //     : Text(selectedFloor),
                            hint: Text(selectedFloor),
                            elevation: 16,
                            items: floors.asMap().entries.map((it) {
                              int idx = it.key;
                              String value = it.value;
                              return DropdownMenuItem<String>(
                                onTap: () {
                                  setFloorId(it.key);
                                  print(it.key);
                                },
                                value: it.value,
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
                                  if (selectedFloor == ENT_GROUND_FLOOR) {
                                    if (printData != null &&
                                        printData['bungalow_entrance'] != null)
                                      printData["bungalow_entrance"]["floor"] =
                                          G_FLOOR;
                                  }
                                  if (selectedFloor == ENT_SELECT) {
                                    if (printData != null &&
                                        printData['bungalow_entrance'] != null)
                                      printData["bungalow_entrance"]["floor"] =
                                          S_ELECT;
                                  }
                                  if (selectedFloor == ENT_FIRST_FLOOR) {
                                    if (printData != null &&
                                        printData['bungalow_entrance'] != null)
                                      printData["bungalow_entrance"]["floor"] =
                                          FIRST_FLOOR;
                                  }
                                  if (selectedFloor == ENT_SECOND_FLOOR) {
                                    if (printData != null &&
                                        printData['bungalow_entrance'] != null)
                                      printData["bungalow_entrance"]["floor"] =
                                          SECOND_FLOOR;
                                  }
                                  if (selectedFloor == ENT_THIRD_FLOOR) {
                                    if (printData != null &&
                                        printData['bungalow_entrance'] != null)
                                      printData["bungalow_entrance"]["floor"] =
                                          THIRD_FLOOR;
                                  }
                                  // if (selectedFloor == ENT_MORE_FLOOR) {
                                  //   if (printData != null &&
                                  //       printData['bungalow_entrance'] != null)
                                  //     printData["bungalow_entrance"]["floor"] =
                                  //         MORE_FLOOR;
                                  // }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    // if (selectedFloor == ENT_MORE_FLOOR) ...[
                    //   Material(
                    //     elevation: 5,
                    //     borderRadius:
                    //         const BorderRadius.all(Radius.circular(5)),
                    //     child: SizedBox(
                    //       height: height * 0.04,
                    //       width: width * 0.15,
                    //       child: TextFormField(
                    //         initialValue: printData != null &&
                    //                 printData['bungalow_entrance'] != null
                    //             ? printData["bungalow_entrance"]["floor"]
                    //                         .toString() !=
                    //                     null
                    //                 ? printData["bungalow_entrance"]["floor"]
                    //                     .toString()
                    //                 : ""
                    //             : "",
                    //         style: const TextStyle(fontSize: 14),
                    //         decoration: const InputDecoration(
                    //             hintText: "floors",
                    //             hintStyle: TextStyle(fontSize: 14),
                    //             border: OutlineInputBorder(
                    //               borderSide: BorderSide.none,
                    //             ),
                    //             isDense: true,
                    //             contentPadding: EdgeInsets.all(8)
                    //             //fillColor: Colors.green
                    //             ),
                    //         onChanged: ((value) {
                    //           floorController = value;
                    //         }),
                    //       ),
                    //     ),
                    //   )
                    // ]
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("vastu"),
                    SizedBox(
                      width: width * 0.17,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.035,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: height * 0.04,
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: moderate,
                                  onChanged: (value) {
                                    setState(() {
                                      moderate = !moderate;
                                    });
                                  },
                                ),
                                requirementText("moderate consideration")
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.29,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        height: height * 0.04,
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: consult,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      consult = value!;
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: const Text(
                                          "This service is not started yet",
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                consult = false;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              color: Colors.black,
                                              child: const Text(
                                                "okay",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }),
                            requirementText("consult")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: headingFont('Ground floor requirement'),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Entrance"),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: height * 0.04,
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: oneGate,
                                  onChanged: (value) {
                                    setState(() {
                                      if (printData['bungalow_entrance'] !=
                                              null &&
                                          printData['bungalow_entrance']
                                                  ['entrance_gate'] !=
                                              null) {
                                        printData['bungalow_entrance']
                                            ['entrance_gate'] = "";
                                      }
                                      oneGate = !oneGate!;
                                      twoGate = false;
                                      adjascent = false;
                                      diffrentCustom = false;
                                    });
                                  },
                                ),
                                requirementText("one gate")
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
                            margin: const EdgeInsets.only(right: 10),
                            height: height * 0.04,
                            child: Row(
                              children: [
                                Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: printData != null &&
                                            printData['bungalow_entrance'] !=
                                                null
                                        ? printData['bungalow_entrance']
                                                    ['entrance_gate'] ==
                                                TWO_GATE
                                            ? true
                                            : twoGate
                                        : twoGate,
                                    onChanged: (value) {
                                      setState(() {
                                        if (printData != null &&
                                            printData['bungalow_entrance'] !=
                                                null &&
                                            printData['bungalow_entrance']
                                                    ['entrance_gate'] !=
                                                null) {
                                          printData['bungalow_entrance']
                                              ['entrance_gate'] = "";
                                        }
                                        twoGate = value;
                                        oneGate = false;
                                      });
                                    }),
                                requirementText("two gates")
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
                Row(
                  children: [
                    if (oneGate == true) ...[
                      SizedBox(
                        width: width * 0.185,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: height * 0.04,
                          padding: const EdgeInsets.all(3),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                hint: printData != null &&
                                        printData['bungalow_entrance'] !=
                                            null &&
                                        printData['bungalow_entrance']
                                                ['one_gate'] !=
                                            null
                                    ? Text(printData['bungalow_entrance']
                                        ["one_gate"])
                                    : Text(entranceSelectedGates),
                                items: entranceGates
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (e) => setState(() {
                                      if (printData != null &&
                                          printData['bungalow_entrance'] !=
                                              null &&
                                          printData['bungalow_entrance']
                                                  ['one_gate'] !=
                                              null) {
                                        printData['bungalow_entrance']
                                            ["one_gate"] = null;
                                      }
                                      entranceSelectedGates = e!;
                                    })),
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.044, 0.05),
                      if (entranceSelectedGates == "more") ...[
                        SizedBox(
                          width: width * 0.065,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.2,
                            child: TextFormField(
                              initialValue: printData != null &&
                                      printData['bungalow_entrance'] != null &&
                                      printData['bungalow_entrance']
                                              ['one_gate'] !=
                                          null
                                  ? printData['bungalow_entrance']['one_gate']
                                  : '',
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                hintText: "Gate Width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8),
                                //fillColor: Colors.green
                              ),
                              onChanged: ((value) {
                                gateWidthController = value;
                              }),
                            ),
                          ),
                        ),
                        // requirementTextFieldCont(height, width, 0.04, 0.2,
                        //     "gatewidth", gateWidthController)
                      ]
                    ],
                    if (twoGate == true) ...[
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.075,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(5),
                                elevation: 5,
                                child: Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: adjascent,
                                          onChanged: (value) {
                                            setState(() {
                                              adjascent = value;
                                              diffrentCustom = false;
                                            });
                                          }),
                                      requirementText("Adjacent")
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
                                width: width * 0.185,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(5),
                                elevation: 5,
                                child: Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: diffrentCustom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                diffrentCustom = value;
                                                adjascent = false;
                                              },
                                            );
                                          }),
                                      requirementText("Diffrent Custom")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]
                  ],
                ),
                if (adjascent == true) ...[
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(children: [
                          requirementText("Main car gate"),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: height * 0.045,
                                  width: width * 0.2,
                                  padding: const EdgeInsets.all(3),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        icon: const Visibility(
                                            visible: false,
                                            child: Icon(Icons.arrow_downward)),
                                        hint: Text(selectedCarGate),
                                        // value: selectedCarGate,
                                        items: carGate
                                            .map(
                                                (e) => DropdownMenuItem<String>(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                            .toList(),
                                        onChanged: (e) => setState(() {
                                              selectedCarGate = e!;
                                            })),
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.044, 0.05),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        width: width * 0.3,
                      ),
                      Container(
                        child: Column(children: [
                          requirementText("Side padestriangate"),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: height * 0.045,
                                  width: width * 0.2,
                                  padding: const EdgeInsets.all(3),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        icon: const Visibility(
                                            visible: false,
                                            child: Icon(Icons.arrow_downward)),
                                        hint: Text(selectedSidePadest),
                                        // value: selectedSidePadest,
                                        items: sidePadest
                                            .map(
                                                (e) => DropdownMenuItem<String>(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                            .toList(),
                                        onChanged: (e) => setState(() {
                                              selectedSidePadest = e!;
                                            })),
                                  ),
                                ),
                              ),
                              valueContainer(height, width, size, 0.044, 0.05)
                            ],
                          )
                        ]),
                      )
                    ],
                  )
                ],
                if (diffrentCustom == true) ...[
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Brief about diffrent custom Location",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.05,
                      width: width * 0.95,
                      child: TextFormField(
                        initialValue: printData != null &&
                                printData["bungalow_entrance"] != null &&
                                printData["bungalow_entrance"]
                                        ["different_customized_location"] !=
                                    null
                            ? printData["bungalow_entrance"]
                                ["different_customized_location"]
                            : '',
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: "Brief of diffrent customed location",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green
                            ),
                        onChanged: (value) {
                          diffrentCustomizedLocationController = value;
                        },
                      ),
                    ),
                  ),
                ],
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.025,
                    ),
                    if (selectedCarGate == "more" && adjascent == true) ...[
                      requirementTextFieldCont(height, width, 0.04, 0.2,
                          "gate width", selectedCarGateController)
                    ],
                    SizedBox(
                      width: width * 0.375,
                    ),
                    if (selectedSidePadest == "more" && adjascent == true) ...[
                      requirementTextFieldCont(height, width, 0.04, 0.28,
                          "side gate width", selectedSidePadestController)
                    ],
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: requirementText("Security kiosk"),
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
                                      value: securityRequired,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            securityRequired = value;
                                            securityNotRequired = false;
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
                                      value: securityNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          securityNotRequired = value;
                                          securityRequired = false;
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
                if (securityRequired == true) ...[
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
                            initialValue: securityKioskLengthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "lenght",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              securityKioskLengthController = value;
                            },
                          ),
                        ),
                      ),
                      // requirementTextFieldCont(height, width, 0.04, 0.15,"length", securityKioskLengthController),
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
                            initialValue: securityKioskWidthController,
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
                              securityKioskWidthController = value;
                            },
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      InkWell(
                          onTap: () {
                            HintDailog(segment_id: SEGMENT_PORCH);
                            print("security kiosk==");
                          },
                          child: requirementText("help ?"))
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
                  height: height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: requirementText("Porch"),
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
                                    value: porchRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        porchRequired = value;
                                        porchNotRequired = false;
                                      });
                                    },
                                  ),
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
                                      value: porchNotRequired,
                                      onChanged: (value) {
                                        setState(() {
                                          porchNotRequired = value;
                                          porchRequired = false;
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
                if (porchRequired == true) ...[
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
                            initialValue: porchLengthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              hintText: "length",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              //fillColor: Colors.green
                            ),
                            onChanged: ((value) {
                              porchLengthController = value;
                            }),
                          ),
                        ),
                      ),
                      valueContainer(
                        height,
                        width,
                        size,
                        0.04,
                        0.05,
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
                            initialValue: porchWidthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              hintText: "width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              //fillColor: Colors.green
                            ),
                            onChanged: ((value) {
                              porchWidthController = value;
                            }),
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      requirementText("help ?")
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
                                    value: visualNature,
                                    onChanged: (value) {
                                      setState(() {
                                        visualNature = value;
                                      });
                                    }),
                              ),
                              requirementText("visual nature")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  if (visualNature == true) ...[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.045,
                          width: width * 0.3,
                          padding: const EdgeInsets.all(3),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              hint: Text(selectedVisual),
                              // value: selectedVisual,
                              items: visualItems.asMap().entries.map((e) {
                                int idx = e.key;
                                String val = e.value;
                                return DropdownMenuItem<String>(
                                  value: e.value,
                                  onTap: () {
                                    visualNaturString = idx.toString();
                                    print(visualNaturString);
                                  },
                                  child: Text(e.value),
                                );
                              }).toList(),
                              onChanged: (e) => setState(
                                () {
                                  selectedVisual = e!;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
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
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        width: width * 0.5,
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.04,
                              child: Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: carparking,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        carparking = value;
                                      },
                                    );
                                  }),
                            ),
                            requirementText("car parking space"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                if (carparking == true) ...[
                  Row(
                    children: [
                      const Text("No. of Colors"),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.035,
                          width: width * 0.15,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward),
                              ),
                              hint: Text(SelectedCar),
                              items: noOfCars.asMap().entries.map((e) {
                                int idx = e.key;
                                String val = e.value;
                                return DropdownMenuItem<String>(
                                  value: e.value,
                                  onTap: () {
                                    carParkingString = idx.toString();
                                  },
                                  child: Text(e.value),
                                );
                              }).toList(),
                              onChanged: (e) => setState(
                                () {
                                  SelectedCar = e!;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      if (SelectedCar == "more") ...[
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.035,
                            width: width * 0.2,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  hintText: "no of cars",
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8)
                                  //fillColor: Colors.green
                                  ),
                              onChanged: (value) {
                                noOfCar = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ],
                  )
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                if (porchRequired == true) ...[
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
                  ),
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: requirementText("Foyer/welcome lobby"),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        width: width * 0.4,
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.04,
                              child: Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: requiredWelcomeLobyy,
                                  onChanged: (value) {
                                    setState(() {
                                      requiredWelcomeLobyy = value;
                                      // printData['bungalow_entrance']['foyer_req'] = 5;
                                      notReqiredWelcomeLobby = false;
                                    });
                                  }),
                            ),
                            requirementText("Required"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        width: width * 0.4,
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.04,
                              child: Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: notReqiredWelcomeLobby,
                                  onChanged: (value) {
                                    setState(() {
                                      notReqiredWelcomeLobby = value;
                                      requiredWelcomeLobyy = false;
                                    });
                                  }),
                            ),
                            requirementText("Not Required"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                if (requiredWelcomeLobyy == true) ...[
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
                            initialValue: foyerLengthController,
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
                              foyerLengthController = value;
                            },
                          ),
                        ),
                      ),
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
                            initialValue: foyerWidthController,
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
                              foyerWidthController = value;
                            },
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      requirementText("help ?")
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Lobby Design"),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: height * 0.035,
                          width: width * 0.45,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              hint:
                                  // printData['bungalow_entrance']['foyer_lobby'] !=
                                  //         null
                                  //     ? Text(
                                  //         printData['bungalow_entrance']['foyer_lobby'])
                                  //     :
                                  Text(SelectedLobbyDesign),
                              // value: SelectedLobbyDesign,
                              items: lobbyDesign
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (e) => setState(
                                () {
                                  SelectedLobbyDesign = e!;
                                  // printData['bungalow_entrance']['foyer_lobby'] =
                                  //     SelectedLobbyDesign;
                                },
                              ),
                            ),
                          ),
                        ),
                      )
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
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: requirementText("veranda"),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        width: width * 0.4,
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.04,
                              child: Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: requiredVeranda,
                                  onChanged: (value) {
                                    setState(() {
                                      requiredVeranda = value;
                                      notReqiredVeranda = false;
                                    });
                                  }),
                            ),
                            requirementText("Required"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        width: width * 0.4,
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.04,
                              child: Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: notReqiredVeranda,
                                  onChanged: (value) {
                                    setState(() {
                                      notReqiredVeranda = value;
                                      requiredVeranda = false;
                                    });
                                  }),
                            ),
                            requirementText("Not Required"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                if (requiredVeranda == true) ...[
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
                            initialValue: verandaLengthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Length",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              verandaLengthController = value;
                            },
                          ),
                        ),
                      ),
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
                            initialValue: verandaWidthController,
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
                              verandaWidthController = value;
                            },
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      requirementText("help ?")
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        width: width * 0.4,
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.04,
                              child: Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: outSideOpen,
                                  onChanged: (value) {
                                    setState(() {
                                      outSideOpen = value;
                                      outSideClosed = false;
                                    });
                                  }),
                            ),
                            requirementText("out side open"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(5),
                    elevation: 5,
                    child: Container(
                      width: width * 1,
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.04,
                            child: Checkbox(
                                activeColor: checkColor,
                                checkColor: Colors.white,
                                value: outSideClosed,
                                onChanged: (value) {
                                  setState(() {
                                    outSideClosed = value;
                                    outSideOpen = false;
                                  });
                                }),
                          ),
                          requirementText(
                              "Out side closed with glass or grill"),
                        ],
                      ),
                    ),
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
                ],
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: () async {
                    setState(
                      () {
                        if (adjascent == true) {
                          twoGateType = 'Adjacent';
                        } else if (diffrentCustom == true) {
                          twoGateType = 'diffrent';
                        }
                        if (moderate == true) {
                          moderateString = STR_ONE;
                        } else {
                          moderateString = STR_ZERO;
                        }
                        floor();
                        if (oneGate == false) {
                          gate = TWO_GATE;
                        } else {
                          gate = ONE_GATE;
                        }
                        if (selectedCarGate == MORE) {
                          selectedCarGate = selectedCarGateController.text;
                        }
                        if (selectedSidePadest == MORE) {
                          selectedSidePadest =
                              selectedSidePadestController.text;
                        }

                        if (securityRequired == true) {
                          securityReqInt = INT_ONE;
                          int securityArea =
                              int.parse(securityKioskLengthController) *
                                  int.parse(securityKioskWidthController);
                          securityKiosqArea = securityArea.toString();
                        }
                        if (porchRequired == true) {
                          porchReqInt = INT_ONE;
                          int pArea = int.parse(porchLengthController) *
                              int.parse(porchWidthController);
                          porchArea = pArea.toString();
                        }
                        if (visualNature == true &&
                            !porchRequiredFaci.contains("1")) {
                          porchRequiredFaci.add("1");
                        }
                        if (carparking == true &&
                            !porchRequiredFaci.contains("2")) {
                          porchRequiredFaci.add("2");
                        }

                        if (visualNature == false &&
                            porchRequiredFaci.contains("1")) {
                          porchRequiredFaci.remove("1");
                        }
                        if (carparking == false &&
                            porchRequiredFaci.contains("2")) {
                          porchRequiredFaci.remove("2");
                        }

                        if (carparking == true && visualNature == true) {
                          porch = "visual nature car parking space ";
                        }

                        if (requiredWelcomeLobyy == true) {
                          requiredWelcomeLobyyInt = INT_ONE;
                          int fArea = int.parse(foyerLengthController) *
                              int.parse(foyerWidthController);
                          porchArea = fArea.toString();
                        }
                        if (requiredVeranda == true) {
                          requiredVerandaInt = INT_ONE;
                          int vArea = INT_ZERO;

                          vArea = int.parse(verandaLengthController) *
                              int.parse(verandaWidthController);
                          verandaArea = vArea.toString();

                          if (outSideOpen == true) {
                            veranda = OutSideOpen;
                          }
                          if (outSideClosed == true) {
                            veranda = OutSideClosed;
                          }
                        }
                      },
                    );
                    if (pageId != null) {
                      var status = await entrancePut(
                        project_id,
                        moderateString,
                        floorInt,
                        gate,
                        entranceSelectedGates,
                        twoGateType,
                        selectedCarGate,
                        selectedSidePadest,
                        diffrentCustomizedLocationController,
                        securityReqInt,
                        securityKioskLengthController,
                        securityKioskWidthController,
                        securityKiosqArea,
                        INT_ZERO,
                        porchReqInt,
                        porchLengthController,
                        porchWidthController,
                        porchArea,
                        porchRequiredFaci,
                        visualNaturString,
                        carParkingString,
                        requiredWelcomeLobyy!,
                        foyerLengthController,
                        foyerWidthController,
                        foyerArea,
                        SelectedLobbyDesign,
                        requiredVerandaInt,
                        verandaLengthController,
                        verandaWidthController,
                        verandaArea,
                        veranda,
                      );
                      if (status == SUCCESS) {
                        showToast('Entrance Requirement Updated !',
                            Colors.lightGreen, ToastGravity.TOP);
                      }
                    } else {
                      var status = await entrancePost(
                        project_id,
                        moderateString,
                        floorInt,
                        gate,
                        entranceSelectedGates,
                        twoGateType,
                        selectedCarGate,
                        selectedSidePadest,
                        diffrentCustomizedLocationController,
                        securityReqInt,
                        securityKioskLengthController,
                        securityKioskWidthController,
                        securityKiosqArea,
                        INT_ZERO,
                        porchReqInt,
                        porchLengthController,
                        porchWidthController,
                        porchArea,
                        porchRequiredFaci,
                        visualNaturString,
                        carParkingString,
                        requiredWelcomeLobyy!,
                        foyerLengthController,
                        foyerWidthController,
                        foyerArea,
                        SelectedLobbyDesign,
                        requiredVerandaInt,
                        verandaLengthController,
                        verandaWidthController,
                        verandaArea,
                        veranda,
                      );
                      if (status == SUCCESS) {
                        showToast('Entrance Requirement Submitted !',
                            Colors.lightGreen, ToastGravity.TOP);
                      }
                    }
                  },
                  child: Container(
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
          );
  }
}

Text headingFont(String s) {
  return Text(
    s,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}
