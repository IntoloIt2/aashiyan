import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:aashiyan/components/constant.dart';
import 'package:aashiyan/components/forms.dart' as Forms;
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/utils/helpers.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/page_nav_provider.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/residential_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../const.dart';
import 'package:http/http.dart' as http;

var plotValue = TextEditingController();

class Requirement extends StatefulWidget {
  // static const namedRoute = "/intrestedNext";
  static const namedRoute = "/Requirement";
  @override
  State<Requirement> createState() => _RequirementState();
}

class _RequirementState extends State<Requirement> {
  // late Future<RequirementModel> futureRequirement;
  String nameController = '';
  String lastNameController = "";
  String emailController = "";
  String addressController = "";
  String? diagonal1Controller = '';
  String? diagonal2Controller = '';
  String eastController = "";
  String westController = "";
  String northController = "";
  String southController = "";
  String levelController = "";
  TextEditingController widthController = TextEditingController();
  // String? lengthController = '';
  TextEditingController lengthController = TextEditingController();
  var project_id;

  var projectGroupId;
  var projectTypeId;

  int isRegular = 1;
  int isNotRegular = 0;
  int isNorthOrientaion = 0;
  int plot_orientaion = 0;

  bool lengthFeetbool = false;
  bool lengthMeterbool = false;

  bool widthFeetbool = false;
  bool widthMeterbool = false;

  bool isMount = true;
  int isWest = 1;
  int isNorth = 1;
  int isSouth = 1;
  int isEast = 1;

  bool? northOriented = false;
  bool? regularPlotValue = false;
  bool? irregularPlotValue = false;
  bool? surveyor = false;
  bool? notReqired = true;
  int notReqiredInt = 0;

  bool eastRoad = false;
  bool westRoad = false;
  bool northRoad = false;
  bool southRoad = false;
  bool? otherEast = false;
  bool? otherwest = false;
  bool? otherNorth = false;
  bool? otherSouth = false;

  List<String> levels = ["select", "Almost same level", "Up", "Down"];
  String selectedLevel = 'select';
  int selectedLevelInt = 0;

  List<String> items = ["select", "Mr", "Mrs", "Ms", "M/s"];
  String selectedItems = 'select';
  int selectedItemInt = 0;

  List<String> countryItmes = ["India"];
  String country = "India";

  // String selectCity = "select";

  String myState = "Select State";

  int cityId = 0;
  int stateId = 0;

  int plotSize = 0;
  String plotSizeStr = '';
  String selectedState = "select";
  // String selectedState = "";

  List cityData = [];
  List stateData = [];

  // Map<String, dynamic> stateData = [];
  // List requirementDataByUserId = [];
  double plotWidth = 1.0;
  double plotLenght = 1.0;
  int value = 0;
  String? lengthText, widthText, finalString;
  String calculation = "";

  String totalCalculated() {
    lengthText = lengthController.text;
    widthText = widthController.text;
    finalString = plotValue.text;

    // print('plotLenght======');
    // print(plotLenght);

    // print('lengthText-----');
    // print(lengthText);
    if (lengthText != '' && widthText != '') {
      calculation =
          (num.parse(lengthText.toString()) * num.parse(widthText.toString()))
              .toStringAsFixed(2);
      // print('calculation--');
      // print(calculation);
      // (num.parse(plotLenght.toString()) * num.parse(plotWidth.toString()))
      //     .toString();
      // .toString();
      plotValue.value = plotValue.value.copyWith(text: calculation.toString());
    }

    plotValue.text = calculation;
    // print('plotValue.text------');
    // print(calculation);
    return calculation;
  }

  String apiRegularCalcuation() {
    if (printData != null) {
      lengthText = printData["project"]["plot_length"] != null
          ? printData["project"]["plot_length"].toString()
          : "";
      widthText = printData["project"]["plot_width"] != null
          ? printData["project"]["plot_width"].toString()
          : "";
      finalString = plotValue.text;

      if (lengthText != '' && widthText != '') {
        calculation = (plotLenght * plotWidth).toString();
        plotValue.value = plotValue.value.copyWith(
          text: calculation.toString(),
        );
      }
      plotValue.text = calculation;
      // print(plotValue.text);
      // print(calculation);
    }
    return calculation;
  }

  String apiIregularCalcuation() {
    diagonal1Text = diagonal1Controller;
    diagonal2Text = diagonal2Controller;
    finalDiagonal = plotValue.text;

    if (diagonal1Text != '' && diagonal2Text != '') {
      diagonalCalculation = (((diagonal1! * diagonal2!) / 2)).toString();
      plotValue.value = plotValue.value.copyWith(
        text: diagonalCalculation.toString(),
      );
    }
    return diagonalCalculation;
  }

  int? diagonal1 = 0;
  int? diagonal2 = 0;
  int? diagonalValue = 0;
  String? diagonal1Text, diagonal2Text, finalDiagonal;
  String diagonalCalculation = "";

  String diagonalCalculations() {
    diagonal1Text = diagonal1Controller;
    diagonal2Text = diagonal2Controller;
    finalDiagonal = plotValue.text;

    if (diagonal1Text != '' && diagonal2Text != '') {
      diagonalCalculation = (((diagonal1! * diagonal2!) / 2)).toString();
      plotValue.value = plotValue.value.copyWith(
        text: diagonalCalculation.toString(),
      );
    }
    return diagonalCalculation;
  }

