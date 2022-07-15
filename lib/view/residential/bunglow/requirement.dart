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
  List<String> items = ["select", "Mr", "Mrs", "Ms", "M/s"];
  String selectedItems = 'select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: requirementColor,
      appBar: appBar("Requirement"),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            bungalowSteps(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Forms.lableText("Name"),
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
                Forms.textField(context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text("Name"),
                Forms.lableText("lable sdfgjsdf "),
                // SizedBox(
                //   width: 100,
                // ),
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
                  elevation: 2,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: "firstname",
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
