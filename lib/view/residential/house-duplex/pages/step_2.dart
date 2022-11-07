import 'dart:convert';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/page_nav_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../components/constant.dart';
import '../../../../controller/api_services.dart';
import '../../../../utils/helpers.dart';
import '../../bunglow/entrance.dart';

class Step_2 extends StatefulWidget {
  const Step_2({Key? key}) : super(key: key);

  @override
  State<Step_2> createState() => _Step_2State();
}

class _Step_2State extends State<Step_2> {
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

  String porchLengthController = "";
  String porchWidthController = '';

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
    });
  }

  bool? adjascent = false;
  bool? diffrentCustom = false;

  bool moderate = false;
  String moderateString = "0";

  bool? consult = false;

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
      var response = await http.get(
        Uri.parse("${dotenv.env['APP_URL']}edit-flat-house-entrance/$id"),
      );

      if (response.statusCode == SUCCESS) {
        final jsonResponse = jsonDecode(response.body);

        setState(
          () {
            printData = jsonResponse;
            print('printData===');
            print(printData);
            if (printData != null) {
              pageId = printData['flat_house_entrance']['id'] != null
                  ? int.parse(printData['flat_house_entrance']['id'].toString())
                  : pageId;
              print("pageId");
              print(pageId);

              selectedFloor = printData['flat_house_entrance']['floor'] != null
                  ? floors[int.parse(
                      printData['flat_house_entrance']['floor'].toString())]
                  : selectedFloor;

              moderate = printData['flat_house_entrance']['vastu'] != null
                  ? printData['flat_house_entrance']['vastu'] == "1"
                  : false;

              adjascent = printData["flat_house_entrance"]["two_gate"] != null
                  ? printData["flat_house_entrance"]["two_gate"] ==
                      ENT_ADJACENTONE
                  : false;
              diffrentCustom =
                  printData["flat_house_entrance"]["two_gate"] != null
                      ? printData["flat_house_entrance"]["two_gate"] ==
                          ENT_ADJACENTWO
                      : false;

              porchRequired =
                  printData["flat_house_entrance"]['porch_req'] != null
                      ? printData["flat_house_entrance"]['porch_req'] == T_RUE
                      : false;

              porchNotRequired =
                  printData["flat_house_entrance"]['porch_req'] != null
                      ? printData["flat_house_entrance"]['porch_req'] == F_ALSE
                      : false;
              porchLengthController =
                  printData['flat_house_entrance']['porch_length'] ?? '';

              porchWidthController =
                  printData['flat_house_entrance']['porch_width'] ?? '';
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

    print("step 2project_id == ");
    print(project_id);

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
                            //         printData["flat_house_entrance"] != null
                            //     ? Text(floors[printData["flat_house_entrance"]["floor"]]
                            //         .toString())
                            //     : Text(selectedFloor),
                            hint: printData != null
                                ? printData['project'] != null
                                    ? printData['project']
                                                ['flat_house_entrance'] !=
                                            null
                                        ? Text(floors[printData['project']
                                                ['flat_house_entrance']]
                                            .toString())
                                        : Text(selectedFloor)
                                    : Text(selectedFloor)
                                : Text(selectedFloor),
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
                                        printData['flat_house_entrance'] !=
                                            null)
                                      printData["flat_house_entrance"]
                                          ["floor"] = G_FLOOR;
                                  }
                                  if (selectedFloor == ENT_SELECT) {
                                    if (printData != null &&
                                        printData['flat_house_entrance'] !=
                                            null)
                                      printData["flat_house_entrance"]
                                          ["floor"] = S_ELECT;
                                  }
                                  if (selectedFloor == ENT_FIRST_FLOOR) {
                                    if (printData != null &&
                                        printData['flat_house_entrance'] !=
                                            null)
                                      printData["flat_house_entrance"]
                                          ["floor"] = FIRST_FLOOR;
                                  }
                                  if (selectedFloor == ENT_SECOND_FLOOR) {
                                    if (printData != null &&
                                        printData['flat_house_entrance'] !=
                                            null)
                                      printData["flat_house_entrance"]
                                          ["floor"] = SECOND_FLOOR;
                                  }
                                  if (selectedFloor == ENT_THIRD_FLOOR) {
                                    if (printData != null &&
                                        printData['flat_house_entrance'] !=
                                            null)
                                      printData["flat_house_entrance"]
                                          ["floor"] = THIRD_FLOOR;
                                  }
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
                            initialValue: printData != null &&
                                    printData['flat_house_entrance'] != null
                                ? printData['flat_house_entrance']
                                    ['porch_length']
                                : '',
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
                            initialValue: printData != null &&
                                    printData['flat_house_entrance'] != null
                                ? printData['flat_house_entrance']
                                    ['porch_width']
                                : '',
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
                ],
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    setState(
                      () {
                        if (moderate == true) {
                          moderateString = STR_ONE;
                        } else {
                          moderateString = STR_ZERO;
                        }
                        floor();

                        if (porchRequired == true) {
                          porchReqInt = INT_ONE;
                          int pArea = int.parse(porchLengthController) *
                              int.parse(porchWidthController);
                          porchArea = pArea.toString();
                        }
                      },
                    );
                    if (pageId != null) {
                      print("data is updating");
                      var status = await step2Put(
                        project_id,
                        moderateString,
                        floorInt,
                        porchReqInt,
                        porchLengthController,
                        porchWidthController,
                      );
                      // if (status == SUCCESS) {
                      //   showToast('Entrance Requirement Updated !',
                      //       Colors.lightGreen, ToastGravity.TOP);
                      // }
                    } else {
                      print("data is posting ");
                      var status = await step2Post(
                        project_id,
                        moderateString,
                        floorInt,
                        porchReqInt,
                        porchLengthController,
                        porchWidthController,
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
