// ignore_for_file: unused_import, camel_case_types, unused_local_variable, empty_catches, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Step_2 extends StatefulWidget {
  const Step_2({super.key});

  @override
  State<Step_2> createState() => _Step_2State();
}

class _Step_2State extends State<Step_2> {
  String selectedFloorItems = "Select floor";
  bool vastuStatus = false;
  bool consultExpert = false;
  bool porchRequired = false;
  bool porchNotRequired = false;
  num porchLength = 0;
  num porchWidth = 0;

  List<String> floorItems = [
    "Select floor",
    "Ground floor(G)",
    "1st floor(G+1)",
    "2nd floor(G+1)"
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Future<void> saveFlatEntrance() async {
      try {
        var body = {
          "floor": selectedFloorItems,
          "vastu": vastuStatus,
          "porch_req": porchRequired ? 1 : 0,
          "porch_length": porchLength,
          "porch_width": porchWidth
        };
        var response = await http.post(
            Uri.parse("${dotenv.env['API_URL']}flat-house-entrance"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
      } catch (e) {}
    }

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "No. of floors",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                DropdownButton<String>(
                    elevation: 5,
                    // value: selectedFloorItems,
                    hint: Text(selectedFloorItems),
                    items: floorItems
                        .map(
                          (ele) => DropdownMenuItem<String>(
                            value: ele,
                            child: Text(ele,
                                style: const TextStyle(color: Colors.black)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFloorItems = value!;
                      });
                    }),
                // SizedBox(
                //   width: width * 0.04,
                // ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Vastu",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                SizedBox(
                  width: width * 0.10,
                ),
                Checkbox(
                  value: vastuStatus,
                  onChanged: (bool? value) {
                    setState(() {
                      vastuStatus = value!;
                    });
                  },
                ),
                const Text(
                  "Moderate considerations",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.195,
                ),
                Checkbox(
                    value: consultExpert,
                    onChanged: (bool? value) {
                      setState(() {
                        consultExpert = value!;
                      });
                    }),
                const Text("Consult expert",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500))
              ],
            ),
            Row(
              children: [
                const Text("Ground Floor requirement",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700)),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Porch"),
                      //
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  child: Row(
                    children: [
                      Checkbox(
                          value: porchRequired,
                          onChanged: (bool? value) {
                            setState(() {
                              porchRequired = value!;
                              porchNotRequired = false;
                            });
                          }),
                      const Text("Required",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    children: [
                      Checkbox(
                          value: porchNotRequired,
                          onChanged: (bool? value) {
                            setState(() {
                              porchNotRequired = value!;
                              porchRequired = false;
                            });
                          }),
                      const Text("Not Required",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            porchRequired
                ? Container(
                    margin: EdgeInsets.only(right: width * 0.2),
                    padding: const EdgeInsets.all(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text("Length"),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 1,
                              child: Container(
                                  width: width * 0.15,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        hintText: "Length",
                                        hintStyle: TextStyle(fontSize: 14),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(0)),
                                    initialValue: porchLength.toString(),
                                    onChanged: (value) {
                                      porchLength = int.parse(value);
                                    },
                                  )),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Width"),
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 1,
                              child: Container(
                                  width: width * 0.15,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        hintText: "width",
                                        hintStyle: TextStyle(fontSize: 14),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(1)),
                                    initialValue: porchLength.toString(),
                                    onChanged: (value) {
                                      porchWidth = int.parse(value);
                                    },
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        const Text("Help"),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      saveFlatEntrance();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        "save and continue",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
