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
  int? mi;
  int? si;
  int? di;
  int? pi;
  int? gi;
  int? o1i;
  int? o2i;
  int? o3i;

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
    getData();
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

  List<String>? masterRFac;
  List<String>? masterDFac;

  List<String>? sonRFac;
  List<String>? sonDFac;

  List<String>? daughterRFac;
  List<String>? daughterDFac;

  List<String>? guestRFac;
  List<String>? guestDFac;

  List<String>? parentRFac;
  List<String>? parentDFac;

  List<String>? other1RFac;
  List<String>? other1DFac;

  List<String>? other2DFac;
  List<String>? other2RFac;

  List<String>? other3RFac;
  List<String>? other3DFac;

  var printData;
  int project_id = 179;

  Future<void> getData() async {
    try {
      var response = await http.get(
        Uri.parse(
          "http://192.168.0.99:8080/sdplserver/api/edit-bungalow-bedroom/$project_id",
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(
          () {
            // if (jsonResponse != null) {
            //   print(mi);
            //   mi = int.parse(
            //       jsonResponse['bungalow_bedroom']['bedroom'].toString());

            //   print(mi);
            //   print(si);

            //   si = int.parse(printData['bedroom'].toString());

            //   print(si);
            //   print(di);

            //   di = int.parse(printData['bedroom'].toString());

            //   print(di);

            //   pi = int.parse(printData['bedroom'].toString());

            //   gi = int.parse(printData['bedroom'].toString());

            //   o1i = int.parse(printData['bedroom'].toString());

            //   o2i = int.parse(printData['bedroom'].toString());

            //   o3i = int.parse(printData['bedroom'].toString());
            // }

            //printData = jsonResponse
            printData = jsonResponse["bungalow_bedroom"];

            // if (printData != null) {
            //   print(mi);

            //   mi = printData.asMap().containsKey(0)
            //       ? int.parse(
            //           jsonResponse['bungalow_bedroom']['bedroom'].toString())
            //       : null;

            //   print(mi);
            //   print(si);

            //   si = printData.asMap().containsKey(1)
            //       ? int.parse(printData['bedroom'].toString())
            //       : null;

            //   print(si);
            //   print(di);

            //   di = printData.asMap().containsKey(2)
            //       ? int.parse(printData['bedroom'].toString())
            //       : null;

            //   print(di);

            //   pi = printData.asMap().containsKey(3)
            //       ? int.parse(printData['bedroom'].toString())
            //       : null;

            //   gi = printData.asMap().containsKey(4)
            //       ? int.parse(printData['bedroom'].toString())
            //       : null;

            //   o1i = printData.asMap().containsKey(5)
            //       ? int.parse(printData['bedroom'].toString())
            //       : null;

            //   o2i = printData.asMap().containsKey(6)
            //       ? int.parse(printData['bedroom'].toString())
            //       : null;

            //   o3i = printData.asMap().containsKey(7)
            //       ? int.parse(printData['bedroom'].toString())
            //       : null;
            // }

            print(printData);
            print('first Index ${printData[0]}');

            if (printData.asMap().containsKey(0)) {
              masterLength = printData[0]['bedroom_length'] != null
                  ? int.parse(printData[0]['bedroom_length'].toString())
                  : 0;
              masterWidth = printData[0]['bedroom_width'] != null
                  ? int.parse(printData[0]['bedroom_width'].toString())
                  : 0;
              masterToiletLength = printData[0]['bedroom_toilet_length'] != null
                  ? int.parse(printData[0]['bedroom_toilet_length'].toString())
                  : 0;
              masterToiletWidth = printData[0]['bedroom_toilet_width'] != null
                  ? int.parse(printData[0]['bedroom_toilet_width'].toString())
                  : 0;
              masterDressLength = printData[0]['bedroom_dress_length'] != null
                  ? int.parse(printData[0]['bedroom_dress_length'].toString())
                  : 0;
              masterLocation = printData[0]['bedroom_floor'] != null
                  ? int.parse(printData[0]['bedroom_floor'].toString())
                  : 0;
              masterDressWidth = printData[0]['bedroom_dress_width'] != null
                  ? int.parse(printData[0]['bedroom_dress_width'].toString())
                  : 0;
              masterDressInt = printData[0]['bedroom_dress_req'] != null
                  ? int.parse(printData[0]['bedroom_dress_req'].toString())
                  : 0;
              masterToiletFacility =
                  printData[0]['bedroom_toilet_req_text'] != null
                      ? printData[0]['bedroom_toilet_req_text'].toString()
                      : " ";
              masterDresstext = printData[0]['bedroom_dress_req_text'] != null
                  ? printData[0]['bedroom_dress_req_text'].toString()
                  : " ";
              masterOtherRequirement =
                  printData[0]['bedroom_facility_req_text'] != null
                      ? printData[0]['bedroom_facility_req_text'].toString()
                      : " ";
              masterDressFacility = printData[0]['bedroom_dress_facility'] !=
                      null
                  ? printData[0]['bedroom_dress_facility'].toString().split(',')
                  : [];
              masterRoomFacility = printData[0]['bedroom_facility'] != null
                  ? printData[0]['bedroom_facility'].toString().split(',')
                  : [];
            }
            if (printData.asMap().containsKey(1)) {
              sonLength = printData[1]['bedroom_length'] != null
                  ? int.parse(printData[1]['bedroom_length'].toString())
                  : 0;
              sonWidth = printData[1]['bedroom_width'] != null
                  ? int.parse(printData[1]['bedroom_width'].toString())
                  : 0;
              sonToiletLength = printData[1]['bedroom_toilet_length'] != null
                  ? int.parse(printData[1]['bedroom_toilet_length'].toString())
                  : 0;
              sonToiletWidth = printData[1]['bedroom_toilet_width'] != null
                  ? int.parse(printData[1]['bedroom_toilet_width'].toString())
                  : 0;
              sonDressLength = printData[1]['bedroom_dress_length'] != null
                  ? int.parse(printData[1]['bedroom_dress_length'].toString())
                  : 0;
              sonLocation = printData[1]['bedroom_floor'] != null
                  ? int.parse(printData[1]['bedroom_floor'].toString())
                  : 0;
              sonDressWidth = printData[1]['bedroom_dress_width'] != null
                  ? int.parse(printData[1]['bedroom_dress_width'].toString())
                  : 0;
              sonDressInt = printData[1]['bedroom_dress_req'] != null
                  ? int.parse(printData[1]['bedroom_dress_req'].toString())
                  : 0;
              sonToiletFacility =
                  printData[1]['bedroom_toilet_req_text'] != null
                      ? printData[1]['bedroom_toilet_req_text'].toString()
                      : " ";
              sonDresstext = printData[1]['bedroom_dress_req_text'] != null
                  ? printData[1]['bedroom_dress_req_text'].toString()
                  : " ";
              sonOtherRequirement =
                  printData[1]['bedroom_facility_req_text'] != null
                      ? printData[1]['bedroom_facility_req_text'].toString()
                      : " ";
              sonDressFacility = printData[1]['bedroom_dress_facility'] != null
                  ? printData[1]['bedroom_dress_facility'].toString().split(',')
                  : [];
              sonRoomFacility = printData[1]['bedroom_facility'] != null
                  ? printData[1]['bedroom_facility'].toString().split(',')
                  : [];
            }
            if (printData.asMap().containsKey(2)) {
              daughterLength = printData[2]['bedroom_length'] != null
                  ? int.parse(printData[2]['bedroom_length'].toString())
                  : 0;
              daughterWidth = printData[2]['bedroom_width'] != null
                  ? int.parse(printData[2]['bedroom_width'].toString())
                  : 0;
              daughterToiletLength = printData[2]['bedroom_toilet_length'] !=
                      null
                  ? int.parse(printData[2]['bedroom_toilet_length'].toString())
                  : 0;
              daughterToiletWidth = printData[2]['bedroom_toilet_width'] != null
                  ? int.parse(printData[2]['bedroom_toilet_width'].toString())
                  : 0;
              daughterDressLength = printData[2]['bedroom_dress_length'] != null
                  ? int.parse(printData[2]['bedroom_dress_length'].toString())
                  : 0;
              daughterLocation = printData[2]['bedroom_floor'] != null
                  ? int.parse(printData[2]['bedroom_floor'].toString())
                  : 0;
              daughterDressWidth = printData[2]['bedroom_dress_width'] != null
                  ? int.parse(printData[2]['bedroom_dress_width'].toString())
                  : 0;
              daughterDressInt = printData[2]['bedroom_dress_req'] != null
                  ? int.parse(printData[2]['bedroom_dress_req'].toString())
                  : 0;
              daughterToiletFacility =
                  printData[2]['bedroom_toilet_req_text'] != null
                      ? printData[2]['bedroom_toilet_req_text'].toString()
                      : " ";
              daughterDresstext = printData[2]['bedroom_dress_req_text'] != null
                  ? printData[2]['bedroom_dress_req_text'].toString()
                  : " ";
              daughterOtherRequirement =
                  printData[2]['bedroom_facility_req_text'] != null
                      ? printData[2]['bedroom_facility_req_text'].toString()
                      : " ";
              daughterDressFacility = printData[2]['bedroom_dress_facility'] !=
                      null
                  ? printData[2]['bedroom_dress_facility'].toString().split(',')
                  : [];
              daughterRoomFacility = printData[2]['bedroom_facility'] != null
                  ? printData[2]['bedroom_facility'].toString().split(',')
                  : [];
            }
            if (printData.asMap().containsKey(3)) {
              parentLength = printData[3]['bedroom_length'] != null
                  ? int.parse(printData[3]['bedroom_length'].toString())
                  : 0;
              parentWidth = printData[3]['bedroom_width'] != null
                  ? int.parse(printData[3]['bedroom_width'].toString())
                  : 0;
              parentToiletLength = printData[3]['bedroom_toilet_length'] != null
                  ? int.parse(printData[3]['bedroom_toilet_length'].toString())
                  : 0;
              parentToiletWidth = printData[3]['bedroom_toilet_width'] != null
                  ? int.parse(printData[3]['bedroom_toilet_width'].toString())
                  : 0;
              parentDressLength = printData[3]['bedroom_dress_length'] != null
                  ? int.parse(printData[3]['bedroom_dress_length'].toString())
                  : 0;
              parentLocation = printData[3]['bedroom_floor'] != null
                  ? int.parse(printData[3]['bedroom_floor'].toString())
                  : 0;
              parentDressWidth = printData[3]['bedroom_dress_width'] != null
                  ? int.parse(printData[3]['bedroom_dress_width'].toString())
                  : 0;
              parentDressInt = printData[3]['bedroom_dress_req'] != null
                  ? int.parse(printData[3]['bedroom_dress_req'].toString())
                  : 0;
              parentToiletFacility =
                  printData[3]['bedroom_toilet_req_text'] != null
                      ? printData[3]['bedroom_toilet_req_text'].toString()
                      : " ";
              parentDresstext = printData[3]['bedroom_dress_req_text'] != null
                  ? printData[3]['bedroom_dress_req_text'].toString()
                  : " ";
              parentOtherRequirement =
                  printData[3]['bedroom_facility_req_text'] != null
                      ? printData[3]['bedroom_facility_req_text'].toString()
                      : " ";
              parentDressFacility = printData[3]['bedroom_dress_facility'] !=
                      null
                  ? printData[3]['bedroom_dress_facility'].toString().split(',')
                  : [];
              parentRoomFacility = printData[3]['bedroom_facility'] != null
                  ? printData[3]['bedroom_facility'].toString().split(',')
                  : [];
            }
            if (printData.asMap().containsKey(4)) {
              guestLength = printData[4]['bedroom_length'] != null
                  ? int.parse(printData[4]['bedroom_length'].toString())
                  : 0;
              guestWidth = printData[4]['bedroom_width'] != null
                  ? int.parse(printData[4]['bedroom_width'].toString())
                  : 0;
              guestToiletLength = printData[4]['bedroom_toilet_length'] != null
                  ? int.parse(printData[4]['bedroom_toilet_length'].toString())
                  : 0;
              guestToiletWidth = printData[4]['bedroom_toilet_width'] != null
                  ? int.parse(printData[4]['bedroom_toilet_width'].toString())
                  : 0;
              guestDressLength = printData[4]['bedroom_dress_length'] != null
                  ? int.parse(printData[4]['bedroom_dress_length'].toString())
                  : 0;
              guestLocation = printData[4]['bedroom_floor'] != null
                  ? int.parse(printData[4]['bedroom_floor'].toString())
                  : 0;
              guestDressWidth = printData[4]['bedroom_dress_width'] != null
                  ? int.parse(printData[4]['bedroom_dress_width'].toString())
                  : 0;
              guestDressInt = printData[4]['bedroom_dress_req'] != null
                  ? int.parse(printData[4]['bedroom_dress_req'].toString())
                  : 0;
              guestToiletFacility =
                  printData[4]['bedroom_toilet_req_text'] != null
                      ? printData[4]['bedroom_toilet_req_text'].toString()
                      : " ";
              guestDresstext = printData[4]['bedroom_dress_req_text'] != null
                  ? printData[4]['bedroom_dress_req_text'].toString()
                  : " ";
              guestOtherRequirement =
                  printData[4]['bedroom_facility_req_text'] != null
                      ? printData[4]['bedroom_facility_req_text'].toString()
                      : " ";
              guestDressFacility = printData[4]['bedroom_dress_facility'] !=
                      null
                  ? printData[4]['bedroom_dress_facility'].toString().split(',')
                  : [];
              guestRoomFacility = printData[4]['bedroom_facility'] != null
                  ? printData[4]['bedroom_facility'].toString().split(',')
                  : [];
            }
            if (printData.asMap().containsKey(5)) {
              other1Length = printData[5]['bedroom_length'] != null
                  ? int.parse(printData[5]['bedroom_length'].toString())
                  : 0;
              other1Width = printData[5]['bedroom_width'] != null
                  ? int.parse(printData[5]['bedroom_width'].toString())
                  : 0;
              other1ToiletLength = printData[5]['bedroom_toilet_length'] != null
                  ? int.parse(printData[5]['bedroom_toilet_length'].toString())
                  : 0;
              other1ToiletWidth = printData[5]['bedroom_toilet_width'] != null
                  ? int.parse(printData[5]['bedroom_toilet_width'].toString())
                  : 0;
              other1DressLength = printData[5]['bedroom_dress_length'] != null
                  ? int.parse(printData[5]['bedroom_dress_length'].toString())
                  : 0;
              other1Location = printData[5]['bedroom_floor'] != null
                  ? int.parse(printData[5]['bedroom_floor'].toString())
                  : 0;
              other1DressWidth = printData[5]['bedroom_dress_width'] != null
                  ? int.parse(printData[5]['bedroom_dress_width'].toString())
                  : 0;
              other1DressInt = printData[5]['bedroom_dress_req'] != null
                  ? int.parse(printData[5]['bedroom_dress_req'].toString())
                  : 0;
              other1ToiletFacility =
                  printData[5]['bedroom_toilet_req_text'] != null
                      ? printData[5]['bedroom_toilet_req_text'].toString()
                      : " ";
              other1Dresstext = printData[5]['bedroom_dress_req_text'] != null
                  ? printData[5]['bedroom_dress_req_text'].toString()
                  : " ";
              other1OtherRequirement =
                  printData[5]['bedroom_facility_req_text'] != null
                      ? printData[5]['bedroom_facility_req_text'].toString()
                      : " ";
              other1DressFacility = printData[5]['bedroom_dress_facility'] !=
                      null
                  ? printData[5]['bedroom_dress_facility'].toString().split(',')
                  : [];
              other1RoomFacility = printData[5]['bedroom_facility'] != null
                  ? printData[5]['bedroom_facility'].toString().split(',')
                  : [];
            }
            if (printData.asMap().containsKey(6)) {
              other2Length = printData[6]['bedroom_length'] != null
                  ? int.parse(printData[6]['bedroom_length'].toString())
                  : 0;
              other2Width = printData[6]['bedroom_width'] != null
                  ? int.parse(printData[6]['bedroom_width'].toString())
                  : 0;
              other2ToiletLength = printData[6]['bedroom_toilet_length'] != null
                  ? int.parse(printData[6]['bedroom_toilet_length'].toString())
                  : 0;
              other2ToiletWidth = printData[6]['bedroom_toilet_width'] != null
                  ? int.parse(printData[6]['bedroom_toilet_width'].toString())
                  : 0;
              other2DressLength = printData[6]['bedroom_dress_length'] != null
                  ? int.parse(printData[6]['bedroom_dress_length'].toString())
                  : 0;
              other2Location = printData[6]['bedroom_floor'] != null
                  ? int.parse(printData[6]['bedroom_floor'].toString())
                  : 0;
              other2DressWidth = printData[6]['bedroom_dress_width'] != null
                  ? int.parse(printData[6]['bedroom_dress_width'].toString())
                  : 0;
              other2DressInt = printData[6]['bedroom_dress_req'] != null
                  ? int.parse(printData[6]['bedroom_dress_req'].toString())
                  : 0;
              other2ToiletFacility =
                  printData[6]['bedroom_toilet_req_text'] != null
                      ? printData[6]['bedroom_toilet_req_text'].toString()
                      : " ";
              other2Dresstext = printData[6]['bedroom_dress_req_text'] != null
                  ? printData[6]['bedroom_dress_req_text'].toString()
                  : " ";
              other2OtherRequirement =
                  printData[6]['bedroom_facility_req_text'] != null
                      ? printData[6]['bedroom_facility_req_text'].toString()
                      : " ";
              other2DressFacility = printData[6]['bedroom_dress_facility'] !=
                      null
                  ? printData[6]['bedroom_dress_facility'].toString().split(',')
                  : [];
              other2RoomFacility = printData[6]['bedroom_facility'] != null
                  ? printData[6]['bedroom_facility'].toString().split(',')
                  : [];
            }
            if (printData.asMap().containsKey(7)) {
              other3Length = printData[7]['bedroom_length'] != null
                  ? int.parse(printData[7]['bedroom_length'].toString())
                  : 0;
              other3Width = printData[7]['bedroom_width'] != null
                  ? int.parse(printData[7]['bedroom_width'].toString())
                  : 0;
              other3ToiletLength = printData[7]['bedroom_toilet_length'] != null
                  ? int.parse(printData[7]['bedroom_toilet_length'].toString())
                  : 0;
              other3ToiletWidth = printData[7]['bedroom_toilet_width'] != null
                  ? int.parse(printData[7]['bedroom_toilet_width'].toString())
                  : 0;
              other3DressLength = printData[7]['bedroom_dress_length'] != null
                  ? int.parse(printData[7]['bedroom_dress_length'].toString())
                  : 0;
              other3Location = printData[7]['bedroom_floor'] != null
                  ? int.parse(printData[7]['bedroom_floor'].toString())
                  : 0;
              other3DressWidth = printData[7]['bedroom_dress_width'] != null
                  ? int.parse(printData[7]['bedroom_dress_width'].toString())
                  : 0;
              other3DressInt = printData[7]['bedroom_dress_req'] != null
                  ? int.parse(printData[7]['bedroom_dress_req'].toString())
                  : 0;
              other3ToiletFacility =
                  printData[7]['bedroom_toilet_req_text'] != null
                      ? printData[7]['bedroom_toilet_req_text'].toString()
                      : " ";
              other3Dresstext = printData[7]['bedroom_dress_req_text'] != null
                  ? printData[7]['bedroom_dress_req_text'].toString()
                  : " ";
              other3OtherRequirement =
                  printData[7]['bedroom_facility_req_text'] != null
                      ? printData[7]['bedroom_facility_req_text'].toString()
                      : " ";
              other3DressFacility = printData[7]['bedroom_dress_facility'] !=
                      null
                  ? printData[7]['bedroom_dress_facility'].toString().split(',')
                  : [];
              other3RoomFacility = printData[7]['bedroom_facility'] != null
                  ? printData[7]['bedroom_facility'].toString().split(',')
                  : [];
            }

            if (printData != null) {
              if (printData[0]['bedroom_facility'] != null) {
                masterRFac = printData[0]['bedroom_facility'] != null
                    ? printData[0]['bedroom_facility'].toString().split(',')
                    : [];
              }

              if (printData[0]['bedroom_dress_facility'] != null) {
                masterDFac = printData[0]['bedroom_dress_facility'] != null
                    ? printData[0]['bedroom_dress_facility']
                        .toString()
                        .split(',')
                    : [];
              }

              if (printData[1] != null) {
                if (printData[1]['bedroom_facility'] != null) {
                  sonRFac = printData[1]['bedroom_facility'] != null
                      ? printData[1]['bedroom_facility'].toString().split(',')
                      : [];
                }
                if (printData[1]['bedroom_dress_facility'] != null) {
                  sonDFac = printData[1]['bedroom_facility'] != null
                      ? printData[1]['bedroom_dress_facility']
                          .toString()
                          .split(',')
                      : [];
                }
              }

              if (printData[2] != null) {
                if (printData[2]['bedroom_facility'] != null) {
                  daughterRFac = printData[2]['bedroom_facility'].split(',');
                }
                if (printData[2]['bedroom_dress_facility'] != null) {
                  daughterDFac =
                      printData[2]['bedroom_dress_facility'].split(',');
                }
              }

              if (printData[3] != null) {
                if (printData[3]['bedroom_facility'] != null) {
                  parentRFac = printData[3]['bedroom_facility'].split(',');
                }
                if (printData[3]['bedroom_dress_facility'] != null) {
                  parentDFac =
                      printData[3]['bedroom_dress_facility'].split(',');
                }
              }

              if (printData[4] != null) {
                if (printData[4]['bedroom_facility'] != null) {
                  guestRFac = printData[4]['bedroom_facility'].split(',');
                }
                if (printData[4]['bedroom_dress_facility'] != null) {
                  guestDFac = printData[4]['bedroom_dress_facility'].split(',');
                }
              }

              if (printData[5] != null) {
                if (printData[5]['bedroom_facility'] != null) {
                  other1RFac = printData[5]['bedroom_facility'].split(',');
                }
                if (printData[5]['bedroom_dress_facility'] != null) {
                  other1DFac =
                      printData[5]['bedroom_dress_facility'].split(',');
                }
              }

              if (printData[6] != null) {
                if (printData[6]['bedroom_facility'] != null) {
                  other2RFac = printData[6]['bedroom_facility'].split(',');
                }
                if (printData[6]['bedroom_dress_facility'] != null) {
                  other2DFac =
                      printData[6]['bedroom_dress_facility'].split(',');
                }
              }

              if (printData[7] != null) {
                if (printData[7]['bedroom_facility'] != null) {
                  other3RFac = printData[7]['bedroom_facility'].split(',');
                }
                if (printData[7]['bedroom_dress_facility'] != null) {
                  other3DFac =
                      printData[7]['bedroom_dress_facility'].split(',');
                }
              }
            }
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<Map<String, dynamic>> _values = [];

  int? masterLength;
  int? masterWidth;
  int? masterLocation = 0;
  int? masterToiletLength;
  int? masterToiletWidth;
  String? masterToiletFacility = ' ';
  int? masterDressInt = 0;
  int? masterDressLength;
  int? masterDressWidth;
  var masterDressFacility = [];
  var masterRoomFacility = [];
  String? masterOtherRequirement;
  String? masterDresstext = '';

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

    // print(printData[0]['bedroom_toilet_req_text']);

    print(masterToiletFacility);

    // print(printData[1]['bedroom_facility']);

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
                                          value: printData
                                                  .asMap()
                                                  .containsKey(0)
                                              ? printData[0]['bedroom'] == '1'
                                                  ? true
                                                  : masterBedroom
                                              : masterBedroom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                masterBedroom = value!;
                                                if (printData
                                                    .asMap()
                                                    .containsKey(0)) {
                                                  if (masterBedroom == true) {
                                                    printData[0]['bedroom'] =
                                                        "1";
                                                  } else if (masterBedroom ==
                                                      false) {
                                                    printData[0]['bedroom'] =
                                                        "10";
                                                  }
                                                }

                                                // if (masterBedroom == true) {
                                                //   masterState = false;
                                                // }
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
                                        value: printData.asMap().containsKey(1)
                                            ? printData[1]['bedroom'] == '2'
                                                ? true
                                                : sonBedRoom
                                            : sonBedRoom,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              sonBedRoom = value!;
                                              print(sonBedRoom);
                                              if (printData
                                                  .asMap()
                                                  .containsKey(2)) {
                                                if (sonBedRoom == true) {
                                                  printData[1]['bedroom'] = "2";
                                                } else if (sonBedRoom ==
                                                    false) {
                                                  printData[1]['bedroom'] =
                                                      "10";
                                                }
                                              }
                                            },
                                          );
                                        },
                                      ),
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
                                          value: printData
                                                  .asMap()
                                                  .containsKey(2)
                                              ? printData[2]['bedroom'] == '3'
                                                  ? true
                                                  : daughterBedRoom
                                              : daughterBedRoom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                daughterBedRoom = value!;
                                                if (printData
                                                    .asMap()
                                                    .containsKey(2)) {
                                                  if (daughterBedRoom == true) {
                                                    printData[2]['bedroom'] =
                                                        "3";
                                                  } else if (daughterBedRoom ==
                                                      false) {
                                                    printData[2]['bedroom'] =
                                                        "10";
                                                  }
                                                }
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
                                          value: printData
                                                  .asMap()
                                                  .containsKey(3)
                                              ? printData[3]['bedroom'] == '4'
                                                  ? true
                                                  : parentBedRoom
                                              : parentBedRoom,
                                          onChanged: (value) {
                                            setState(() {
                                              parentBedRoom = value!;
                                              if (printData
                                                  .asMap()
                                                  .containsKey(3)) {
                                                if (parentBedRoom == true) {
                                                  printData[3]['bedroom'] = "4";
                                                } else if (parentBedRoom ==
                                                    false) {
                                                  printData[3]['bedroom'] =
                                                      "10";
                                                }
                                              }
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
                                          value: printData
                                                  .asMap()
                                                  .containsKey(4)
                                              ? printData[4]['bedroom'] == '5'
                                                  ? true
                                                  : guestBedRoom
                                              : guestBedRoom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                guestBedRoom = value!;
                                                if (printData
                                                    .asMap()
                                                    .containsKey(4)) {
                                                  guestBedRoom = value;

                                                  if (guestBedRoom == true) {
                                                    printData[4]['bedroom'] =
                                                        "5";
                                                  } else if (guestBedRoom ==
                                                      false) {
                                                    printData[4]['bedroom'] =
                                                        "10";
                                                  }
                                                }
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
                                          value: printData
                                                  .asMap()
                                                  .containsKey(5)
                                              ? printData[5]['bedroom'] == '6'
                                                  ? true
                                                  : other1BedRoom
                                              : other1BedRoom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                other1BedRoom = value!;

                                                if (printData
                                                    .asMap()
                                                    .containsKey(5)) {
                                                  other1BedRoom = value;

                                                  if (other1BedRoom == true) {
                                                    printData[5]['bedroom'] =
                                                        "6";
                                                  } else if (other1BedRoom ==
                                                      false) {
                                                    printData[5]['bedroom'] =
                                                        "10";
                                                  }
                                                }
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
                                          value: printData
                                                  .asMap()
                                                  .containsKey(6)
                                              ? printData[6]['bedroom'] == '7'
                                                  ? true
                                                  : other2BedRoom
                                              : other2BedRoom,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                other2BedRoom = value!;

                                                if (printData
                                                    .asMap()
                                                    .containsKey(6)) {
                                                  if (other2BedRoom == true) {
                                                    printData[6]['bedroom'] =
                                                        "7";
                                                  } else if (other2BedRoom ==
                                                      false) {
                                                    printData[6]['bedroom'] =
                                                        "10";
                                                  }
                                                }
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
                                          value: printData
                                                  .asMap()
                                                  .containsKey(7)
                                              ? printData[7]['bedroom'] == '8'
                                                  ? true
                                                  : other3BedRoom
                                              : other3BedRoom,
                                          onChanged: (value) {
                                            setState(() {
                                              other3BedRoom = value!;
                                              if (printData
                                                  .asMap()
                                                  .containsKey(7)) {
                                                if (other3BedRoom == true) {
                                                  printData[7]['bedroom'] = "8";
                                                } else if (other3BedRoom ==
                                                    false) {
                                                  printData[7]['bedroom'] =
                                                      "10";
                                                }
                                              }
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
                  if (masterBedroom == true || printData.asMap().containsKey(1)
                      ? printData[0]['bedroom'] == "1"
                      : masterBedroom) ...[
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
                            padding: const EdgeInsets.all(10),
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
                                          initialValue: printData[0]
                                                      ['bedroom_length'] !=
                                                  null
                                              ? printData[0]['bedroom_length']
                                              : null,
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
                                          onChanged: (text) {
                                            setState(
                                              () {
                                                masterLength =
                                                    int.parse(text.toString());
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
                                          initialValue: printData[0]
                                              ['bedroom_width'],
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
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(),
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
                                            hint: printData[0]
                                                        ['bedroom_floor'] !=
                                                    null
                                                ? Text(floorItems[printData[0]
                                                    ['bedroom_floor']])
                                                : Text(selectedFloor!),
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
                                                    printData[0]
                                                            ['bedroom_floor'] =
                                                        null;

                                                    masterLocation = 0;
                                                  }
                                                  if (selectedFloor ==
                                                      "1st Floor") {
                                                    printData[0]
                                                            ['bedroom_floor'] =
                                                        null;
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
                                          initialValue: printData[0]
                                              ['bedroom_toilet_length'],
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
                                          initialValue: printData[0]
                                              ['bedroom_toilet_width'],
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
                                      height,
                                      width,
                                      size,
                                      0.04,
                                      0.05,
                                    ),
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
                                      initialValue: printData[0]
                                          ['bedroom_toilet_req_text'],
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
                                                      value: printData[0][
                                                                  'bedroom_dress_req'] ==
                                                              1
                                                          ? true
                                                          : masterRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          printData[0][
                                                              'bedroom_dress_req'] = 4;
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
                                                    value: printData[0][
                                                                'bedroom_dress_req'] ==
                                                            0
                                                        ? true
                                                        : masterNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          masterNotRequiredDress =
                                                              value;
                                                          masterRequiredDress =
                                                              false;
                                                          printData[0][
                                                              'bedroom_dress_req'] = 4;
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
                                            initialValue: printData[0]
                                                ['bedroom_dress_length'],
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "length",
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
                                            initialValue: printData[0]
                                                ['bedroom_dress_width'],
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
                                          child: Column(children: [
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
                                                  printData[0][
                                                          'bedroom_dress_facility'] =
                                                      null;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text("Office Facility"),
                                              ),
                                            ),
                                            if (printData[0][
                                                    'bedroom_dress_facility'] !=
                                                null) ...[
                                              for (int i = 0;
                                                  i < sonDFac!.length;
                                                  i++)
                                                Wrap(children: [
                                                  Chip(
                                                    label: Text(
                                                        sonDFac![i].toString()),
                                                  )
                                                ])
                                            ],
                                            if (printData[0][
                                                    'bedroom_dress_facility'] ==
                                                null) ...[
                                              Wrap(
                                                children: masterDressFacility
                                                    .map((e) => Chip(
                                                          label: Text(e),
                                                        ))
                                                    .toList(),
                                              )
                                            ]
                                          ]),
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
                                              initialValue: printData[0]
                                                  ['bedroom_dress_req_text'],
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
                                              printData[0]['bedroom_facility'] =
                                                  null;
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
                                        if (printData
                                            .asMap()
                                            .containsKey(1)) ...[
                                          if (printData[0]
                                                  ['bedroom_facility'] !=
                                              null) ...[
                                            for (int i = 0;
                                                i < masterRFac!.length;
                                                i++)
                                              Wrap(children: [
                                                Chip(
                                                  label: Text(masterRFac![i]
                                                      .toString()),
                                                )
                                              ])
                                          ],
                                        ],
                                        if (printData[0]['bedroom_facility'] ==
                                            null) ...[
                                          Wrap(
                                            children: masterRoomFacility
                                                .map((e) => Chip(
                                                      label: Text(e),
                                                    ))
                                                .toList(),
                                          )
                                        ]
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
                                      initialValue: printData[0]
                                          ['bedroom_facility_req_text'],
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
                  if ((sonBedRoom == true) || printData.asMap().containsKey(1)
                      ? printData[1]['bedroom'] == "2"
                      : sonBedRoom == true) ...[
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      color: Colors.grey,
                      child: ExpansionTile(
                        maintainState: true,
                        title: const Text(
                          'Son\'s BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
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
                                          initialValue: printData
                                                  .asMap()
                                                  .containsKey(1)
                                              ? printData[1]['bedroom_length']
                                              : '',
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
                                          initialValue: printData
                                                  .asMap()
                                                  .containsKey(1)
                                              ? printData[1]['bedroom_width']
                                              : '',
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
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(),
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
                                            hint: printData
                                                    .asMap()
                                                    .containsKey(1)
                                                ? Text(floorItems[printData[1]
                                                    ['bedroom_floor']])
                                                : Text(selectedFloorSon!),
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
                                                  if (printData
                                                      .asMap()
                                                      .containsKey(1)) {
                                                    printData[1]
                                                            ['bedroom_floor'] =
                                                        null;
                                                  }
                                                  selectedFloorSon = it;
                                                  print(selectedFloorSon);
                                                  if (selectedFloor ==
                                                      "Ground Floor") {
                                                    sonLocation = 0;
                                                  }
                                                  if (selectedFloorSon ==
                                                      "1st Floor") {
                                                    sonLocation = 1;
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
                                          initialValue:
                                              printData.asMap().containsKey(1)
                                                  ? printData[1]
                                                      ['bedroom_toilet_length']
                                                  : '',
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
                                          initialValue:
                                              printData.asMap().containsKey(1)
                                                  ? printData[1]
                                                      ['bedroom_toilet_width']
                                                  : "",
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
                                      height,
                                      width,
                                      size,
                                      0.04,
                                      0.05,
                                    ),
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
                                      initialValue:
                                          printData.asMap().containsKey(1)
                                              ? printData[1]
                                                  ['bedroom_toilet_req_text']
                                              : ' ',
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
                                                      value: printData
                                                              .asMap()
                                                              .containsKey(1)
                                                          ? printData[1][
                                                                      'bedroom_dress_req'] ==
                                                                  1
                                                              ? true
                                                              : sonRequiredDress
                                                          : sonRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          if (printData
                                                              .asMap()
                                                              .containsKey(1)) {
                                                            printData[1][
                                                                'bedroom_dress_req'] = 4;
                                                          }
                                                          sonRequiredDress =
                                                              value;
                                                          masterNotRequiredDress =
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
                                                    value: printData
                                                            .asMap()
                                                            .containsKey(1)
                                                        ? printData[1][
                                                                    'bedroom_dress_req'] ==
                                                                0
                                                            ? true
                                                            : sonNotRequiredDress
                                                        : sonNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          sonNotRequiredDress =
                                                              value;
                                                          sonRequiredDress =
                                                              false;
                                                          if (printData
                                                              .asMap()
                                                              .containsKey(1)) {
                                                            printData[1][
                                                                'bedroom_dress_req'] = 4;
                                                          }
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
                                if (printData.asMap().containsKey(1)
                                    ? printData[1]['bedroom'] == "2"
                                    : sonRequiredDress == true) ...[
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
                                            initialValue:
                                                printData.asMap().containsKey(1)
                                                    ? printData[1]
                                                        ['bedroom_dress_length']
                                                    : '',
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "length",
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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
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
                                            initialValue:
                                                printData.asMap().containsKey(1)
                                                    ? printData[1]
                                                        ['bedroom_dress_width']
                                                    : '',
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
                                            padding: const EdgeInsets.all(5),
                                            constraints: const BoxConstraints(),
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
                                          child: Column(children: [
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
                                                  if (printData
                                                      .asMap()
                                                      .containsKey(1)) {
                                                    printData[1][
                                                            'bedroom_dress_facility'] =
                                                        null;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text("Office Facility"),
                                              ),
                                            ),
                                            if (printData
                                                .asMap()
                                                .containsKey(1)) ...[
                                              for (int i = 0;
                                                  i < masterDFac!.length;
                                                  i++)
                                                Wrap(children: [
                                                  Chip(
                                                    label: Text(masterDFac![i]
                                                        .toString()),
                                                  )
                                                ])
                                            ],
                                            if (printData
                                                    .asMap()
                                                    .containsKey(1) ==
                                                false) ...[
                                              Wrap(
                                                children: sonDressFacility
                                                    .map(
                                                      (e) => Chip(
                                                        label: Text(e),
                                                      ),
                                                    )
                                                    .toList(),
                                              )
                                            ]
                                          ]),
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
                                              initialValue: printData
                                                      .asMap()
                                                      .containsKey(1)
                                                  ? printData[1]
                                                      ['bedroom_dress_req_text']
                                                  : '',
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
                                              if (printData
                                                  .asMap()
                                                  .containsKey(1)) {
                                                printData[1]
                                                    ['bedroom_facility'] = null;
                                              }
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
                                        if (printData.asMap().containsKey(1)
                                        // ? printData[1]['bedroom_facility'] !=
                                        //     null :
                                        ) ...[
                                          for (int i = 0;
                                              i < sonRFac!.length;
                                              i++)
                                            Wrap(children: [
                                              Chip(
                                                label: Text(
                                                    sonRFac![i].toString()),
                                              )
                                            ])
                                        ],
                                        if (printData.asMap().containsKey(1) ==
                                            false) ...[
                                          Wrap(
                                            children: sonRoomFacility
                                                .map((e) => Chip(
                                                      label: Text(e),
                                                    ))
                                                .toList(),
                                          )
                                        ]
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
                                      initialValue:
                                          printData.asMap().containsKey(1)
                                              ? printData[1]
                                                  ['bedroom_facility_req_text']
                                              : '',
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
                  if (daughterBedRoom == true ||
                          printData.asMap().containsKey(2)
                      ? printData[2]['bedroom'] == "3"
                      : daughterBedRoom == true) ...[
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
                            padding: const EdgeInsets.all(10),
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
                                          initialValue: printData[2]
                                              ['bedroom_length'],
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
                                                daughterLength =
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
                                          initialValue: printData[2]
                                              ['bedroom_width'],
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
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(),
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
                                            hint: printData[2]
                                                        ['bedroom_floor'] !=
                                                    null
                                                ? Text(floorItemsDaughter[
                                                    printData[2]
                                                        ['bedroom_floor']])
                                                : Text(selectedFloorSon!),
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
                                                  printData[2]
                                                      ['bedroom_floor'] = null;
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
                                          initialValue: printData[2]
                                              ['bedroom_toilet_length'],
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
                                          initialValue: printData[2]
                                              ['bedroom_toilet_width'],
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
                                      height,
                                      width,
                                      size,
                                      0.04,
                                      0.05,
                                    ),
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
                                      initialValue: printData[2]
                                          ['bedroom_toilet_req_text'],
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
                                                      value: printData[2][
                                                                  'bedroom_dress_req'] ==
                                                              1
                                                          ? true
                                                          : daughterRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          printData[2][
                                                              'bedroom_dress_req'] = 4;
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
                                                    value: printData[2][
                                                                'bedroom_dress_req'] ==
                                                            0
                                                        ? true
                                                        : daughterNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          daughterNotRequiredDress =
                                                              value;
                                                          daughterRequiredDress =
                                                              false;
                                                          printData[2][
                                                              'bedroom_dress_req'] = 4;
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
                                if (sonRequiredDress == true ||
                                    printData[2]['bedroom'] == "1") ...[
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
                                            initialValue: printData[2]
                                                ['bedroom_dress_length'],
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "length",
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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
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
                                            initialValue: printData[2]
                                                ['bedroom_dress_width'],
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
                                            padding: const EdgeInsets.all(5),
                                            constraints: const BoxConstraints(),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(children: [
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
                                                  printData[2][
                                                          'bedroom_dress_facility'] =
                                                      null;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text("Office Facility"),
                                              ),
                                            ),
                                            if (printData[2][
                                                    'bedroom_dress_facility'] !=
                                                null) ...[
                                              for (int i = 0;
                                                  i < daughterDFac!.length;
                                                  i++)
                                                Wrap(children: [
                                                  Chip(
                                                    label: Text(daughterDFac![i]
                                                        .toString()),
                                                  )
                                                ])
                                            ],
                                            if (printData[2][
                                                    'bedroom_dress_facility'] ==
                                                null) ...[
                                              Wrap(
                                                children: daughterDressFacility
                                                    .map(
                                                      (e) => Chip(
                                                        label: Text(e),
                                                      ),
                                                    )
                                                    .toList(),
                                              )
                                            ]
                                          ]),
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
                                              initialValue: printData[2]
                                                  ['bedroom_dress_req_text'],
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
                                              itemCount:
                                                  bunglowPageRecentList.length,
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
                                                    const Duration(
                                                        milliseconds: 800),
                                                viewportFraction: 1,
                                              ),
                                            );
                                          }
                                        },
                                      ),
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
                                              printData[2]['bedroom_facility'] =
                                                  null;
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
                                        if (printData[2]['bedroom_facility'] !=
                                            null) ...[
                                          for (int i = 0;
                                              i < daughterRFac!.length;
                                              i++)
                                            Wrap(children: [
                                              Chip(
                                                label: Text(daughterRFac![i]
                                                    .toString()),
                                              )
                                            ])
                                        ],
                                        if (printData[2]['bedroom_facility'] ==
                                            null) ...[
                                          Wrap(
                                            children: daughterRoomFacility
                                                .map((e) => Chip(
                                                      label: Text(e),
                                                    ))
                                                .toList(),
                                          )
                                        ]
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
                                      initialValue: printData[2]
                                          ['bedroom_facility_req_text'],
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
                  if (parentBedRoom == true || printData.asMap().containsKey(3)
                      ? printData[3]['bedroom'] == "4"
                      : parentBedRoom == true) ...[
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
                            padding: const EdgeInsets.all(10),
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
                                          initialValue: printData[3]
                                              ['bedroom_length'],
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
                                                parentLength =
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
                                          initialValue: printData[3]
                                              ['bedroom_width'],
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
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(),
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
                                            hint: printData[3]
                                                        ['bedroom_floor'] !=
                                                    null
                                                ? Text(floorItemsDaughter[
                                                    printData[3]
                                                        ['bedroom_floor']])
                                                : Text(selectedFloorParent!),
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
                                                  printData[3]
                                                      ['bedroom_floor'] = null;
                                                  selectedFloorParent = it;
                                                  print(selectedFloorParent);
                                                  if (selectedFloorParent ==
                                                      "Ground Floor") {
                                                    parentLocation = 0;
                                                  }
                                                  if (selectedFloorParent ==
                                                      "1st Floor") {
                                                    parentLocation = 1;
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
                                          initialValue: printData[3]
                                              ['bedroom_toilet_length'],
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
                                          initialValue: printData[3]
                                              ['bedroom_toilet_width'],
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
                                      height,
                                      width,
                                      size,
                                      0.04,
                                      0.05,
                                    ),
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
                                      initialValue: printData[3]
                                          ['bedroom_toilet_req_text'],
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
                                                      value: printData[3][
                                                                  'bedroom_dress_req'] ==
                                                              1
                                                          ? true
                                                          : parentsRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          printData[3][
                                                              'bedroom_dress_req'] = 4;
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
                                                    value: printData[3][
                                                                'bedroom_dress_req'] ==
                                                            0
                                                        ? true
                                                        : parentsNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          parentsNotRequiredDress =
                                                              value;
                                                          parentsRequiredDress =
                                                              false;
                                                          printData[3][
                                                              'bedroom_dress_req'] = 4;
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
                                if (parentsRequiredDress == true ||
                                    printData[3]['bedroom'] == "1") ...[
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
                                            initialValue: printData[3]
                                                ['bedroom_dress_length'],
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "length",
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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
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
                                            initialValue: printData[3]
                                                ['bedroom_dress_width'],
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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
                                      SizedBox(
                                        width: width * 0.08,
                                      ),
                                      Row(
                                        children: [
                                          requirementText(
                                            "help",
                                          ),
                                          IconButton(
                                            padding: const EdgeInsets.all(5),
                                            constraints: const BoxConstraints(),
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
                                          padding: const EdgeInsets.symmetric(
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
                                                    printData[3][
                                                            'bedroom_dress_facility'] =
                                                        null;
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
                                              if (printData[3][
                                                      'bedroom_dress_facility'] !=
                                                  null) ...[
                                                for (int i = 0;
                                                    i < parentDFac!.length;
                                                    i++)
                                                  Wrap(children: [
                                                    Chip(
                                                      label: Text(
                                                        parentDFac![i]
                                                            .toString(),
                                                      ),
                                                    )
                                                  ])
                                              ],
                                              if (printData[3][
                                                      'bedroom_dress_facility'] ==
                                                  null) ...[
                                                Wrap(
                                                  children: parentDressFacility
                                                      .map(
                                                        (e) => Chip(
                                                          label: Text(e),
                                                        ),
                                                      )
                                                      .toList(),
                                                )
                                              ]
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
                                              initialValue: printData[3]
                                                  ['bedroom_dress_req_text'],
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
                                              itemCount:
                                                  bunglowPageRecentList.length,
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
                                                    const Duration(
                                                        milliseconds: 800),
                                                viewportFraction: 1,
                                              ),
                                            );
                                          }
                                        },
                                      ),
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

                                            setState(
                                              () {
                                                parentRoomFacility = result;
                                                print(parentDressFacility);
                                                printData[3]
                                                    ['bedroom_facility'] = null;
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("Room Facility"),
                                          ),
                                        ),
                                        if (printData[2]['bedroom_facility'] !=
                                            null) ...[
                                          for (int i = 0;
                                              i < parentRFac!.length;
                                              i++)
                                            Wrap(children: [
                                              Chip(
                                                label: Text(
                                                    parentRFac![i].toString()),
                                              )
                                            ])
                                        ],
                                        if (printData[3]['bedroom_facility'] ==
                                            null) ...[
                                          Wrap(
                                            children: parentRoomFacility
                                                .map((e) => Chip(
                                                      label: Text(e),
                                                    ))
                                                .toList(),
                                          )
                                        ]
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
                                      initialValue: printData[3]
                                          ['bedroom_facility_req_text'],
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
                  if (guestBedRoom == true || printData.asMap().containsKey(4)
                      ? printData[4]['bedroom'] == "5"
                      : guestBedRoom == true) ...[
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
                            padding: const EdgeInsets.all(10),
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
                                          initialValue: printData[4]
                                              ['bedroom_length'],
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
                                                guestLength =
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
                                          initialValue: printData[4]
                                              ['bedroom_width'],
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
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(),
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
                                            hint: printData[4]
                                                        ['bedroom_floor'] !=
                                                    null
                                                ? Text(floorItemsGuest[
                                                    printData[4]
                                                        ['bedroom_floor']])
                                                : Text(selectedFloorGuest!),
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
                                              setState(
                                                () {
                                                  printData[4]
                                                      ['bedroom_floor'] = null;
                                                  selectedFloorGuest = it;
                                                  print(selectedFloorGuest);
                                                  if (selectedFloorGuest ==
                                                      "Ground Floor") {
                                                    guestLocation = 0;
                                                  }
                                                  if (selectedFloorGuest ==
                                                      "1st Floor") {
                                                    guestLocation = 1;
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
                                          initialValue: printData[4]
                                              ['bedroom_toilet_length'],
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
                                          initialValue: printData[4]
                                              ['bedroom_toilet_width'],
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
                                      height,
                                      width,
                                      size,
                                      0.04,
                                      0.05,
                                    ),
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
                                      initialValue: printData[4]
                                          ['bedroom_toilet_req_text'],
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
                                                      value: printData[4][
                                                                  'bedroom_dress_req'] ==
                                                              1
                                                          ? true
                                                          : guestRequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          printData[4][
                                                              'bedroom_dress_req'] = 4;
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
                                                    value: printData[4][
                                                                'bedroom_dress_req'] ==
                                                            0
                                                        ? true
                                                        : parentsNotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          guestNotRequiredDress =
                                                              value;
                                                          guestRequiredDress =
                                                              false;
                                                          printData[3][
                                                              'bedroom_dress_req'] = 4;
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
                                if (guestRequiredDress == true ||
                                    printData[4]['bedroom'] == "1") ...[
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
                                            initialValue: printData[4]
                                                ['bedroom_dress_length'],
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "length",
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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
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
                                            initialValue: printData[4]
                                                ['bedroom_dress_width'],

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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
                                      SizedBox(
                                        width: width * 0.08,
                                      ),
                                      Row(
                                        children: [
                                          requirementText(
                                            "help",
                                          ),
                                          IconButton(
                                            padding: const EdgeInsets.all(5),
                                            constraints: const BoxConstraints(),
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
                                          padding: const EdgeInsets.symmetric(
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
                                                    printData[4][
                                                            'bedroom_dress_facility'] =
                                                        null;
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
                                              if (printData[4][
                                                      'bedroom_dress_facility'] !=
                                                  null) ...[
                                                for (int i = 0;
                                                    i < parentDFac!.length;
                                                    i++)
                                                  Wrap(children: [
                                                    Chip(
                                                      label: Text(parentDFac![i]
                                                          .toString()),
                                                    )
                                                  ])
                                              ],
                                              if (printData[4][
                                                      'bedroom_dress_facility'] ==
                                                  null) ...[
                                                Wrap(
                                                  children:
                                                      daughterDressFacility
                                                          .map(
                                                            (e) => Chip(
                                                              label: Text(e),
                                                            ),
                                                          )
                                                          .toList(),
                                                ),
                                              ]
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
                                              initialValue: printData[4]
                                                  ['bedroom_dress_req_text'],
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
                                              itemCount:
                                                  bunglowPageRecentList.length,
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
                                                    const Duration(
                                                        milliseconds: 800),
                                                viewportFraction: 1,
                                              ),
                                            );
                                          }
                                        },
                                      ),
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
                                              printData[4]['bedroom_facility'] =
                                                  null;
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
                                        if (printData[4]['bedroom_facility'] !=
                                            null) ...[
                                          for (int i = 0;
                                              i < guestRFac!.length;
                                              i++)
                                            Wrap(
                                              children: [
                                                Chip(
                                                  label: Text(
                                                      guestRFac![i].toString()),
                                                )
                                              ],
                                            )
                                        ],
                                        if (printData[4]['bedroom_facility'] ==
                                            null) ...[
                                          Wrap(
                                            children: guestRoomFacility
                                                .map((e) => Chip(
                                                      label: Text(e),
                                                    ))
                                                .toList(),
                                          )
                                        ]
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
                                      initialValue: printData[4]
                                          ['bedroom_facility_req_text'],
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

              // ------------------------- other1bedroom  ------------------------------//

              Column(
                children: [
                  if (other1BedRoom == true || printData.asMap().containsKey(5)
                      ? printData[5]['bedroom'] == "6"
                      : other1BedRoom == true) ...[
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
                          'Other\'s 1 BedRoom Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
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
                                          initialValue: printData[5]
                                              ['bedroom_length'],
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
                                                other1Length =
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
                                          initialValue: printData[5]
                                              ['bedroom_width'],
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
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(),
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
                                            hint: printData[5]
                                                        ['bedroom_floor'] !=
                                                    null
                                                ? Text(floorItemsGuest[
                                                    printData[5]
                                                        ['bedroom_floor']])
                                                : Text(selectedFloorGuest!),
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
                                              setState(
                                                () {
                                                  printData[5]
                                                      ['bedroom_floor'] = null;
                                                  selectedFloorOther1 = it;
                                                  print(selectedFloorOther1);
                                                  if (selectedFloorOther1 ==
                                                      "Ground Floor") {
                                                    other1Location = 0;
                                                  }
                                                  if (selectedFloorOther1 ==
                                                      "1st Floor") {
                                                    other1Location = 1;
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
                                          initialValue: printData[5]
                                              ['bedroom_toilet_length'],
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
                                          initialValue: printData[5]
                                              ['bedroom_toilet_width'],
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
                                      height,
                                      width,
                                      size,
                                      0.04,
                                      0.05,
                                    ),
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
                                      initialValue: printData[5]
                                          ['bedroom_toilet_req_text'],
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
                                                      value: printData[5][
                                                                  'bedroom_dress_req'] ==
                                                              1
                                                          ? true
                                                          : other1RequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          printData[5][
                                                              'bedroom_dress_req'] = 4;
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
                                                    value: printData[5][
                                                                'bedroom_dress_req'] ==
                                                            0
                                                        ? true
                                                        : other1NotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          other1NotRequiredDress =
                                                              value;
                                                          other1RequiredDress =
                                                              false;
                                                          printData[5][
                                                              'bedroom_dress_req'] = 4;
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
                                if (other1RequiredDress == true ||
                                    printData[5]['bedroom'] == "1") ...[
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
                                            initialValue: printData[5]
                                                ['bedroom_dress_length'],
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "length",
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
                                                  other1DressLength = int.parse(
                                                      value.toString());
                                                },
                                              );
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
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
                                            initialValue: printData[5]
                                                ['bedroom_dress_width'],

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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
                                      SizedBox(
                                        width: width * 0.08,
                                      ),
                                      Row(
                                        children: [
                                          requirementText("help"),
                                          IconButton(
                                            padding: const EdgeInsets.all(5),
                                            constraints: const BoxConstraints(),
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
                                          padding: const EdgeInsets.symmetric(
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
                                                    printData[5][
                                                            'bedroom_dress_facility'] =
                                                        null;
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
                                              if (printData[5][
                                                      'bedroom_dress_facility'] !=
                                                  null) ...[
                                                for (int i = 0;
                                                    i < other1DFac!.length;
                                                    i++)
                                                  Wrap(children: [
                                                    Chip(
                                                      label: Text(other1DFac![i]
                                                          .toString()),
                                                    )
                                                  ])
                                              ],
                                              if (printData[5][
                                                      'bedroom_dress_facility'] ==
                                                  null) ...[
                                                Wrap(
                                                  children: other1DressFacility
                                                      .map(
                                                        (e) => Chip(
                                                          label: Text(e),
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                              ]
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
                                              initialValue: printData[5]
                                                  ['bedroom_dress_req_text'],
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
                                              itemCount:
                                                  bunglowPageRecentList.length,
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
                                                    const Duration(
                                                        milliseconds: 800),
                                                viewportFraction: 1,
                                              ),
                                            );
                                          }
                                        },
                                      ),
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
                                              printData[5]['bedroom_facility'] =
                                                  null;
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
                                        if (printData[5]['bedroom_facility'] !=
                                            null) ...[
                                          for (int i = 0;
                                              i < other1RFac!.length;
                                              i++)
                                            Wrap(
                                              children: [
                                                Chip(
                                                  label: Text(other1RFac![i]
                                                      .toString()),
                                                )
                                              ],
                                            )
                                        ],
                                        if (printData[5]['bedroom_facility'] ==
                                            null) ...[
                                          Wrap(
                                            children: other1RoomFacility
                                                .map((e) => Chip(
                                                      label: Text(e),
                                                    ))
                                                .toList(),
                                          )
                                        ]
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
                                      initialValue: printData[5]
                                          ['bedroom_facility_req_text'],
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
                  if (other2BedRoom == true || printData.asMap().containsKey(6)
                      ? printData[6]['bedroom'] == "7"
                      : other2BedRoom == true) ...{
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
                            padding: const EdgeInsets.all(10),
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
                                          initialValue: printData[6]
                                              ['bedroom_length'],
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
                                                other2Length =
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
                                          initialValue: printData[6]
                                              ['bedroom_width'],
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
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(),
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
                                            hint: printData[6]
                                                        ['bedroom_floor'] !=
                                                    null
                                                ? Text(floorItemsOther2[
                                                    printData[6]
                                                        ['bedroom_floor']])
                                                : Text(selectedFloorOther2!),
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
                                              setState(
                                                () {
                                                  printData[6]
                                                      ['bedroom_floor'] = null;
                                                  selectedFloorOther2 = it;
                                                  print(selectedFloorOther2);
                                                  if (selectedFloorOther2 ==
                                                      "Ground Floor") {
                                                    other2Location = 0;
                                                  }
                                                  if (selectedFloorOther2 ==
                                                      "1st Floor") {
                                                    other2Location = 1;
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
                                          initialValue: printData[6]
                                              ['bedroom_toilet_length'],
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
                                          initialValue: printData[6]
                                              ['bedroom_toilet_width'],
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
                                      height,
                                      width,
                                      size,
                                      0.04,
                                      0.05,
                                    ),
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
                                      initialValue: printData[6]
                                          ['bedroom_toilet_req_text'],
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
                                                      value: printData[6][
                                                                  'bedroom_dress_req'] ==
                                                              1
                                                          ? true
                                                          : other2RequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          printData[6][
                                                              'bedroom_dress_req'] = 4;
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
                                                    value: printData[6][
                                                                'bedroom_dress_req'] ==
                                                            0
                                                        ? true
                                                        : other2NotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          other2NotRequiredDress =
                                                              value;
                                                          other2RequiredDress =
                                                              false;
                                                          printData[6][
                                                              'bedroom_dress_req'] = 4;
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
                                if (other2RequiredDress == true ||
                                    printData[6]['bedroom'] == "1") ...[
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
                                            initialValue: printData[6]
                                                ['bedroom_dress_length'],
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "length",
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
                                                  other2DressLength = int.parse(
                                                      value.toString());
                                                },
                                              );
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
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
                                            initialValue: printData[6]
                                                ['bedroom_dress_width'],

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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
                                      SizedBox(
                                        width: width * 0.08,
                                      ),
                                      Row(
                                        children: [
                                          requirementText("help"),
                                          IconButton(
                                            padding: const EdgeInsets.all(5),
                                            constraints: const BoxConstraints(),
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
                                          padding: const EdgeInsets.symmetric(
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
                                                    printData[6][
                                                            'bedroom_dress_facility'] =
                                                        null;
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
                                              if (printData[6][
                                                      'bedroom_dress_facility'] !=
                                                  null) ...[
                                                for (int i = 0;
                                                    i < other2DFac!.length;
                                                    i++)
                                                  Wrap(children: [
                                                    Chip(
                                                      label: Text(other2DFac![i]
                                                          .toString()),
                                                    )
                                                  ])
                                              ],
                                              if (printData[6][
                                                      'bedroom_dress_facility'] ==
                                                  null) ...[
                                                Wrap(
                                                  children: other2DressFacility
                                                      .map(
                                                        (e) => Chip(
                                                          label: Text(e),
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                              ]
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
                                              initialValue: printData[6]
                                                  ['bedroom_dress_req_text'],
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
                                              itemCount:
                                                  bunglowPageRecentList.length,
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
                                                    const Duration(
                                                        milliseconds: 800),
                                                viewportFraction: 1,
                                              ),
                                            );
                                          }
                                        },
                                      ),
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
                                              printData[6]['bedroom_facility'] =
                                                  null;
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
                                        if (printData[6]['bedroom_facility'] !=
                                            null) ...[
                                          for (int i = 0;
                                              i < other2RFac!.length;
                                              i++)
                                            Wrap(
                                              children: [
                                                Chip(
                                                  label: Text(other2RFac![i]
                                                      .toString()),
                                                )
                                              ],
                                            )
                                        ],
                                        if (printData[6]['bedroom_facility'] ==
                                            null) ...[
                                          Wrap(
                                            children: other2RoomFacility
                                                .map((e) => Chip(
                                                      label: Text(e),
                                                    ))
                                                .toList(),
                                          )
                                        ]
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
                                      initialValue: printData[6]
                                          ['bedroom_facility_req_text'],
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
                  if (other3BedRoom == true || printData.asMap().containsKey(7)
                      ? printData[7]['bedroom'] == "8"
                      : other3BedRoom == true) ...{
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
                            padding: const EdgeInsets.all(10),
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
                                          initialValue: printData[7]
                                              ['bedroom_length'],
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
                                                other3Length =
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
                                          initialValue: printData[7]
                                              ['bedroom_width'],
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
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(),
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
                                            hint: printData[7]
                                                        ['bedroom_floor'] !=
                                                    null
                                                ? Text(floorItemsGuest[
                                                    printData[7]
                                                        ['bedroom_floor']])
                                                : Text(selectedFloorGuest!),
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
                                              setState(
                                                () {
                                                  printData[7]
                                                      ['bedroom_floor'] = null;
                                                  selectedFloorOther3 = it;
                                                  print(selectedFloorOther3);
                                                  if (selectedFloorOther3 ==
                                                      "Ground Floor") {
                                                    other3Location = 0;
                                                  }
                                                  if (selectedFloorOther3 ==
                                                      "1st Floor") {
                                                    other3Location = 1;
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
                                          initialValue: printData[7]
                                              ['bedroom_toilet_length'],
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
                                          initialValue: printData[7]
                                              ['bedroom_toilet_width'],
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
                                      height,
                                      width,
                                      size,
                                      0.04,
                                      0.05,
                                    ),
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
                                      initialValue: printData[5]
                                          ['bedroom_toilet_req_text'],
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
                                                      value: printData[7][
                                                                  'bedroom_dress_req'] ==
                                                              1
                                                          ? true
                                                          : other3RequiredDress,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          printData[7][
                                                              'bedroom_dress_req'] = 4;
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
                                                    value: printData[7][
                                                                'bedroom_dress_req'] ==
                                                            0
                                                        ? true
                                                        : other3NotRequiredDress,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          other3NotRequiredDress =
                                                              value;
                                                          other3RequiredDress =
                                                              false;
                                                          printData[7][
                                                              'bedroom_dress_req'] = 4;
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
                                if (other3RequiredDress == true ||
                                    printData[7]['bedroom'] == "1") ...[
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
                                            initialValue: printData[7]
                                                ['bedroom_dress_length'],
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: "length",
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
                                                  other3DressLength = int.parse(
                                                      value.toString());
                                                },
                                              );
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      ),
                                      valueContainer(
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
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
                                            initialValue: printData[7]
                                                ['bedroom_dress_width'],

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
                                        height,
                                        width,
                                        size,
                                        0.04,
                                        0.05,
                                      ),
                                      SizedBox(
                                        width: width * 0.08,
                                      ),
                                      Row(
                                        children: [
                                          requirementText("help"),
                                          IconButton(
                                            padding: const EdgeInsets.all(5),
                                            constraints: const BoxConstraints(),
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
                                          padding: const EdgeInsets.symmetric(
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
                                                    printData[7][
                                                            'bedroom_dress_facility'] =
                                                        null;
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
                                              if (printData[7][
                                                      'bedroom_dress_facility'] !=
                                                  null) ...[
                                                for (int i = 0;
                                                    i < other3DFac!.length;
                                                    i++)
                                                  Wrap(children: [
                                                    Chip(
                                                      label: Text(other3DFac![i]
                                                          .toString()),
                                                    )
                                                  ])
                                              ],
                                              if (printData[7][
                                                      'bedroom_dress_facility'] ==
                                                  null) ...[
                                                Wrap(
                                                  children: other3DressFacility
                                                      .map(
                                                        (e) => Chip(
                                                          label: Text(e),
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                              ]
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
                                              initialValue: printData[7]
                                                  ['bedroom_dress_req_text'],
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
                                              itemCount:
                                                  bunglowPageRecentList.length,
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
                                                    const Duration(
                                                        milliseconds: 800),
                                                viewportFraction: 1,
                                              ),
                                            );
                                          }
                                        },
                                      ),
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
                                              printData[7]['bedroom_facility'] =
                                                  null;
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
                                        if (printData[7]['bedroom_facility'] !=
                                            null) ...[
                                          for (int i = 0;
                                              i < other3RFac!.length;
                                              i++)
                                            Wrap(
                                              children: [
                                                Chip(
                                                  label: Text(other3RFac![i]
                                                      .toString()),
                                                )
                                              ],
                                            )
                                        ],
                                        if (printData[7]['bedroom_facility'] ==
                                            null) ...[
                                          Wrap(
                                            children: other3RoomFacility
                                                .map((e) => Chip(
                                                      label: Text(e),
                                                    ))
                                                .toList(),
                                          )
                                        ]
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
                                      initialValue: printData[7]
                                          ['bedroom_facility_req_text'],
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
                    _value["project_id"] = project_id;

                    List<Bedtypes> bedData = [
                      if (masterBedroom == true ||
                          printData[0]['bedroom'] == "1")
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
                      if (printData.asMap().containsKey(1)
                          ? printData[1]['bedroom'] == "2"
                          : sonBedRoom == true)
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
                      if (printData.asMap().containsKey(2)
                          ? printData[2]['bedroom'] == "3"
                          : daughterBedRoom == true)
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
                      if (printData.asMap().containsKey(3)
                          ? printData[3]['bedroom'] == "4"
                          : parentBedRoom == true)
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
                      if (printData.asMap().containsKey(4)
                          ? printData[4]['bedroom'] == "5"
                          : guestBedRoom == true)
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
                      if (printData.asMap().containsKey(5)
                          ? printData[5]['bedroom'] == "6"
                          : other1BedRoom == true)
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
                      if (printData.asMap().containsKey(6)
                          ? printData[6]['bedroom'] == "7"
                          : other2BedRoom == true)
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
                      if (printData.asMap().containsKey(7)
                          ? printData[7]['bedroom'] == "8"
                          : other3BedRoom == true)
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
                    print(jsonEncode(_value));
                    // _value.putIfAbsent("bedrooms", () => jsonUser);
                    // print(jsonEncode(_value));
                    // print(_values[0]["bedroom_length"]);
                    //  print(masterLength);
                    // print({'dimension': 1, "project_id": 567, "bedrooms": jsonUser});

                    if (project_id == null) {
                      final update = await http.post(
                        Uri.parse(
                            'http://192.168.0.99:8080/sdplserver/api/bungalow-bedroom'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(_value),
                        // body: _valu
                      );
                      // print(update.body);
                    } else {
                      print(jsonEncode(_value));
                      // final submit = await http.post(
                      //   Uri.parse(
                      //   'http://192.168.0.99:8080/sdplserver/api/update-bungalow-bedroom/$project_id'),
                      //   headers: <String, String>{
                      //   'Content-Type': 'application/json; charset=UTF-8',
                      //   },
                      //   body: jsonEncode(_value),
                      //   );
                      //   print(submit.body);
                    }
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
