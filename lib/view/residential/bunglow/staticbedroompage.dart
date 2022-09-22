import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../components/forms.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';
import '../../../model/bedtype.dart';
import 'package:http/http.dart' as http;

class User {
  String personBedRoom;
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
    this.personBedRoom = '',
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

class StaticBedroomPage extends StatefulWidget {
  const StaticBedroomPage({Key? key}) : super(key: key);

  @override
  State<StaticBedroomPage> createState() => _StaticBedroomPageState();
}

class _StaticBedroomPageState extends State<StaticBedroomPage> {
  void multiSelected(result, l1, l2) async {
    print(l1);
    if (result != null) {
      setState(
        () {
          l1 = result;
          l2 = result;
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
        masterDressFacility = result;
      });
    }
  }

  final lengthController = TextEditingController();

  bool? requiredDres = false;
  bool? notRequiredDres = false;

  bool? masterRequiredDress = false;
  bool? masterNotRequiredDress = false;

  bool? sonRequiredDress = false;
  bool? sonNotRequiredDress = false;

  bool? daughterRequiredDress = false;
  bool? daughterNotRequiredDress = false;

  bool? parentsRequiredDress = false;
  bool? parentsNotRequiredDress = false;

  bool? guestRequiredDress = false;
  bool? guestNotRequiredDress = false;

  bool? other1RequiredDress = false;
  bool? other1NotRequiredDress = false;

  bool? other2RequiredDress = false;
  bool? other2NotRequiredDress = false;

  bool? other3RequiredDress = false;
  bool? other3NotRequiredDress = false;

  var result;

  @override
  void initState() {
    //Initialize with 1 item

    super.initState();
    _values;
    // getData();
  }

  List<String> otherFacilities = [];
  List<String> dressF = [];

  String? selectedFloorMaster = "select Floor";
  List<String> floorItemsMater = [
    "select Floor",
    "Ground Floor",
  ];

  String? selectedFloorParent = "select Floor";
  List<String> floorItemsParent = [
    "select Floor",
    "Ground Floor",
  ];

  String? selectedFloorSon = "select Floor";
  List<String> floorItemsSon = [
    "select Floor",
    "Ground Floor",
  ];

  String? selectedFloorDaughter = "select Floor";
  List<String> floorItemsDaughter = [
    "select Floor",
    "Ground Floor",
  ];

  String? selectedFloorGuest = "select Floor";
  List<String> floorItemsGuest = [
    "select Floor",
    "Ground Floor",
  ];

  String? selectedFloorOther1 = "select Floor";
  List<String> floorItemsOther1 = [
    "select Floor",
    "Ground Floor",
  ];

  String? selectedFloorOther2 = "select Floor";
  List<String> floorItemsOther2 = [
    "select Floor",
    "Ground Floor",
  ];

  String? selectedFloorOther3 = "select Floor";
  List<String> floorItemsOther3 = [
    "select Floor",
    "Ground Floor",
  ];

  String? selectedFloor = "select Floor";
  List<String> floorItems = [
    "select Floor",
    "Ground Floor",
  ];

  var printData;

