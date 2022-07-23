import 'package:aashiyan/components/app_bar.dart';
import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/bedroom.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

class Basement extends StatefulWidget {
  static const namedRoute = "/Basement";
  @override
  State<Basement> createState() => _BasementState();
}

class _BasementState extends State<Basement> {
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

  bool? BasementRequirement = false;
  bool? BasementNotRequire = false;

  bool? StiltRequirement = false;
  bool? StiltNotRequire = false;

  bool? officeRequirement = false;
  bool? officeNotRequire = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar("Basement"),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bungalowSteps(context),
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
              )
            ],
          ],
        ),
      ),
    );
  }
}
