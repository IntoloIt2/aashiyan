// ignore_for_file: camel_case_types, duplicate_ignore, unused_field, prefer_final_fields, non_constant_identifier_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Step_5 extends StatefulWidget {
  const Step_5({super.key});

  @override
  State<Step_5> createState() => _Step_5State();
}

class _Step_5State extends State<Step_5> {
  TextEditingController personBedRoom = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController widths = TextEditingController();
  TextEditingController dressLength = TextEditingController();
  TextEditingController dressWidth = TextEditingController();
  TextEditingController dressReqText = TextEditingController();
  TextEditingController dressReq = TextEditingController();
  TextEditingController selectedFloor = TextEditingController();
  TextEditingController toiletLength = TextEditingController();
  TextEditingController toiletWidth = TextEditingController();
  TextEditingController dressFacility = TextEditingController();
  TextEditingController toiletFacility = TextEditingController();
  TextEditingController roomRequirement = TextEditingController();
  TextEditingController roomOtherRequirement = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _customTileExpanded = false;
  List flat_house_bedroom = [];
  var height;
  var width;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    flat_house_bedroom = [
      {
        "bedroom_length": '',
        "bedroom_width": '',
        "bedroom_area": '',
        "bedroom_toilet_length": '',
        "bedroom_toilet_width": '',
        "bedroom_toilet_area = T": '',
        "bedroom_toilet_req_text": '',
        "bedroom_dress_req": '',
        "bedroom_dress_length": '',
        "bedroom_dress_width": '',
        "bedroom_dress_area": '',
        "bedroom_dress_facility": '',
        "bedroom_img": '',
        "bedroom_facility_req_text": '',
        "bedroom_length_feet": '',
        "bedroom_width_feet": '',
        "bedroom_area_feet": '',
        "bedroom_toilet_length_feet": '',
        "bedroom_toilet_width_feet": '',
        "bedroom_toilet_area_feet": '',
        "bedroom_dress_length_feet": '',
        "bedroom_dress_width_feet": '',
        "bedroom_dress_area_feet": ''
      }
    ];
  }

  Widget flatHouseBedroomInput(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: const Text("bedroom counter"),
          subtitle: const Text("data 1"),
          children: [
            const ListTile(
              title: Text("tile no. 1"),
            ),
            Column(
              children: [
                const Text("Person Bedroom"),
                Row(
                  children: [
                    Container(
                      height: height * 0.05,
                      width: width * 0.5,
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
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(width: 1, color: Colors.black)),
                child: InkWell(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Add BedRoom"),
                      Container(
                        child: const Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ),
            ),
            flatHouseBedroomInput(context)
          ],
        ),
      ),
    );
  }
}
