// import 'package:aashiyan/model/bedmodel.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import '../../../components/forms.dart';
// import '../../../const.dart';
// import '../../../controller/api_services.dart';
// class StaticBedroomPage extends StatefulWidget {
//   const StaticBedroomPage({Key? key}) : super(key: key)
//   @override
//   State<StaticBedroomPage> createState() => _StaticBedroomPageState();
// 
// class _StaticBedroomPageState extends State<StaticBedroomPage> {
//   bool? requiredDress = false;
//   bool? notRequiredDress = false;
//   @override
//   void initState() {
//     //Initialize with 1 item
//     super.initState();
//     // getData();
//   }
//   String? selectedFloor = "select Floor";
//   List<String> floorItems = [
//     "select Floor",
//     "Ground Floor",
//     "1st Floor",
//     "2nd Floor",
//     "3rd Floor",
//     "other"
//   ];
//   String masterLength = '';
//   String masterWidth = '';
//   String masterLocation = '';
//   String masterToiletLength = '';
//   String masterToiletWidth = '';
//   String masterToiletFacility = '';
//   int masterDressInt = 0;
//   String masterDressLength = '';
//   String masterDressWidth = '';
//   String masterDressFacility = '';
//   String masterRoomFacility = '';
//   String masterOtherRequirement = '';
//   String sonWidth = '';
//   String sonLocation = '';
//   String sonLength = '';
//   String sonToiletLength = '';
//   String sonToiletWidth = '';
//   String sonToiletFacility = '';
//   int sonDressInt = 0;
//   String sonDressLength = '';
//   String sonDressWidth = '';
//   String sonDressFacility = '';
//   String sonRoomFacility = '';
//   String sonOtherRequirement = '';
//   String daughterLength = '';
//   String daughterWidth = '';
//   String daughterLocation = '';
//   String daughterToiletLength = '';
//   String daughterToiletWidth = '';
//   String daughterToiletFacility = '';
//   int daughterDressInt = 0;
//   String daughterDressLength = '';
//   String daughterDressWidth = '';
//   String daughterDressFacility = '';
//   String daughterRoomFacility = '';
//   String daughterOtherRequirement = '';
//   String parentLength = '';
//   String parentWidth = '';
//   String parentLocation = '';
//   String parentToiletLength = '';
//   String parentToiletWidth = '';
//   String parentToiletFacility = '';
//   int parentDressInt = 0;
//   String parentDressLength = '';
//   String parentDressWidth = '';
//   String parentDressFacility = '';
//   String parentRoomFacility = '';
//   String parentOtherRequirement = '';
//   String guestLength = '';
//   String guestWidth = '';
//   String guestLocation = '';
//   String guestToiletLength = '';
//   String guestToiletWidth = '';
//   String guestToiletFacility = '';
//   int guestDressInt = 0;
//   String guestDressLength = '';
//   String guestDressWidth = '';
//   String guestDressFacility = '';
//   String guestRoomFacility = '';
//   String guestOtherRequirement = '';
//   String other1Length = '';
//   String other1Width = '';
//   String other1Location = '';
//   String other1ToiletLength = '';
//   String other1ToiletWidth = '';
//   String other1ToiletFacility = '';
//   int other1DressInt = 0;
//   String other1DressLength = '';
//   String other1DressWidth = '';
//   String other1DressFacility = '';
//   String other1RoomFacility = '';
//   String other1OtherRequirement = '';
//   String other2Length = '';
//   String other2Width = '';
//   String other2Location = '';
//   String other2ToiletLength = '';
//   String other2ToiletWidth = '';
//   String other2ToiletFacility = '';
//   int other2DressInt = 0;
//   String other2DressLength = '';
//   String other2DressWidth = '';
//   String other2DressFacility = '';
//   String other2RoomFacility = '';
//   String other2OtherRequirement = '';
//   String other3Length = '';
//   String other3Width = '';
//   String other3Location = '';
//   String other3ToiletLength = '';
//   String other3ToiletWidth = '';
//   String other3ToiletFacility = '';
//   int other3DressInt = 0;
//   String other3DressLength = '';
//   String other3DressWidth = '';
//   String other3DressFacility = '';
//   String other3RoomFacility = '';
//   String other3OtherRequirement = '';
//   List<BedrooModel> data = [];
//   bool masterBedroom = false;
//   bool sonBedRoom = false;
//   bool daughterBedRoom = false;
//   bool parentBedRoom = false;
//   bool guestBedRoom = false;
//   bool other1BedRoom = false;
//   bool other2BedRoom = false;
//   bool other3BedRoom = false;
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(5),
//                     elevation: 5,
//                     child: Container(
//                       width: width * 0.45,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: height * 0.03,
//                             width: width * 0.07,
//                             child: Checkbox(
//                                 activeColor: checkColor,
//                                 checkColor: Colors.white,
//                                 value: masterBedroom,
//                                 onChanged: (value) {
//                                   setState(
//                                     () {
//                                       masterBedroom = value!;
//                                     },
//                                   );
//                                 }),
//                           ),
//                           requirementText("Master Bed Room")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(5),
//                     elevation: 5,
//                     child: Container(
//                       width: width * 0.45,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: height * 0.03,
//                             width: width * 0.07,
//                             child: Checkbox(
//                                 activeColor: checkColor,
//                                 checkColor: Colors.white,
//                                 value: sonBedRoom,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     sonBedRoom = value!;
//                                   });
//                                 }),
//                           ),
//                           requirementText("Son's Bed Room "),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         // SizedBox(
//         //   height: height * 0.01,
//         // ),
//         Row(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(5),
//                     elevation: 5,
//                     child: Container(
//                       width: width * 0.45,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: height * 0.03,
//                             width: width * 0.07,
//                             child: Checkbox(
//                                 activeColor: checkColor,
//                                 checkColor: Colors.white,
//                                 value: daughterBedRoom,
//                                 onChanged: (value) {
//                                   setState(
//                                     () {
//                                       daughterBedRoom = value!;
//                                     },
//                                   );
//                                 }),
//                           ),
//                           requirementText("Daughter's Bed Room")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(5),
//                     elevation: 5,
//                     child: Container(
//                       width: width * 0.45,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: height * 0.03,
//                             width: width * 0.07,
//                             child: Checkbox(
//                                 activeColor: checkColor,
//                                 checkColor: Colors.white,
//                                 value: parentBedRoom,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     parentBedRoom = value!;
//                                   });
//                                 }),
//                           ),
//                           requirementText("Parent's Bed Room"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: height * 0.01,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(5),
//                     elevation: 5,
//                     child: Container(
//                       width: width * 0.45,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: height * 0.03,
//                             width: width * 0.07,
//                             child: Checkbox(
//                                 activeColor: checkColor,
//                                 checkColor: Colors.white,
//                                 value: guestBedRoom,
//                                 onChanged: (value) {
//                                   setState(
//                                     () {
//                                       guestBedRoom = value!;
//                                     },
//                                   );
//                                 }),
//                           ),
//                           requirementText("Guest's Bed Room")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(5),
//                     elevation: 5,
//                     child: Container(
//                       width: width * 0.45,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: height * 0.03,
//                             width: width * 0.07,
//                             child: Checkbox(
//                                 activeColor: checkColor,
//                                 checkColor: Colors.white,
//                                 value: other1BedRoom,
//                                 onChanged: (value) {
//                                   setState(
//                                     () {
//                                       other1BedRoom = value!;
//                                     },
//                                   );
//                                 }),
//                           ),
//                           requirementText("Other's 1 Bed Room"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: height * 0.01,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(5),
//                     elevation: 5,
//                     child: Container(
//                       width: width * 0.45,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: height * 0.03,
//                             width: width * 0.07,
//                             child: Checkbox(
//                                 activeColor: checkColor,
//                                 checkColor: Colors.white,
//                                 value: other2BedRoom,
//                                 onChanged: (value) {
//                                   setState(
//                                     () {
//                                       other2BedRoom = value!;
//                                     },
//                                   );
//                                 }),
//                           ),
//                           requirementText("Other's 2 Bed Room")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(5),
//                     elevation: 5,
//                     child: Container(
//                       width: width * 0.45,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: height * 0.03,
//                             width: width * 0.07,
//                             child: Checkbox(
//                                 activeColor: checkColor,
//                                 checkColor: Colors.white,
//                                 value: other3BedRoom,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     other3BedRoom = value!;
//                                   });
//                                 }),
//                           ),
//                           requirementText("Other's 3 Bed Room"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: height * 0.01,
//         ),
//         if (masterBedroom == true) ...{
//           Container(
//             color: Colors.grey,
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text(
//                 'Master\'s BedRoom Details',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: width * 1,
//                   color: color3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [],
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {});
//                                 },
//                                 onFieldSubmitted: (value) {
//                                   // getData();
//                                 },
//                                 // onSaved: (newValue){
//                                 //   widget.bedroomLength = newValue;
//                                 //   // getData();
//                                 // },
//                               ),
//                             ),
//                           ),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * .01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Floor"),
//                           Material(
//                             elevation: 5,
//                             borderRadius: BorderRadius.circular(5),
//                             child: Container(
//                               height: height * 0.03,
//                               width: width * 0.6,
//                               margin: const EdgeInsets.all(
//                                 3,
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                     icon: const Visibility(
//                                         visible: false,
//                                         child: Icon(Icons.arrow_downward)),
//                                     value: selectedFloor,
//                                     elevation: 16,
//                                     items: floorItems
//                                         .map((it) => DropdownMenuItem<String>(
//                                             value: it,
//                                             child: Text(
//                                               it,
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             )))
//                                         .toList(),
//                                     onChanged: (it) =>
//                                         setState(() => selectedFloor = it!)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet details"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, 0.04, 0.9, "Other Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Dress Details"),
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: requiredDress,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   requiredDress = value;
//                                                   notRequiredDress = false;
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
//                           SizedBox(
//                             height: height * 0.01,
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: notRequiredDress,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 notRequiredDress = value;
//                                                 requiredDress = false;
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
//                       if (requiredDress == true) ...[
//                         Row(
//                           children: [
//                             requirementText("Length"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.15, "Length"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             requirementText("Width"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.1, "Width"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.13,
//                             ),
//                             Row(
//                               children: [
//                                 requirementText("help"),
//                                 IconButton(
//                                     padding: EdgeInsets.all(5),
//                                     constraints: BoxConstraints(),
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.help,
//                                       size: height * 0.03,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: requirementText("Dress Facility"),
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             requirementTextField(height, width, 0.04, 1, "more")
//                           ],
//                         )
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       SizedBox(height: height * 0.01),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                                   child: Row(
//                                     children: const [
//                                       Icon(Icons.cloud_upload),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("Upload a stair image"),
//                                     ],
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
//                                 child: const Text(
//                                   "Preview",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: requirementText("Room Facility"),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, .04, .8, "other requirement"),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         },
//         if (sonBedRoom == true) ...{
//           SizedBox(
//             height: height * 0.01,
//           ),
//           Container(
//             color: Colors.grey,
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text(
//                 'Son\'s Bedroom Details',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: width * 1,
//                   color: color3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [],
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     sonLength = value;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "width",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     sonWidth = value;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.1,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * .01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Floor"),
//                           Material(
//                             elevation: 5,
//                             borderRadius: BorderRadius.circular(5),
//                             child: Container(
//                               height: height * 0.03,
//                               width: width * 0.6,
//                               margin: const EdgeInsets.all(
//                                 3,
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                     icon: const Visibility(
//                                         visible: false,
//                                         child: Icon(Icons.arrow_downward)),
//                                     value: selectedFloor,
//                                     elevation: 16,
//                                     items: floorItems
//                                         .map((it) => DropdownMenuItem<String>(
//                                             value: it,
//                                             child: Text(
//                                               it,
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             )))
//                                         .toList(),
//                                     onChanged: (it) =>
//                                         setState(() => selectedFloor = it!)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet details"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, 0.04, 0.9, "Other Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Dress Details"),
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: requiredDress,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   requiredDress = value;
//                                                   notRequiredDress = false;
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
//                           SizedBox(
//                             height: height * 0.01,
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: notRequiredDress,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 notRequiredDress = value;
//                                                 requiredDress = false;
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
//                       if (requiredDress == true) ...[
//                         Row(
//                           children: [
//                             requirementText("Length"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.15, "Length"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             requirementText("Width"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.1, "Width"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.13,
//                             ),
//                             Row(
//                               children: [
//                                 requirementText("help"),
//                                 IconButton(
//                                     padding: EdgeInsets.all(5),
//                                     constraints: BoxConstraints(),
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.help,
//                                       size: height * 0.03,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: requirementText("Dress Facility"),
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             requirementTextField(height, width, 0.04, 1, "more")
//                           ],
//                         )
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       SizedBox(height: height * 0.01),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                                   child: Row(
//                                     children: const [
//                                       Icon(Icons.cloud_upload),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("Upload a stair image"),
//                                     ],
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
//                                 child: const Text(
//                                   "Preview",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: requirementText("Room Facility"),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, .04, .8, "other requirement"),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         },
//         SizedBox(
//           height: height * 0.01,
//         ),
//         if (daughterBedRoom == true) ...{
//           Container(
//             color: Colors.grey,
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text(
//                 'Daughter BedRoom Details',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: width * 1,
//                   color: color3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {});
//                                 },
//                               ),
//                             ),
//                           ),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * .01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Floor"),
//                           Material(
//                             elevation: 5,
//                             borderRadius: BorderRadius.circular(5),
//                             child: Container(
//                               height: height * 0.03,
//                               width: width * 0.6,
//                               margin: const EdgeInsets.all(
//                                 3,
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                     icon: const Visibility(
//                                         visible: false,
//                                         child: Icon(Icons.arrow_downward)),
//                                     value: selectedFloor,
//                                     elevation: 16,
//                                     items: floorItems
//                                         .map((it) => DropdownMenuItem<String>(
//                                             value: it,
//                                             child: Text(
//                                               it,
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             )))
//                                         .toList(),
//                                     onChanged: (it) =>
//                                         setState(() => selectedFloor = it!)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet details"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, 0.04, 0.9, "Other Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Dress Details"),
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: requiredDress,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   requiredDress = value;
//                                                   notRequiredDress = false;
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
//                           SizedBox(
//                             height: height * 0.01,
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: notRequiredDress,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 notRequiredDress = value;
//                                                 requiredDress = false;
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
//                       if (requiredDress == true) ...[
//                         Row(
//                           children: [
//                             requirementText("Length"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.15, "Length"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             requirementText("Width"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.1, "Width"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.13,
//                             ),
//                             Row(
//                               children: [
//                                 requirementText("help"),
//                                 IconButton(
//                                     padding: EdgeInsets.all(5),
//                                     constraints: BoxConstraints(),
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.help,
//                                       size: height * 0.03,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: requirementText("Dress Facility"),
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             requirementTextField(height, width, 0.04, 1, "more")
//                           ],
//                         )
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       SizedBox(height: height * 0.01),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                                   child: Row(
//                                     children: const [
//                                       Icon(Icons.cloud_upload),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("Upload a stair image"),
//                                     ],
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
//                                 child: const Text(
//                                   "Preview",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: requirementText("Room Facility"),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, .04, .8, "other requirement"),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         },
//         SizedBox(
//           height: height * 0.01,
//         ),
//         if (parentBedRoom == true) ...{
//           Container(
//             color: Colors.grey,
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text(
//                 'Parents BedRoom Details',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: width * 1,
//                   color: color3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [],
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {});
//                                 },
//                                 onFieldSubmitted: (value) {
//                                   // getData();
//                                 },
//                                 // onSaved: (newValue){
//                                 //   widget.bedroomLength = newValue;
//                                 //   // getData();
//                                 // },
//                               ),
//                             ),
//                           ),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * .01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Floor"),
//                           Material(
//                             elevation: 5,
//                             borderRadius: BorderRadius.circular(5),
//                             child: Container(
//                               height: height * 0.03,
//                               width: width * 0.6,
//                               margin: const EdgeInsets.all(
//                                 3,
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                     icon: const Visibility(
//                                         visible: false,
//                                         child: Icon(Icons.arrow_downward)),
//                                     value: selectedFloor,
//                                     elevation: 16,
//                                     items: floorItems
//                                         .map((it) => DropdownMenuItem<String>(
//                                             value: it,
//                                             child: Text(
//                                               it,
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             )))
//                                         .toList(),
//                                     onChanged: (it) =>
//                                         setState(() => selectedFloor = it!)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet details"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, 0.04, 0.9, "Other Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Dress Details"),
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: requiredDress,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   requiredDress = value;
//                                                   notRequiredDress = false;
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
//                           SizedBox(
//                             height: height * 0.01,
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: notRequiredDress,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 notRequiredDress = value;
//                                                 requiredDress = false;
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
//                       if (requiredDress == true) ...[
//                         Row(
//                           children: [
//                             requirementText("Length"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.15, "Length"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             requirementText("Width"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.1, "Width"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.13,
//                             ),
//                             Row(
//                               children: [
//                                 requirementText("help"),
//                                 IconButton(
//                                     padding: EdgeInsets.all(5),
//                                     constraints: BoxConstraints(),
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.help,
//                                       size: height * 0.03,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: requirementText("Dress Facility"),
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             requirementTextField(height, width, 0.04, 1, "more")
//                           ],
//                         )
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       SizedBox(height: height * 0.01),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                                   child: Row(
//                                     children: const [
//                                       Icon(Icons.cloud_upload),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("Upload a stair image"),
//                                     ],
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
//                                 child: const Text(
//                                   "Preview",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: requirementText("Room Facility"),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, .04, .8, "other requirement"),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         },
//         SizedBox(
//           height: height * 0.01,
//         ),
//         if (guestBedRoom == true) ...{
//           Container(
//             color: Colors.grey,
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text(
//                 'Masters BedRoom Details',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: width * 1,
//                   color: color3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [],
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {});
//                                 },
//                                 onFieldSubmitted: (value) {
//                                   // getData();
//                                 },
//                                 // onSaved: (newValue){
//                                 //   widget.bedroomLength = newValue;
//                                 //   // getData();
//                                 // },
//                               ),
//                             ),
//                           ),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * .01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Floor"),
//                           Material(
//                             elevation: 5,
//                             borderRadius: BorderRadius.circular(5),
//                             child: Container(
//                               height: height * 0.03,
//                               width: width * 0.6,
//                               margin: const EdgeInsets.all(
//                                 3,
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                     icon: const Visibility(
//                                         visible: false,
//                                         child: Icon(Icons.arrow_downward)),
//                                     value: selectedFloor,
//                                     elevation: 16,
//                                     items: floorItems
//                                         .map((it) => DropdownMenuItem<String>(
//                                             value: it,
//                                             child: Text(
//                                               it,
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             )))
//                                         .toList(),
//                                     onChanged: (it) =>
//                                         setState(() => selectedFloor = it!)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet details"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, 0.04, 0.9, "Other Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Dress Details"),
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: requiredDress,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   requiredDress = value;
//                                                   notRequiredDress = false;
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
//                           SizedBox(
//                             height: height * 0.01,
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: notRequiredDress,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 notRequiredDress = value;
//                                                 requiredDress = false;
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
//                       if (requiredDress == true) ...[
//                         Row(
//                           children: [
//                             requirementText("Length"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.15, "Length"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             requirementText("Width"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.1, "Width"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.13,
//                             ),
//                             Row(
//                               children: [
//                                 requirementText("help"),
//                                 IconButton(
//                                     padding: EdgeInsets.all(5),
//                                     constraints: BoxConstraints(),
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.help,
//                                       size: height * 0.03,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: requirementText("Dress Facility"),
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             requirementTextField(height, width, 0.04, 1, "more")
//                           ],
//                         )
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       SizedBox(height: height * 0.01),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                                   child: Row(
//                                     children: const [
//                                       Icon(Icons.cloud_upload),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("Upload a stair image"),
//                                     ],
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
//                                 child: const Text(
//                                   "Preview",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: requirementText("Room Facility"),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, .04, .8, "other requirement"),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         },
//         SizedBox(
//           height: height * 0.01,
//         ),
//         if (other1BedRoom == true) ...{
//           Container(
//             color: Colors.grey,
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text(
//                 'Other 1 BedRoom',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: width * 1,
//                   color: color3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [],
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {});
//                                 },
//                                 onFieldSubmitted: (value) {
//                                   // getData();
//                                 },
//                                 // onSaved: (newValue){
//                                 //   widget.bedroomLength = newValue;
//                                 //   // getData();
//                                 // },
//                               ),
//                             ),
//                           ),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * .01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Floor"),
//                           Material(
//                             elevation: 5,
//                             borderRadius: BorderRadius.circular(5),
//                             child: Container(
//                               height: height * 0.03,
//                               width: width * 0.6,
//                               margin: const EdgeInsets.all(
//                                 3,
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                     icon: const Visibility(
//                                         visible: false,
//                                         child: Icon(Icons.arrow_downward)),
//                                     value: selectedFloor,
//                                     elevation: 16,
//                                     items: floorItems
//                                         .map((it) => DropdownMenuItem<String>(
//                                             value: it,
//                                             child: Text(
//                                               it,
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             )))
//                                         .toList(),
//                                     onChanged: (it) =>
//                                         setState(() => selectedFloor = it!)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet details"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, 0.04, 0.9, "Other Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Dress Details"),
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: requiredDress,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   requiredDress = value;
//                                                   notRequiredDress = false;
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
//                           SizedBox(
//                             height: height * 0.01,
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: notRequiredDress,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 notRequiredDress = value;
//                                                 requiredDress = false;
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
//                       if (requiredDress == true) ...[
//                         Row(
//                           children: [
//                             requirementText("Length"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.15, "Length"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             requirementText("Width"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.1, "Width"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.13,
//                             ),
//                             Row(
//                               children: [
//                                 requirementText("help"),
//                                 IconButton(
//                                     padding: EdgeInsets.all(5),
//                                     constraints: BoxConstraints(),
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.help,
//                                       size: height * 0.03,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: requirementText("Dress Facility"),
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             requirementTextField(height, width, 0.04, 1, "more")
//                           ],
//                         )
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       SizedBox(height: height * 0.01),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                                   child: Row(
//                                     children: const [
//                                       Icon(Icons.cloud_upload),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("Upload a stair image"),
//                                     ],
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
//                                 child: const Text(
//                                   "Preview",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: requirementText("Room Facility"),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, .04, .8, "other requirement"),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         },
//         SizedBox(
//           height: height * 0.01,
//         ),
//         if (other2BedRoom == true) ...{
//           Container(
//             color: Colors.grey,
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text(
//                 'Other 2 BedRoom ',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: width * 1,
//                   color: color3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [],
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {});
//                                 },
//                                 onFieldSubmitted: (value) {
//                                   // getData();
//                                 },
//                                 // onSaved: (newValue){
//                                 //   widget.bedroomLength = newValue;
//                                 //   // getData();
//                                 // },
//                               ),
//                             ),
//                           ),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * .01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Floor"),
//                           Material(
//                             elevation: 5,
//                             borderRadius: BorderRadius.circular(5),
//                             child: Container(
//                               height: height * 0.03,
//                               width: width * 0.6,
//                               margin: const EdgeInsets.all(
//                                 3,
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                     icon: const Visibility(
//                                         visible: false,
//                                         child: Icon(Icons.arrow_downward)),
//                                     value: selectedFloor,
//                                     elevation: 16,
//                                     items: floorItems
//                                         .map((it) => DropdownMenuItem<String>(
//                                             value: it,
//                                             child: Text(
//                                               it,
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             )))
//                                         .toList(),
//                                     onChanged: (it) =>
//                                         setState(() => selectedFloor = it!)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet details"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, 0.04, 0.9, "Other Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Dress Details"),
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: requiredDress,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   requiredDress = value;
//                                                   notRequiredDress = false;
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
//                           SizedBox(
//                             height: height * 0.01,
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: notRequiredDress,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 notRequiredDress = value;
//                                                 requiredDress = false;
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
//                       if (requiredDress == true) ...[
//                         Row(
//                           children: [
//                             requirementText("Length"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.15, "Length"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             requirementText("Width"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.1, "Width"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.13,
//                             ),
//                             Row(
//                               children: [
//                                 requirementText("help"),
//                                 IconButton(
//                                     padding: EdgeInsets.all(5),
//                                     constraints: BoxConstraints(),
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.help,
//                                       size: height * 0.03,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: requirementText("Dress Facility"),
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             requirementTextField(height, width, 0.04, 1, "more")
//                           ],
//                         )
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       SizedBox(height: height * 0.01),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                                   child: Row(
//                                     children: const [
//                                       Icon(Icons.cloud_upload),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("Upload a stair image"),
//                                     ],
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
//                                 child: const Text(
//                                   "Preview",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: requirementText("Room Facility"),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, .04, .8, "other requirement"),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         },
//         SizedBox(
//           height: height * 0.01,
//         ),
//         if (other3BedRoom == true) ...{
//           Container(
//             color: Colors.grey,
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text(
//                 'Son\'s BedRoom Details',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: width * 1,
//                   color: color3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [],
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
//                                 style: const TextStyle(fontSize: 14),
//                                 decoration: const InputDecoration(
//                                     hintText: "Length",
//                                     hintStyle: TextStyle(fontSize: 14),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.all(8)
//                                     //fillColor: Colors.green
//                                     ),
//                                 onChanged: (value) {
//                                   setState(() {});
//                                 },
//                                 onFieldSubmitted: (value) {
//                                   // getData();
//                                 },
//                                 // onSaved: (newValue){
//                                 //   widget.bedroomLength = newValue;
//                                 //   // getData();
//                                 // },
//                               ),
//                             ),
//                           ),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * .01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Floor"),
//                           Material(
//                             elevation: 5,
//                             borderRadius: BorderRadius.circular(5),
//                             child: Container(
//                               height: height * 0.03,
//                               width: width * 0.6,
//                               margin: const EdgeInsets.all(
//                                 3,
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                     icon: const Visibility(
//                                         visible: false,
//                                         child: Icon(Icons.arrow_downward)),
//                                     value: selectedFloor,
//                                     elevation: 16,
//                                     items: floorItems
//                                         .map((it) => DropdownMenuItem<String>(
//                                             value: it,
//                                             child: Text(
//                                               it,
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             )))
//                                         .toList(),
//                                     onChanged: (it) =>
//                                         setState(() => selectedFloor = it!)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet details"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.1, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.13,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, 0.04, 0.9, "Other Toilet Facility"),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementText("Dress Details"),
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: requiredDress,
//                                             onChanged: (value) {
//                                               setState(
//                                                 () {
//                                                   requiredDress = value;
//                                                   notRequiredDress = false;
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
//                           SizedBox(
//                             height: height * 0.01,
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
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.04,
//                                         child: Checkbox(
//                                             activeColor: checkColor,
//                                             checkColor: Colors.white,
//                                             value: notRequiredDress,
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 notRequiredDress = value;
//                                                 requiredDress = false;
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
//                       if (requiredDress == true) ...[
//                         Row(
//                           children: [
//                             requirementText("Length"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.15, "Length"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.02,
//                             ),
//                             requirementText("Width"),
//                             SizedBox(
//                               width: width * 0.015,
//                             ),
//                             requirementTextField(
//                                 height, width, 0.04, 0.1, "Width"),
//                             valueContainer(height, width, size, 0.04, 0.05),
//                             SizedBox(
//                               width: width * 0.13,
//                             ),
//                             Row(
//                               children: [
//                                 requirementText("help"),
//                                 IconButton(
//                                     padding: EdgeInsets.all(5),
//                                     constraints: BoxConstraints(),
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.help,
//                                       size: height * 0.03,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: requirementText("Dress Facility"),
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             requirementTextField(height, width, 0.04, 1, "more")
//                           ],
//                         )
//                       ],
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       SizedBox(height: height * 0.01),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                                   child: Row(
//                                     children: const [
//                                       Icon(Icons.cloud_upload),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("Upload a stair image"),
//                                     ],
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
//                                 child: const Text(
//                                   "Preview",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: requirementText("Room Facility"),
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       requirementTextField(
//                           height, width, .04, .8, "other requirement"),
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
//                                     return Container(
//                                       child: const Center(
//                                         child: CircularProgressIndicator(),
//                                       ),
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         },
//         SizedBox(
//           height: height * 0.01,
//         ),
//       ],
//     );
//   }
// }