  void showToast(msg, toastColor, GRAVITY) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 0,
      backgroundColor: toastColor,
      textColor: Colors.white,
    );
  }

  Future<void> getState() async {
    try {
      var client = http.Client();
      var tempStates;
      var response =
          await http.get(Uri.parse("${dotenv.env['APP_URL']}state/$STATE_ID"));
      if (response.statusCode == 200) {
        Map jsonResponse = jsonDecode(response.body);
        List tempStates = jsonResponse["states"];
        setState(() {
          stateData = tempStates;
        });
      }
    } catch (e) {}
  }

  Future<List?> getCities() async {
    try {
      var client = http.Client();
      var response =
          await http.get(Uri.parse("${dotenv.env['APP_URL']}city/$stateId"));
      if (response.statusCode == SUCCESS) {
        final jsonResponse = jsonDecode(response.body);
        final cityList = jsonResponse['cities'] as List;
        setState(() {
          cityData = cityList;
        });
        return cityList;
      }
    } catch (e) {}
  }

  var printData;
  int? pageId;

  Future<void> getData(id) async {
    try {
      var response = await http.get(
        Uri.parse("${dotenv.env['APP_URL']}edit-project/$id"),
      );
      if (response.statusCode == SUCCESS) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          printData = jsonResponse;
          print("print printData ==");
          print(printData);

          if (printData != null) {
            // selectedItems = printData['project']['prefix'] != null
            //     ? items[int.parse(printData['project']['prefix'].toString())]
            //     : selectedItems;
            // selectedItemInt = printData['project']['prefix'] != null
            //     ? int.parse(printData['project']['prefix'].toString())
            //     : selectedItemInt;
            // pageId = printData['project']['id'] != null
            //     ? int.parse(printData['project']['id'].toString())
            //     : pageId;

            nameController = printData["project"]['first_name'] != null
                ? printData["project"]['first_name'].toString()
                : nameController;
            print("nameController");
            print(nameController);
            lastNameController = printData["project"]["last_name"] != null
                ? printData["project"]["last_name"].toString()
                : "";
            emailController = printData["project"]["email"] != null
                ? printData["project"]["email"].toString()
                : "";
            addressController = printData["project"]["address"] != null
                ? printData["project"]["address"].toString()
                : "";

            selectedState = printData["project"]["state_name"] != null
                ? printData["project"]["state_name"].toString()
                : "";
            lengthController.text = printData["project"]["plot_length"] != null
                ? printData["project"]["plot_length"].toString()
                : "";
            widthController.text = printData["project"]["plot_width"] != null
                ? printData["project"]["plot_width"].toString()
                : "";
            plotLenght = printData["project"]["plot_length"] != null
                ? double.parse(printData["project"]["plot_length"])
                : plotLenght;
            plotWidth = printData["project"]["plot_width"] != null
                ? double.parse(printData["project"]["plot_width"])
                : plotWidth;
            diagonal1Controller = printData["project"]["diagonal_1"] != null
                ? printData["project"]["diagonal_1"].toString()
                : '';
            diagonal2Controller = printData["project"]["diagonal_2"] != null
                ? printData["project"]["diagonal_2"].toString()
                : '';
            diagonal1 = printData["project"]["diagonal_1"] != null
                ? int.parse(printData["project"]["diagonal_1"].toString())
                : INT_ZERO;
            diagonal2 = printData["project"]["diagonal_2"] != null
                ? int.parse(printData["project"]["diagonal_2"].toString())
                : INT_ZERO;

            eastController = printData["project"]["east_road_width"] != null
                ? printData["project"]["east_road_width"].toString()
                : "";

            westController = printData["project"]["west_road_width"] != null
                ? printData["project"]["west_road_width"].toString()
                : "";
            northController = printData["project"]["north_road_width"] != null
                ? printData["project"]["north_road_width"].toString()
                : "";
            southController = printData["project"]["south_road_width"] != null
                ? printData["project"]["south_road_width"].toString()
                : "";
            levelController = printData["project"]["level_value"] != null
                ? printData["project"]["level_value"].toString()
                : "";

            plotValue.text = printData["project"]["plot_size"] != null
                ? printData["project"]["plot_size"].toString()
                : "";

            stateId = printData["project"]["state"] != null
                ? printData["project"]["state"]
                : "";
            cityId = printData["project"]["city"] != null
                ? printData["project"]["city"]
                : "";
            otherEast = printData["project"]["west_property"] != null
                ? printData["project"]["east_property"] == 2
                : otherEast;
            otherNorth = printData["project"]["west_property"] != null
                ? printData["project"]["north_property"] == 2
                : otherNorth;
            otherwest = printData["project"]["west_property"] != null
                ? printData["project"]["west_property"] == 2
                : otherwest;
            otherSouth = printData["project"]["west_property"] != null
                ? printData["project"]["south_property"] == 2
                : otherSouth;
            eastRoad = printData["project"]["west_property"] != null
                ? printData["project"]["east_property"] == 1
                : eastRoad;
            westRoad = printData["project"]["west_property"] != null
                ? printData["project"]["north_property"] == 1
                : westRoad;
            northRoad = printData["project"]["west_property"] != null
                ? printData["project"]["west_property"] == 1
                : northRoad;
            southRoad = printData["project"]["west_property"] != null
                ? printData["project"]["south_property"] == 1
                : southRoad;
            selectedLevel = printData["project"]["level"] != null
                ? levels[int.parse(printData["project"]["level"].toString())]
                : selectedLevel;

            selectedLevelInt = printData["project"]["level"] != null
                ? int.parse(printData["project"]["level"].toString())
                : selectedLevelInt;
            otherEast = printData["project"]["east_property"] != null
                ? int.parse(printData["project"]["east_property"].toString()) ==
                    INT_TWO
                : otherEast;
            otherwest = printData["project"]["west_property"] != null
                ? int.parse(printData["project"]["west_property"].toString()) ==
                    INT_TWO
                : otherwest;
            otherNorth = printData["project"]["north_property"] != null
                ? int.parse(
                        printData["project"]["north_property"].toString()) ==
                    INT_TWO
                : otherNorth;
            otherSouth = printData["project"]["south_property"] != null
                ? int.parse(
                        printData["project"]["south_property"].toString()) ==
                    INT_TWO
                : otherSouth;
            eastRoad = printData["project"]["east_property"] != null
                ? int.parse(printData["project"]["east_property"].toString()) ==
                    INT_ONE
                : eastRoad;
            westRoad = printData["project"]["west_property"] != null
                ? int.parse(printData["project"]["west_property"].toString()) ==
                    INT_ONE
                : westRoad;
            northOriented = printData["project"]["north_property"] != null
                ? int.parse(
                        printData["project"]["north_property"].toString()) ==
                    INT_ONE
                : northOriented;
            southRoad = printData["project"]["south_property"] != null
                ? int.parse(
                        printData["project"]["south_property"].toString()) ==
                    INT_ONE
                : southRoad;
            selectedLevel = printData["project"]["level"] != null
                ? levels[int.parse(printData["project"]["level"].toString())]
                : selectedLevel;
            levelController = printData["project"]["level_value"] != null
                ? printData["project"]["level_value"].toString()
                : levelController;
            southController = printData["project"]["south_road_width"] != null
                ? printData["project"]["south_road_width"].toString()
                : southController;
            westController = printData["project"]["west_road_width"] != null
                ? printData["project"]["west_road_width"].toString()
                : westController;
            northController = printData["project"]["north_road_width"] != null
                ? printData["project"]["north_road_width"].toString()
                : northController;
            eastController = printData["project"]["east_road_width"] != null
                ? printData["project"]["east_road_width"].toString()
                : eastController;
            irregularPlotValue = printData["project"]["plot_type"] != null
                ? int.parse(printData["project"]["plot_type"].toString()) ==
                    INT_TWO
                : irregularPlotValue;
            regularPlotValue = printData["project"]["plot_type"] != null
                ? int.parse(printData["project"]["plot_type"].toString()) ==
                    INT_ONE
                : regularPlotValue;
            selectedLevelInt = printData["project"]["level"] != null
                ? int.parse(printData["project"]["level"].toString())
                : selectedLevelInt;
          }
        });
      }
    } catch (e) {}
  }

  bool isloading = false;

  // updateCheckbox() {
  //   if (isloading) {
  //     if (printData["project"]["east_property"] == 2) {
  //       setState(() {
  //         eastRoad = true;
  //       });
  //     }
  //   }
  // }
  Future<dynamic> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    project_id = prefs.getInt('projectId');
    projectTypeId = prefs.getInt('projectTypeId');
    projectGroupId = prefs.getInt('projectGroupId');
    print("project_id == ");
    print(project_id);
    getData(project_id);
    var decJson;
    if (userData != null) {
      decJson = jsonDecode(userData);
    }
    user_id = decJson['data']['id'];
  }

  Future<void> setDimension(dimension) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('dimension', dimenInt);
  }

  String? plotType;
  late var timer;

  @override
  void initState() {
    super.initState();

    getUserId();
    final store = Provider.of<PageNavProvider>(context, listen: false);
    var residentProvider =
        Provider.of<ResidentialProvider>(context, listen: false);

    getCities();
    getState();
    apiRegularCalcuation();
    if (!isMount) {
      return;
    }
    if (isMount) {
      plotValue.addListener(
        () => setState(
          () {
            if (printData != null) {
              plotType = printData["project"] != null
                  ? printData["project"]["plot_type"].toString()
                  : plotType;
              if (plotType == STR_ONE) {
                plotValue.text =
                    (num.parse(printData["project"]["plot_length"]) *
                            num.parse(printData["project"]["plot_width"]))
                        .toStringAsFixed(2);
              }
              if (plotType == STR_TWO) {
                // plotValue.text = (printData["project"]["plot_length"] *
                //     printData["project"]["plot_width"] ~/
                //     2);
                plotValue.text =
                    (num.parse(printData["project"]["plot_length"]) ~/
                            num.parse(printData["project"]["plot_width"]))
                        .toStringAsFixed(2);
              }
            }
          },
        ),
      );
    }

    timer = Timer.periodic(
        const Duration(seconds: 3),
        (Timer t) => setState(() {
              isloading = true;
            }));
  }

  @override
  void dispose() {
    // print("dispose");
    timer.cancel();
    isMount = false;
    if (lengthController != null) lengthController.dispose();
    if (widthController != null) widthController.dispose();

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
                Row(
                  children: [
                    requirementText("Name"),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height * 0.04,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text(selectedItems),
                            icon: const Icon(Icons.keyboard_arrow_down_sharp),
                            elevation: 16,
                            items: items.asMap().entries.map((it) {
                              int idx = it.key;
                              String value = it.value;
                              return DropdownMenuItem<String>(
                                value: it.value,
                                onTap: () {
                                  selectedItemInt = it.key;
                                },
                                child: Text(it.value,
                                    style: TextStyle(fontSize: height * 0.02)),
                              );
                            }).toList(),
                            onChanged: (it) => setState(
                              () {
                                // if (it == PREFIX_MR) {
                                //   selectedItemInt = MR;
                                // } else if (it == PREFIX_MRS) {
                                //   selectedItemInt = MRS;
                                // } else if (it == PREFIX_MS) {
                                //   selectedItemInt = MS;
                                // } else if (it == PREFIX_M_S) {
                                //   selectedItemInt = M_S;
                                // }
                                // print(items.indexOf(it!));
                                selectedItems = it!;
                                if (printData['project'] != null &&
                                    printData != null) {
                                  printData['project']['prefix'] =
                                      selectedItems;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.25,
                        child: TextFormField(
                          // controller: nameController,
                          // initialValue: printData != null
                          //     ? printData['project'] != null
                          //         ? printData["project"]["first_name"].toString()
                          //         : nameController
                          //     : nameController,
                          initialValue: nameController,
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "First name",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)),
                          onChanged: (value) {
                            nameController = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.19,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: lastNameController,
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "last name",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)),
                          onChanged: (value) {
                            lastNameController = value;
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
                    requirementText("Email"),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.6,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: emailController.toString(),
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green

                              ),
                          onChanged: (value) {
                            emailController = value;
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
                    requirementText("Project \nAddress"),
                    SizedBox(
                      width: width * 0.017,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.06,
                        width: width * 0.6,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: addressController,
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "address",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green

                              ),
                          onChanged: (value) {
                            addressController = value;
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
                    requirementText("Country"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height * 0.04,
                        width: width * 0.6,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: country,
                            elevation: 16,
                            items: countryItmes
                                .map(
                                  (it) => DropdownMenuItem<String>(
                                    value: it,
                                    child: Text(it,
                                        style:
                                            TextStyle(fontSize: height * 0.02)),
                                  ),
                                )
                                .toList(),
                            onChanged: (it) => setState(() => country = it!),
                          ),
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
                    Forms.requirementText("State"),
                    SizedBox(
                      width: width * 0.06,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height * 0.04,
                        width: width * 0.6,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            // value: printData["project"] != null
                            //     ? printData["project"]["state_name"] != null
                            //         ? printData["project"]["state_name"]
                            //         : selectedState
                            //     : selectedState,
                            hint: Text(selectedState),

                            // hint: printData['project'] != null
                            //     ? printData["project"]["state_name"] != null
                            //         ? Text(printData["project"]["state_name"])
                            //         : Text(selectedState)
                            //     : Text(selectedState),
                            elevation: 16,
                            items: stateData.asMap().entries.map((e) {
                              int idx = e.key;
                              String val = e.value['state_name'];
                              return DropdownMenuItem<String>(
                                value: val,
                                onTap: () {
                                  stateId = e.value["id"];
                                  getCities();
                                },
                                child: Text(val),
                              );
                            }).toList(),

                            onChanged: (it) {
                              setState(() {
                                if (printData['project'] != null) {
                                  printData["project"]["state_name"] = null;
                                }
                                selectedState = it.toString();
                                getCities();
                              });
                            },

                            // stateData
                            //     .map(
                            //       (it) => DropdownMenuItem<String>(
                            //         value: it["state_name"] != null &&
                            //                 it["state_name"] != ''
                            //             ? it["state_name"]
                            //             : Text(selectedState),
                            //         child: Text(
                            //           it["state_name"],
                            //           style: TextStyle(
                            //               fontSize: height * 0.02),
                            //         ),
                            //         onTap: () {
                            //           setState(() {
                            //             // stateId = it["id"];
                            //             // print('it["id"]');
                            //             // print(it["id"]);
                            //             getCities();
                            //           });
                            //         },
                            //       ),
                            //     )
                            //     .toList(),
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
                    Forms.requirementText("city"),
                    SizedBox(
                      width: width * 0.085,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height * 0.04,
                        width: width * 0.6,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: printData != null
                                ? printData["project"] != null
                                    ? printData["project"]["city_name"] != null
                                        ? Text(
                                            printData["project"]["city_name"])
                                        : Text(myState)
                                    : Text(myState)
                                : Text(myState),
                            elevation: 16,
                            items: cityData
                                .map(
                                  (it) => DropdownMenuItem<String>(
                                    value: it["city_name"],
                                    child: Text(
                                      it["city_name"],
                                      style: TextStyle(fontSize: height * 0.02),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        cityId = it["id"];
                                      });
                                    },
                                  ),
                                )
                                .toList(),
                            onChanged: (newValue) {
                              setState(
                                () {
                                  if (printData['project'] != null) {
                                    printData["project"]["city_name"] =
                                        newValue.toString();
                                  }
                                  myState = newValue.toString();
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
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    const Text(
                      "Property details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.23,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height * 0.04,
                        width: width * 0.2,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: size,
                            elevation: 16,
                            items: sizeitems
                                .map((it) => DropdownMenuItem<String>(
                                      value: it,
                                      child: Text(
                                        it,
                                        style:
                                            TextStyle(fontSize: height * 0.02),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (it) => setState(() {
                              size = it!;
                              if (size == FEET) {
                                double one =
                                    double.parse(lengthController.text);
                                print('one---');
                                print(one);
                                if (lengthFeetbool ||
                                    printData["project"]["plot_length"] !=
                                        null) {
                                  lengthController.text =
                                      (one * M_TO_F).toStringAsFixed(2);
                                  // (one * M_TO_F).toString();
                                  printData["project"]["plot_length"] = null;
                                  lengthFeetbool = false;
                                  lengthMeterbool = true;
                                  totalCalculated();
                                }

                                double width_one =
                                    double.parse(widthController.text);
                                if (widthFeetbool ||
                                    printData["project"]["plot_width"] !=
                                        null) {
                                  widthController.text =
                                      (width_one * M_TO_F).toStringAsFixed(2);
                                  printData["project"]["plot_width"] = null;
                                  widthFeetbool = false;
                                  widthMeterbool = true;
                                  totalCalculated();
                                }

                                // print('if widthController---');
                                // print(widthController.text);
                              } else {
                                double two =
                                    double.parse(lengthController.text);
                                print('two--');
                                print(two);
                                if (lengthMeterbool ||
                                    printData["project"]["plot_length"] !=
                                        null) {
                                  lengthController.text =
                                      (two ~/ M_TO_F).toStringAsFixed(2);
                                  // print('lengthController.text===');
                                  // print(lengthController.text);
                                  // (two ~/ M_TO_F).toString();
                                  printData["project"]["plot_length"] = null;
                                  lengthMeterbool = false;
                                  lengthFeetbool = true;
                                  totalCalculated();
                                }

                                double width_two =
                                    double.parse(widthController.text);
                                if (widthMeterbool ||
                                    printData["project"]["plot_width"] !=
                                        null) {
                                  widthController.text =
                                      (width_two ~/ M_TO_F).toStringAsFixed(2);
                                  printData["project"]["plot_width"] = null;
                                  widthMeterbool = false;
                                  widthFeetbool = true;
                                }
                                print('else widthController---');
                                // print(widthController.text);
                                totalCalculated();
                              }
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: printData != null
                          ? printData['project'] != null
                              // ? printData['project']['plot_type'] != null
                              ? printData['project']['plot_type'] == 1
                                  ? true
                                  : regularPlotValue
                              // : regularPlotValue
                              : regularPlotValue
                          : regularPlotValue,
                      // value: regularPlotValue,
                      onChanged: (val) {
                        setState(() {
                          regularPlotValue = val;
                          irregularPlotValue = false;
                          key:
                          Key(totalCalculated());

                          // if (lengthController != null && widthController != null) {
                          //   plotValue.text = (int.parse(lengthController!) *
                          //           int.parse(widthController!))
                          //       .toString();

                          //   print(" ======");
                          //   print(plotValue.text);
                          // }

                          if (printData != null &&
                              printData['project'] != null) {
                            printData['project']['plot_type'] = val;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      width: width * 0.00,
                    ),
                    requirementText("Regular plot"),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: irregularPlotValue,
                      onChanged: (val) {
                        setState(
                          () {
                            irregularPlotValue = val;
                            regularPlotValue = false;

                            if (printData != null &&
                                printData['project'] != null) {
                              printData['project']['plot_type'] = val;
                            }
                          },
                        );
                      },
                    ),
                    requirementText("Irregular plot"),
                  ],
                ),
                //  if (regularPlotValue == true) ...[
                Row(
                  children: [
                    requirementText("Length"),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.15,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Lenght",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)),
                          controller: lengthController,
                          onChanged: (val) {
                            print('lengthController---');
                            print(lengthController.text);

                            setState(() {
                              if (val != '') {
                                plotType = '';
                                plotLenght =
                                    double.parse(lengthController.text);
                                // plotLenght = double.parse(val.toString());
                                lengthFeetbool = true;
                                lengthMeterbool = true;
                                // plotLenght = double.tryParse(val)!;

                                totalCalculated();
                                if (printData != null &&
                                    printData['project']['plot_length'] !=
                                        null) {
                                  printData['project']['plot_length'] = val;
                                }
                              } else {
                                plotLenght = double.parse(INT_ZERO.toString());
                                plotValue.text = STR_ZERO;
                                lengthController.text = '';
                                // lengthController.text = STR_ZERO;
                              }
                            });
                          },
                          onTap: () {
                            setState(() {
                              // plotLenght = 0;
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    valueContainer(height, width, size, 0.039, 0.05),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    // if (irregularPlotValue == true)
                    if (printData != null
                        ? printData['project'] != null
                            ? printData['project']['plot_type'] == 2
                                ? true
                                : irregularPlotValue == true
                            : irregularPlotValue == true
                        : irregularPlotValue == true) ...[
                      requirementText("Diagona1"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 5,
                        child: Container(
                          height: height * 0.04,
                          width: width * 0.2,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Diagonal 1",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            initialValue: diagonal1Controller,
                            onChanged: (value) {
                              setState(() {
                                if (value != '') {
                                  diagonal1 = int.parse(value.toString());
                                  diagonal1Controller = value;
                                  if (printData != null &&
                                      printData['project']['diagonal_1'] !=
                                          null) {
                                    printData['project']['diagonal_1'] = value;
                                  }
                                  diagonalCalculations();
                                } else {
                                  diagonal1 = 0;
                                  plotValue.text = '0';
                                  diagonal1Controller = '0';
                                }
                              });
                            },
                            onTap: () {
                              setState(() {
                                diagonalCalculations();
                              });
                            },
                            keyboardType: TextInputType.number,
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
                    requirementText("Width"),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.15,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          controller: widthController,
                          onChanged: (val) {
                            setState(() {
                              if (val != '') {
                                plotType = '';
                                plotWidth = double.parse(val.toString());

                                // widthController = val;
                                if (printData != null &&
                                    printData['project']['plot_width'] !=
                                        null) {
                                  printData['project']['plot_width'] = val;
                                }
                                totalCalculated();
                              } else {
                                plotWidth = 0;
                                plotValue.text = '0';
                                // widthController = '0';
                              }
                            });
                          },
                          onTap: () {
                            setState(() {
                              // widthController.clear();
                              if (widthController == 0) {
                                plotWidth = 0;
                              }
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    valueContainer(height, width, size, 0.039, 0.05),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    if (irregularPlotValue == true)
                      // if (irregularPlotValue == true)
                      ...[
                      requirementText("Diagona2"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(5),
                        elevation: 5,
                        child: Container(
                          height: height * 0.04,
                          width: width * 0.2,
                          child: TextFormField(
                            initialValue: diagonal2Controller.toString(),
                            decoration: const InputDecoration(
                                hintText: "Diagonal 2",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.all(8)
                                // fillColor: Colors.green
                                ),

                            onChanged: (value) {
                              setState(() {
                                if (value != '') {
                                  diagonal2 = int.parse(value.toString());
                                  diagonal2Controller = value;
                                  if (printData != null &&
                                      printData['project']['diagonal_2'] !=
                                          null) {
                                    printData['project']['diagonal_2'] = value;
                                  }
                                  diagonalCalculations();
                                } else {
                                  diagonal2 = 0;
                                  diagonal2Controller = '0';
                                  plotValue.text = '0';
                                }
                              });
                            },
                            onTap: () {
                              setState(() {});
                            },
                            // onSubmitted: (value) {
                            //   setState(() {
                            //     plotWidth = value;
                            //     plotSize = int.parse(plotWidth);
                            //     plotSize *= int.parse(plotlength);
                            //   });
                            // },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                // ],
                Row(
                  children: [
                    requirementText("Plot size"),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    if (irregularPlotValue == true) ...[
                      Material(
                        borderRadius: BorderRadius.circular(5),
                        elevation: 5,
                        child: Container(
                          height: height * 0.04,
                          width: width * 0.2,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            key: Key(diagonalCalculations()),
                            // initialValue: printData != null
                            //     ? printData['project'] != null
                            //         // ? printData['project']['plot_size'] != null
                            //         ? printData['project']['plot_size']
                            //         // : plotValue
                            //         : plotValue.value.text
                            //     : plotValue.value.text,
                            // initialValue: printData != null
                            //     ? printData['project'] != null
                            //         ? printData['project']['plot_size'] != null
                            //             ? printData['project']['plot_size'].toString()
                            //             : plotValue.text
                            //         : plotValue.text
                            //     : plotValue.text,
                            controller: plotValue,
                            onChanged: (value) {
                              setState(() {
                                if (plotLenght == 0 || plotWidth == 0) {
                                  value = "0";
                                } else if (lengthController == '' ||
                                    widthController == '') {
                                  value = "0";
                                } else {
                                  plotValue.value = plotValue.value.copyWith(
                                    text: value.toString(),
                                  );
                                  // printData['project']['plot_size'] =
                                  // plotValue.text;
                                }
                              });
                            },
                            onTap: () {
                              setState(() {
                                plotValue.clear();
                                plotValue.value = plotValue.value.copyWith(
                                  text: '',
                                );
                              });
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ] else ...[
                      Material(
                        borderRadius: BorderRadius.circular(5),
                        elevation: 5,
                        child: Container(
                          height: height * 0.04,
                          width: width * 0.2,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            key: Key(totalCalculated()),
                            // initialValue: printData != null
                            //     ? printData['project'] != null
                            //         ? printData['project']['plot_size'].toString()
                            //         : plotValue.value.text
                            //     : plotValue.value.text,
                            controller: plotValue,
                            onChanged: (value) {
                              setState(() {
                                plotValue.value = plotValue.value.copyWith(
                                  text: value.toString(),
                                );
                              });
                            },
                            onTap: () {
                              setState(() {
                                plotValue.clear();
                                plotValue.value = plotValue.value.copyWith(
                                  text: '',
                                );
                              });
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                if (irregularPlotValue == true) ...[
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    width: width * 1,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: requirementText(
                              "For irregular plot plot sketch is required"),
                        ),
                        Row(
                          children: [
                            Material(
                              elevation: 2,
                              child: Container(
                                child: Row(
                                  children: const [
                                    Icon(Icons.cloud_upload),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Upload a hand sketch(jpg)"),
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
                              color: Colors.blue[900],
                              child: const Text(
                                "Preview",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
                Row(
                  children: [
                    Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: surveyor,
                      onChanged: (val) {
                        setState(() {
                          surveyor = val;
                        });
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text(
                                "You have raised a Alert Dialog Box"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    surveyor = false;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.black,
                                  child: const Text(
                                    "okay",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    requirementText("Appoint as a surveyor"),
                    Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: notReqired,
                      onChanged: (val) {
                        setState(() {
                          notReqired = val;
                        });
                      },
                    ),
                    requirementText("Not required"),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: requirementText("Plot values"),
                ),
                Row(
                  children: [
                    requirementText("East"),
                    Checkbox(
                        activeColor: checkColor,
                        checkColor: Colors.white,
                        // value: otherEast,
                        value: eastRoad,
                        onChanged: (value) {
                          setState(() {
                            eastRoad = value!;
                            otherEast = false;
                            // if (eastRoad == true) {
                            //   eastRoad = false;
                            // }
                            if (printData != null &&
                                printData['project'] != null) {
                              printData["project"]["east_property"] = eastRoad;
                            }
                          });
                        }),
                    Forms.requirementText("Other property"),
                    // CheckboxListTile(value: value, onChanged: (value)),
                    Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      // value: false,
                      // value: printData != null ? otherEast : otherEast,
                      value: otherEast,
                      onChanged: (value) {
                        // print?(printData["project"]["east_property"]);
                        setState(() {
                          otherEast = value!;
                          eastRoad = false;
                          if (printData != null &&
                              printData['project'] != null) {
                            printData["project"]["east_property"] = otherEast;
                          }
                          // if (otherEast = true) {
                          //   otherEast = false;
                          // }
                        });
                      },
                    ),
                    requirementText("Road"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    if (otherEast!) ...[
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.2,
                          child: TextFormField(
                            // controller: nameController,
                            initialValue: eastController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Road width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)),
                            onChanged: (value) {
                              eastController = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Forms.valueContainer(height, width, size, 0.039, 0.05)
                    ]
                  ],
                ),
                Row(
                  children: [
                    requirementText("West"),
                    Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      // value: otherwest,
                      value: printData != null
                          ? printData['project'] != null
                              ? printData["project"]["west_property"] ==
                                      WEST_PROPERTY
                                  ? true
                                  : westRoad
                              : westRoad
                          : westRoad,
                      onChanged: (value) {
                        setState(() {
                          westRoad = value!;
                          otherwest = false;
                          if (printData != null &&
                              printData['project'] != null) {
                            printData["project"]["west_property"] = westRoad;
                          }
                          // if (westRoad == true) {
                          //   westRoad = false;
                          // }
                        });
                      },
                    ),
                    requirementText("Other Property"),
                    Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      // value: otherwest,
                      value: otherwest,
                      onChanged: (value) {
                        setState(() {
                          otherwest = value!;
                          westRoad = false;
                          if (printData != null &&
                              printData['project'] != null) {
                            printData["project"]["west_property"] = otherwest;
                          }
                          // if (otherwest = true) {
                          //   otherwest = false;
                          // }
                        });
                      },
                    ),
                    requirementText("Road"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    if (otherwest!) ...[
                      // if (printData['project'] != null
                      //     ? printData["project"]["west_road_width"] != null
                      //         ? printData["project"]["west_road_width"]
                      //         : otherwest
                      //     : otherwest == true) ...[
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.18,
                          child: TextFormField(
                            // controller: nameController,
                            initialValue: westController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Road width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green

                                ),
                            onChanged: (value) {
                              westController = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Forms.valueContainer(height, width, size, 0.039, 0.05)
                    ]
                  ],
                ),
                Row(
                  children: [
                    requirementText("North"),
                    Checkbox(
                        activeColor: checkColor,
                        checkColor: Colors.white,
                        // value: otherNortn,
                        value: northRoad,
                        onChanged: (value) {
                          setState(() {
                            northRoad = value!;
                            otherNorth = false;
                            if (printData != null &&
                                printData['project'] != null) {
                              printData["project"]["north_property"] =
                                  northRoad;
                            }
                            // if (nortRoad == true) {
                            //   nortRoad = false;
                            // }
                          });
                        }),
                    requirementText("Other Property"),
                    Checkbox(
                        activeColor: checkColor,
                        checkColor: Colors.white,
                        // value: otherNortn,
                        value: otherNorth,
                        onChanged: (value) {
                          setState(() {
                            otherNorth = value!;
                            northRoad = false;
                            if (printData != null &&
                                printData['project'] != null) {
                              printData["project"]["north_property"] =
                                  northRoad;
                            }
                            // if (otherNortn = true) {
                            //   otherNortn = false;
                            // }
                          });
                        }),
                    requirementText("Road"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    if (otherNorth!) ...[
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.18,
                          child: TextFormField(
                            // controller: nameController,
                            initialValue: northController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Road width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              northController = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Forms.valueContainer(height, width, size, 0.039, 0.05)
                    ]
                  ],
                ),
                Row(
                  children: [
                    requirementText("South"),
                    Checkbox(
                        activeColor: checkColor,
                        checkColor: Colors.white,
                        // value: otherSouth,
                        value: southRoad,
                        onChanged: (value) {
                          setState(
                            () {
                              southRoad = value!;
                              otherSouth = false;
                              if (printData != null &&
                                  printData['project'] != null) {
                                printData["project"]["south_property"] =
                                    SOUTH_PROPERTY;
                              }
                              // if (southRoad == true) {
                              //   southRoad = false;
                              // }
                            },
                          );
                        }),
                    Forms.requirementText("Other Property"),
                    Checkbox(
                        activeColor: checkColor,
                        checkColor: Colors.white,
                        // value: otherSouth,
                        value: otherSouth,
                        onChanged: (value) {
                          setState(() {
                            otherSouth = value!;
                            southRoad = false;
                            if (printData != null &&
                                printData['project'] != null) {
                              printData["project"]["south_property"] =
                                  otherSouth;
                            }
                            // if (otherSouth = true) {
                            //   otherSouth = false;
                            // }
                          });
                        }),
                    requirementText("Road"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    if (otherSouth!) ...[
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.18,
                          child: TextFormField(
                            // controller: nameController,
                            initialValue: southController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Road width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green

                                ),
                            onChanged: (value) {
                              southController = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Forms.valueContainer(height, width, size, 0.039, 0.05)
                    ]
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.white,
                  width: width * 1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: northOriented,
                              onChanged: (value) {
                                setState(() {
                                  northOriented = value;
                                });
                              }),
                          Align(
                            alignment: Alignment.topLeft,
                            child: requirementText(
                                "For irregular plot sketch is required"),
                          ),
                        ],
                      ),
                      if (northOriented == true) ...[
                        Row(
                          children: [
                            Material(
                              elevation: 2,
                              child: Container(
                                child: Row(
                                  children: const [
                                    Icon(Icons.cloud_upload),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Upload a hand sketch(jpg)"),
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
                              color: Colors.blue[900],
                              child: const Text(
                                "Preview",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ]
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: requirementText("Plot level from road level"),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: height * 0.04,
                          padding: const EdgeInsets.all(5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text(selectedLevel),
                              // value: selectedLevel,
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              elevation: 16,
                              items: levels.asMap().entries.map((it) {
                                int idx = it.key;
                                String value = it.value;
                                return DropdownMenuItem<String>(
                                  value: it.value,
                                  onTap: () {
                                    selectedLevelInt = it.key;
                                  },
                                  child: Text(it.value,
                                      style:
                                          TextStyle(fontSize: height * 0.02)),
                                );
                              }).toList(),
                              onChanged: (it) => setState(() {
                                selectedLevel = it!;
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (selectedLevel == "Up") ...[
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.22,
                          child: TextFormField(
                            // controller: nameController,
                            initialValue: levelController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Road width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              levelController = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                    ],
                    if (selectedLevel == "Down") ...[
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.22,
                          child: TextFormField(
                            // controller: nameController,
                            initialValue: levelController,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Road width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              levelController = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                    ]
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () async {
                    setState(
                      () {
                        print("projectTypeId is running");
                        print(projectTypeId);

                        if (irregularPlotValue == true) {
                          isRegular = 2;
                          plot_orientaion = 1;
                        } else {
                          isRegular = 1;
                        }
                        // setProjectTypeId(BUNGALOW);
                        if (size == "m") {
                          dimenInt = 2;
                          setDimension(dimenInt);
                        } else {
                          dimenInt = 1;
                          setDimension(1);
                        }
                        if (isNorthOrientaion == true) {
                          isNorthOrientaion = 1;
                        }
                        if (westRoad == true) {
                          isWest = WEST_PROPERTY;
                        } else if (otherwest == true) {
                          isWest = WEST_OTHER_PROPERTY;
                        }
                        if (eastRoad == true) {
                          isEast = EAST_PROPERTY;
                        } else if (otherEast == true) {
                          isEast = EAST_OTHER_PROPERTY;
                        }
                        if (northRoad == true) {
                          isNorth = NORTH_PROPERTY;
                        } else if (otherNorth == true) {
                          isNorth = NORTH_OTHER_PROPERTY;
                        }
                        if (southRoad == true) {
                          isSouth = SOUTH_PROPERTY;
                        } else if (otherSouth == true) {
                          isSouth = SOUTH_OTHER_PROPERTY;
                        }
                        if (notReqired == true) {
                          notReqiredInt = 1;
                        }
                      },
                    );
                    var status;

                    if (pageId != null) {
                      print("upadte is running");
                      print(project_id);
                      status = await provider.requirementUpdate(
                        project_id,
                        user_id,
                        projectGroupId,
                        projectTypeId,
                        selectedItemInt,
                        nameController,
                        lastNameController,
                        emailController,
                        COUNTRY_ID,
                        stateId,
                        cityId,
                        addressController,
                        isRegular,
                        dimenInt,
                        lengthController.text,
                        widthController.text,
                        diagonal1Controller!,
                        diagonal2Controller!,
                        plotValue.text,
                        " ",
                        plot_orientaion,
                        " ",
                        isEast,
                        eastController,
                        isWest,
                        westController,
                        isNorth,
                        northController,
                        isSouth,
                        southController,
                        selectedLevelInt,
                        levelController,
                        notReqiredInt,
                      );
                    } else {
                      status = await provider.requirementPost(
                        user_id,
                        projectGroupId,
                        projectTypeId,
                        selectedItemInt,
                        nameController,
                        lastNameController,
                        emailController,
                        COUNTRY_ID,
                        stateId,
                        cityId,
                        addressController,
                        isRegular,
                        dimenInt,
                        lengthController.text,
                        widthController.text,
                        diagonal1Controller!,
                        diagonal2Controller!,
                        plotValue.text,
                        "",
                        plot_orientaion,
                        "",
                        isEast,
                        eastController,
                        isWest,
                        westController,
                        isNorth,
                        northController,
                        isSouth,
                        southController,
                        selectedLevelInt,
                        levelController,
                        notReqiredInt,
                      );
                    }

                    // project_id = provider.project_id;
                    if (status == 200) {
                      showToast('Project Requirement Submitted !',
                          Colors.lightGreen, ToastGravity.TOP);
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

  bool sqCheck(String str) {
    if (str.contains(size)) {
      return true;
    } else {
      return false;
    }
  }
}
