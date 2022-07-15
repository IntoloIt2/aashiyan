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
  bool? regularPlotValue = false;
  bool irregularPlotValue = false;
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

  List<String> sizeitems = ["ft", "m"];

  String size = "ft";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: requirementColor,
      appBar: appBar("Requirement"),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            bungalowSteps(context),
            Row(
              children: [
                requirementText("Name"),
                SizedBox(
                  width: height * 0.02,
                ),
                Material(
                  elevation: 5,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: height * 0.04,
                    width: width * 0.19,
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
                        onChanged: (it) => setState(() => selectedItems = it!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                requirementTextField(height, width, 0.04, 0.25, "firstname"),
                SizedBox(
                  width: width * 0.01,
                ),
                requirementTextField(height, width, 0.04, 0.19, "lastname"),
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
                requirementTextField(height, width, 0.04, 0.6, "email"),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                requirementText("project \nAddress"),
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
                Forms.requirementText("country"),
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
                Forms.requirementText("state"),
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
                                    style: TextStyle(fontSize: height * 0.02)),
                              ),
                            )
                            .toList(),
                        onChanged: (it) => setState(() => selectedState = it!),
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
                      irregularPlotValue = !irregularPlotValue;
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
                      irregularPlotValue = val!;
                      regularPlotValue = !regularPlotValue!;
                    });
                  },
                ),
                requirementText("Irregular plot"),
              ],
            ),
            Row(children: [
              requirementText("length"),
              SizedBox(
                width: width * 0.04,
              ),
              requirementTextField(height, width, 0.04, 0.15, "length"),
              Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 1,
                child: Container(
                  width: width * 0.08,
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(size),
                ),
              )
            ]),
            SizedBox(
              height: height * 0.004,
            ),
            Row(children: [
              requirementText("width"),
              SizedBox(
                width: width * 0.05,
              ),
              requirementTextField(height, width, 0.04, 0.15, "width"),
              Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 1,
                child: Container(
                  width: width * 0.08,
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(size),
                ),
              )
            ]),
            SizedBox(
              height: height * 0.004,
            ),
            Row(children: [
              requirementText("plot size"),
              SizedBox(
                width: width * 0.05,
              ),
              requirementTextField(height, width, 0.04, 0.15, "00"),
              SizedBox(
                width: width * 0.015,
              ),
              Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 1,
                child: Container(
                  padding: EdgeInsets.all(2),
                  width: width * 0.05,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white),
                  child: if(size == "ft"){
                    n;
                    }else{
                    new Container();
                      }
                ),
              )
            ])
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
