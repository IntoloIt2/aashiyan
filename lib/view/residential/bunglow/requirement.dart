import 'package:flutter/material.dart';

import '../../../const.dart';

class Requirement extends StatefulWidget {
  static const namedRoute = "/intrestedNext";

  @override
  State<Requirement> createState() => _RequirementState();
}

class _RequirementState extends State<Requirement> {
  List<String> items = ["select", "Mr", "Mrs", "Ms", "M/s"];
  String selectedItems = 'select';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: requirementColor,
      appBar: buildAppbar("Requirement"),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            buildSteps(context),
            Row(
              children: [
                Text("Name"),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: height * 0.05,
                      width: width * 0.15,
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
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: SizedBox(
                    height: height * 0.05,
                    width: width * 0.3,
                    child: TextFormField(
                      style: TextStyle(fontSize: height * 0.02),
                      decoration: InputDecoration(
                          hintText: "firstname",
                          hintStyle: TextStyle(fontSize: height * 0.02),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(8)
                          //fillColor: Colors.green
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          hintText: "last name",
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(8)
                          //fillColor: Colors.green
                          ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
