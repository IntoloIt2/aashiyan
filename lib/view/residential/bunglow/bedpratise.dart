import 'dart:convert';

import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:aashiyan/view/residential/bunglow/statemanagement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../components/forms.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';

class BedPractise extends StatefulWidget {
  @override
  State<BedPractise> createState() => _BedPractiseState();
}

class _BedPractiseState extends State<BedPractise> {
  final StateManagement cont = Get.put(StateManagement());

  bool isloading = false;

  var _user = User();

  int BedPage = 0;

  int index = 0;

  get dimenInt => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    // if (printData != null) {
    //   isloading = true;
    //   listLen = printData["bungalow_Bed"].length;
    // }
    // for (int i = 0; i < printData["bungalow_Bed"].length; i++) {
    //   users.add(
    //     Bed(
    //       user: _user,
    //       onDelete: () => onDelete(_user),
    //     ),
    //   );
    // }
    // print(printData["bungalow_Bed"]
    // );

    print("hello");

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            OutlinedButton(
              onPressed: cont.onAddForm,
              child: const Text('Add a Bed'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: FutureBuilder(
                future: cont.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Obx(
                      () {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount:

                              // cont.printData != null

                              //     ? cont.printData.length

                              //     :

                              cont.users.length,
                          itemBuilder: (_, i) {
                            return cont.users[i];
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                // final  Map<String, dynamic> _values;

                List<Map<String, dynamic>> val = [];

                Map<String, dynamic> _value = {};

                var userdata = cont.users.map((it) => it.user).toList();

                _value.putIfAbsent(
                  "project_id",
                  () => "349",
                );

                _value.putIfAbsent("dimension", () => dimenInt);

                for (int i = 0; i < userdata.length; i++) {
                  Map<String, dynamic> json = {
                    "Bed": cont.users[i].user!.personBed,
                    "Bed_length": cont.users[i].user!.length,
                    "Bed_width": cont.users[i].user!.width,
                    "Bed_dress_length": cont.users[i].user!.dressLenght,
                    "Bed_dress_width": cont.users[i].user!.dressWidth,
                    "Bed_dress_req_text": cont.users[i].user!.dressReqText,
                    "Bed_dress_req": cont.users[i].user!.dressReq,
                    "Bed_floor": cont.users[i].user!.selectedFloor,
                    "Bed_toilet_length": cont.users[i].user!.toiletLength,
                    "Bed_toilet_width": cont.users[i].user!.toiletWidth,
                    "Bed_dress_facility": cont.users[i].user!.dressFacility,
                    "Bed_toilet_req_text": cont.users[i].user!.toiletFacility,
                    "Bed_facility": cont.users[i].user!.roomRequirement,
                    "Bed_facility_req_text":
                        cont.users[i].user!.roomOtherRequirement,
                  };

                  val.add(json);
                }

                _value.putIfAbsent("Beds", () => val);

                var finalResponse = _value;

                // print(finalResponse);

                final response = await http.post(
                  // Uri.parse(baseUrlLocal + "project"),

                  Uri.parse(
                      'http://192.168.1.99:8080/sdplserver/api/bungalow-Bed'),

                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },

                  body: jsonEncode(finalResponse),
                );

                print(response.body);
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}

// void onDelete(User _user) {
//   Obx(() {
//     var find;
//     return find = users.firstWhere(
//       (it) => it.user == _user,
//       // orElse: () => null,
//     );
//     if (find != null) users.removeAt(users.indexOf(find));
//   });
// }

class User {
  String personBed;
  String length;
  String width;
  int selectedFloor;
  String toiletLength;
  String toiletWidth;
  String toiletFacility;
  int dressReq;
  String dressLenght;
  String dressWidth;
  List dressFacility;
  List roomRequirement;
  String roomOtherRequirement;
  String dressReqText;
  User({
    this.personBed = '',
    this.length = '',
    this.width = '',
    this.selectedFloor = 0,
    this.toiletLength = '',
    this.toiletWidth = '',
    this.toiletFacility = '',
    this.dressReq = 0,
    this.dressLenght = '',
    this.dressWidth = '',
    this.dressFacility = const [],
    this.roomRequirement = const [],
    this.roomOtherRequirement = '',
    this.dressReqText = '',
  });
}

typedef OnDelete();

class Bed extends StatefulWidget {
  static const namedRoute = "/namedRoute";
  final User? user;
  final OnDelete? onDelete;
  final int? index;

  String? selectedFloor = "select Floor";

  List<String> floorItems = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other",
  ];

  Bed({this.user, this.onDelete, this.index});

  @override
  State<Bed> createState() => _BedState();
}

class _BedState extends State<Bed> {
  List<String> otherFacilities = [];
  List<String> dressF = [];

  final StateManagement cont = Get.put(StateManagement());

  // var printData;
  // int BedPage = 0;
  // Future<void> getData() async {
  //   try {
  //     // var client = http.Client();
  //     // http://sdplweb.com/sdpl/api/edit-bungalow-Bed/project_id
  //     var response = await http.get(
  //       Uri.parse(
  //           "http://192.168.1.99:8080/sdplserver/api/edit-bungalow-Bed/179"),
  //     );

  //     if (response.statusCode == 200) {
  //       final jsonResponse = jsonDecode(response.body);
  //       setState(() {
  //         printData = jsonResponse;
  //       });

  //       print(printData);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }

  bool? requiredDress = false;
  bool? notRequiredDress = false;

  @override
  void initState() {
    super.initState();
  }

  User _u = User();

  void multiSelected() async {
    final List<String> otherItems = [
      "None",
      "Chair Arrangement",
      "Sofa Arrangement",
      "Writing and Laptop table",
      "TV",
      "Mini Bar",
    ];
    final List<String> result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: otherItems);
      },
    );
    if (result != null) {
      setState(
        () {
          otherFacilities = result;
          widget.user!.roomRequirement = result;
        },
      );
    }
  }

  void multi() async {
    final List<String> otherIt = [
      "Walk in Cupboard",
      "Vanity",
      "Cupboard",
    ];

    final List<String> result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: otherIt);
      },
    );

    if (result != null) {
      setState(() {
        dressF = result;
        widget.user!.dressFacility = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    print("full screen rendring");

    return ExpansionTile(
      trailing: InkWell(
        child: Icon(Icons.delete),
        onTap: widget.onDelete,
      ),
      maintainState: true,
      title: const Text(
        'Bed Details',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      children: [
        Column(
          children: [
            Container(
              width: width * 1,
              color: color3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Name the Bed"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.55,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              hintText: "Son's Daughter Mother room's",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                            onChanged: (value) {
                              setState(() {
                                widget.user!.personBed = value;
                              });
                            },
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
                      requirementText("Length"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Length",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              widget.user!.length = value;
                            },
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      requirementText("Width"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              widget.user!.width = value;
                            },
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.15,
                      ),
                      Row(
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
                    ],
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    children: [
                      requirementText("Floor"),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.6,
                          margin: const EdgeInsets.all(
                            3,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                value: widget.selectedFloor,
                                elevation: 16,
                                items: widget.floorItems
                                    .map((it) => DropdownMenuItem<String>(
                                        value: it,
                                        child: Text(
                                          it,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (it) {
                                  if (it == "Ground Floor") {
                                    widget.user!.selectedFloor = 0;
                                  }
                                  if (it == "1st Floor") {
                                    widget.user!.selectedFloor = 1;
                                  }
                                  if (it == "2nd Floor") {
                                    widget.user!.selectedFloor = 2;
                                  }
                                  if (it == "3rd Floor") {
                                    widget.user!.selectedFloor = 3;
                                  }

                                  setState(() => widget.selectedFloor = it);
                                }),
                          ),
                        ),
                      ),
                      if (widget.selectedFloor == "other") ...[
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.1,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  hintText: "Bed Location",
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8)
                                  //fillColor: Colors.green
                                  ),
                              onChanged: (value) {
                                widget.user!.selectedFloor = value as int;
                              },
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  requirementText("Toilet details"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      requirementText("Length"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Length",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              widget.user!.toiletLength = value;
                            },
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      requirementText("Width"),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width * 0.15,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "width",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              widget.user!.toiletWidth = value;
                            },
                          ),
                        ),
                      ),
                      valueContainer(height, width, size, 0.04, 0.05),
                      SizedBox(
                        width: width * 0.15,
                      ),
                      Row(
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  requirementText("Toilet Facility"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.9,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: "other Toilet Facility",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green
                            ),
                        onChanged: (value) {
                          widget.user!.toiletFacility = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  requirementText("Dress Details"),
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
                                      value: requiredDress,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            requiredDress = value;
                                            notRequiredDress = false;
                                            widget.user!.dressReq = 1;
                                          },
                                        );
                                      },
                                    ),
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
                                        value: notRequiredDress,
                                        onChanged: (value) {
                                          setState(() {
                                            notRequiredDress = value;
                                            requiredDress = false;
                                            widget.user!.dressReq = 0;
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
                  if (requiredDress == true) ...[
                    Row(
                      children: [
                        requirementText("Length"),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.15,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  hintText: "lenght",
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8)
                                  //fillColor: Colors.green
                                  ),
                              onChanged: (value) {
                                widget.user!.dressLenght = value;
                              },
                            ),
                          ),
                        ),
                        valueContainer(height, width, size, 0.04, 0.05),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        requirementText("Width"),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: height * 0.04,
                            width: width * 0.15,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  hintText: "width",
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8)
                                  //fillColor: Colors.green
                                  ),
                              onChanged: (value) {
                                widget.user!.dressWidth = value;
                              },
                            ),
                          ),
                        ),
                        valueContainer(height, width, size, 0.04, 0.05),
                        SizedBox(
                          width: width * 0.15,
                        ),
                        Row(
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
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: requirementText("Dress Facility"),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => multi(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text("Office Facility"),
                                  ),
                                ),
                                Wrap(
                                  children: dressF
                                      .map((e) => Chip(
                                            label: Text(e),
                                          ))
                                      .toList(),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 5,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: SizedBox(
                              height: height * 0.04,
                              width: width,
                              child: TextFormField(
                                style: const TextStyle(fontSize: 14),
                                decoration: const InputDecoration(
                                    hintText: "dress facility",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8)
                                    //fillColor: Colors.green
                                    ),
                                onChanged: (value) {
                                  widget.user!.dressReqText = value;
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(height: height * 0.01),
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
                                            bunglowPageRecentList[i]
                                                ["img_path"],
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
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Material(
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 3,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                children: const [
                                  Icon(Icons.cloud_upload),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Upload a stair image"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            color: buttonColor,
                            child: const Text(
                              "Preview",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        requirementText("Room Facility"),
                        SizedBox(
                          width: 5,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: "Other Requirement",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green
                            ),
                        onChanged: (value) {
                          widget.user!.roomOtherRequirement = value;
                        },
                      ),
                    ),
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
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
