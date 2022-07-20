import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart' as Forms;
import 'package:aashiyan/components/forms.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../components/app_bar.dart';

class Requirement extends StatefulWidget {
  static const namedRoute = "/intrestedNext";

  @override
  State<Requirement> createState() => _RequirementState();
}

class _RequirementState extends State<Requirement> {
  bool? northOriented = false;
  bool? regularPlotValue = true;
  bool? irregularPlotValue = false;
  bool? surveyor = false;
  bool? notReqired = false;
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
  List<String> items = ["select", "Mr", "Mrs", "Ms", "M/s"];
  String selectedItems = 'select';
  List<String> countryItmes = ["India"];
  String country = "India";
  List<String> stateItems = [
    "SELECT STATE",
    "ARUNACHAL PRADESH",
    "ASSAM",
    "BIHAR",
    "CHHATTISGARH",
    "GOA",
    "GUJRAT",
    "HARYANA",
    "HIMACHAL PRADESH",
    "JHARKHAND",
    "KARNATAK",
    "KERALA",
    "MADHYA PRADESH",
    "MAHARASHTRA",
    "MANIPUR",
    "MEGHALAYA",
    "MIZORAM",
    "NAGALAND",
    "ODISHA",
    'PUNJAB',
    'RAJASTHAN',
    "SIKKIM",
    "TAMIL NADU",
    "TELENGA",
    "TRIPURA",
    "UTTAR PRADESH",
    "UTTRAKHAND",
    "WEST BENGAL",
    "ANDHRA PRADESH"
  ];
  String selectedState = "SELECT STATE";

  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: requirementColor,
      appBar: appBar("Requirement"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              bungalowSteps(context),
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
                                        style:
                                            TextStyle(fontSize: height * 0.02)),
                                  ))
                              .toList(),
                          onChanged: (it) =>
                              setState(() => selectedItems = it!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  requirementTextField(height, width, 0.04, 0.25, "Firstname"),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  requirementTextField(height, width, 0.04, 0.19, "Lastname"),
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
                  requirementTextField(height, width, 0.04, 0.6, "Email"),
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
                  requirementTextField(height, width, 0.06, 0.6, "Address"),
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
                      padding: EdgeInsets.all(5),
                      height: height * 0.04,
                      width: width * 0.6,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedState,
                          elevation: 16,
                          items: stateItems
                              .map(
                                (it) => DropdownMenuItem<String>(
                                  value: it,
                                  child: Text(it,
                                      style:
                                          TextStyle(fontSize: height * 0.02)),
                                ),
                              )
                              .toList(),
                          onChanged: (it) =>
                              setState(() => selectedState = it!),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                requirementTextField(height, width, 0.04, 0.15, "Length"),
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
                  requirementTextField(height, width, 0.04, 0.2, "Diagonal ")
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
                  requirementTextField(height, width, 0.04, 0.15, "Width"),
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
                    requirementTextField(height, width, 0.04, 0.2, "Diagonal ")
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
                requirementTextField(height, width, 0.04, 0.15, "00"),
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
                    requirementTextField(
                        height, width, 0.04, 0.22, "Road Width"),
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
                    requirementTextField(
                        height, width, 0.04, 0.22, "Road Width"),
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
                    requirementTextField(
                        height, width, 0.04, 0.22, "Road Width"),
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
                    requirementTextField(
                        height, width, 0.04, 0.22, "Road Width"),
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
                                          style: TextStyle(
                                              fontSize: height * 0.02)),
                                    ))
                                .toList(),
                            onChanged: (it) =>
                                setState(() => selectedLevel = it!),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (selectedLevel == "Up") ...[
                    requirementTextField(height, width, 0.04, 0.2, "Up/Down"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    valueContainer(height, width, size, 0.039, 0.05)
                  ],
                  if (selectedLevel == "Down") ...[
                    requirementTextField(height, width, 0.04, 0.2, "Up/Down"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    valueContainer(height, width, size, 0.039, 0.05)
                  ]
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    color: buttonColor, borderRadius: BorderRadius.circular(4)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text(
                  "save and continue",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
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
