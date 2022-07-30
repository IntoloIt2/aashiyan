import 'dart:convert';
import 'dart:ffi';

import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart' as Forms;
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/controller/api_services.dart';
import 'package:aashiyan/model/citiesmodel.dart';
import 'package:aashiyan/model/requirementmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';
import '../../../const.dart';

import 'package:http/http.dart' as http;

class Requirement extends StatefulWidget {
  static const namedRoute = "/intrestedNext";

  @override
  State<Requirement> createState() => _RequirementState();
}

class _RequirementState extends State<Requirement> {
  final JavascriptRuntime jsRuntime = getJavascriptRuntime();

  String plotlength = "1";
  String plotWidth = "1";

  late Future<RequirementModel> futureRequirement;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController daigonal1Controller = TextEditingController();
  TextEditingController diagonal2Controller = TextEditingController();
  TextEditingController eastController = TextEditingController();
  TextEditingController westController = TextEditingController();
  TextEditingController northController = TextEditingController();
  TextEditingController southController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  var levelControllerDouble;

  int isRegular = 0;
  int isNotRegular = 0;
  int isNorthOrientaion = 0;

  String isEast = "0";
  String isWest = "0";
  String isNorth = "0";
  String isSouth = "0";

  bool? northOriented = false;
  bool? regularPlotValue = false;
  bool? irregularPlotValue = false;
  bool? surveyor = false;
  bool? notReqired = false;
  int notReqiredInt = 0;

  bool? eastRoad = false;
  bool? westRoad = false;
  bool? nortRoad = false;
  bool? southRoad = false;
  bool? otherEast = false;
  bool? otherwest = false;
  bool? otherNortn = false;
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
  String selectedState = "Select State";

  List cityData = [];
  List stateData = [];

  @override
  void initState() {
    super.initState();
    getCities();
    getState();
    print("getting data");
  }

