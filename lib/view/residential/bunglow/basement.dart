import 'package:aashiyan/components/app_bar.dart';
import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/bedroom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../controller/api_services.dart';

class Basement extends StatefulWidget {
  static const namedRoute = "/Basement";
  @override
  State<Basement> createState() => _BasementState();
}

class _BasementState extends State<Basement> {
  List<String> otherFacilities = [];
  void multiSelected() async {
    final List<String> otherItems = ["Pantry", "Staff Toilet", "Toilet"];

    final List<String> result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: otherItems);
        });

    if (result != null) {
      setState(() {
        otherFacilities = result;
      });
    }
  }

  String slectedBasement = "For parking";
  List<String> basementList = ["For parking", "For amenites", "Both"];

  String slectedstilt = "For parking";
  List<String> stiltList = ["For parking", "For amenites", "Both"];

  String selectedOfficeLocation = "Select Location";
  List<String> listOfficeLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area"
  ];

  String serventLocation = "Select Location";
  List<String> serventItems = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area"
  ];

  String homeTheaterFloor = "Select Floor";
  List<String> homeTheaterFloorItems = [
    "Select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "Basement",
    "Stilt",
    "Terrace",
    "other"
  ];
  String selectedServent = "Select";
  List<String> noOfServents = ["Select", "1", "2", "3"];

  String selectedSeats = "Select";
  List<String> seatsItems = ["Select", "8", "10", "12", "more"];

  String selectedIndoorLocation = "Select Location";
  List<String> itemsIndoorLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area"
  ];

  String selectedBarLocation = "Select Location";
  List<String> itemsBarLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area"
  ];

  String swimmingLocation = "Select Location";
  List<String> itemsSwimmingLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area",
  ];

  String gymLocation = "Select Location";
  List<String> itemsGymLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area",
  ];

  String spaLocation = "Select Location";
  List<String> itemsSpaLocation = [
    "Select Location",
    "Basement",
    "Stilt",
    "Ground other than stilt area",
  ];

  bool? serventFacility1 = false;
  bool? serventFacility2 = false;

  bool? BasementRequirement = false;
  bool? BasementNotRequire = false;

  bool? StiltRequirement = false;
  bool? StiltNotRequire = false;

  bool? officeRequirement = false;
  bool? officeNotRequire = false;

  bool? servantNotRequired = false;
  bool? servantRequirement = false;

  bool? HomeTheaterNotRequired = false;
  bool? HomeTheaterRequirement = false;

  bool? AdditionalNotRequired = false;
  bool? AdditionalRequirement = false;

  bool? indoorNotRequired = false;
  bool? indoorRequirement = false;

  bool? barNotRequired = false;
  bool? barRequirement = false;

  bool? barFacility1 = false;
  bool? barFacility2 = false;

  bool? swimmingNotRequired = false;
  bool? swimmingRequirement = false;

  bool? gymNotRequired = false;
  bool? gymRequirement = false;

  bool? spaNotRequired = false;
  bool? spaRequirement = false;

  bool? gardenNotRequired = false;
  bool? gardenRequirement = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              requirementText("Basement Detail"),
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
                                    value: BasementRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          BasementRequirement = value;
                                          BasementNotRequire = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: BasementNotRequire,
                                    onChanged: (value) {
                                      setState(() {
                                        BasementNotRequire = value;
                                        BasementRequirement = false;
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
              if (BasementRequirement == true) ...[
                Row(
                  children: [
                    requirementText("Basement"),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: height * .04,
                        width: width * 0.4,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: slectedBasement,
                              items: basementList
                                  .map((it) => DropdownMenuItem<String>(
                                      value: it, child: Text(it)))
                                  .toList(),
                              onChanged: (it) => setState(() {
                                    slectedBasement = it!;
                                  })),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Stilt Details"),
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
                                    value: StiltRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          StiltRequirement = value;
                                          StiltNotRequire = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: StiltNotRequire,
                                    onChanged: (value) {
                                      setState(() {
                                        StiltNotRequire = value;
                                        StiltRequirement = false;
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
              if (StiltRequirement == true) ...[
                Row(
                  children: [
                    requirementText("Basement"),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: height * .04,
                        width: width * 0.4,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: const Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
                            value: slectedBasement,
                            items: stiltList
                                .map((it) => DropdownMenuItem<String>(
                                    value: it, child: Text(it)))
                                .toList(),
                            onChanged: (it) => setState(
                              () {
                                slectedstilt = it!;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                requirementText("Amenities"),
              ],
              requirementText("office"),
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
                                    value: officeRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          officeRequirement = value;
                                          officeNotRequire = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: officeNotRequire,
                                    onChanged: (value) {
                                      setState(() {
                                        officeNotRequire = value;
                                        officeRequirement = false;
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
              if (officeRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Location"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    DropDown(width, height, listOfficeLocation,
                        selectedOfficeLocation, 0.6, .035)
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Other Requirement"),
                    SizedBox(
                      width: width * 0.01,
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
                                child: Text("Office Facility"),
                              ),
                            ),
                            Wrap(
                              children: otherFacilities
                                  .map((e) => Chip(
                                        label: Text(e),
                                      ))
                                  .toList(),
                            )
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
                    requirementText("other Requirements"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "Other requirement")
                  ],
                ),
              ],
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("servant requirement"),
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
                                    value: servantRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          servantRequirement = value;
                                          servantNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: servantNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        servantNotRequired = value;
                                        servantRequirement = false;
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
              if (servantRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Location"),
                    DropDown(
                      width,
                      height,
                      serventItems,
                      serventLocation,
                      0.6,
                      0.03,
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("No Of Servent"),
                    DropDown(
                      width,
                      height,
                      noOfServents,
                      selectedServent,
                      0.2,
                      0.03,
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Facilities"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: serventFacility1,
                      onChanged: (value) => setState(
                        () {
                          serventFacility1 = value;
                        },
                      ),
                    ),
                    requirementText("One room + small kit + toilet")
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.14,
                    ),
                    SizedBox(
                      height: 20,
                      child: Checkbox(
                        activeColor: checkColor,
                        checkColor: Colors.white,
                        value: serventFacility2,
                        onChanged: (value) => setState(
                          () {
                            serventFacility2 = value;
                          },
                        ),
                      ),
                    ),
                    requirementText("One room + small kit + common toilet")
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Other Facilities"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "Other Requirement")
                  ],
                )
              ],
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Home Theater"),
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
                                    value: HomeTheaterRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          HomeTheaterRequirement = value;
                                          HomeTheaterNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: HomeTheaterNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        HomeTheaterNotRequired = value;
                                        HomeTheaterRequirement = false;
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
              if (HomeTheaterRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("floor"),
                    DropDown(
                      width,
                      height,
                      homeTheaterFloorItems,
                      homeTheaterFloor,
                      0.6,
                      0.03,
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Seats"),
                    DropDown(
                      width,
                      height,
                      seatsItems,
                      selectedSeats,
                      0.2,
                      0.03,
                    ),
                    if (selectedSeats == "more") ...[
                      requirementTextField(height, width, 0.04, 0.2, "more")
                    ]
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Special Requiremnt"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementTextField(
                      height,
                      width,
                      0.04,
                      0.5,
                      "Special Requirement",
                    ),
                  ],
                )
              ],
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Additional Parking Garage"),
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
                                    value: AdditionalRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          AdditionalRequirement = value;
                                          AdditionalNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: AdditionalNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        AdditionalNotRequired = value;
                                        AdditionalRequirement = false;
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
              if (AdditionalRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Cars"),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    requirementTextField(height, width, .04, .5, "no. of cars")
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Seats"),
                    DropDown(
                      width,
                      height,
                      seatsItems,
                      selectedSeats,
                      0.2,
                      0.03,
                    ),
                    if (selectedSeats == "more") ...[
                      requirementTextField(height, width, 0.04, 0.2, "more")
                    ]
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    requirementText("Special Requiremnt"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementTextField(
                      height,
                      width,
                      0.04,
                      0.5,
                      "Special Requirement",
                    ),
                  ],
                )
              ],
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Indoor play area"),
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
                                    value: indoorRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          indoorRequirement = value;
                                          indoorNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: indoorNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        indoorNotRequired = value;
                                        indoorRequirement = false;
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
              SizedBox(height: height * 0.01),
              if (indoorRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ))
                        ],
                      ),
                    ),
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
                        width: width * 0.5,
                        margin: const EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: selectedIndoorLocation,
                              elevation: 16,
                              items: itemsIndoorLocation
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
                                  setState(() => selectedIndoorLocation = it!)),
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
                    requirementText("Special Requirement"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "Special Requirement ")
                  ],
                ),
              ],
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Bar"),
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
                                    value: barRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          barRequirement = value;
                                          barNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: barNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        barNotRequired = value;
                                        barRequirement = false;
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
              if (barRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ))
                        ],
                      ),
                    ),
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
                        width: width * 0.5,
                        margin: const EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: selectedBarLocation,
                              elevation: 16,
                              items: itemsBarLocation
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
                                  setState(() => selectedBarLocation = it!)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                requirementText(
                  "Bar Facility",
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
                                      value: barFacility1,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            barFacility1 = value;
                                          },
                                        );
                                      }),
                                ),
                                requirementText("With bar room")
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
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      checkColor: Colors.white,
                                      value: barFacility2,
                                      onChanged: (value) {
                                        setState(() {
                                          barFacility2 = value;
                                        });
                                      }),
                                ),
                                requirementText("With bar counter and lobby"),
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
                Row(
                  children: [
                    requirementText("Special Requirement"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "Special requirement"),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
              requirementText("Swimming pool"),
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
                                    value: swimmingRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          swimmingRequirement = value;
                                          swimmingNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: swimmingNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        swimmingNotRequired = value;
                                        swimmingRequirement = false;
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
              SizedBox(height: height * 0.01),
              if (swimmingRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ))
                        ],
                      ),
                    ),
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
                        width: width * 0.5,
                        margin: const EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: swimmingLocation,
                              elevation: 16,
                              items: itemsSwimmingLocation
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
                                  setState(() => swimmingLocation = it!)),
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
                    requirementText("Special Requirement"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "Special Requirement ")
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
              requirementText("Gym"),
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
                                    value: gymRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          gymRequirement = value;
                                          gymNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: gymNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        gymNotRequired = value;
                                        gymRequirement = false;
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
              SizedBox(height: height * 0.01),
              if (gymRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.help,
                                size: height * 0.03,
                              ))
                        ],
                      ),
                    ),
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
                        width: width * 0.5,
                        margin: const EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: gymLocation,
                              elevation: 16,
                              items: itemsGymLocation
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
                                  setState(() => gymLocation = it!)),
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
                    requirementText("Special Requirement"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "Special Requirement ")
                  ],
                ),
              ],
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("spa"),
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
                                    value: spaRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          spaRequirement = value;
                                          spaNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: spaNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        spaNotRequired = value;
                                        spaRequirement = false;
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
              SizedBox(height: height * 0.01),
              if (spaRequirement == true) ...[
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Length")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "length"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: requirementText("Width")),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 30,
                        child: Row(
                          children: [
                            requirementTextField(
                                height, width, 0.04, 0.15, "Width"),
                            valueContainer(height, width, size, 0.04, 0.05),
                          ],
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Row(
                        children: [
                          requirementText("help"),
                          IconButton(
                            padding: EdgeInsets.all(5),
                            constraints: BoxConstraints(),
                            onPressed: () {},
                            icon: Icon(
                              Icons.help,
                              size: height * 0.03,
                            ),
                          )
                        ],
                      ),
                    ),
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
                        width: width * 0.5,
                        margin: const EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: spaLocation,
                              elevation: 16,
                              items: itemsSpaLocation
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
                                  setState(() => spaLocation = it!)),
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
                    requirementText("Special Requirement"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementTextField(
                        height, width, 0.04, 0.5, "Special Requirement ")
                  ],
                ),
              ],
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Garden"),
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
                                    value: gardenRequirement,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          gardenRequirement = value;
                                          gardenNotRequired = false;
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
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: gardenNotRequired,
                                    onChanged: (value) {
                                      setState(() {
                                        gardenNotRequired = value;
                                        gardenRequirement = false;
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
              if (gardenRequirement == true) ...[
                Row(
                  children: [
                    requirementText("Garden Type"),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: height * 0.03,
                        width: width * 0.5,
                        margin: const EdgeInsets.all(
                          3,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: const Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
                              value: spaLocation,
                              elevation: 16,
                              items: itemsSpaLocation
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
                                  setState(() => spaLocation = it!)),
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
                    requirementText('Special Requirement'),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    requirementTextField(
                        height, width, .04, .5, "Special requirement")
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
                alignment: Alignment.center,
                child: Container(
                  height: height * 0.04,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MultiSelect extends StatefulWidget {
  List<String> items;

  MultiSelect({required this.items});
  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> selectedItems = [];

  void itemChanges(bool isSelected, String itemValue) {
    setState(() {
      if (isSelected) {
        selectedItems.add(itemValue);
      } else {
        selectedItems.remove(itemValue);
      }
    });
  }

  void cancel() {
    Navigator.pop(context);
  }

  void submit() {
    Navigator.pop(context, selectedItems);
  }

  void clear() {
    setState(() {
      selectedItems = [];
      Navigator.pop(context, selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("office facility"),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map(
                (item) => CheckboxListTile(
                  value: selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => itemChanges(isChecked!, item),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        ElevatedButton(
          child: Text('clear all'),
          onPressed: clear,
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          child: Text('Cancel'),
          onPressed: cancel,
        ),
        ElevatedButton(
          child: Text('Submit'),
          onPressed: submit,
        ),
      ],
    );
  }
}