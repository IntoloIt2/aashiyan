// ignore_for_file: unused_import, camel_case_types, unused_local_variable, empty_catches, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:convert';

import 'package:aashiyan/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Step_2 extends StatefulWidget {
  const Step_2({super.key});

  @override
  State<Step_2> createState() => _Step_2State();
}

class _Step_2State extends State<Step_2> {
  String selectedFloorItems = "Select floor";
  int ConstfloorItems = 0;
  bool vastuStatus = false;
  bool consultExpert = false;
  bool porchRequired = false;
  bool porchNotRequired = false;
  String? porchLength;
  String? porchWidth;

  void showToast(msg, toastColor, GRAVITY) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 0,
        backgroundColor: toastColor,
        textColor: Colors.white);
  }

  List<String> floorItems = [
    "Select floor",
    "Ground floor(G)",
    "1st floor(G+1)",
    "2nd floor(G+1)",
    "3rd floor(G+1)"
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Future<void> saveFlatEntrance() async {
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var dimension = prefs.getInt('dimension');
        var projectId = prefs.getInt('projectId');

        var body = {
          "project_id": projectId,
          "dimension": dimension,
          "floor": selectedFloorItems,
          "vastu": vastuStatus ? 1 : 0,
          "porch_req": porchRequired ? 1 : 0,
          "porch_length": porchLength,
          "porch_width": porchWidth
        };
        // print('body===');
        // print(body);
        var response = await http.post(
            Uri.parse("${dotenv.env['APP_URL']}flat-house-entrance"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
        // print(response);
        var temp = jsonDecode(response.body);

        print('temp==');
        print(temp);
        // if (temp['status'] == 200) {
        //   showToast('Entrance Requirement Submitted !', Colors.lightGreen,
        //       ToastGravity.TOP);
        // }
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
                        if (value == G_FLOOR_TEXT) {
                          ConstfloorItems = 1;
                        } else if (value == G_1_FLOOR_TEXT) {
                          ConstfloorItems = 2;
                        } else if (value == G_2_FLOOR_TEXT) {
                          ConstfloorItems = 3;
                        }
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
                                    initialValue: porchLength,
                                    onChanged: (value) {
                                      porchLength = value;
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
                                    initialValue: porchWidth,
                                    onChanged: (value) {
                                      porchWidth = value;
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
