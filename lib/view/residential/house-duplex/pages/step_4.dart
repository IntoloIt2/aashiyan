<<<<<<< HEAD
// import 'dart:convert';
// import 'dart:io';
// import 'package:aashiyan/components/bungalow_steps.dart';
// import 'package:aashiyan/components/forms.dart';
// import 'package:aashiyan/view/residential/bunglow/basement.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import '../../../../const.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import '../../../../controller/api_services.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// class Step_4 extends StatefulWidget {
//   static const namedRoute = "/floorstore";
//   @override
//   State<Step_4> createState() => _Step_4State();
// }

// class _Step_4State extends State<Step_4> {
//   // List<String> diningFaciltiy = [];
//   // List diningFeaturesList = [];
//   // String diningFloor = " ";
//   // String diningLocation = " ";
//   dynamic _pickImageError;
//   bool previewImageStatus = false;

//   // List<XFile>? _imageFileList;
//   var _imageFileList;

//   String selectedStairItem = "select stair";
//   int? stairItem;
//   List<String> stairCase = [
//     "select stair",
//     "U-shaped",
//     "L-shaped",
//     "Semi Circular"
//   ];

//   // void multiSelected() async {
//   //   final List<String> otherItems = [
//   //     "With crockery storage",
//   //     "Without crockery storage",
//   //     "Double Height",
//   //     "Near By Basin",
//   //   ];

//   //   final List<String> result = await showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return MultiSelect(items: otherItems);
//   //       });
//   //   if (result != null) {
//   //     setState(() {
//   //       diningFaciltiy = result;
//   //     });
//   //   }
//   // }

//   // String? selectedDiningSeats = "select dining seat";
//   // List<String> diningSeatsItems = [
//   //   "select dining seat",
//   //   "6",
//   //   "8",
//   //   "10",
//   //   "more",
//   // ];

//   String selectedFloor = "select floor";
//   String selectedType = "select room type";
//   int? poojaFloor;
//   String poojaType = "";

//   bool? poojaRoomRequiredValue;
//   List<String> poojaFloorItems = [
//     "select floor",
//     "Ground floor",
//     "1st floor",
//     "2nd floor",
//     "3rd floor",
//     "other"
//   ];

//   List<String> poojaFloorTypes = [
//     "select room Type",
//     "Proper room",
//     "Only place"
//   ];

//   bool? poojaRoomRequired = false;
//   bool? poojaRoomNotRequired = false;

//   var poojaRoomLength;
//   var poojaRoomWidth;
//   var poojaRoomFloor;
//   var poojaRoomType;

//   int pantryDetailInt = 0;

//   bool isloading = false;
//   var printData;
//   Future<void> getData() async {
//     try {
//       var response = await http.get(
//         Uri.parse("${dotenv.env['APP_URL']}edit-flat-house-floor-store/179"),
//       );

//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         print(true);
//         setState(() {
//           printData = jsonResponse;
//           poojaRoomLength =
//               printData["flat_house_floor_store"]["pooja_room_length"] != null
//                   ? printData["flat_house_floor_store"]["pooja_room_length"]
//                       .toString()
//                   : "";

//           poojaRoomWidth =
//               printData["flat_house_floor_store"]["pooja_room_width"] != null
//                   ? printData["flat_house_floor_store"]["pooja_room_width"]
//                       .toString()
//                   : "";
//         });
//       }
//     } catch (e) {
//       print(
//         e.toString(),
//       );
//     }
//   }

//   Future<void> _onImageButtonPressed(
//       ImageSource source, BuildContext? context) async {
//     final ImagePicker _picker = ImagePicker();
//     try {
//       final XFile? pickedFile = await _picker.pickImage(
//           source: source, maxHeight: 1800, maxWidth: 1800);
//       setState(() {
//         // _imageFileList = pickedFile == null ? null : <XFile>[pickedFile];
//         _imageFileList = pickedFile == null ? null : File(pickedFile.path);
//       });
//     } catch (e) {
//       setState(() {
//         _pickImageError = e;
//       });
//     }
//   }

