import 'package:flutter/material.dart';
import '../../bunglow/basement.dart';

// ignore: camel_case_types
class Step_6 extends StatefulWidget {
  const Step_6({super.key});

  @override
  State<Step_6> createState() => _Step_6State();
}

class _Step_6State extends State<Step_6> {
  //stilt details
  var stiltRequired = false;
  var stiltNotRequired = false;
  String selectedStiltValue = 'For parking';
  var stiltItems = ['For Parking', 'For Amenities', 'Both'];

  //for amenities checkbox
  var amenitiesOfficeRequired = false;
  var amenitiesOfficeNotRequired = false;

  var amenitiesParkingRequired = false;
  var amenitiesParkingNotRequired = false;
  //additional parking
  var requiredParking = false;
  var notRequiredParking = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            // decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Text(
              "Stilt Details",
            ),
          ),
          Row(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: stiltRequired,
                          onChanged: ((value) {
                            setState(() {
                              stiltRequired = value!;
                              stiltNotRequired = false;
                            });
                          })),
                      Text("Required"),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: stiltNotRequired,
                          onChanged: ((value) {
                            setState(() {
                              stiltNotRequired = value!;
                              stiltRequired = false;
                            });
                          })),
                      Text("Not Required"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          stiltRequired
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text("Stilt"),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton(
                          hint: Text(selectedStiltValue),
                          // value: selectedStiltValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: stiltItems.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: ((String? value) {
                            setState(() {
                              selectedStiltValue = value!;
                            });
                          })),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            height: 8,
          ),
          const Divider(
            height: 20,

            thickness: 1,
            // indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            // decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Text(
              "Amenities",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("Office"), SizedBox(width: 25), Text("Help")],
            ),
          ),
          Row(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: amenitiesOfficeRequired,
                          onChanged: ((value) {
                            setState(() {
                              amenitiesOfficeRequired = value!;
                              amenitiesOfficeNotRequired = false;
                            });
                          })),
                      Text("Required"),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: amenitiesOfficeNotRequired,
                          onChanged: ((value) {
                            setState(() {
                              amenitiesOfficeNotRequired = value!;
                              amenitiesOfficeRequired = false;
                            });
                          })),
                      Text("Not Required"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          amenitiesOfficeRequired
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Length"),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.15,
                            child: TextFormField(
                              // controller: length,
                              decoration:
                                  const InputDecoration(label: Text("Length")),
                              // validator: ((value) {
                              //       if (value == null || value.isEmpty) {
                              //       return 'Required length';
                              //     }
                              //     return null;
                              //   }),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text("width"),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.15,
                            child: TextFormField(
                              // controller: length,
                              decoration:
                                  const InputDecoration(label: Text("width")),
                              // validator: ((value) {
                              //       if (value == null || value.isEmpty) {
                              //       return 'Required length';
                              //     }
                              //     return null;
                              //   }),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Location"),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton(
                              hint: Text(selectedStiltValue),
                              // value: selectedStiltValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: stiltItems.map((String items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                              onChanged: ((String? value) {
                                setState(() {
                                  selectedStiltValue = value!;
                                });
                              })),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Office Facility"),
                          SizedBox(
                            width: 15,
                          ),
                          Card(
                            child: InkWell(
                              onTap: () async {
                                final List<String> otherIt = [
                                  "Pantry",
                                  "Staff Toilet",
                                  "Toilet",
                                ];

                                final List<String> ab = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MultiSelect(items: otherIt);
                                  },
                                );
                                setState(() {
                                  // masterDressFacility = ab;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text("Office Facility"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Other Requirement"),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.4,
                            child: TextFormField(
                              // controller: length,
                              decoration: const InputDecoration(
                                  label: Text("Other Requirement")),
                              // validator: ((value) {
                              //       if (value == null || value.isEmpty) {
                              //       return 'Required length';
                              //     }
                              //     return null;
                              //   }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
          const Divider(
            height: 30,
            thickness: 1,
            endIndent: 0,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Additional Parking garage",
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Help",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: requiredParking,
                          onChanged: ((value) {
                            setState(() {
                              requiredParking = value!;
                              notRequiredParking = false;
                            });
                          })),
                      Text("Required"),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: notRequiredParking,
                          onChanged: ((value) {
                            setState(() {
                              notRequiredParking = value!;
                              requiredParking = false;
                            });
                          })),
                      Text("Not Required"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          requiredParking
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Length"),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.15,
                            child: TextFormField(
                              // controller: length,
                              decoration:
                                  const InputDecoration(label: Text("Length")),
                              // validator: ((value) {
                              //       if (value == null || value.isEmpty) {
                              //       return 'Required length';
                              //     }
                              //     return null;
                              //   }),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text("width"),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.15,
                            child: TextFormField(
                              // controller: length,
                              decoration:
                                  const InputDecoration(label: Text("width")),
                              // validator: ((value) {
                              //       if (value == null || value.isEmpty) {
                              //       return 'Required length';
                              //     }
                              //     return null;
                              //   }),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Location"),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton(
                              hint: Text(selectedStiltValue),
                              // value: selectedStiltValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: stiltItems.map((String items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                              onChanged: ((String? value) {
                                setState(() {
                                  selectedStiltValue = value!;
                                });
                              })),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Separated Shade"),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.33,
                            child: TextFormField(
                              // controller: length,
                              decoration: const InputDecoration(
                                  label: Text("Separated Shade")),
                              // validator: ((value) {
                              //       if (value == null || value.isEmpty) {
                              //       return 'Required length';
                              //     }
                              //     return null;
                              //   }),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Special Requirement"),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.4,
                            child: TextFormField(
                              // controller: length,
                              decoration: const InputDecoration(
                                  label: Text("Special Requirement")),
                              // validator: ((value) {
                              //       if (value == null || value.isEmpty) {
                              //       return 'Required length';
                              //     }
                              //     return null;
                              //   }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
