import 'dart:convert';
import 'dart:io';
import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../const.dart';
import '../../../../controller/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Step_4 extends StatefulWidget {
  static const namedRoute = "/pantrydetails";
  @override
  State<Step_4> createState() => _Step_4State();
}

class _Step_4State extends State<Step_4> {
  List<String> diningFaciltiy = [];
  List diningFeaturesList = [];
  String diningFloor = " ";
  String diningLocation = " ";
  dynamic _pickImageError;
  bool previewImageStatus = false;

  // List<XFile>? _imageFileList;
  var _imageFileList;

  String selectedStairItem = "select stair";
  List<String> stairCase = [
    "select stair",
    "U-shaped",
    "L-shaped",
    "Semi Circular"
  ];

  void multiSelected() async {
    final List<String> otherItems = [
      "With crockery storage",
      "Without crockery storage",
      "Double Height",
      "Near By Basin",
    ];

    final List<String> result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: otherItems);
        });
    if (result != null) {
      setState(() {
        diningFaciltiy = result;
      });
    }
  }

  String pantryArea = "";
  String diningArea = "";
  String diningLocationController = " ";
  String floorLocationController = " ";
  String pantryLengthController = " ";
  String pantrywidthController = " ";
  String specificRequestController = " ";
  String diningLengthController = " ";
  String diningWidthController = " ";
  String diningFloorLocation = " ";
  String diningRequirements = " ";

  String? selectedDiningSeats = "select dining seat";
  List<String> diningSeatsItems = [
    "select dining seat",
    "6",
    "8",
    "10",
    "more",
  ];

  String selectedFloor = "select floor";
  String pantryFloor = "";
  List<String> pantryItems = [
    "select floor",
    "Ground floor",
    "1st floor",
    "2nd floor",
    "3rd floor",
    "other"
  ];

  String? selectedDiningFloor = "select floor";
  List<String> diningItems = [
    "select floor",
    "Ground floor",
    "1st floor",
    "2nd floor",
    "3rd floor",
    "other"
  ];

  bool? pantryDetails1 = false;
  bool? pantryDetails2 = false;
  int pantryDetailInt = 0;