//   Widget? _previewImages() {
//     if (_imageFileList != null) {
//       return Container(
//         child: Column(children: [
//           Text("Image Picker"),
//           Container(
//             child: Image.file(
//               _imageFileList,
//               fit: BoxFit.fitHeight,
//             ),
//           )
//         ]),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//     if (printData == null) {
//       isloading = true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     if (printData != null) {
//       isloading = false;
//     }
//     return isloading == true
//         ? Center(
//             child: Column(
//               children: [
//                 CircularProgressIndicator(),
//               ],
//             ),
//           )
//         : previewImageStatus
//             ? Container(child: _previewImages())
//             : Container(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Stair Case",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 14),
//                           ),
//                           SizedBox(
//                             width: width * 0.04,
//                           ),
//                           DropdownButton<String>(
//                               elevation: 5,
//                               // value: selectedFloorItems,
//                               hint: printData['flat_house_floor_store']
//                                           ['stair_case'] !=
//                                       null
//                                   ? Text(printData['flat_house_floor_store']
//                                       ['stair_case'])
//                                   : Text(selectedStairItem),
//                               items: stairCase
//                                   .map(
//                                     (ele) => DropdownMenuItem<String>(
//                                       value: ele,
//                                       child: Text(ele,
//                                           style:
//                                               TextStyle(color: Colors.black)),
//                                     ),
//                                   )
//                                   .toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   selectedStairItem = value!;
//                                   printData['flat_house_floor_store']
//                                       ['stair_case'] = null;
//                                   if (selectedStairItem == "select stair") {
//                                     stairItem = 0;
//                                   } else if (selectedStairItem == "U-shaped") {
//                                     stairItem = 1;
//                                   } else if (selectedStairItem == "L-shaped") {
//                                     stairItem = 2;
//                                   } else {
//                                     stairItem = 3;
//                                   }
//                                 });
//                               }),
//                           // SizedBox(
//                           //   width: width * 0.04,
//                           // ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Material(
//                         elevation: 10,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           color: Colors.white,
//                           child: SizedBox(
//                             width: width * 9,
//                             height: height * 0.3,
//                             child: FutureBuilder(
//                                 future: getRecent(),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.connectionState ==
//                                       ConnectionState.waiting) {
//                                     return const Center(
//                                       child: CircularProgressIndicator(),
//                                     );
//                                   } else {
//                                     return CarouselSlider.builder(
//                                       itemCount: bunglowPageRecentList.length,
//                                       itemBuilder: (context, i, id) {
//                                         return Container(
//                                           height: height * 0.4,
//                                           width: width * 0.9,
//                                           child: Image.network(
//                                             imageUrl +
//                                                 bunglowPageRecentList[i]
//                                                     ["img_path"],
//                                             fit: BoxFit.fill,
//                                           ),
//                                         );
//                                       },
//                                       options: CarouselOptions(
//                                         autoPlay: true,
//                                         enableInfiniteScroll: true,
//                                         autoPlayAnimationDuration:
//                                             const Duration(milliseconds: 800),
//                                         viewportFraction: 1,
//                                       ),
//                                     );
//                                   }
//                                 }),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Material(
//                         elevation: 5,
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Material(
//                                 elevation: 3,
//                                 child: Container(
//                                   margin: EdgeInsets.all(5),
//                                   child: InkWell(
//                                     onTap: () {
//                                       _onImageButtonPressed(
//                                           ImageSource.gallery, context);
//                                     },
//                                     child: Row(
//                                       children: const [
//                                         Icon(Icons.cloud_upload),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Text("Upload a stair image"),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.2,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 5, horizontal: 10),
//                                 color: buttonColor,
//                                 child: InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       previewImageStatus = true;
//                                     });
//                                   },
//                                   child: const Text(
//                                     "Preview",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Pooja Room"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           Row(
//                             children: [
//                               Material(
//                                 borderRadius: BorderRadius.circular(5),
//                                 elevation: 5,
//                                 child: Container(
//                                   padding: const EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             // value: poojaRoomRequired,
//                                             value: printData[
//                                                             'flat_house_floor_store']
//                                                         ['pooja_room_req'] !=
//                                                     null
//                                                 ? printData['flat_house_floor_store']
//                                                             [
//                                                             'pooja_room_req'] ==
//                                                         1
//                                                     ? true
//                                                     : poojaRoomRequired
//                                                 : poojaRoomRequired,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   poojaRoomRequired = value;
//                                                   poojaRoomNotRequired = false;
//                                                   if (printData[
//                                                               'flat_house_floor_store']
//                                                           ['pooja_room_req'] !=
//                                                       null) {
//                                                     printData[
//                                                             'flat_house_floor_store']
//                                                         [
//                                                         'pooja_room_req'] = null;
//                                                   }
//                                                 },
//                                               );
//                                             }),
//                                       ),
//                                       requirementText("Required")
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: width * 0.05,
//                               ),
//                               Material(
//                                 borderRadius: BorderRadius.circular(5),
//                                 elevation: 5,
//                                 child: Container(
//                                   padding: const EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: printData[
//                                                             'flat_house_floor_store']
//                                                         ['pooja_room_req'] !=
//                                                     null
//                                                 ? printData['flat_house_floor_store']
//                                                             [
//                                                             'pooja_room_req'] ==
//                                                         0
//                                                     ? true
//                                                     : poojaRoomNotRequired
//                                                 : poojaRoomNotRequired,
//                                             // value: poojaRoomNotRequired,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 poojaRoomNotRequired = value;
//                                                 poojaRoomRequired = false;
//                                                 // printData[
//                                                 //         'flat_house_floor_store']
//                                                 //     ['pooja_room_req'] = 5;
//                                                 if (printData[
//                                                             'flat_house_floor_store']
//                                                         ['pooja_room_req'] !=
//                                                     null) {
//                                                   printData[
//                                                           'flat_house_floor_store']
//                                                       ['pooja_room_req'] = null;
//                                                 }
//                                               });
//                                             }),
//                                       ),
//                                       requirementText("Not Required"),
//                                       SizedBox(
//                                         height: height * 0.01,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           Material(
//                             elevation: 5,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(5)),
//                             child: SizedBox(
//                               height: height * 0.04,
//                               width: width * 0.15,
//                               child: TextFormField(
//                                 initialValue:
//                                     printData['flat_house_floor_store']
//                                                 ['pooja_room_length'] !=
//                                             null
//                                         ? printData['flat_house_floor_store']
//                                                 ['pooja_room_length']
//                                             .toString()
//                                         : poojaRoomLength.toString(),
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   poojaRoomLength = value;
//                                 },
//                               ),
//                             ),
//                           ),
//                           // requirementTextFieldCont(
//                           //     height, width, 0.04, 0.15, "length", KitchenLengthController),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           Material(
//                             elevation: 5,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(5)),
//                             child: SizedBox(
//                               height: height * 0.04,
//                               width: width * 0.15,
//                               child: TextFormField(
//                                 initialValue:
//                                     printData['flat_house_floor_store']
//                                                 ['pooja_room_width'] !=
//                                             null
//                                         ? printData['flat_house_floor_store']
//                                                 ['pooja_room_width']
//                                             .toString()
//                                         : poojaRoomWidth.toString(),
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Width",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   poojaRoomWidth = value;
//                                 },
//                               ),
//                             ),
//                           ),
//                           // requirementTextFieldCont(
//                           //     height, width, 0.04, 0.15, "Width", kitchenWidthController),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.01,
//                           ),
//                           requirementText("help ?"),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       if (poojaRoomRequired == true ||
//                           printData['flat_house_floor_store']
//                                   ['pooja_room_req'] ==
//                               1) ...[
//                         // SizedBox(
//                         //   height: height * 0.01,
//                         // ),
//                         Row(
//                           children: [
//                             requirementText("Location"),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Material(
//                                 elevation: 5,
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Container(
//                                   height: height * 0.03,
//                                   width: width * 0.25,
//                                   margin: EdgeInsets.all(
//                                     3,
//                                   ),
//                                   child: DropdownButtonHideUnderline(
//                                     child: DropdownButton<String>(
//                                         icon: const Visibility(
//                                             visible: false,
//                                             child: Icon(Icons.arrow_downward)),
//                                         // hint: Text(selectedFloor),
//                                         hint: printData["flat_house_floor_store"]
//                                                     ["pooja_room_floor"] !=
//                                                 null
//                                             ? Text(poojaFloorItems[int.parse(
//                                                 printData[
//                                                         "flat_house_floor_store"]
//                                                     ["pooja_room_floor"])])
//                                             : Text(selectedFloor),

//                                         //value: selectedKitchen,
//                                         elevation: 16,
//                                         items: poojaFloorItems
//                                             .map(
//                                               (it) => DropdownMenuItem<String>(
//                                                 value: it,
//                                                 child: Text(
//                                                   it,
//                                                   style: TextStyle(
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ),
//                                             )
//                                             .toList(),
//                                         onChanged: (it) {
//                                           setState(
//                                             () {
//                                               selectedFloor = it!;
//                                               if (printData[
//                                                           "flat_house_floor_store"]
//                                                       ["pooja_room_floor"] !=
//                                                   null) {
//                                                 printData[
//                                                         "flat_house_floor_store"]
//                                                     ["pooja_room_floor"] = null;
//                                               }
//                                               // print(selectedKitchen);
//                                               if (selectedFloor == "Select") {
//                                                 poojaFloor = 0;
//                                                 // printData[
//                                                 //         "flat_house_floor_store"]

//                                                 //     ["pooja_room_floor"] = 0;
//                                               }
//                                               if (selectedFloor ==
//                                                   "Ground floor") {
//                                                 poojaFloor = 1;
//                                                 // printData[
//                                                 // "flat_house_floor_store"]
//                                                 // ["pooja_room_floor"] = 1;
//                                               }
//                                               if (selectedFloor ==
//                                                   "1st Floor") {
//                                                 poojaFloor = 2;
//                                                 // printData[
//                                                 //         "flat_house_floor_store"]
//                                                 //     ["pooja_room_floor"] = 2;
//                                               }
//                                               if (selectedFloor ==
//                                                   "2nd Floor") {
//                                                 poojaFloor = 3;
//                                                 // printData[
//                                                 //         "flat_house_floor_store"]
//                                                 //     ["pooja_room_floor"] = 3;
//                                               }
//                                               if (selectedFloor ==
//                                                   "3rd Floor") {
//                                                 poojaFloor = 4;
//                                                 // printData[
//                                                 //         "flat_house_floor_store"]
//                                                 //     ["pooja_room_floor"] = 4;
//                                               }
//                                               if (selectedFloor == "other") {
//                                                 poojaFloor = 5;
//                                                 // printData[
//                                                 //         "flat_house_floor_store"]
//                                                 //     ["pooja_room_floor"] = 5;
//                                               }
//                                               // print(printData[
//                                               //         "flat_house_floor_store"]
//                                               //     ["pooja_room_floor"]);
//                                             },
//                                           );
//                                         }),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             if (selectedFloor == "other") ...[
//                               requirementTextField(
//                                   height, width, 0.04, 0.25, "other location"),
//                             ]
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),

