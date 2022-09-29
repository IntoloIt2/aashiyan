import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
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
                                style: TextStyle(color: Colors.black)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFloorItems = value!;
                        print(selectedFloorItems);
                      });
                    }),
                SizedBox(
                  width: width * 0.04,
                ),
              ],
            ),
            Row(
              children: [
                Text(
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
                Text(
                  "Moderate considerations",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.19,
                ),
                Checkbox(
                    value: consultExpert,
                    onChanged: (bool? value) {
                      setState(() {
                        consultExpert = value!;
                      });
                    }),
                Text("Consult expert",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500))
              ],
            ),
            Row(
              children: [
                Text("Ground Floor requirement",
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
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Porch"),
                      //
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: porchRequired,
                    onChanged: (bool? value) {
                      setState(() {
                        porchRequired = value!;
                      });
                    }),
                Text("Required",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                Checkbox(
                    value: porchNotRequired,
                    onChanged: (bool? value) {
                      setState(() {
                        porchNotRequired = value!;
                      });
                    }),
                Text("Not Required",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500))
              ],
            ),
            porchRequired
                ? Container(
                    margin: EdgeInsets.only(right: width * 0.2),
                    padding: EdgeInsets.all(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Length"),
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
                            Text("Width"),
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
                                      porchLength = int.parse(value);
                                    },
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Text("Help")
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