// http://sdplweb.com/sdpl/api/edit-bungalow-pantry/project_id

  bool isloading = false;
  var printData;
  Future<void> getData() async {
    try {
      // var client = http.Client();
      var response = await http.get(
        Uri.parse(
          "http://192.168.0.99:8080/sdplserver/api/edit-bungalow-pantry/179",
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          printData = jsonResponse;
          print(printData);
        });
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future<void> _onImageButtonPressed(
      ImageSource source, BuildContext? context) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? pickedFile = await _picker.pickImage(
          source: source, maxHeight: 1800, maxWidth: 1800);
      setState(() {
        // _imageFileList = pickedFile == null ? null : <XFile>[pickedFile];
        _imageFileList = pickedFile == null ? null : File(pickedFile.path);
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Widget? _previewImages() {
    if (_imageFileList != null) {
      return Container(
        child: Column(children: [
          Text("Image Picker"),
          Container(
            child: Image.file(
              _imageFileList,
              fit: BoxFit.fitHeight,
            ),
          )
        ]),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    if (printData == null) {
      isloading = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (printData != null) {
      isloading = false;
    }
    return isloading == true
        ? Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
              ],
            ),
          )
        : previewImageStatus
            ? Container(child: _previewImages())
            : Container(
                child: SingleChildScrollView(
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
                              hint: Text(selectedStairItem),
                              items: stairCase
                                  .map(
                                    (ele) => DropdownMenuItem<String>(
                                      value: ele,
                                      child: Text(ele,
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedStairItem = value!;
                                  // print(selectedStairItem);
                                });
                              }),
                          // SizedBox(
                          //   width: width * 0.04,
                          // ),
                        ],
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
                                    return const Center(
                                      child: CircularProgressIndicator(),
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
                                  child: InkWell(
                                    onTap: () {
                                      _onImageButtonPressed(
                                          ImageSource.gallery, context);
                                    },
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
                              ),
                              SizedBox(
                                width: width * 0.2,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                color: buttonColor,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      previewImageStatus = true;
                                    });
                                  },
                                  child: const Text(
                                    "Preview",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      requirementText("Pooja Room"),
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
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: height * 0.04,
                                        child: Checkbox(
                                            activeColor: checkColor,
                                            checkColor: Colors.white,
                                            value: printData['bungalow_pantry']
                                                        ['pantry_req'] ==
                                                    1
                                                ? true
                                                : pantryDetails1,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  pantryDetails1 = value;
                                                  pantryDetails2 = false;
                                                  printData['bungalow_pantry']
                                                      ['pantry_req'] = 5;
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
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(5),
                                elevation: 5,
                                child: Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: height * 0.04,
                                        child: Checkbox(
                                            activeColor: checkColor,
                                            checkColor: Colors.white,
                                            value: printData['bungalow_pantry']
                                                        ['pantry_req'] ==
                                                    0
                                                ? true
                                                : pantryDetails2,
                                            onChanged: (value) {
                                              setState(() {
                                                pantryDetails2 = value;
                                                pantryDetails1 = false;
                                                printData['bungalow_pantry']
                                                    ['pantry_req'] = 5;
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
                                    return const Center(
                                      child: CircularProgressIndicator(),
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
                      if (pantryDetails1 == true ||
                          printData['bungalow_pantry']['pantry_req'] == 1) ...[
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                      SizedBox(
                        height: height * 0.01,
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            if (pantryDetails1 == true) {
                              pantryDetailInt = 1;
                              if (selectedFloor == "Ground floor") {
                                pantryFloor = '1';
                              }
                              if (selectedFloor == "1st floor") {
                                pantryFloor = '2';
                              }
                              if (selectedFloor == "2nd floor") {
                                pantryFloor = '3';
                              }
                              if (selectedFloor == "3rd floor") {
                                pantryFloor = '3';
                              }
                              if (selectedFloor == "other") {
                                selectedFloor = floorLocationController;
                              }
                              int pantry = int.parse(pantryLengthController) *
                                  int.parse(pantrywidthController);
                              pantryArea = pantry.toString();
                            }

                            int dining = int.parse(diningLengthController) *
                                int.parse(diningWidthController);
                            diningArea = dining.toString();
                            for (int i = 0; i < diningFaciltiy.length; i++) {
                              if (diningFaciltiy[i] ==
                                  "With crockery storage") {
                                diningFeaturesList.add("1");
                              }
                              if (diningFaciltiy[i] ==
                                  "Without crockery storage") {
                                diningFeaturesList.add("2");
                              }
                              if (diningFaciltiy[i] == "Double Height") {
                                diningFeaturesList.add("3");
                              }
                              if (diningFaciltiy[i] == "Near By Basin") {
                                diningFeaturesList.add("4");
                              }
                            }
                            if (selectedDiningSeats == "6") {
                              diningFloor = "1";
                            }
                            if (selectedDiningSeats == "8") {
                              diningFloor = "2";
                            }
                            if (selectedDiningSeats == "10") {
                              diningFloor = "3";
                            }
                            if (selectedDiningSeats == "more") {
                              diningFloor = "3";
                            }

                            if (selectedDiningFloor == "more") {
                              diningFloor = diningLengthController;
                            }
                            if (selectedDiningFloor == "Ground floor") {
                              diningLocation = "1";
                            }
                            if (selectedDiningFloor == "1st floor ") {
                              diningLocation = "2";
                            }
                            if (selectedDiningFloor == "2nd floor") {
                              diningLocation = "3";
                            }
                            if (selectedDiningFloor == "3rd floor") {
                              diningLocation = "4";
                            }
                            if (selectedDiningFloor == "other") {
                              diningLocation = diningFloorLocation;
                            }
                          });

                          pantryPost(
                            pantryDetailInt,
                            pantryFloor,
                            pantryLengthController,
                            pantrywidthController,
                            pantryArea,
                            specificRequestController,
                            diningLengthController,
                            diningWidthController,
                            diningArea,
                            diningFeaturesList,
                            diningLocation,
                            diningFloor,
                            diningRequirements,
                          );
                        }),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: height * 0.04,
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(4)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: const Text(
                              "save and continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}