//                         Row(
//                           children: [
//                             requirementText("Type"),
//                             SizedBox(width: width * 0.08),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Material(
//                                 elevation: 5,
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Container(
//                                   height: height * 0.03,
//                                   width: width * 0.5,
//                                   margin: EdgeInsets.all(
//                                     3,
//                                   ),
//                                   child: DropdownButtonHideUnderline(
//                                     child: DropdownButton<String>(
//                                         icon: const Visibility(
//                                             visible: false,
//                                             child: Icon(Icons.arrow_downward)),
//                                         hint: Text(
//                                             printData["flat_house_floor_store"]
//                                                         ["pooja_room_type"] !=
//                                                     null
//                                                 ? printData[
//                                                         "flat_house_floor_store"]
//                                                     ["pooja_room_type"]
//                                                 : Text(selectedType)),

//                                         //value: selectedKitchen,
//                                         elevation: 16,
//                                         items: poojaFloorTypes
//                                             .map(
//                                               (it) => DropdownMenuItem<String>(
//                                                 value: it,
//                                                 child: Text(
//                                                   it,
//                                                   style: TextStyle(
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ),
//                                             )
//                                             .toList(),
//                                         onChanged: (it) {
//                                           setState(
//                                             () {
//                                               selectedType = it!;
//                                               if (selectedType ==
//                                                   "select room Type") {
//                                                 poojaType = "select room Type";
//                                                 printData["flat_house_floor_store"]
//                                                         ["pooja_room_type"] =
//                                                     "select room Type";
//                                               }
//                                               if (selectedType ==
//                                                   "Proper room") {
//                                                 poojaType = "Proper room";
//                                                 printData["flat_house_floor_store"]
//                                                         ["pooja_room_type"] =
//                                                     "Proper room";
//                                               }
//                                               if (selectedType ==
//                                                   "Only place") {
//                                                 poojaType = "Only place";
//                                                 printData["flat_house_floor_store"]
//                                                         ["pooja_room_type"] =
//                                                     "Only place";
//                                               }
//                                             },
//                                           );
//                                         }),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: width * 0.02,
//                             // ),
//                             // if (selectedType == "other") ...[
//                             //   requirementTextField(
//                             //       height, width, 0.04, 0.25, "other location"),
//                             // ]
//                           ],
//                         ),
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Material(
//                         elevation: 10,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           color: Colors.white,
//                           child: SizedBox(
//                             width: width * 9,
//                             height: height * 0.3,
//                             child: FutureBuilder(
//                                 future: getRecent(),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.connectionState ==
//                                       ConnectionState.waiting) {
//                                     return const Center(
//                                       child: CircularProgressIndicator(),
//                                     );
//                                   } else {
//                                     return CarouselSlider.builder(
//                                       itemCount: bunglowPageRecentList.length,
//                                       itemBuilder: (context, i, id) {
//                                         return Container(
//                                           height: height * 0.4,
//                                           width: width * 0.9,
//                                           child: Image.network(
//                                             imageUrl +
//                                                 bunglowPageRecentList[i]
//                                                     ["img_path"],
//                                             fit: BoxFit.fill,
//                                           ),
//                                         );
//                                       },
//                                       options: CarouselOptions(
//                                         autoPlay: true,
//                                         enableInfiniteScroll: true,
//                                         autoPlayAnimationDuration:
//                                             const Duration(milliseconds: 800),
//                                         viewportFraction: 1,
//                                       ),
//                                     );
//                                   }
//                                 }),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       InkWell(
//                         onTap: (() {
//                           HouseDuplexFloorPost(
//                               182,
//                               stairItem,
//                               '',
//                               poojaRoomRequired,
//                               poojaRoomLength,
//                               poojaRoomWidth,
//                               poojaFloor,
//                               poojaType,
//                               "Opening toward hall/ Lobby");
//                         }),
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             height: height * 0.04,
//                             decoration: BoxDecoration(
//                                 color: buttonColor,
//                                 borderRadius: BorderRadius.circular(4)),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 5),
//                             child: const Text(
//                               "save and continue",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 14),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//   }
// }
=======
import 'dart:convert';
import 'dart:io';
import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../const.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../controller/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Step_4 extends StatefulWidget {
  static const namedRoute = "/floorstore";
  @override
  State<Step_4> createState() => _Step_4State();
}

class _Step_4State extends State<Step_4> {
  // List<String> diningFaciltiy = [];
  // List diningFeaturesList = [];
  // String diningFloor = " ";
  // String diningLocation = " ";
  dynamic _pickImageError;
  bool previewImageStatus = false;

  // List<XFile>? _imageFileList;
  var _imageFileList;

  String selectedStairItem = "select stair";
  int? stairItem;
  List<String> stairCase = [
    "select stair",
    "U-shaped",
    "L-shaped",
    "Semi Circular"
  ];

  // void multiSelected() async {
  //   final List<String> otherItems = [
  //     "With crockery storage",
  //     "Without crockery storage",
  //     "Double Height",
  //     "Near By Basin",
  //   ];

  //   final List<String> result = await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return MultiSelect(items: otherItems);
  //       });
  //   if (result != null) {
  //     setState(() {
  //       diningFaciltiy = result;
  //     });
  //   }
  // }

  // String? selectedDiningSeats = "select dining seat";
  // List<String> diningSeatsItems = [
  //   "select dining seat",
  //   "6",
  //   "8",
  //   "10",
  //   "more",
  // ];

  String selectedFloor = "select floor";
  String selectedType = "select room type";
  int? poojaFloor;
  String poojaType = "";

  bool? poojaRoomRequiredValue;
  List<String> poojaFloorItems = [
    "select floor",
    "Ground floor",
    "1st floor",
    "2nd floor",
    "3rd floor",
    "other"
  ];

  List<String> poojaFloorTypes = [
    "select room Type",
    "Proper room",
    "Only place"
  ];

  bool? poojaRoomRequired = false;
  bool? poojaRoomNotRequired = false;

  var poojaRoomLength;
  var poojaRoomWidth;
  var poojaRoomFloor;
  var poojaRoomType;

  int pantryDetailInt = 0;

  bool isloading = false;
  var printData;
  Future<void> getData() async {
    try {
      var response = await http.get(
        Uri.parse("${dotenv.env['APP_URL']}edit-flat-house-floor-store/179"),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print(true);
        setState(() {
          printData = jsonResponse;
          poojaRoomLength =
              printData["flat_house_floor_store"]["pooja_room_length"] != null
                  ? printData["flat_house_floor_store"]["pooja_room_length"]
                      .toString()
                  : "";

          poojaRoomWidth =
              printData["flat_house_floor_store"]["pooja_room_width"] != null
                  ? printData["flat_house_floor_store"]["pooja_room_width"]
                      .toString()
                  : "";
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
                            "Stair Case",
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
                              hint: printData['flat_house_floor_store']
                                          ['stair_case'] !=
                                      null
                                  ? Text(printData['flat_house_floor_store']
                                      ['stair_case'])
                                  : Text(selectedStairItem),
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
                                  printData['flat_house_floor_store']
                                      ['stair_case'] = null;
                                  if (selectedStairItem == "select stair") {
                                    stairItem = 0;
                                  } else if (selectedStairItem == "U-shaped") {
                                    stairItem = 1;
                                  } else if (selectedStairItem == "L-shaped") {
                                    stairItem = 2;
                                  } else {
                                    stairItem = 3;
                                  }
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
                                            // value: poojaRoomRequired,
                                            value: printData[
                                                            'flat_house_floor_store']
                                                        ['pooja_room_req'] !=
                                                    null
                                                ? printData['flat_house_floor_store']
                                                            [
                                                            'pooja_room_req'] ==
                                                        1
                                                    ? true
                                                    : poojaRoomRequired
                                                : poojaRoomRequired,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  poojaRoomRequired = value;
                                                  poojaRoomNotRequired = false;
                                                  if (printData[
                                                              'flat_house_floor_store']
                                                          ['pooja_room_req'] !=
                                                      null) {
                                                    printData[
                                                            'flat_house_floor_store']
                                                        [
                                                        'pooja_room_req'] = null;
                                                  }
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
                                            value: printData[
                                                            'flat_house_floor_store']
                                                        ['pooja_room_req'] !=
                                                    null
                                                ? printData['flat_house_floor_store']
                                                            [
                                                            'pooja_room_req'] ==
                                                        0
                                                    ? true
                                                    : poojaRoomNotRequired
                                                : poojaRoomNotRequired,
                                            // value: poojaRoomNotRequired,
                                            onChanged: (value) {
                                              setState(() {
                                                poojaRoomNotRequired = value;
                                                poojaRoomRequired = false;
                                                // printData[
                                                //         'flat_house_floor_store']
                                                //     ['pooja_room_req'] = 5;
                                                if (printData[
                                                            'flat_house_floor_store']
                                                        ['pooja_room_req'] !=
                                                    null) {
                                                  printData[
                                                          'flat_house_floor_store']
                                                      ['pooja_room_req'] = null;
                                                }
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
                                initialValue:
                                    printData['flat_house_floor_store']
                                                ['pooja_room_length'] !=
                                            null
                                        ? printData['flat_house_floor_store']
                                                ['pooja_room_length']
                                            .toString()
                                        : poojaRoomLength.toString(),
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
                                  poojaRoomLength = value;
                                },
                              ),
                            ),
                          ),
                          // requirementTextFieldCont(
                          //     height, width, 0.04, 0.15, "length", KitchenLengthController),
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
                                initialValue:
                                    printData['flat_house_floor_store']
                                                ['pooja_room_width'] !=
                                            null
                                        ? printData['flat_house_floor_store']
                                                ['pooja_room_width']
                                            .toString()
                                        : poojaRoomWidth.toString(),
                                style: const TextStyle(fontSize: 14),
                                decoration: const InputDecoration(
                                    hintText: "Width",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8)
                                    //fillColor: Colors.green
                                    ),
                                onChanged: (value) {
                                  poojaRoomWidth = value;
                                },
                              ),
                            ),
                          ),
                          // requirementTextFieldCont(
                          //     height, width, 0.04, 0.15, "Width", kitchenWidthController),
                          valueContainer(height, width, size, 0.04, 0.05),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          requirementText("help ?"),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      if (poojaRoomRequired == true ||
                          printData['flat_house_floor_store']
                                  ['pooja_room_req'] ==
                              1) ...[
                        // SizedBox(
                        //   height: height * 0.01,
                        // ),
                        Row(
                          children: [
                            requirementText("Location"),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: height * 0.03,
                                  width: width * 0.25,
                                  margin: EdgeInsets.all(
                                    3,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        icon: const Visibility(
                                            visible: false,
                                            child: Icon(Icons.arrow_downward)),
                                        // hint: Text(selectedFloor),
                                        hint: printData["flat_house_floor_store"]
                                                    ["pooja_room_floor"] !=
                                                null
                                            ? Text(poojaFloorItems[int.parse(
                                                printData[
                                                        "flat_house_floor_store"]
                                                    ["pooja_room_floor"])])
                                            : Text(selectedFloor),

                                        //value: selectedKitchen,
                                        elevation: 16,
                                        items: poojaFloorItems
                                            .map(
                                              (it) => DropdownMenuItem<String>(
                                                value: it,
                                                child: Text(
                                                  it,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (it) {
                                          setState(
                                            () {
                                              selectedFloor = it!;
                                              if (printData[
                                                          "flat_house_floor_store"]
                                                      ["pooja_room_floor"] !=
                                                  null) {
                                                printData[
                                                        "flat_house_floor_store"]
                                                    ["pooja_room_floor"] = null;
                                              }
                                              // print(selectedKitchen);
                                              if (selectedFloor == "Select") {
                                                poojaFloor = 0;
                                                // printData[
                                                //         "flat_house_floor_store"]

                                                //     ["pooja_room_floor"] = 0;
                                              }
                                              if (selectedFloor ==
                                                  "Ground floor") {
                                                poojaFloor = 1;
                                                // printData[
                                                // "flat_house_floor_store"]
                                                // ["pooja_room_floor"] = 1;
                                              }
                                              if (selectedFloor ==
                                                  "1st Floor") {
                                                poojaFloor = 2;
                                                // printData[
                                                //         "flat_house_floor_store"]
                                                //     ["pooja_room_floor"] = 2;
                                              }
                                              if (selectedFloor ==
                                                  "2nd Floor") {
                                                poojaFloor = 3;
                                                // printData[
                                                //         "flat_house_floor_store"]
                                                //     ["pooja_room_floor"] = 3;
                                              }
                                              if (selectedFloor ==
                                                  "3rd Floor") {
                                                poojaFloor = 4;
                                                // printData[
                                                //         "flat_house_floor_store"]
                                                //     ["pooja_room_floor"] = 4;
                                              }
                                              if (selectedFloor == "other") {
                                                poojaFloor = 5;
                                                // printData[
                                                //         "flat_house_floor_store"]
                                                //     ["pooja_room_floor"] = 5;
                                              }
                                              // print(printData[
                                              //         "flat_house_floor_store"]
                                              //     ["pooja_room_floor"]);
                                            },
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            if (selectedFloor == "other") ...[
                              requirementTextField(
                                  height, width, 0.04, 0.25, "other location"),
                            ]
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),

                        Row(
                          children: [
                            requirementText("Type"),
                            SizedBox(width: width * 0.08),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: height * 0.03,
                                  width: width * 0.5,
                                  margin: EdgeInsets.all(
                                    3,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        icon: const Visibility(
                                            visible: false,
                                            child: Icon(Icons.arrow_downward)),
                                        hint: Text(
                                            printData["flat_house_floor_store"]
                                                        ["pooja_room_type"] !=
                                                    null
                                                ? printData[
                                                        "flat_house_floor_store"]
                                                    ["pooja_room_type"]
                                                : Text(selectedType)),

                                        //value: selectedKitchen,
                                        elevation: 16,
                                        items: poojaFloorTypes
                                            .map(
                                              (it) => DropdownMenuItem<String>(
                                                value: it,
                                                child: Text(
                                                  it,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (it) {
                                          setState(
                                            () {
                                              selectedType = it!;
                                              if (selectedType ==
                                                  "select room Type") {
                                                poojaType = "select room Type";
                                                printData["flat_house_floor_store"]
                                                        ["pooja_room_type"] =
                                                    "select room Type";
                                              }
                                              if (selectedType ==
                                                  "Proper room") {
                                                poojaType = "Proper room";
                                                printData["flat_house_floor_store"]
                                                        ["pooja_room_type"] =
                                                    "Proper room";
                                              }
                                              if (selectedType ==
                                                  "Only place") {
                                                poojaType = "Only place";
                                                printData["flat_house_floor_store"]
                                                        ["pooja_room_type"] =
                                                    "Only place";
                                              }
                                            },
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: width * 0.02,
                            // ),
                            // if (selectedType == "other") ...[
                            //   requirementTextField(
                            //       height, width, 0.04, 0.25, "other location"),
                            // ]
                          ],
                        ),
                      ],
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
                      InkWell(
                        onTap: (() {
                          HouseDuplexFloorPost(
                              182,
                              stairItem,
                              '',
                              poojaRoomRequired,
                              poojaRoomLength,
                              poojaRoomWidth,
                              poojaFloor,
                              poojaType,
                              "Opening toward hall/ Lobby");
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
>>>>>>> 829d15a565281f08c576dd92ac58c0796bce9f11
