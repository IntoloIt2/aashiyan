import 'package:aashiyan/components/forms.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

import '../../../controller/api_services.dart';

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
    "more"
  ];

  String selectedFloor = "Select";

  int floorInt = 1;

  TextEditingController floorController = TextEditingController();
  TextEditingController gateWidthController = TextEditingController();
  TextEditingController selectedCarGateController = TextEditingController();
  TextEditingController selectedSidePadestController = TextEditingController();
  TextEditingController diffrentCustomizedLocationController =
      TextEditingController();
  TextEditingController securityKioskLengthController = TextEditingController();
  TextEditingController securityKioskWidthController = TextEditingController();
  TextEditingController porchLengthController = TextEditingController();
  TextEditingController porchWidthController = TextEditingController();
  TextEditingController foyerWidthController = TextEditingController();
  TextEditingController foyerLengthController = TextEditingController();
  TextEditingController verandaWidthController = TextEditingController();
  TextEditingController verandaLengthController = TextEditingController();

  void floor() {
    setState(() {
      if (selectedFloor == "2(G+1)") {
        floorInt = 2;
      }
      if (selectedFloor == "3(G+2)") {
        floorInt = 3;
      }
      if (selectedFloor == "4(G+3)") {
        floorInt = 4;
      }
      if (selectedFloor == "more") {
        floorInt = int.parse(floorController.text);
      }
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

  List<String> carParkingItems = ["Select", "1", "2", "3", "4", "5", "more"];
  String selectedCarParking = "Select";

  bool? outSideOpen = false;
  bool? outSideClosed = false;

  bool? requiredVeranda = false;
  bool? notReqiredVeranda = false;
  int requiredVerandaInt = 0;
  String verandaArea = "0";

  bool? requiredWelcomeLobyy = false;
  int requiredWelcomeLobyyInt = 0;
  String foyerArea = "0";
  String veranda = "";

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

  bool? moderate = false;
  String moderateString = "0";

  bool? consult = false;

  bool? oneGate = true;
  String gate = "OneGate";

  bool? twoGate = false;

  bool? porchRequired = false;
  int porchReqInt = 0;
  
  bool? porchNotRequired = false;
  String porchArea = "";

  String porch = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
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
                          items: floors
                              .map((it) => DropdownMenuItem<String>(
                                  value: it,
                                  child: Text(
                                    it,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  )))
                              .toList(),
                          onChanged: (it) =>
                              setState(() => selectedFloor = it!)),
                    ),
                  ),
                ),
                if (selectedFloor == "more") ...[
                  requirementTextFieldCont(
                      height, width, 0.04, 0.15, "floors", floorController)
                ]
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
                            StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                  activeColor: checkColor,
                                  checkColor: Colors.white,
                                  value: moderate,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      moderate = value!;
                                    });
                                  });
                            }),
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
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Ground floor requirement",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
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
                                    oneGate = value;
                                    twoGate = false;
                                    adjascent = false;
                                    diffrentCustom = false;
                                  });
                                }),
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
                        margin: EdgeInsets.only(right: 10),
                        height: height * 0.04,
                        child: Row(
                          children: [
                            Checkbox(
                                activeColor: checkColor,
                                checkColor: Colors.white,
                                value: twoGate,
                                onChanged: (value) {
                                  setState(() {
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
                            value: entranceSelectedGates,
                            items: entranceGates
                                .map((e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (e) => setState(() {
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
                    requirementTextFieldCont(height, width, 0.04, 0.2,
                        "gatewidth", gateWidthController)
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
                                        setState(() {
                                          diffrentCustom = value;
                                          adjascent = false;
                                        });
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
                                    value: selectedCarGate,
                                    items: carGate
                                        .map((e) => DropdownMenuItem<String>(
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
                                    value: selectedSidePadest,
                                    items: sidePadest
                                        .map((e) => DropdownMenuItem<String>(
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
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Brief about diffrent custom Location",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              requirementTextFieldCont(
                  height,
                  width,
                  0.05,
                  0.95,
                  "Bnef of diffrent customed location",
                  diffrentCustomizedLocationController),
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
                                    setState(() {
                                      securityRequired = value;
                                      securityNotRequired = false;
                                    });
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      securityKioskLengthController),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      securityKioskWidthController),
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      porchLengthController),
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
                  requirementTextFieldCont(
                      height, width, 0.04, 0.15, "Width", porchWidthController),
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
                            value: selectedVisual,
                            items: visualItems
                                .map((e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (e) => setState(() {
                                  selectedVisual = e!;
                                })),
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
                height: height * 0.02,
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
                              value: carparking,
                              onChanged: (value) {
                                setState(() {
                                  carparking = value;
                                });
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
                                child: Icon(Icons.arrow_downward)),
                            value: SelectedCar,
                            items: noOfCars
                                .map((e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (e) => setState(() {
                                  SelectedCar = e!;
                                })),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  if (SelectedCar == "more") ...[
                    requirementTextField(
                        height, width, 0.035, 0.2, "no of cars"),
                  ]
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      foyerLengthController),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextFieldCont(
                      height, width, 0.04, 0.15, "Width", foyerWidthController),
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
                            value: SelectedLobbyDesign,
                            items: lobbyDesign
                                .map((e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (e) => setState(() {
                                  SelectedLobbyDesign = e!;
                                })),
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
                  requirementTextFieldCont(height, width, 0.04, 0.15, "length",
                      verandaLengthController),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextFieldCont(height, width, 0.04, 0.15, "Width",
                      verandaWidthController),
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
                      requirementText("Out side closed with glass or grill"),
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
            ],
            SizedBox(
              height: height * 0.01,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (moderate == true) {
                    moderateString = "0";
                  }
                  floor();
                  if (oneGate == false) {
                    gate = "Twogate";
                  }
                  if (selectedCarGate == "more") {
                    selectedCarGate = selectedCarGateController.text;
                  }
                  if (selectedSidePadest == "more") {
                    selectedSidePadest = selectedSidePadestController.text;
                  }

                  if (securityRequired == true) {
                    securityReqInt = 1;
                    int securityArea =
                        int.parse(securityKioskLengthController.text) *
                            int.parse(securityKioskWidthController.text);

                    securityKiosqArea = securityArea.toString();
                  }
                  if (porchRequired == true) {
                    porchReqInt = 1;
                    int pArea = int.parse(porchLengthController.text) *
                        int.parse(porchWidthController.text);
                    porchArea = pArea.toString();
                  }
                  if (visualNature == true) {
                    porch = "visual nature ";
                  }
                  if (carparking == true) {
                    porch = "car parking space";
                  }
                  if (carparking == true && visualNature == true) {
                    porch = "visual nature car parking space ";
                  }
                  if (carparking == true) {
                    carParkingString = "1";
                  }
                  if (visualNature == true) {
                    visualNaturString = "1";
                  }
                  if (requiredWelcomeLobyy == true) {
                    requiredWelcomeLobyyInt = 1;
                    int fArea = int.parse(foyerLengthController.text) *
                        int.parse(foyerWidthController.text);

                    porchArea = fArea.toString();
                  }
                  if (requiredVeranda == true) {
                    requiredVerandaInt = 1;
                    int vArea = 0;

                    vArea = int.parse(verandaLengthController.text) *
                        int.parse(verandaWidthController.text);
                    verandaArea = vArea.toString();

                    if (outSideOpen == true) {
                      veranda = "out side open";
                    }
                    if (outSideClosed == true) {
                      veranda = "out side closed with glass or grill";
                    }
                    
                  }
                });
                entrancePost(
                  123,
                  moderateString,
                  floorInt,
                  gate,
                  entranceSelectedGates,
                  gate,
                  selectedCarGate,
                  selectedSidePadest,
                  diffrentCustomizedLocationController.text,
                  securityReqInt,
                  securityKioskLengthController.text,
                  securityKioskWidthController.text,
                  securityKiosqArea,
                  0,
                  porchReqInt,
                  porchLengthController.text,
                  porchWidthController.text,
                  porchArea,
                  porch,
                  visualNaturString,
                  carParkingString,
                  requiredWelcomeLobyyInt,
                  foyerLengthController.text,
                  foyerWidthController.text,
                  foyerArea,
                  SelectedLobbyDesign,
                  requiredVerandaInt,
                  verandaLengthController.text,
                  verandaWidthController.text,
                  verandaArea,
                  veranda,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: buttonColor, borderRadius: BorderRadius.circular(4)),
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
      ),
    );
  }
}
