import 'dart:convert';
import 'dart:core';

import 'package:aashiyan/model/bedmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../components/forms.dart';
import '../../../const.dart';
import '../../../controller/api_services.dart';

class StaticBedroomPage extends StatefulWidget {
  const StaticBedroomPage({Key? key}) : super(key: key);

  @override
  State<StaticBedroomPage> createState() => _StaticBedroomPageState();
}

class _StaticBedroomPageState extends State<StaticBedroomPage> {
  final lengthController = TextEditingController();

  bool? requiredDress = false;
  bool? notRequiredDress = false;

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
    lengthController.addListener(_printLatestValue);
    _values;
    // getData();
  }

  _onUpdate(
    int key,
    String length,
    String width,
    String floor,
    String toiletLength,
    String toiletWidth,
    String toiletFacility,
    String dresReq,
    String dressLength,
    String dressWidth,
    String dressFacility,
    String roomFacility,
  ) {
    int foundKey = -1;
    for (var map in _values) {
      if (map.containsKey("id")) {
        if (map["id"] == key) {
          // print("$foundKey ${map["id"]} ");
          foundKey = key;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values.removeWhere((map) {
        // print("${map["id"] == foundKey} ${map["id"]}");
        return map["id"] == foundKey;
      });
    }
    Map<String, dynamic> json = {
      "id": key,
      "bedroom_length": length,
      "bedroom_width": width,
      "floor": floor,
      "toilet_length": toiletLength,
      "toilet_width": toiletWidth,
      "toilet_facility": toiletFacility,
      "dress_req": dressFacility,
      "dress_length": dressLength,
      "dress_width": dressWidth,
      "dress_facility": dressFacility,
      "room_facility": roomFacility,
    };

    _values.add(json);
    setState(() {
      result = _prettyPrint(_values);
    });
    print(result);
  }

  String _prettyPrint(jsonObject) {
    var encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(jsonObject);
  }

  @override
  void dispose() {
    lengthController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${lengthController.text}');
  }

  String? selectedFloorMaster = "select Floor";
  List<String> floorItemsMater = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String? selectedFloorSon = "select Floor";
  List<String> floorItemsSon = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String? selectedFloorDaughter = "select Floor";
  List<String> floorItemsDaughter = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String? selectedFloorGuest = "select Floor";
  List<String> floorItemsGuest = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String? selectedFloorOther1 = "select Floor";
  List<String> floorItemsOther1 = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String? selectedFloorOther2 = "select Floor";
  List<String> floorItemsOther2 = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String? selectedFloorOther3 = "select Floor";
  List<String> floorItemsOther3 = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  String? selectedFloor = "select Floor";
  List<String> floorItems = [
    "select Floor",
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "other"
  ];

  List<Map<String, dynamic>> _values = [];

  String masterDressReq = '0';
  List<String> masterLength = <String>[];
  List<String> masterWidth = <String>[];
  String masterLocation = '';
  String masterToiletLength = '';
  String masterToiletWidth = '';
  String masterToiletFacility = '';
  String masterDressLength = '';
  String masterDressWidth = '';
  String masterDressFacility = '';
  String masterRoomFacility = '';
  String masterOtherRequirement = '';

  String sonDressReq = '0';
  String sonWidth = '';
  String sonLocation = '';
  String sonLength = '';
  String sonToiletLength = '';
  String sonToiletWidth = '';
  String sonToiletFacility = '';
  int sonDressInt = 0;
  String sonDressLength = '';
  String sonDressWidth = '';
  String sonDressFacility = '';
  String sonRoomFacility = '';
  String sonOtherRequirement = '';

  String daughterDressReq = '0';
  String daughterLength = '';
  String daughterWidth = '';
  String daughterLocation = '';
  String daughterToiletLength = '';
  String daughterToiletWidth = '';
  String daughterToiletFacility = '';
  int daughterDressInt = 0;
  String daughterDressLength = '';
  String daughterDressWidth = '';
  String daughterDressFacility = '';
  String daughterRoomFacility = '';
  String daughterOtherRequirement = '';

  String parentDressReq = '0';
  String parentLength = '';
  String parentWidth = '';
  String parentLocation = '';
  String parentToiletLength = '';
  String parentToiletWidth = '';
  String parentToiletFacility = '';
  int parentDressInt = 0;
  String parentDressLength = '';
  String parentDressWidth = '';
  String parentDressFacility = '';
  String parentRoomFacility = '';
  String parentOtherRequirement = '';

  String guestDressReq = '0';
  String guestLength = '';
  String guestWidth = '';
  String guestLocation = '';
  String guestToiletLength = '';
  String guestToiletWidth = '';
  String guestToiletFacility = '';
  int guestDressInt = 0;
  String guestDressLength = '';
  String guestDressWidth = '';
  String guestDressFacility = '';
  String guestRoomFacility = '';
  String guestOtherRequirement = '';

  String other1DressReq = '0';
  String other1Length = '';
  String other1Width = '';
  String other1Location = '';
  String other1ToiletLength = '';
  String other1ToiletWidth = '';
  String other1ToiletFacility = '';
  int other1DressInt = 0;
  String other1DressLength = '';
  String other1DressWidth = '';
  String other1DressFacility = '';
  String other1RoomFacility = '';
  String other1OtherRequirement = '';

  String other2DressReq = '0';
  String other2Length = '';
  String other2Width = '';
  String other2Location = '';
  String other2ToiletLength = '';
  String other2ToiletWidth = '';
  String other2ToiletFacility = '';
  int other2DressInt = 0;
  String other2DressLength = '';
  String other2DressWidth = '';
  String other2DressFacility = '';
  String other2RoomFacility = '';
  String other2OtherRequirement = '';

  String other3DressReq = '0';
  String other3Length = '';
  String other3Width = '';
  String other3Location = '';
  String other3ToiletLength = '';
  String other3ToiletWidth = '';
  String other3ToiletFacility = '';
  int other3DressInt = 0;
  String other3DressLength = '';
  String other3DressWidth = '';
  String other3DressFacility = '';
  String other3RoomFacility = '';
  String other3OtherRequirement = '';

  bool masterBedroom = false;
  bool sonBedRoom = false;
  bool daughterBedRoom = false;
  bool parentBedRoom = false;
  bool guestBedRoom = false;
  bool other1BedRoom = false;
  bool other2BedRoom = false;
  bool other3BedRoom = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    return Column(
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
        if (masterBedroom == true) ...{
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            color: Colors.grey,
            child: ExpansionTile(
              maintainState: true,
              initiallyExpanded: true,
              title: Text(
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
                                  _onUpdate(1, value, '', '', '', '', '', '',
                                      '', '', '', '');
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
                                  setState(() {
                                    _onUpdate(
                                        0,
                                        _values[0]["bedroom_length"],
                                        value,
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',);
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
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
                                      child: Icon(Icons.arrow_downward)),
                                  value: selectedFloor,
                                  elevation: 16,
                                  items: floorItems
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
                                    setState(() {
                                      _onUpdate(
                                          0,
                                          _values[0]["bedroom_length"],
                                          _values[0]["bedroom_width"],
                                          it!,
                                          '',
                                          '',
                                          '',
                                          '',
                                          '',
                                          '',
                                          '',
                                          '');
                                    });

                                    setState(
                                      () {
                                        selectedFloor = it;
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
                                  setState(() {
                                    _onUpdate(
                                        0,
                                        _values[0]["bedroom_length"],
                                        _values[0]["bedroom_width"],
                                        _values[0]["floor"],
                                        value,
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '');
                                  });
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
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _onUpdate(
                                        0,
                                        _values[0]["bedroom_length"],
                                        _values[0]["bedroom_width"],
                                        _values[0]["floor"],
                                        _values[0]["toilet_length"],
                                        value,
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '');
                                  });
                                },
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              _onUpdate(
                                0,
                                _values[0]["bedroom_length"],
                                _values[0]["bedroom_width"],
                                _values[0]["floor"],
                                _values[0]["toilet_length"],
                                _values[0]["toilet_width"],
                                value,
                                '',
                                '',
                                '',
                                '',
                                '',
                              );
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
                                              setState(() {
                                                requiredDress = value;
                                                notRequiredDress = false;
                                              });
                                              if (requiredDress == true) {
                                                _onUpdate(
                                                  0,
                                                  _values[0]["bedroom_length"],
                                                  _values[0]["bedroom_width"],
                                                  _values[0]["floor"],
                                                  _values[0]["toilet_length"],
                                                  _values[0]["toilet_width"],
                                                  _values[0]["toilet_facility"],
                                                  "1",
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                );
                                              }
                                              if (notRequiredDress == false) {
                                                _onUpdate(
                                                  0,
                                                  _values[0]["bedroom_length"],
                                                  _values[0]["bedroom_width"],
                                                  _values[0]["floor"],
                                                  _values[0]["toilet_length"],
                                                  _values[0]["toilet_width"],
                                                  _values[0]["toilet_facility"],
                                                  "0",
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                );
                                              }
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
                                              });
                                              if (requiredDress == true) {
                                                _onUpdate(
                                                  0,
                                                  _values[0]["bedroom_length"],
                                                  _values[0]["bedroom_width"],
                                                  _values[0]["floor"],
                                                  _values[0]["toilet_length"],
                                                  _values[0]["toilet_width"],
                                                  _values[0]["toilet_facility"],
                                                  "1",
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                );
                                              }
                                              if (notRequiredDress == false) {
                                                _onUpdate(
                                                  0,
                                                  _values[0]["bedroom_length"],
                                                  _values[0]["bedroom_width"],
                                                  _values[0]["floor"],
                                                  _values[0]["toilet_length"],
                                                  _values[0]["toilet_width"],
                                                  _values[0]["toilet_facility"],
                                                  "0",
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                );
                                              }
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    _onUpdate(
                                      0,
                                      _values[0]["bedroom_length"],
                                      _values[0]["bedroom_width"],
                                      _values[0]["floor"],
                                      _values[0]["toilet_length"],
                                      _values[0]["toilet_width"],
                                      _values[0]["toilet_facility"],
                                      _values[0]["dress_req"],
                                      value,
                                      '',
                                      '',
                                      '',
                                    );
                                  },
                                  onFieldSubmitted: (value) {},
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    _onUpdate(
                                      0,
                                      _values[0]["bedroom_length"],
                                      _values[0]["bedroom_width"],
                                      _values[0]["floor"],
                                      _values[0]["toilet_length"],
                                      _values[0]["toilet_width"],
                                      _values[0]["toilet_facility"],
                                      _values[0]["dress_req"],
                                      _values[0]["dress_lenght"],
                                      value,
                                      '',
                                      '',
                                    );
                                  },
                                  onFieldSubmitted: (value) {},
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
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
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: requirementText("Dress Facility"),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText: "more",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    _onUpdate(
                                      0,
                                      _values[0]["bedroom_length"],
                                      _values[0]["bedroom_width"],
                                      _values[0]["floor"],
                                      _values[0]["toilet_length"],
                                      _values[0]["toilet_width"],
                                      _values[0]["toilet_facility"],
                                      _values[0]["dress_req"],
                                      _values[0]["dress_lenght"],
                                      _values[0]["dress_width"],
                                      value,
                                      '',
                                    );
                                  },
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
                        child: requirementText("Room Facility"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                _onUpdate(
                                  0,
                                  _values[0]["bedroom_length"],
                                  _values[0]["bedroom_width"],
                                  _values[0]["floor"],
                                  _values[0]["toilet_length"],
                                  _values[0]["toilet_width"],
                                  _values[0]["toilet_facility"],
                                  _values[0]["dress_req"],
                                  _values[0]["dress_lenght"],
                                  _values[0]["dress_width"],
                                  _values[0]["dress_facility"],
                                  value,
                                );
                              });
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        },
        if (sonBedRoom == true) ...{
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            color: Colors.grey,
            child: ExpansionTile(
              maintainState: true,
              initiallyExpanded: true,
              title: Text(
                'Son\'s Bedroom Details',
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
                                  setState(() {
                                    _onUpdate(2, value, '', '', '', '', '', '',
                                        '', '', '', '');
                                  });
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
                                  setState(() {
                                    // _onUpdate(
                                    //     2,
                                    //     _values[1]['bedroon_length'],
                                    //     value,
                                    //     '',
                                    //     '',
                                    //     '',
                                    //     '',
                                    //     '',
                                    //     '',
                                    //     '',
                                    //     '',
                                    //     '');
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                                    value: selectedFloorSon,
                                    elevation: 16,
                                    items: floorItemsSon
                                        .map((it) => DropdownMenuItem<String>(
                                            value: it,
                                            child: Text(
                                              it,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            )))
                                        .toList(),
                                    onChanged: (it) =>
                                        setState(() => selectedFloorSon = it!)),
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
                                  setState(() {
                                    sonToiletLength = value;
                                  });
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
                                  setState(() {
                                    sonToiletWidth = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                hintText: "Other toilet facility",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(8)
                                //fillColor: Colors.green
                                ),
                            onChanged: (value) {
                              setState(() {
                                sonToiletFacility = value;
                              });
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
                                            value: sonRequiredDress,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  sonRequiredDress = value;
                                                  sonNotRequiredDress = false;
                                                },
                                              );
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
                                            value: sonNotRequiredDress,
                                            onChanged: (value) {
                                              setState(() {
                                                sonNotRequiredDress = value;
                                                sonRequiredDress = false;
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
                      if (sonRequiredDress == true) ...[
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
                                      hintText: "length",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8)
                                      //fillColor: Colors.green
                                      ),
                                  onChanged: (value) {
                                    setState(() {
                                      sonDressLength = value;
                                    });
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
                                    setState(() {
                                      sonDressWidth = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                            SizedBox(
                              width: width * 0.1,
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
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: requirementText("Dress Facility"),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                      hintText: "more",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8)
                                      //fillColor: Colors.green
                                      ),
                                  onChanged: (value) {
                                    setState(() {
                                      sonDressFacility = value;
                                    });
                                  },
                                ),
                              ),
                            ),
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
                        child: requirementText("Room Facility"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {});
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
                    ],
                  ),
                ),
              ],
            ),
          )
        },
        if (daughterBedRoom == true) ...{
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            color: Colors.grey,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Daughter BedRoom Details',
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
                                  setState(() {
                                    daughterLength = value;
                                    print(masterLength);
                                  });
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
                                  setState(() {
                                    daughterWidth = value;
                                    print(masterWidth);
                                  });
                                },
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                                    value: selectedFloorDaughter,
                                    elevation: 16,
                                    items: floorItemsDaughter
                                        .map((it) => DropdownMenuItem<String>(
                                            value: it,
                                            child: Text(
                                              it,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )))
                                        .toList(),
                                    onChanged: (it) => setState(
                                        () => selectedFloorDaughter = it!)),
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
                                  setState(() {
                                    daughterToiletLength = value;

                                    print(masterToiletLength);
                                  });
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
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    daughterToiletWidth = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                daughterToiletFacility = value;
                              });
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
                                            value: daughterRequiredDress,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  daughterRequiredDress = value;
                                                  daughterNotRequiredDress =
                                                      false;
                                                },
                                              );
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
                                            value: daughterNotRequiredDress,
                                            onChanged: (value) {
                                              setState(() {
                                                daughterNotRequiredDress =
                                                    value;
                                                daughterRequiredDress = false;
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
                      if (daughterRequiredDress == true) ...[
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      daughterDressLength = value;
                                      print(daughterDressLength);
                                    });
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      daughterDressWidth = value;
                                      print(daughterDressWidth);
                                    });
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                            SizedBox(
                              width: width * 0.1,
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
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: requirementText("Dress Facility"),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText: "more",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      daughterDressFacility = value;
                                      print(daughterDressFacility);
                                    });
                                  },
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
                        child: requirementText("Room Facility"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                daughterRoomFacility = value;
                                print(daughterRoomFacility);
                              });
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
                    ],
                  ),
                ),
              ],
            ),
          )
        },
        if (parentBedRoom == true) ...{
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            color: Colors.grey,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Parents BedRoom Details',
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
                                  setState(() {
                                    parentLength = value;
                                    print(parentLength);
                                  });
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
                                  setState(() {
                                    parentWidth = value;
                                    print(masterWidth);
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                                    value: selectedFloor,
                                    elevation: 16,
                                    items: floorItems
                                        .map((it) => DropdownMenuItem<String>(
                                            value: it,
                                            child: Text(
                                              it,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )))
                                        .toList(),
                                    onChanged: (it) =>
                                        setState(() => selectedFloor = it!)),
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
                                  setState(() {
                                    parentToiletLength = value;
                                    print(parentToiletLength);
                                  });
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
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    parentToiletWidth = value;
                                    print(parentToiletWidth);
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                parentToiletFacility = value;
                              });
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
                                            value: parentsRequiredDress,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  parentsRequiredDress = value;
                                                  parentsNotRequiredDress =
                                                      false;
                                                },
                                              );
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
                                            value: parentsNotRequiredDress,
                                            onChanged: (value) {
                                              setState(() {
                                                parentsNotRequiredDress = value;
                                                parentsRequiredDress = false;
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
                      if (parentsRequiredDress == true) ...[
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      parentDressLength = value;
                                      print(masterDressLength);
                                    });
                                  },
                                  onFieldSubmitted: (value) {},
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      parentDressWidth = value;
                                      print(parentDressWidth);
                                    });
                                  },
                                  onFieldSubmitted: (value) {},
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                            SizedBox(
                              width: width * 0.1,
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
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: requirementText("Dress Facility"),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText: "more",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      parentDressFacility = value;
                                      print(parentDressFacility);
                                    });
                                  },
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
                        child: requirementText("Room Facility"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                parentRoomFacility = value;
                                print(parentRoomFacility);
                              });
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
                    ],
                  ),
                ),
              ],
            ),
          )
        },
        if (guestBedRoom == true) ...{
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            color: Colors.grey,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Guest BedRoom Details',
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
                                  setState(() {
                                    guestLength = value;
                                    print(guestLength);
                                  });
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
                                  setState(() {
                                    guestWidth = value;
                                    print(guestWidth);
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                                  value: selectedFloorGuest,
                                  elevation: 16,
                                  items: floorItemsGuest
                                      .map((it) => DropdownMenuItem<String>(
                                          value: it,
                                          child: Text(
                                            it,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          )))
                                      .toList(),
                                  onChanged: (it) =>
                                      setState(() => selectedFloorGuest = it!),
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
                                    contentPadding: EdgeInsets.all(8)),
                                onChanged: (value) {
                                  setState(() {
                                    guestToiletLength = value;
                                    print(guestToiletLength);
                                  });
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
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    guestToiletWidth = value;
                                    print(guestToiletWidth);
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                guestToiletFacility = value;
                              });
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
                                            value: guestRequiredDress,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  guestRequiredDress = value;
                                                  guestNotRequiredDress = false;
                                                },
                                              );
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
                                            value: guestNotRequiredDress,
                                            onChanged: (value) {
                                              setState(() {
                                                guestNotRequiredDress = value;
                                                guestRequiredDress = false;
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
                      if (guestRequiredDress == true) ...[
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      guestDressLength = value;
                                      print(guestDressLength);
                                    });
                                  },
                                  onFieldSubmitted: (value) {},
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      guestDressWidth = value;
                                      print(guestDressWidth);
                                    });
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                            SizedBox(
                              width: width * 0.1,
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
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: requirementText("Dress Facility"),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText: "more",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      guestDressFacility = value;
                                      print(guestDressFacility);
                                    });
                                  },
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
                        child: requirementText("Room Facility"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                guestRoomFacility = value;
                                print(guestRoomFacility);
                              });
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
                    ],
                  ),
                ),
              ],
            ),
          )
        },
        if (other1BedRoom == true) ...{
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            color: Colors.grey,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Other 1 BedRoom',
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
                                  setState(() {
                                    other1Length = value;
                                    print(other1Length);
                                  });
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
                                  setState(() {
                                    other1Width = value;
                                    print(other1Width);
                                  });
                                },
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                                    value: selectedFloorOther1,
                                    elevation: 16,
                                    items: floorItemsOther1
                                        .map((it) => DropdownMenuItem<String>(
                                            value: it,
                                            child: Text(
                                              it,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )))
                                        .toList(),
                                    onChanged: (it) => setState(
                                        () => selectedFloorOther1 = it!)),
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
                                  setState(() {
                                    other1ToiletLength = value;
                                    print(other1ToiletLength);
                                  });
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
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    other1ToiletWidth = value;
                                    print(other1ToiletWidth);
                                  });
                                },
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                other1ToiletFacility = value;
                              });
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
                                            value: other1RequiredDress,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  other1RequiredDress = value;
                                                  other1NotRequiredDress =
                                                      false;
                                                },
                                              );
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
                                            value: other1NotRequiredDress,
                                            onChanged: (value) {
                                              setState(() {
                                                other1NotRequiredDress = value;
                                                other1RequiredDress = false;
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
                      if (other1RequiredDress == true) ...[
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other1DressLength = value;
                                      print(other1DressLength);
                                    });
                                  },
                                  onFieldSubmitted: (value) {},
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other1DressWidth = value;
                                      print(other1DressWidth);
                                    });
                                  },
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                            SizedBox(
                              width: width * 0.1,
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
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: requirementText("Dress Facility"),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText: "more",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other1DressFacility = value;
                                      print(other1DressFacility);
                                    });
                                  },
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
                        child: requirementText("Room Facility"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                other1RoomFacility = value;
                                print(other1RoomFacility);
                              });
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
                    ],
                  ),
                ),
              ],
            ),
          )
        },
        if (other2BedRoom == true) ...{
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            color: Colors.grey,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Other 2 BedRoom ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: width * 1,
                  color: color3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                  setState(() {
                                    other2Length = value;
                                    print(other2Length);
                                  });
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
                                  setState(() {
                                    other2Width = value;
                                    print(other2Width);
                                  });
                                },
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                                    value: selectedFloorOther2,
                                    elevation: 16,
                                    items: floorItemsOther2
                                        .map((it) => DropdownMenuItem<String>(
                                            value: it,
                                            child: Text(
                                              it,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )))
                                        .toList(),
                                    onChanged: (it) => setState(
                                        () => selectedFloorOther2 = it!)),
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
                                  setState(() {
                                    other2ToiletLength = value;
                                    print(other2ToiletLength);
                                  });
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
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    other2ToiletWidth = value;
                                    print(other2ToiletWidth);
                                  });
                                },
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                other2ToiletFacility = value;
                              });
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
                                            value: other2RequiredDress,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  other2RequiredDress = value;
                                                  other2NotRequiredDress =
                                                      false;
                                                },
                                              );
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
                                            value: other2NotRequiredDress,
                                            onChanged: (value) {
                                              setState(() {
                                                other2NotRequiredDress = value;
                                                other2RequiredDress = false;
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
                      if (other2RequiredDress == true) ...[
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other2DressLength = value;
                                      print(other2DressLength);
                                    });
                                  },
                                  onFieldSubmitted: (value) {},
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other2DressWidth = value;
                                      print(other2DressWidth);
                                    });
                                  },
                                  onFieldSubmitted: (value) {},
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                            SizedBox(
                              width: width * 0.1,
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
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: requirementText("Dress Facility"),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText: "more",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other2DressFacility = value;
                                      print(other2DressFacility);
                                    });
                                  },
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
                        child: requirementText("Room Facility"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                other2RoomFacility = value;
                                print(other2RoomFacility);
                              });
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
                    ],
                  ),
                ),
              ],
            ),
          )
        },
        if (other3BedRoom == true) ...{
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            color: Colors.grey,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Other 3 BedRoom Details',
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
                                  setState(() {
                                    other3Length = value;
                                    print(other3Length);
                                  });
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
                                  setState(() {
                                    other3Width = value;
                                    print(other3Width);
                                  });
                                },
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                                    value: selectedFloorOther3,
                                    elevation: 16,
                                    items: floorItemsOther3
                                        .map((it) => DropdownMenuItem<String>(
                                            value: it,
                                            child: Text(
                                              it,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )))
                                        .toList(),
                                    onChanged: (it) => setState(
                                        () => selectedFloorOther3 = it!)),
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
                                  setState(() {
                                    other3ToiletLength = value;
                                    print(other3ToiletLength);
                                  });
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
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    other3ToiletWidth = value;
                                    print(other3ToiletWidth);
                                  });
                                },
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.1,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                other3ToiletFacility = value;
                              });
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
                                            value: other3RequiredDress,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  other3RequiredDress = value;
                                                  other3NotRequiredDress =
                                                      false;
                                                },
                                              );
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
                                            value: other3NotRequiredDress,
                                            onChanged: (value) {
                                              setState(() {
                                                other3NotRequiredDress = value;
                                                other3RequiredDress = false;
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
                      if (other3RequiredDress == true) ...[
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other3DressLength = value;
                                      print(other3DressLength);
                                    });
                                  },
                                  onFieldSubmitted: (value) {},
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
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other3DressWidth = value;
                                      print(other3DressWidth);
                                    });
                                  },
                                  onFieldSubmitted: (value) {},
                                ),
                              ),
                            ),
                            valueContainer(height, width, size, 0.04, 0.05),
                            SizedBox(
                              width: width * 0.1,
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
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: requirementText("Dress Facility"),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: height * 0.04,
                                width: width,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText: "more",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      other3DressFacility = value;
                                      print(other3DressFacility);
                                    });
                                  },
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
                        child: requirementText("Room Facility"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                              setState(() {
                                other3RoomFacility = value;
                                print(other3RoomFacility);
                              });
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
          )
        },
        SizedBox(
          height: height * 0.01,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: InkWell(
            onTap: () {
              List<Bedtypes> bedData = [
                Bedtypes(
                  bedroomLength: masterLength.toString(),
                  bedRoomFloor: selectedFloorMaster.toString(),
                  bedRoomWidth: masterWidth.toString(),
                  bedRoomToiletLength: masterToiletLength.toString(),
                  bedRoomToiletWidth: masterToiletWidth.toString(),
                  bedRoomToiletFacility: masterToiletFacility.toString(),
                  bedroomDressLength: masterDressLength.toString(),
                  bedroomDressWidth: masterDressWidth.toString(),
                  bedroomDressRequirment: masterDressReq.toString(),
                  bedroomDressFacility: masterDressFacility.toString(),
                  bedroomImg: "",
                  bedroomFacility: masterRoomFacility.toString(),
                ),
                Bedtypes(
                  bedroomLength: sonLength.toString(),
                  bedRoomFloor: selectedFloorSon.toString(),
                  bedRoomWidth: sonWidth.toString(),
                  bedRoomToiletLength: sonToiletLength.toString(),
                  bedRoomToiletWidth: sonToiletWidth.toString(),
                  bedRoomToiletFacility: sonToiletFacility.toString(),
                  bedroomDressLength: sonDressLength.toString(),
                  bedroomDressWidth: sonDressWidth.toString(),
                  bedroomDressRequirment: sonDressReq.toString(),
                  bedroomDressFacility: sonDressFacility.toString(),
                  bedroomImg: "",
                  bedroomFacility: sonRoomFacility.toString(),
                ),
                Bedtypes(
                  bedroomLength: daughterLength.toString(),
                  bedRoomFloor: selectedFloorDaughter.toString(),
                  bedRoomWidth: daughterWidth.toString(),
                  bedRoomToiletLength: daughterToiletLength.toString(),
                  bedRoomToiletWidth: daughterToiletWidth.toString(),
                  bedRoomToiletFacility: daughterToiletFacility.toString(),
                  bedroomDressLength: daughterDressLength.toString(),
                  bedroomDressWidth: daughterDressWidth.toString(),
                  bedroomDressRequirment: daughterDressReq.toString(),
                  bedroomDressFacility: daughterDressFacility.toString(),
                  bedroomImg: "",
                  bedroomFacility: daughterRoomFacility.toString(),
                ),
                Bedtypes(
                  bedroomLength: parentLength.toString(),
                  bedRoomFloor: selectedFloor.toString(),
                  bedRoomWidth: parentWidth.toString(),
                  bedRoomToiletLength: parentToiletLength.toString(),
                  bedRoomToiletWidth: parentToiletWidth.toString(),
                  bedRoomToiletFacility: parentToiletFacility.toString(),
                  bedroomDressLength: parentDressLength.toString(),
                  bedroomDressWidth: parentDressWidth.toString(),
                  bedroomDressRequirment: parentDressReq.toString(),
                  bedroomDressFacility: parentDressFacility.toString(),
                  bedroomImg: "",
                  bedroomFacility: parentRoomFacility.toString(),
                ),
                Bedtypes(
                  bedroomLength: guestLength.toString(),
                  bedRoomFloor: selectedFloorGuest.toString(),
                  bedRoomWidth: guestWidth.toString(),
                  bedRoomToiletLength: guestToiletLength.toString(),
                  bedRoomToiletWidth: guestToiletWidth.toString(),
                  bedRoomToiletFacility: guestToiletFacility.toString(),
                  bedroomDressLength: guestDressLength.toString(),
                  bedroomDressWidth: guestDressWidth.toString(),
                  bedroomDressRequirment: guestDressReq.toString(),
                  bedroomDressFacility: guestDressFacility.toString(),
                  bedroomImg: "",
                  bedroomFacility: guestRoomFacility.toString(),
                ),
                Bedtypes(
                  bedroomLength: other2Length.toString(),
                  bedRoomFloor: selectedFloorOther2.toString(),
                  bedRoomWidth: other2Width.toString(),
                  bedRoomToiletLength: other2ToiletLength.toString(),
                  bedRoomToiletWidth: other2ToiletWidth.toString(),
                  bedRoomToiletFacility: other2ToiletFacility.toString(),
                  bedroomDressLength: other2DressLength.toString(),
                  bedroomDressWidth: other2DressWidth.toString(),
                  bedroomDressRequirment: other2DressReq.toString(),
                  bedroomDressFacility: other2DressFacility.toString(),
                  bedroomImg: "",
                  bedroomFacility: other2RoomFacility.toString(),
                ),
                Bedtypes(
                  bedroomLength: other2Length.toString(),
                  bedRoomFloor: selectedFloorOther2.toString(),
                  bedRoomWidth: other2Width.toString(),
                  bedRoomToiletLength: masterToiletLength.toString(),
                  bedRoomToiletWidth: other2ToiletWidth.toString(),
                  bedRoomToiletFacility: other2ToiletFacility.toString(),
                  bedroomDressLength: other2DressLength.toString(),
                  bedroomDressWidth: other2DressWidth.toString(),
                  bedroomDressRequirment: other2DressReq.toString(),
                  bedroomDressFacility: other2DressFacility.toString(),
                  bedroomImg: "",
                  bedroomFacility: other2RoomFacility.toString(),
                ),
                Bedtypes(
                  bedroomLength: other3Length.toString(),
                  bedRoomFloor: selectedFloorOther3.toString(),
                  bedRoomWidth: other3Width.toString(),
                  bedRoomToiletLength: other3ToiletLength.toString(),
                  bedRoomToiletWidth: other3ToiletWidth.toString(),
                  bedRoomToiletFacility: other3ToiletFacility.toString(),
                  bedroomDressLength: other3DressLength.toString(),
                  bedroomDressWidth: other3DressWidth.toString(),
                  bedroomDressRequirment: other3DressReq.toString(),
                  bedroomDressFacility: other3DressFacility.toString(),
                  bedroomImg: "",
                  bedroomFacility: other3RoomFacility.toString(),
                ),
              ];

              List jsonUser = [];
              for (int i = 0; i < bedData.length; i++) {
                jsonUser.add(jsonEncode(bedData[i]));
              }
              // print(masterLength);
              // print(jsonUser);
              print(_values);
              // print(_values[0]["bedroom_length"]);
            },
            child: Container(
              height: height * 0.04,
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
