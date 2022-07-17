import 'package:aashiyan/components/forms.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../components/bungalow_steps.dart';
import '../../../const.dart';
import '../../../components/app_bar.dart';
import '../../../controller/api_services.dart';

class Entrance extends StatefulWidget {
  const Entrance({Key? key}) : super(key: key);
  static const namedRoute = "/entrance";

  @override
  State<Entrance> createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  List<String> floors = ["Select", "1(G)", "2(G+1)", "3(G+3)", "more"];
  String selectedFloor = "Select";
  List<String> entranceGates = ["Select", "10", "12", "14", "more"];
  String entranceSelectedGates = "Select";

  List<String> carGate = ["Select", "10", "12", "14", "more"];
  String selectedCarGate = "Select";

  List<String> sidePadest = ["Select", "3", "4", "more"];
  String selectedSidePadest = "Select";

  List<String> visualItems = [
    "Select",
    "single height",
    "Double height",
  ];
  String selectedVisual = "Select";

  List<String> carParkingItems = ["Select", "1", "2", "3", "4", "5", "more"];
  String selectedCarParking = "Select";

  bool? carparking = false;
  bool? visualNature = false;
  bool? securityRequired = false;
  bool? securityNotRequired = false;
  bool? adjascent = false;
  bool? diffrentCustom = false;
  bool? moderate = false;
  bool? consult = false;
  bool? oneGate = true;
  bool? twoGate = false;
  bool? porchRequired = false;
  bool? porchNotRequired = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar("Entrance"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              bungalowSteps(context),
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
                      height: height * 0.045,
                      width: width * 0.2,
                      padding: const EdgeInsets.all(3),
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
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: height * 0.02),
                                    )))
                                .toList(),
                            onChanged: (it) =>
                                setState(() => selectedFloor = it!)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  requirementText("vastu"),
                  SizedBox(
                    width: width * 0.17,
                  ),
                  entranceContainer(
                      width, .035, "moderate consideration", moderate!)
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              entranceContainer(width, 0.29, "Consult", consult!),
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
                          padding: EdgeInsets.only(right: 10),
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
                          padding: EdgeInsets.only(right: 10),
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
                        height: height * 0.045,
                        width: width * 0.2,
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
                      requirementTextField(
                          height, width, 0.04, 0.2, "gatewidth")
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
                requirementTextField(
                  height,
                  width,
                  0.05,
                  0.95,
                  "Bnef of diffrent customed location",
                ),
              ],
              Row(
                children: [
                  SizedBox(
                    width: width * 0.025,
                  ),
                  if (selectedCarGate == "more" && adjascent == true) ...[
                    requirementTextField(height, width, 0.04, 0.2, "gate width")
                  ],
                  SizedBox(
                    width: width * 0.375,
                  ),
                  if (selectedSidePadest == "more" && adjascent == true) ...[
                    requirementTextField(
                        height, width, 0.04, 0.28, "side gate width")
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
                    requirementTextField(height, width, 0.04, 0.15, "length"),
                    valueContainer(height, width, size, 0.04, 0.05),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementText("Width"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    requirementTextField(height, width, 0.04, 0.15, "Width"),
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
                    requirementTextField(height, width, 0.04, 0.15, "length"),
                    valueContainer(height, width, size, 0.04, 0.05),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementText("Width"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    requirementTextField(height, width, 0.04, 0.15, "Width"),
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
                if (visualNature == true) ...[
                  SizedBox(
                    height: height * 0.01,
                  ),
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
                              value: carparking,
                              onChanged: (value) {
                                setState(() {
                                  carparking = value;
                                });
                              }),
                        ),
                        requirementText("car parking space")
                      ],
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