  Future<void> getState() async {
    try {
      var client = http.Client();
      var response =
          await http.get(Uri.parse("https://sdplweb.com/sdpl/api/state/1"));
      // print(response.body.toString());
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final stateList = jsonResponse['states'] as List;
        setState(() {
          stateData = stateList;
        });
        // print(stateData);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List?> getCities() async {
    try {
      var client = http.Client();
      var response = await http
          .get(Uri.parse("https://sdplweb.com/sdpl/api/city/$stateId"));
      // print(response.body.toString());
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final cityList = jsonResponse['cities'] as List;
        setState(() {
          cityData = cityList;
        });
        // print(cityData);
        return cityList;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // for (var element in cityData!) {
    //   print(element["city_name"]);
    // }
    // print(stateId);
    // print(cityData);
    // print(stateData);

    return Container(
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
                  padding: EdgeInsets.all(5),
                  height: height * 0.04,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedItems,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      elevation: 16,
                      items: items
                          .map((it) => DropdownMenuItem<String>(
                                value: it,
                                child: Text(it,
                                    style: TextStyle(fontSize: height * 0.02)),
                              ))
                          .toList(),
                      onChanged: (it) => setState(() {
                        if (it == "MR") {
                          selectedItemInt = 1;
                        } else if (it == "MRS") {
                          selectedItemInt = 2;
                        } else if (it == "MS") {
                          selectedItemInt = 3;
                        }
                        selectedItems = it!;
                      }),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              requirementTextFieldCont(
                height,
                width,
                0.04,
                0.25,
                "Firstname",
                nameController,
              ),
              SizedBox(
                width: width * 0.01,
              ),
              requirementTextFieldCont(
                height,
                width,
                0.04,
                0.19,
                "Lastname",
                lastNameController,
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
              requirementTextFieldCont(
                height,
                width,
                0.04,
                0.6,
                "Email",
                emailController,
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
              Forms.requirementTextFieldCont(
                height,
                width,
                0.06,
                0.6,
                "Address",
                addressController,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              Forms.requirementText("Country"),
              SizedBox(
                width: width * 0.02,
              ),
              Material(
                elevation: 5,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
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
                                  style: TextStyle(fontSize: height * 0.02)),
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
                  padding: EdgeInsets.all(5),
                  height: height * 0.04,
                  width: width * 0.6,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text(selectedState),
                      elevation: 16,
                      items: stateData
                          .map(
                            (it) => DropdownMenuItem<String>(
                              value: it["state_name"],
                              child: Text(
                                it["state_name"],
                                style: TextStyle(fontSize: height * 0.02),
                              ),
                              onTap: () {
                                setState(() {
                                  stateId = it["id"];
                                  getCities();
                                });
                              },
                            ),
                          )
                          .toList(),
                      onChanged: (it) => setState(() {
                        selectedState = it!;
                        getCities();
                      }),
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
                  padding: EdgeInsets.all(5),
                  height: height * 0.04,
                  width: width * 0.6,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text(myState),
                      elevation: 16,
                      items: cityData
                          .map(
                            (it) => DropdownMenuItem<String>(
                              value: it["city_name"],
                              child: Text(it["city_name"],
                                  style: TextStyle(fontSize: height * 0.02)),
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
                            myState = newValue!;
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
                  padding: EdgeInsets.all(5),
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
                                  style: TextStyle(fontSize: height * 0.02),
                                ),
                              ))
                          .toList(),
                      onChanged: (it) => setState(() => size = it!),
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
                value: regularPlotValue,
                onChanged: (val) {
                  setState(() {
                    regularPlotValue = val;
                    irregularPlotValue = false;
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
                  setState(() {
                    irregularPlotValue = val;
                    regularPlotValue = false;
                  });
                },
              ),
              requirementText("Irregular plot"),
            ],
          ),
          Row(children: [
            requirementText("Length"),
            SizedBox(
              width: width * 0.04,
            ),
            Container(
              height: height * 0.04,
              width: width * 0.15,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    plotlength = value;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    plotlength = value;

                    plotSize = int.parse(plotlength);
                    plotSize *= int.parse(plotWidth);
                  });
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            valueContainer(height, width, size, 0.039, 0.05),
            SizedBox(
              width: width * 0.02,
            ),
            if (irregularPlotValue == true) ...[
              requirementText("Diagona1"),
              SizedBox(
                width: width * 0.02,
              ),
              requirementTextFieldCont(
                  height, width, 0.04, 0.2, "Diagonal", daigonal1Controller)
            ]
          ]),
          SizedBox(
            height: height * 0.004,
          ),
          Row(
            children: [
              requirementText("Width"),
              SizedBox(
                width: width * 0.05,
              ),
              Container(
                height: height * 0.04,
                width: width * 0.15,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      plotWidth = value;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      plotWidth = value;
                      plotSize = int.parse(plotWidth);
                      plotSize *= int.parse(plotlength);
                    });
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
              SizedBox(
                width: width * 0.01,
              ),
              valueContainer(height, width, size, 0.039, 0.05),
              SizedBox(
                width: width * 0.02,
              ),
              if (irregularPlotValue == true) ...[
                requirementText("Diagona2"),
                SizedBox(
                  width: width * 0.02,
                ),
                requirementTextFieldCont(
                    height, width, 0.04, 0.2, "Diagonal", diagonal2Controller)
              ]
            ],
          ),
          SizedBox(
            height: height * 0.004,
          ),
          Row(children: [
            requirementText("Plot size"),
            SizedBox(
              width: width * 0.05,
            ),
            Forms.valueContainer(height, width, "$plotSize", 0.04, 0.1),
            SizedBox(
              width: width * 0.015,
            ),
            requirementTextField(height, width, 0.04, 0.15, "Length"),
            SizedBox(
              width: width * 0.01,
            ),
            valueContainer(height, width, "Length", 0.039, 0.08)
          ]),
          if (irregularPlotValue == true) ...[
            Container(
              padding: EdgeInsets.all(5),
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
                  value: otherEast,
                  onChanged: (value) {
                    setState(() {
                      otherEast = value;
                      if (eastRoad == true) {
                        eastRoad = false;
                      }
                    });
                  }),
              Forms.requirementText("Other property"),
              Checkbox(
                  activeColor: checkColor,
                  checkColor: Colors.white,
                  value: eastRoad,
                  onChanged: (value) {
                    setState(() {
                      eastRoad = value;
                      if (otherEast = true) {
                        otherEast = false;
                      }
                    });
                  }),
              requirementText("Road"),
              SizedBox(
                width: width * 0.01,
              ),
              if (eastRoad == true) ...[
                Forms.requirementTextFieldCont(
                    height, width, 0.04, 0.22, "Road Width", eastController),
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
                  value: otherwest,
                  onChanged: (value) {
                    setState(() {
                      otherwest = value;
                      if (westRoad == true) {
                        westRoad = false;
                      }
                    });
                  }),
              Forms.requirementText("Other Property"),
              Checkbox(
                  activeColor: checkColor,
                  checkColor: Colors.white,
                  value: westRoad,
                  onChanged: (value) {
                    setState(() {
                      westRoad = value;
                      if (otherwest = true) {
                        otherwest = false;
                      }
                    });
                  }),
              requirementText("Road"),
              SizedBox(
                width: width * 0.01,
              ),
              if (westRoad == true) ...[
                Forms.requirementTextFieldCont(
                    height, width, 0.04, 0.22, "Road Width", westController),
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
                  value: otherNortn,
                  onChanged: (value) {
                    setState(() {
                      otherNortn = value;
                      if (nortRoad == true) {
                        nortRoad = false;
                      }
                    });
                  }),
              Forms.requirementText("Other Property"),
              Checkbox(
                  activeColor: checkColor,
                  checkColor: Colors.white,
                  value: nortRoad,
                  onChanged: (value) {
                    setState(() {
                      nortRoad = value;
                      if (otherNortn = true) {
                        otherNortn = false;
                      }
                    });
                  }),
              requirementText("Road"),
              SizedBox(
                width: width * 0.01,
              ),
              if (nortRoad == true) ...[
                Forms.requirementTextFieldCont(
                    height, width, 0.04, 0.22, "Road Width", northController),
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
                  value: otherSouth,
                  onChanged: (value) {
                    setState(() {
                      otherSouth = value;
                      if (southRoad == true) {
                        southRoad = false;
                      }
                    });
                  }),
              Forms.requirementText("Other Property"),
              Checkbox(
                  activeColor: checkColor,
                  checkColor: Colors.white,
                  value: southRoad,
                  onChanged: (value) {
                    setState(() {
                      southRoad = value;
                      if (otherSouth = true) {
                        otherSouth = false;
                      }
                    });
                  }),
              requirementText("Road"),
              SizedBox(
                width: width * 0.01,
              ),
              if (southRoad == true) ...[
                requirementTextFieldCont(
                    height, width, 0.04, 0.22, "Road Width", southController),
                SizedBox(
                  width: width * 0.01,
                ),
                Forms.valueContainer(height, width, size, 0.039, 0.05)
              ]
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
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
                    padding: EdgeInsets.all(5),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedLevel,
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        elevation: 16,
                        items: levels
                            .map((it) => DropdownMenuItem<String>(
                                  value: it,
                                  child: Text(it,
                                      style:
                                          TextStyle(fontSize: height * 0.02)),
                                ))
                            .toList(),
                        onChanged: (it) => setState(() {
                          selectedLevel = it!;
                          if (it == "Up") {
                            selectedLevelInt = 2;
                          } else if (it == "Down") {
                            selectedLevelInt = 3;
                          } else if (it == "Almost same level") {
                            selectedLevelInt = 1;
                          }
                        }),
                      ),
                    ),
                  ),
                ),
              ),
              if (selectedLevel == "Up") ...[
                Forms.requirementTextFieldCont(
                    height, width, 0.04, 0.2, "Up/Down", levelController),
                SizedBox(
                  width: width * 0.01,
                ),
                valueContainer(height, width, size, 0.039, 0.05)
              ],
              if (selectedLevel == "Down") ...[
                Forms.requirementTextFieldCont(
                    height, width, 0.04, 0.2, "Up/Down", levelController),
                SizedBox(
                  width: width * 0.01,
                ),
                valueContainer(
                  height,
                  width,
                  size,
                  0.039,
                  0.05,
                ),
              ]
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (regularPlotValue == true) {
                  isRegular = 1;
                }

                if (regularPlotValue == true) {
                  isNotRegular = 1;
                }

                if (isNorthOrientaion == true) {
                  isNorthOrientaion = 1;
                }

                if (isNorth == true) {
                  isNorth = "1";
                }
                if (isEast == true) {
                  isEast = "1";
                }

                if (isWest == true) {
                  isWest = "1";
                }

                if (isNorth == true) {
                  isWest = "1";
                }
                if(notReqired == true){
                  notReqiredInt = 1;
                }
              });
              futureRequirement = requirementPost(
                2342,
                978,
                098,
                selectedItems,
                nameController.text,
                lastNameController.text,
                emailController.text,
                1,
                stateId,
                cityId,
                addressController.text,
                isRegular,
                isNotRegular,
                plotlength,
                plotWidth,
                daigonal1Controller.text,
                diagonal2Controller.text,
                plotSizeStr,
                " ",
                isNorthOrientaion,
                " ",
                isEast,
                eastController.text,
                isWest,
                westController.text,
                isNorth,
                northController.text,
                isSouth,
                southController.text,
                selectedLevelInt,
                levelController.text,
                notReqiredInt
                
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
// Future<int> addFromJs(
//     JavascriptRuntime jsRuntime, int firstNumber, int secondNumber) async {
//   String blocjs = await rootBundle.loadString("assets/bloc.js");
//   final jsResult = jsRuntime.evaluate(blocjs + "${firstNumber + secondNumber}");
//   final jsStringResult = jsResult.stringResult;
//   return int.parse(jsStringResult);
// }


