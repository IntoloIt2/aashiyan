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
    return Scaffold(
      backgroundColor: requirementColor,
      appBar: buildAppbar("Requirement"),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            buildSteps(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  child: DropdownButton<String>(
                    value: selectedItems,
                    icon: const Icon(Icons.keyboard_arrow_down_sharp),
                    elevation: 16,
                    items: items
                        .map((it) => DropdownMenuItem<String>(
                              value: it,
                              child: Text(it),
                            ))
                        .toList(),
                    onChanged: (it) => setState(() => selectedItems = it!),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "firstname",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),

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