  Future<void> getData() async {
    try {
      var response = await http.get(
        Uri.parse(
          "http://192.168.1.99:8080/sdplserver/api/edit-bungalow-bedroom/87",
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          print(jsonResponse);
          printData = jsonResponse["bungalow_bedroom"] as List;
          print(printData);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<Map<String, dynamic>> _values = [];

  String masterDressReq = '0';
  int? masterLength;
  int? masterWidth;
  int? masterLocation = 0;
  int? masterToiletLength;
  int? masterToiletWidth;
  String masterToiletFacility = '';
  int masterDressInt = 0;
  int? masterDressLength;
  int? masterDressWidth;
  var masterDressFacility = [];
  var masterRoomFacility = [];
  String masterRoomOtherRequirement = '';
  String masterOtherRequirement = '';
  String masterDresstext = '';

  String sonDressReq = '0';
  int? sonLength;
  int? sonWidth;
  int? sonLocation = 0;
  int? sonToiletLength;
  int? sonToiletWidth;
  String sonToiletFacility = '';
  int sonDressInt = 0;
  int? sonDressLength;
  int? sonDressWidth;
  var sonDressFacility = [];
  var sonRoomFacility = [];
  String sonRoomOtherRequirement = '';
  String sonOtherRequirement = '';
  String sonDresstext = '';

  String daughterDressReq = '0';
  int? daughterLength;
  int? daughterWidth;
  int? daughterLocation = 0;
  int? daughterToiletLength;
  int? daughterToiletWidth;
  String daughterToiletFacility = '';
  int daughterDressInt = 0;
  int? daughterDressLength;
  int? daughterDressWidth;
  var daughterDressFacility = [];
  var daughterRoomFacility = [];
  String daughterRoomOtherRequirement = '';
  String daughterOtherRequirement = '';
  String daughterDresstext = '';

  String parentDressReq = '0';
  int? parentLength;
  int? parentWidth;
  int? parentLocation = 0;
  int? parentToiletLength;
  int? parentToiletWidth;
  String parentToiletFacility = '';
  int parentDressInt = 0;
  int? parentDressLength;
  int? parentDressWidth;
  var parentDressFacility = [];
  var parentRoomFacility = [];
  String parentRoomOtherRequirement = '';
  String parentOtherRequirement = '';
  String parentDresstext = '';

  String guestDressReq = '0';
  int? guestLength;
  int? guestWidth;
  int? guestLocation = 0;
  int? guestToiletLength;
  int? guestToiletWidth;
  String guestToiletFacility = '';
  int guestDressInt = 0;
  int? guestDressLength;
  int? guestDressWidth;
  var guestDressFacility = [];
  var guestRoomFacility = [];
  String guestRoomOtherRequirement = '';
  String guestOtherRequirement = '';
  String guestDresstext = '';

  String other1DressReq = '0';
  int? other1Length;
  int? other1Width;
  int? other1Location = 0;
  int? other1ToiletLength;
  int? other1ToiletWidth;
  String other1ToiletFacility = '';
  int other1DressInt = 0;
  int? other1DressLength;
  int? other1DressWidth;
  var other1DressFacility = [];
  var other1RoomFacility = [];
  String other1RoomOtherRequirement = '';
  String other1OtherRequirement = '';
  String other1Dresstext = '';

  String other2DressReq = '0';
  int? other2Length;
  int? other2Width;
  int? other2Location = 0;
  int? other2ToiletLength;
  int? other2ToiletWidth;
  String other2ToiletFacility = '';
  int other2DressInt = 0;
  int? other2DressLength;
  int? other2DressWidth;
  var other2DressFacility = [];
  var other2RoomFacility = [];
  String other2RoomOtherRequirement = '';
  String other2OtherRequirement = '';
  String other2Dresstext = '';

  String other3DressReq = '0';
  int? other3Length;
  int? other3Width;
  int? other3Location = 0;
  int? other3ToiletLength;
  int? other3ToiletWidth;
  String other3ToiletFacility = '';
  int other3DressInt = 0;
  int? other3DressLength;
  int? other3DressWidth;
  var other3DressFacility = [];
  var other3RoomFacility = [];
  String other3RoomOtherRequirement = '';
  String other3OtherRequirement = '';
  String other3Dresstext = '';

  bool masterBedroom = false;
  bool sonBedRoom = false;
  bool daughterBedRoom = false;
  bool parentBedRoom = false;
  bool guestBedRoom = false;
  bool other1BedRoom = false;
  bool other2BedRoom = false;
  bool other3BedRoom = false;

  bool sonState = true;
  bool masterState = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    return printData == null
        ? Container(child: CircularProgressIndicator())
        : Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 5,
                              child: Container(
                                width: width * 0.45,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width * 0.07,
                                      child: Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: masterBedroom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                masterBedroom = value!;
                                                if (masterBedroom == true) {
                                                  masterState = false;
                                                }
                                              },
                                            );
                                          }),
                                    ),
                                    requirementText("Master Bed Room")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 5,
                              child: Container(
                                width: width * 0.45,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width * 0.07,
                                      child: Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: sonBedRoom,
                                          onChanged: (value) {
                                            setState(() {
                                              sonBedRoom = value!;
                                            });
                                          }),
                                    ),
                                    requirementText("Son's Bed Room "),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 5,
                              child: Container(
                                width: width * 0.45,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width * 0.07,
                                      child: Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: daughterBedRoom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                daughterBedRoom = value!;
                                              },
                                            );
                                          }),
                                    ),
                                    requirementText("Daughter's Bed Room")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 5,
                              child: Container(
                                width: width * 0.45,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width * 0.07,
                                      child: Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: parentBedRoom,
                                          onChanged: (value) {
                                            setState(() {
                                              parentBedRoom = value!;
                                            });
                                          }),
                                    ),
                                    requirementText("Parent's Bed Room"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 5,
                              child: Container(
                                width: width * 0.45,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width * 0.07,
                                      child: Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: guestBedRoom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                guestBedRoom = value!;
                                              },
                                            );
                                          }),
                                    ),
                                    requirementText("Guest's Bed Room")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 5,
                              child: Container(
                                width: width * 0.45,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width * 0.07,
                                      child: Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: other1BedRoom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                other1BedRoom = value!;
                                              },
                                            );
                                          }),
                                    ),
                                    requirementText("Other's 1 Bed Room"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 5,
                              child: Container(
                                width: width * 0.45,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width * 0.07,
                                      child: Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: other2BedRoom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                other2BedRoom = value!;
                                              },
                                            );
                                          }),
                                    ),
                                    requirementText("Other's 2 Bed Room")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 5,
                              child: Container(
                                width: width * 0.45,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width * 0.07,
                                      child: Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: other3BedRoom,
                                          onChanged: (value) {
                                            setState(() {
                                              other3BedRoom = value!;
                                            });
                                          }),
                                    ),
                                    requirementText("Other's 3 Bed Room"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // ----------------------------- masterbedroom --------------------------------//

              Column(
                children: [
                  if (masterBedroom == true ||
                      printData[0]['bedroom'] == "1") ...[
                    SizedBox(
                      height: height * 0.01,
                    ),

                    // String masterDressReq = '0';
                    // List<String> masterLength = <String>[];
                    // List<String> masterWidth = <String>[];
                    // String masterLocation = '';
                    // String masterToiletLength = '';
                    // String masterToiletWidth = '';
                    // String masterToiletFacility = '';
                    // String masterDressLength = '';
                    // String masterDressWidth = '';
                    // String masterDressFacility = '';
                    // String masterRoomFacility = '';
                    // String masterOtherRequirement = '';

                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        maintainState: true,
                        title: const Text(
                          'Master\'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
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
                                    requirementText("Length"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                masterLength =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              masterWidth =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                        width: width * 0.5,
                                        margin: const EdgeInsets.all(
                                          3,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Visibility(
                                                visible: false,
                                                child:
                                                    Icon(Icons.arrow_downward)),
                                            // "select Floor",
                                            // "Ground Floor",
                                            // "1st Floor",
                                            // "2nd Floor",
                                            // "3rd Floor",
                                            // "other",
                                            value: selectedFloor,
                                            elevation: 16,
                                            items: floorItems
                                                .map((it) =>
                                                    DropdownMenuItem<String>(
                                                        value: it,
                                                        child: Text(
                                                          it,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )))
                                                .toList(),
                                            onChanged: (it) {
                                              setState(
                                                () {
                                                  selectedFloor = it;
                                                  print(selectedFloor);
                                                  if (selectedFloor ==
                                                      "Ground Floor") {
                                                    masterLocation = 0;
                                                  }
                                                  if (selectedFloor ==
                                                      "1st Floor") {
                                                    masterLocation = 1;
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              masterToiletLength =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                masterToiletWidth =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                          hintText: "Other Toilet Facility",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(8)),
                                      onChanged: (value) {
                                        masterToiletFacility = value;
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                      value:
                                                          masterRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          masterRequiredDress =
                                                              value;
                                                          masterNotRequiredDress =
                                                              false;

                                                          if (masterRequiredDress ==
                                                              true) {
                                                            masterDressInt = 1;
                                                          } else {
                                                            masterDressInt = 0;
                                                          }
                                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                    value:
                                                        masterNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          masterRequiredDress =
                                                              value;
                                                          masterRequiredDress =
                                                              false;

                                                          if (masterRequiredDress ==
                                                              true) {
                                                            masterDressInt = 1;
                                                          } else {
                                                            masterDressInt = 0;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                if (masterRequiredDress == true) ...[
                                  Row(
                                    children: [
                                      requirementText("Length"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "lenght",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                masterDressLength =
                                                    int.parse(value.toString());
                                              });
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      requirementText("Width"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  masterDressWidth =
                                                      int.parse(value);
                                                },
                                              );
                                            },
                                            // onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.08,
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            requirementText("Dress Facility"),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final List<String> otherIt = [
                                                    "Walk in Cupboard",
                                                    "Vanity",
                                                    "Cupboard",
                                                  ];

                                                  final List<String> ab =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return MultiSelect(
                                                          items: otherIt);
                                                    },
                                                  );
                                                  setState(() {
                                                    masterDressFacility = ab;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child:
                                                      Text("Office Facility"),
                                                ),
                                              ),
                                              Wrap(
                                                children: masterDressFacility
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: SizedBox(
                                            height: height * 0.04,
                                            width: width,
                                            child: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                  hintText: "dress facility",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(8)
                                                  //fillColor: Colors.green
                                                  ),
                                              onChanged: (value) {
                                                masterDresstext = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(height: height * 0.01),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  child: requirementText("Room Facility"),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final List<String> otherItems = [
                                              "None",
                                              "Chair Arrangement",
                                              "Sofa Arrangement",
                                              "Writing and Laptop table",
                                              "TV",
                                              "Mini Bar",
                                            ];

                                            final List<String> result =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MultiSelect(
                                                    items: otherItems);
                                              },
                                            );

                                            setState(() {
                                              masterRoomFacility = result;
                                              print(masterDressFacility);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        Wrap(
                                          children: masterRoomFacility
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
                                Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        hintText: "other requirement",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            masterOtherRequirement = value;
                                          },
                                        );
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  viewportFraction: 1,
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              // ----------------------------- sonbedroom --------------------------------//

              Column(
                children: [
                  if (sonBedRoom == true) ...[
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        maintainState: true,
                        title: const Text(
                          'Sons\'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
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
                                    requirementText("Length"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                print("$sonLength");
                                                sonLength =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              sonWidth =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                        width: width * 0.5,
                                        margin: const EdgeInsets.all(
                                          3,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Visibility(
                                                visible: false,
                                                child:
                                                    Icon(Icons.arrow_downward)),
                                            // "select Floor",
                                            // "Ground Floor",
                                            // "1st Floor",
                                            // "2nd Floor",
                                            // "3rd Floor",
                                            // "other",
                                            value: selectedFloorSon,
                                            elevation: 16,
                                            items: floorItemsSon
                                                .map((it) =>
                                                    DropdownMenuItem<String>(
                                                        value: it,
                                                        child: Text(
                                                          it,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )))
                                                .toList(),
                                            onChanged: (it) {
                                              setState(
                                                () {
                                                  selectedFloorSon = it;
                                                  print(selectedFloorSon);
                                                  if (selectedFloorSon ==
                                                      "Ground Floor") {
                                                    sonLocation = 0;
                                                  }
                                                  if (selectedFloorSon ==
                                                      "1st Floor") {
                                                    sonLocation = 1;
                                                  }
                                                  if (selectedFloorSon ==
                                                      "2nd Floor") {
                                                    sonLocation = 2;
                                                  }
                                                  if (selectedFloorSon ==
                                                      "3rd Floor") {
                                                    sonLocation = 3;
                                                  }
                                                  if (selectedFloorSon ==
                                                      "other") {
                                                    setState(() {
                                                      sonLocation = 4;
                                                    });
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    if (masterLocation == 4) ...[
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                                hintText: "more",
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.all(8)
                                                //fillColor: Colors.green
                                                ),
                                            onChanged: ((value) {
                                              sonLocation =
                                                  int.parse(value.toString());
                                            }),
                                          ),
                                        ),
                                      )
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              sonToiletLength =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                sonToiletWidth =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                          hintText: "Other Toilet Facility",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(8)),
                                      onChanged: (value) {
                                        sonToiletFacility = value;
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                      value: sonRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          sonRequiredDress =
                                                              value;
                                                          sonNotRequiredDress =
                                                              false;

                                                          if (sonRequiredDress ==
                                                              true) {
                                                            sonDressInt = 1;
                                                          } else {
                                                            sonDressInt = 0;
                                                          }
                                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                    value: sonNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          sonNotRequiredDress =
                                                              value;
                                                          sonRequiredDress =
                                                              false;

                                                          if (sonRequiredDress ==
                                                              true) {
                                                            sonDressInt = 1;
                                                          } else {
                                                            sonDressInt = 0;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                if (sonRequiredDress == true) ...[
                                  Row(
                                    children: [
                                      requirementText("Length"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "lenght",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                sonDressLength =
                                                    int.parse(value.toString());
                                              });
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      requirementText("Width"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  sonDressWidth =
                                                      int.parse(value);
                                                },
                                              );
                                            },
                                            // onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.08,
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            requirementText("Dress Facility"),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final List<String> otherIt = [
                                                    "Walk in Cupboard",
                                                    "Vanity",
                                                    "Cupboard",
                                                  ];

                                                  final List<String> ab =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return MultiSelect(
                                                          items: otherIt);
                                                    },
                                                  );
                                                  setState(() {
                                                    sonDressFacility = ab;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child:
                                                      Text("Office Facility"),
                                                ),
                                              ),
                                              Wrap(
                                                children: sonDressFacility
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: SizedBox(
                                            height: height * 0.04,
                                            width: width,
                                            child: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                  hintText: "dress facility",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(8)
                                                  //fillColor: Colors.green
                                                  ),
                                              onChanged: (value) {
                                                sonDresstext = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(height: height * 0.01),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  child: requirementText("Room Facility"),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final List<String> otherItems = [
                                              "None",
                                              "Chair Arrangement",
                                              "Sofa Arrangement",
                                              "Writing and Laptop table",
                                              "TV",
                                              "Mini Bar",
                                            ];

                                            final List<String> result =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MultiSelect(
                                                    items: otherItems);
                                              },
                                            );

                                            setState(() {
                                              sonRoomFacility = result;
                                              print(sonDressFacility);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        Wrap(
                                          children: sonRoomFacility
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
                                Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        hintText: "other requirement",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            sonOtherRequirement = value;
                                          },
                                        );
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  viewportFraction: 1,
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              // ----------------------------- daughterbedroom  --------------------------------//

              Column(
                children: [
                  if (daughterBedRoom == true) ...[
                    SizedBox(
                      height: height * 0.01,
                    ),

                    // String masterDressReq = '0';
                    // List<String> masterLength = <String>[];
                    // List<String> masterWidth = <String>[];
                    // String masterLocation = '';
                    // String masterToiletLength = '';
                    // String masterToiletWidth = '';
                    // String masterToiletFacility = '';
                    // String masterDressLength = '';
                    // String masterDressWidth = '';
                    // String masterDressFacility = '';
                    // String masterRoomFacility = '';
                    // String masterOtherRequirement = '';

                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        title: const Text(
                          'Daughter \'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
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
                                    requirementText("Length"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            daughterLength =
                                                int.parse(value.toString());
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              daughterWidth =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                        width: width * 0.5,
                                        margin: const EdgeInsets.all(
                                          3,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Visibility(
                                                visible: false,
                                                child:
                                                    Icon(Icons.arrow_downward)),
                                            // "select Floor",
                                            // "Ground Floor",
                                            // "1st Floor",
                                            // "2nd Floor",
                                            // "3rd Floor",
                                            // "other",
                                            value: selectedFloorDaughter,
                                            elevation: 16,
                                            items: floorItemsDaughter
                                                .map((it) =>
                                                    DropdownMenuItem<String>(
                                                        value: it,
                                                        child: Text(
                                                          it,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )))
                                                .toList(),
                                            onChanged: (it) {
                                              setState(
                                                () {
                                                  selectedFloorDaughter = it;
                                                  print(selectedFloorDaughter);
                                                  if (selectedFloorDaughter ==
                                                      "Ground Floor") {
                                                    daughterLocation = 0;
                                                  }
                                                  if (selectedFloorDaughter ==
                                                      "1st Floor") {
                                                    daughterLocation = 1;
                                                  }
                                                  if (selectedFloorDaughter ==
                                                      "2nd Floor") {
                                                    daughterLocation = 2;
                                                  }
                                                  if (selectedFloorDaughter ==
                                                      "3rd Floor") {
                                                    daughterLocation = 3;
                                                  }
                                                  if (selectedFloorDaughter ==
                                                      "other") {
                                                    daughterLocation = 4;
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    if (selectedFloorDaughter == 4) ...[
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                                hintText: "more",
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.all(8)
                                                //fillColor: Colors.green
                                                ),
                                            onChanged: ((value) {
                                              daughterLocation =
                                                  int.parse(value.toString());
                                            }),
                                          ),
                                        ),
                                      )
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              daughterToiletLength =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                daughterToiletWidth =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                          hintText: "Other Toilet Facility",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(8)),
                                      onChanged: (value) {
                                        daughterToiletFacility = value;
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                      value:
                                                          daughterRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          daughterRequiredDress =
                                                              value;
                                                          daughterNotRequiredDress =
                                                              false;

                                                          if (daughterRequiredDress ==
                                                              true) {
                                                            daughterDressInt =
                                                                1;
                                                          } else {
                                                            daughterDressInt =
                                                                0;
                                                          }
                                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                    value:
                                                        daughterNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          daughterNotRequiredDress =
                                                              value;
                                                          daughterRequiredDress =
                                                              false;

                                                          if (daughterRequiredDress ==
                                                              true) {
                                                            daughterDressInt =
                                                                1;
                                                          } else {
                                                            daughterDressInt =
                                                                0;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                if (daughterRequiredDress == true) ...[
                                  Row(
                                    children: [
                                      requirementText("Length"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "lenght",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                daughterDressLength =
                                                    int.parse(value.toString());
                                              });
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      requirementText("Width"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  daughterDressWidth =
                                                      int.parse(value);
                                                },
                                              );
                                            },
                                            // onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.08,
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            requirementText("Dress Facility"),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final List<String> otherIt = [
                                                    "Walk in Cupboard",
                                                    "Vanity",
                                                    "Cupboard",
                                                  ];

                                                  final List<String> ab =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return MultiSelect(
                                                          items: otherIt);
                                                    },
                                                  );
                                                  setState(() {
                                                    daughterDressFacility = ab;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child:
                                                      Text("Office Facility"),
                                                ),
                                              ),
                                              Wrap(
                                                children: daughterDressFacility
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: SizedBox(
                                            height: height * 0.04,
                                            width: width,
                                            child: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                  hintText: "dress facility",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(8)
                                                  //fillColor: Colors.green
                                                  ),
                                              onChanged: (value) {
                                                daughterDresstext = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(height: height * 0.01),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  child: requirementText("Room Facility"),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final List<String> otherItems = [
                                              "None",
                                              "Chair Arrangement",
                                              "Sofa Arrangement",
                                              "Writing and Laptop table",
                                              "TV",
                                              "Mini Bar",
                                            ];

                                            final List<String> result =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MultiSelect(
                                                    items: otherItems);
                                              },
                                            );

                                            setState(() {
                                              daughterRoomFacility = result;
                                              print(daughterDressFacility);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        Wrap(
                                          children: daughterRoomFacility
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
                                Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        hintText: "other requirement",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            daughterOtherRequirement = value;
                                          },
                                        );
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  viewportFraction: 1,
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              // -----------------------------------------parentbedroom  -----------------------------------------//

              Column(
                children: [
                  if (parentBedRoom == true) ...[
                    SizedBox(
                      height: height * 0.01,
                    ),

                    // String masterDressReq = '0';
                    // List<String> masterLength = <String>[];
                    // List<String> masterWidth = <String>[];
                    // String masterLocation = '';
                    // String masterToiletLength = '';
                    // String masterToiletWidth = '';
                    // String masterToiletFacility = '';
                    // String masterDressLength = '';
                    // String masterDressWidth = '';
                    // String masterDressFacility = '';
                    // String masterRoomFacility = '';
                    // String masterOtherRequirement = '';

                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        title: const Text(
                          'Parents\'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
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
                                    requirementText("Length"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            parentLength =
                                                int.parse(value.toString());
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              parentWidth =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                        width: width * 0.5,
                                        margin: const EdgeInsets.all(
                                          3,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Visibility(
                                                visible: false,
                                                child:
                                                    Icon(Icons.arrow_downward)),
                                            // "select Floor",
                                            // "Ground Floor",
                                            // "1st Floor",
                                            // "2nd Floor",
                                            // "3rd Floor",
                                            // "other",
                                            value: selectedFloorParent,
                                            elevation: 16,
                                            items: floorItemsParent
                                                .map((it) =>
                                                    DropdownMenuItem<String>(
                                                        value: it,
                                                        child: Text(
                                                          it,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )))
                                                .toList(),
                                            onChanged: (it) {
                                              setState(
                                                () {
                                                  selectedFloorParent = it;
                                                  if (selectedFloorParent ==
                                                      "Ground Floor") {
                                                    parentLocation = 0;
                                                  }
                                                  if (selectedFloorParent ==
                                                      "1st Floor") {
                                                    parentLocation = 1;
                                                  }
                                                  if (selectedFloorParent ==
                                                      "2nd Floor") {
                                                    parentLocation = 2;
                                                  }
                                                  if (selectedFloorParent ==
                                                      "3rd Floor") {
                                                    parentLocation = 3;
                                                  }
                                                  if (selectedFloorParent ==
                                                      "other") {
                                                    setState(() {
                                                      parentLocation = 4;
                                                    });
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    if (parentLocation == 4) ...[
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                                hintText: "more",
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.all(8)
                                                //fillColor: Colors.green
                                                ),
                                            onChanged: ((value) {
                                              parentLocation =
                                                  int.parse(value.toString());
                                            }),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              parentToiletLength =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                parentToiletWidth =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                          hintText: "Other Toilet Facility",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(8)),
                                      onChanged: (value) {
                                        parentToiletFacility = value;
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                      value:
                                                          parentsRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          parentsRequiredDress =
                                                              value;
                                                          parentsNotRequiredDress =
                                                              false;

                                                          if (parentsRequiredDress ==
                                                              true) {
                                                            parentDressInt = 1;
                                                          } else {
                                                            parentDressInt = 0;
                                                          }
                                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                    value:
                                                        parentsNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          parentsNotRequiredDress =
                                                              value;
                                                          parentsRequiredDress =
                                                              false;

                                                          if (parentsRequiredDress ==
                                                              true) {
                                                            parentDressInt = 1;
                                                          } else {
                                                            parentDressInt = 0;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                if (parentsRequiredDress == true) ...[
                                  Row(
                                    children: [
                                      requirementText("Length"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "lenght",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                parentDressLength =
                                                    int.parse(value.toString());
                                              });
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      requirementText("Width"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  parentDressWidth =
                                                      int.parse(value);
                                                },
                                              );
                                            },
                                            // onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.08,
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            requirementText("Dress Facility"),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final List<String> otherIt = [
                                                    "Walk in Cupboard",
                                                    "Vanity",
                                                    "Cupboard",
                                                  ];

                                                  final List<String> ab =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return MultiSelect(
                                                          items: otherIt);
                                                    },
                                                  );
                                                  setState(() {
                                                    parentDressFacility = ab;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child:
                                                      Text("Office Facility"),
                                                ),
                                              ),
                                              Wrap(
                                                children: parentDressFacility
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: SizedBox(
                                            height: height * 0.04,
                                            width: width,
                                            child: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                  hintText: "dress facility",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(8)
                                                  //fillColor: Colors.green
                                                  ),
                                              onChanged: (value) {
                                                parentDresstext = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(height: height * 0.01),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  child: requirementText("Room Facility"),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final List<String> otherItems = [
                                              "None",
                                              "Chair Arrangement",
                                              "Sofa Arrangement",
                                              "Writing and Laptop table",
                                              "TV",
                                              "Mini Bar",
                                            ];

                                            final List<String> result =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MultiSelect(
                                                    items: otherItems);
                                              },
                                            );

                                            setState(() {
                                              parentRoomFacility = result;
                                              print(parentDressFacility);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        Wrap(
                                          children: parentRoomFacility
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
                                Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        hintText: "other requirement",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            parentOtherRequirement = value;
                                          },
                                        );
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  viewportFraction: 1,
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              // ------------------ guestbedroom  -------------------------//

              Column(
                children: [
                  if (guestBedRoom == true) ...[
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        maintainState: true,
                        title: const Text(
                          'Guest\'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
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
                                    requirementText("Length"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            guestLength =
                                                int.parse(value.toString());
                                            // _onUpdate(1, value, '', '', '', '', '', '',
                                            //     '', '', '', '');
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              guestWidth =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                        width: width * 0.5,
                                        margin: const EdgeInsets.all(
                                          3,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Visibility(
                                                visible: false,
                                                child:
                                                    Icon(Icons.arrow_downward)),
                                            // "select Floor",
                                            // "Ground Floor",
                                            // "1st Floor",
                                            // "2nd Floor",
                                            // "3rd Floor",
                                            // "other",
                                            value: selectedFloorGuest,
                                            elevation: 16,
                                            items: floorItemsGuest
                                                .map((it) =>
                                                    DropdownMenuItem<String>(
                                                        value: it,
                                                        child: Text(
                                                          it,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )))
                                                .toList(),
                                            onChanged: (it) {
                                              setState(() {
                                                selectedFloorGuest = it;
                                                if (selectedFloorGuest ==
                                                    "Ground Floor") {
                                                  guestLocation = 0;
                                                }
                                                if (selectedFloorGuest ==
                                                    "1st Floor") {
                                                  guestLocation = 1;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              guestToiletLength =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                guestToiletWidth =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                          hintText: "Other Toilet Facility",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(8)),
                                      onChanged: (value) {
                                        guestToiletFacility = value;
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                      value: guestRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          guestRequiredDress =
                                                              value;
                                                          guestNotRequiredDress =
                                                              false;

                                                          if (guestRequiredDress ==
                                                              true) {
                                                            guestDressInt = 1;
                                                          } else {
                                                            guestDressInt = 0;
                                                          }
                                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                    value:
                                                        guestNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          guestNotRequiredDress =
                                                              value;
                                                          guestRequiredDress =
                                                              false;

                                                          if (guestRequiredDress ==
                                                              true) {
                                                            guestDressInt = 1;
                                                          } else {
                                                            guestDressInt = 0;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                if (guestRequiredDress == true) ...[
                                  Row(
                                    children: [
                                      requirementText("Length"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "lenght",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                guestDressLength =
                                                    int.parse(value.toString());
                                              });
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      requirementText("Width"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  guestDressWidth =
                                                      int.parse(value);
                                                },
                                              );
                                            },
                                            // onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.08,
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            requirementText("Dress Facility"),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final List<String> otherIt = [
                                                    "Walk in Cupboard",
                                                    "Vanity",
                                                    "Cupboard",
                                                  ];

                                                  final List<String> ab =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return MultiSelect(
                                                          items: otherIt);
                                                    },
                                                  );
                                                  setState(() {
                                                    guestDressFacility = ab;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child:
                                                      Text("Office Facility"),
                                                ),
                                              ),
                                              Wrap(
                                                children: guestDressFacility
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: SizedBox(
                                            height: height * 0.04,
                                            width: width,
                                            child: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                  hintText: "dress facility",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(8)
                                                  //fillColor: Colors.green
                                                  ),
                                              onChanged: (value) {
                                                guestDresstext = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(height: height * 0.01),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  child: requirementText("Room Facility"),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final List<String> otherItems = [
                                              "None",
                                              "Chair Arrangement",
                                              "Sofa Arrangement",
                                              "Writing and Laptop table",
                                              "TV",
                                              "Mini Bar",
                                            ];

                                            final List<String> result =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MultiSelect(
                                                    items: otherItems);
                                              },
                                            );

                                            setState(() {
                                              guestRoomFacility = result;

                                              print(guestDressFacility);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        Wrap(
                                          children: guestRoomFacility
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
                                Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        hintText: "other requirement",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            guestOtherRequirement = value;
                                          },
                                        );
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  viewportFraction: 1,
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              // ------------------------- other1bedroom  ------------------------------//

              Column(
                children: [
                  if (other1BedRoom == true) ...[
                    SizedBox(
                      height: height * 0.01,
                    ),

                    // String masterDressReq = '0';
                    // List<String> masterLength = <String>[];
                    // List<String> masterWidth = <String>[];
                    // String masterLocation = '';
                    // String masterToiletLength = '';
                    // String masterToiletWidth = '';
                    // String masterToiletFacility = '';
                    // String masterDressLength = '';
                    // String masterDressWidth = '';
                    // String masterDressFacility = '';
                    // String masterRoomFacility = '';
                    // String masterOtherRequirement = '';

                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        maintainState: true,
                        title: const Text(
                          'Other\'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
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
                                    requirementText("Length"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            other1Length =
                                                int.parse(value.toString());
                                            // _onUpdate(1, value, '', '', '', '', '', '',
                                            //     '', '', '', '');
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              other1Width =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                                child:
                                                    Icon(Icons.arrow_downward)),
                                            value: selectedFloorOther1,
                                            elevation: 16,
                                            items: floorItemsOther1
                                                .map((it) =>
                                                    DropdownMenuItem<String>(
                                                        value: it,
                                                        child: Text(
                                                          it,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )))
                                                .toList(),
                                            onChanged: (it) {
                                              setState(() {
                                                other1Location = 0;
                                              });

                                              setState(
                                                () {
                                                  selectedFloorOther1 = it;
                                                  print(selectedFloorOther1);
                                                  if (selectedFloorOther1 ==
                                                      "Ground Floor") {
                                                    other1Location = 1;
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              other1ToiletLength =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                other1ToiletWidth =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                          hintText: "Other Toilet Facility",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(8)),
                                      onChanged: (value) {
                                        other1ToiletFacility = value;
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                      value:
                                                          other1RequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          other1RequiredDress =
                                                              value;
                                                          other1NotRequiredDress =
                                                              false;

                                                          if (other1RequiredDress ==
                                                              true) {
                                                            other1DressInt = 1;
                                                          } else {
                                                            other1DressInt = 0;
                                                          }
                                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                    value: other1RequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          other1RequiredDress =
                                                              value;
                                                          other1RequiredDress =
                                                              false;

                                                          if (other1RequiredDress ==
                                                              true) {
                                                            other1DressInt = 1;
                                                          } else {
                                                            other1DressInt = 0;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                if (other1RequiredDress == true) ...[
                                  Row(
                                    children: [
                                      requirementText("Length"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "lenght",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                other1DressLength =
                                                    int.parse(value.toString());
                                              });
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      requirementText("Width"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  other1DressWidth =
                                                      int.parse(value);
                                                },
                                              );
                                            },
                                            // onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.08,
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            requirementText("Dress Facility"),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final List<String> otherIt = [
                                                    "Walk in Cupboard",
                                                    "Vanity",
                                                    "Cupboard",
                                                  ];

                                                  final List<String> ab =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return MultiSelect(
                                                          items: otherIt);
                                                    },
                                                  );
                                                  setState(() {
                                                    other1DressFacility = ab;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child:
                                                      Text("Office Facility"),
                                                ),
                                              ),
                                              Wrap(
                                                children: other1DressFacility
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: SizedBox(
                                            height: height * 0.04,
                                            width: width,
                                            child: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                  hintText: "dress facility",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(8)
                                                  //fillColor: Colors.green
                                                  ),
                                              onChanged: (value) {
                                                other1Dresstext = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(height: height * 0.01),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  child: requirementText("Room Facility"),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final List<String> otherItems = [
                                              "None",
                                              "Chair Arrangement",
                                              "Sofa Arrangement",
                                              "Writing and Laptop table",
                                              "TV",
                                              "Mini Bar",
                                            ];

                                            final List<String> result =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MultiSelect(
                                                    items: otherItems);
                                              },
                                            );

                                            setState(() {
                                              other1RoomFacility = result;
                                              print(other1DressFacility);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        Wrap(
                                          children: other1RoomFacility
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
                                Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        hintText: "other requirement",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            other1OtherRequirement = value;
                                          },
                                        );
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  viewportFraction: 1,
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              // -------------------------------- other2BedRoom  ---------------------------------------//

              Column(
                children: [
                  if (other2BedRoom == true) ...{
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        maintainState: true,
                        title: const Text(
                          'Other2\'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
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
                                    requirementText("Length"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            other2Length =
                                                int.parse(value.toString());
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              other2Width =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                                child:
                                                    Icon(Icons.arrow_downward)),
                                            value: selectedFloorOther2,
                                            elevation: 16,
                                            items: floorItemsOther2
                                                .map((it) =>
                                                    DropdownMenuItem<String>(
                                                        value: it,
                                                        child: Text(
                                                          it,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )))
                                                .toList(),
                                            onChanged: (it) {
                                              selectedFloorOther2 = it;
                                              print(selectedFloorOther1);

                                              if (selectedFloorOther2 ==
                                                  "Ground Floor") {
                                                other2Location = 1;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              other2ToiletLength =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                other2ToiletWidth =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                          hintText: "Other Toilet Facility",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(8)),
                                      onChanged: (value) {
                                        other2ToiletFacility = value;
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                      value:
                                                          other2RequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          other2RequiredDress =
                                                              value;
                                                          other2NotRequiredDress =
                                                              false;

                                                          if (other2RequiredDress ==
                                                              true) {
                                                            other2DressInt = 1;
                                                          } else {
                                                            other2DressInt = 0;
                                                          }
                                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                    value:
                                                        other2NotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          other2NotRequiredDress =
                                                              value;
                                                          other2RequiredDress =
                                                              false;

                                                          if (other2RequiredDress ==
                                                              true) {
                                                            other2DressInt = 1;
                                                          } else {
                                                            other2DressInt = 0;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                if (other2RequiredDress == true) ...[
                                  Row(
                                    children: [
                                      requirementText("Length"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "lenght",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                other2DressLength =
                                                    int.parse(value.toString());
                                              });
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      requirementText("Width"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  other2DressWidth =
                                                      int.parse(value);
                                                },
                                              );
                                            },
                                            // onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.08,
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            requirementText("Dress Facility"),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final List<String> otherIt = [
                                                    "Walk in Cupboard",
                                                    "Vanity",
                                                    "Cupboard",
                                                  ];

                                                  final List<String> ab =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return MultiSelect(
                                                          items: otherIt);
                                                    },
                                                  );
                                                  setState(() {
                                                    other2DressFacility = ab;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child:
                                                      Text("Office Facility"),
                                                ),
                                              ),
                                              Wrap(
                                                children: other2DressFacility
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: SizedBox(
                                            height: height * 0.04,
                                            width: width,
                                            child: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                  hintText: "dress facility",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(8)
                                                  //fillColor: Colors.green
                                                  ),
                                              onChanged: (value) {
                                                other2Dresstext = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(height: height * 0.01),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  child: requirementText("Room Facility"),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final List<String> otherItems = [
                                              "None",
                                              "Chair Arrangement",
                                              "Sofa Arrangement",
                                              "Writing and Laptop table",
                                              "TV",
                                              "Mini Bar",
                                            ];

                                            final List<String> result =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MultiSelect(
                                                    items: otherItems);
                                              },
                                            );

                                            setState(() {
                                              other2RoomFacility = result;
                                              print(other2DressFacility);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        Wrap(
                                          children: other2RoomFacility
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
                                Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        hintText: "other requirement",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            other2OtherRequirement = value;
                                          },
                                        );
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  viewportFraction: 1,
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  },
                ],
              ),

              // ----------------- other3bedroom   -----------------------------//

              Column(
                children: [
                  if (other3BedRoom == true) ...{
                    SizedBox(
                      height: height * 0.01,
                    ),

                    // String masterDressReq = '0';
                    // List<String> masterLength = <String>[];
                    // List<String> masterWidth = <String>[];
                    // String masterLocation = '';
                    // String masterToiletLength = '';
                    // String masterToiletWidth = '';
                    // String masterToiletFacility = '';
                    // String masterDressLength = '';
                    // String masterDressWidth = '';
                    // String masterDressFacility = '';
                    // String masterRoomFacility = '';
                    // String masterOtherRequirement = '';

                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        maintainState: true,
                        title: const Text(
                          'Other 3\'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
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
                                    requirementText("Length"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            other3Length =
                                                int.parse(value.toString());
                                            // _onUpdate(1, value, '', '', '', '', '', '',
                                            //     '', '', '', '');
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              other3Width =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                                child:
                                                    Icon(Icons.arrow_downward)),
                                            value: selectedFloorOther3,
                                            elevation: 16,
                                            items: floorItemsOther3
                                                .map((it) =>
                                                    DropdownMenuItem<String>(
                                                        value: it,
                                                        child: Text(
                                                          it,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )))
                                                .toList(),
                                            onChanged: (it) {
                                              selectedFloorOther3 = it;
                                              print(selectedFloorOther1);
                                              if (selectedFloorOther3 ==
                                                  "Ground Floor") {
                                                other3Location = 1;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.15,
                                        child: TextFormField(
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                              hintText: "Length",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8)
                                              //fillColor: Colors.green
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              other3ToiletLength =
                                                  int.parse(value.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    requirementText("Width"),
                                    SizedBox(
                                      width: width * 0.015,
                                    ),
                                    Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                other3ToiletWidth =
                                                    int.parse(value.toString());
                                              },
                                            );
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                    ),
                                    valueContainer(
                                        height, width, size, 0.04, 0.05),
                                    SizedBox(
                                      width: width * 0.08,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                          hintText: "Other Toilet Facility",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(8)),
                                      onChanged: (value) {
                                        other3ToiletFacility = value;
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                      value:
                                                          other3RequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          other3RequiredDress =
                                                              value;
                                                          other3NotRequiredDress =
                                                              false;

                                                          if (other3RequiredDress ==
                                                              true) {
                                                            other3DressInt = 1;
                                                          } else {
                                                            other3DressInt = 0;
                                                          }
                                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                    value:
                                                        other3NotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          other3NotRequiredDress =
                                                              value;
                                                          other3RequiredDress =
                                                              false;

                                                          if (other3RequiredDress ==
                                                              true) {
                                                            other3DressInt = 1;
                                                          } else {
                                                            other3DressInt = 0;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                if (other3RequiredDress == true) ...[
                                  Row(
                                    children: [
                                      requirementText("Length"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "lenght",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                other3DressLength =
                                                    int.parse(value.toString());
                                              });
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      requirementText("Width"),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width * 0.15,
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "width",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  other3DressWidth =
                                                      int.parse(value);
                                                },
                                              );
                                            },
                                            // onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                          height, width, size, 0.04, 0.05),
                                      SizedBox(
                                        width: width * 0.08,
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            requirementText("Dress Facility"),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final List<String> otherIt = [
                                                    "Walk in Cupboard",
                                                    "Vanity",
                                                    "Cupboard",
                                                  ];

                                                  final List<String> ab =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return MultiSelect(
                                                          items: otherIt);
                                                    },
                                                  );
                                                  setState(() {
                                                    other3DressFacility = ab;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child:
                                                      Text("Office Facility"),
                                                ),
                                              ),
                                              Wrap(
                                                children: other3DressFacility
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: SizedBox(
                                            height: height * 0.04,
                                            width: width,
                                            child: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                  hintText: "dress facility",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(8)
                                                  //fillColor: Colors.green
                                                  ),
                                              onChanged: (value) {
                                                other3Dresstext = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(height: height * 0.01),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  child: requirementText("Room Facility"),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final List<String> otherItems = [
                                              "None",
                                              "Chair Arrangement",
                                              "Sofa Arrangement",
                                              "Writing and Laptop table",
                                              "TV",
                                              "Mini Bar",
                                            ];

                                            final List<String> result =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MultiSelect(
                                                    items: otherItems);
                                              },
                                            );

                                            setState(() {
                                              other3RoomFacility = result;
                                              print(other3DressFacility);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        Wrap(
                                          children: other3RoomFacility
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
                                Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: SizedBox(
                                    height: height * 0.04,
                                    width: width,
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        hintText: "other requirement",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            other3OtherRequirement = value;
                                          },
                                        );
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return CarouselSlider.builder(
                                                itemCount: bunglowPageRecentList
                                                    .length,
                                                itemBuilder: (context, i, id) {
                                                  return Container(
                                                    height: height * 0.4,
                                                    width: width * 0.9,
                                                    child: Image.network(
                                                      imageUrl +
                                                          bunglowPageRecentList[
                                                              i]["img_path"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  viewportFraction: 1,
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  },
                ],
              ),

              SizedBox(
                height: height * 0.01,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () async {
                    JsonFront json = JsonFront(dimension: 1, projectId: 65);
                    var ab = jsonEncode(json);

                    Map<dynamic, dynamic> _value = {};
                    _value["dimension"] = 1;
                    _value["project_id"] = 87;

                    List<Bedtypes> bedData = [
                      if (masterBedroom == true)
                        Bedtypes(
                          bedroomLength: masterLength,
                          bedRoomFloor: masterLocation,
                          bedRoomWidth: masterWidth,
                          bedRoomToiletLength: masterToiletLength,
                          bedRoomToiletWidth: masterToiletWidth,
                          bedRoomToiletFacility: masterToiletFacility,
                          bedroomDressLength: masterDressLength,
                          bedroomDressWidth: masterDressWidth,
                          bedroomDressFacility: masterDressFacility,
                          bedroomImg: "",
                          bedroomFacility: masterRoomFacility,
                          bedroomName: "1",
                          bedroomDressReq: masterDressInt,
                          bedroomDressText: masterDresstext,
                          bedroomText: masterOtherRequirement,
                        ),
                      if (sonBedRoom == true)
                        Bedtypes(
                          bedroomLength: sonLength,
                          bedRoomFloor: sonLocation,
                          bedRoomWidth: sonWidth,
                          bedRoomToiletLength: sonToiletLength,
                          bedRoomToiletWidth: sonToiletWidth,
                          bedRoomToiletFacility: sonToiletFacility,
                          bedroomDressLength: sonDressLength,
                          bedroomDressWidth: sonDressWidth,
                          bedroomDressFacility: sonDressFacility,
                          bedroomImg: "",
                          bedroomFacility: sonRoomFacility,
                          bedroomName: "2",
                          bedroomDressReq: sonDressInt,
                          bedroomDressText: sonDresstext,
                          bedroomText: sonOtherRequirement,
                        ),
                      if (daughterBedRoom == true)
                        Bedtypes(
                          bedroomLength: daughterLength,
                          bedRoomFloor: daughterLocation,
                          bedRoomWidth: daughterWidth,
                          bedRoomToiletLength: daughterToiletLength,
                          bedRoomToiletWidth: daughterToiletWidth,
                          bedRoomToiletFacility: daughterToiletFacility,
                          bedroomDressLength: daughterDressLength,
                          bedroomDressWidth: daughterDressWidth,
                          bedroomDressFacility: daughterDressFacility,
                          bedroomImg: "",
                          bedroomFacility: daughterRoomFacility,
                          bedroomName: "3",
                          bedroomDressReq: daughterDressInt,
                          bedroomDressText: daughterDresstext,
                          bedroomText: daughterOtherRequirement,
                        ),
                      if (parentBedRoom == true)
                        Bedtypes(
                          bedroomLength: parentLength,
                          bedRoomFloor: parentLocation,
                          bedRoomWidth: parentWidth,
                          bedRoomToiletLength: parentToiletLength,
                          bedRoomToiletWidth: parentToiletWidth,
                          bedRoomToiletFacility: parentToiletFacility,
                          bedroomDressLength: parentDressLength,
                          bedroomDressWidth: parentDressWidth,
                          bedroomDressFacility: parentDressFacility,
                          bedroomImg: "",
                          bedroomFacility: parentRoomFacility,
                          bedroomName: "4",
                          bedroomDressReq: parentDressInt,
                          bedroomDressText: parentDresstext,
                          bedroomText: parentOtherRequirement,
                        ),
                      if (guestBedRoom == true)
                        Bedtypes(
                          bedroomLength: guestLength,
                          bedRoomFloor: guestLocation,
                          bedRoomWidth: guestWidth,
                          bedRoomToiletLength: guestToiletLength,
                          bedRoomToiletWidth: guestToiletWidth,
                          bedRoomToiletFacility: guestToiletFacility,
                          bedroomDressLength: guestDressLength,
                          bedroomDressWidth: guestDressWidth,
                          bedroomDressFacility: guestDressFacility,
                          bedroomImg: "",
                          bedroomFacility: guestRoomFacility,
                          bedroomName: "5",
                          bedroomDressReq: guestDressInt,
                          bedroomDressText: guestDresstext,
                          bedroomText: guestOtherRequirement,
                        ),
                      if (other1BedRoom == true)
                        Bedtypes(
                          bedroomLength: other1Length,
                          bedRoomFloor: other1Location,
                          bedRoomWidth: other1Width,
                          bedRoomToiletLength: other1ToiletLength,
                          bedRoomToiletWidth: other1ToiletWidth,
                          bedRoomToiletFacility: other1ToiletFacility,
                          bedroomDressLength: other1DressLength,
                          bedroomDressWidth: other1DressWidth,
                          bedroomDressFacility: other1DressFacility,
                          bedroomImg: "",
                          bedroomFacility: other1RoomFacility,
                          bedroomName: "6",
                          bedroomDressReq: other1DressInt,
                          bedroomDressText: other1Dresstext,
                          bedroomText: other1OtherRequirement,
                        ),
                      if (other2BedRoom == true)
                        Bedtypes(
                          bedroomLength: other2Length,
                          bedRoomFloor: other2Location,
                          bedRoomWidth: other2Width,
                          bedRoomToiletLength: other2ToiletLength,
                          bedRoomToiletWidth: other2ToiletWidth,
                          bedRoomToiletFacility: other2ToiletFacility,
                          bedroomDressLength: other2DressLength,
                          bedroomDressWidth: other2DressWidth,
                          bedroomDressFacility: other2DressFacility,
                          bedroomImg: "",
                          bedroomFacility: other2RoomFacility,
                          bedroomName: "7",
                          bedroomDressReq: other2DressInt,
                          bedroomDressText: other2Dresstext,
                          bedroomText: other2OtherRequirement,
                        ),
                      if (other3BedRoom == true)
                        Bedtypes(
                          bedroomLength: other3Length,
                          bedRoomFloor: other3Location,
                          bedRoomWidth: other3Width,
                          bedRoomToiletLength: other3ToiletLength,
                          bedRoomToiletWidth: other3ToiletWidth,
                          bedRoomToiletFacility: other3ToiletFacility,
                          bedroomDressLength: other3DressLength,
                          bedroomDressWidth: other3DressWidth,
                          bedroomDressFacility: other3DressFacility,
                          bedroomImg: "",
                          bedroomFacility: other3RoomFacility,
                          bedroomName: "8",
                          bedroomDressReq: other3DressInt,
                          bedroomDressText: other3Dresstext,
                          bedroomText: other3OtherRequirement,
                        ),
                    ];

                    List jsonUser = [];
                    // String dim = "dimension";
                    // String id = "Project_id";

                    for (int i = 0; i < bedData.length; i++) {
                      jsonUser.add(bedData[i]);
                    }
                    _value["bedrooms"] = jsonUser;
                    // _value.putIfAbsent("bedrooms", () => jsonUser);

                    print(jsonEncode(_value));
                    // print(_values[0]["bedroom_length"]);
                    //  print(masterLength);
                    // print({'dimension': 1, "project_id": 567, "bedrooms": jsonUser});

                    final response = await http.post(
                      Uri.parse(
                          'http://192.168.1.99:8080/sdplserver/api/bungalow-bedroom'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(_value),
                      // body: _value
                    );

                    print(response.body);
                  },
                  child: Container(
                    height: height * 0.04,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(4)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text(
                      "save and continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
