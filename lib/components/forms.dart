// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

List<String> sizeitems = ["ft", "m"];
String size = "ft";

int dimenInt = 1;

Container lableText(String lable) {
  return Container(
    padding: EdgeInsets.only(right: 5),
    child: Text(
      "$lable : ",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Material textField(BuildContext context) {
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.all(Radius.circular(5)),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: "First name",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

          //fillColor: Colors.green
        ),
      ),
    ),
  );
}

Material valueContainer(
    double height, double width, String str, double h, double w) {
  return Material(
    borderRadius: BorderRadius.circular(5),
    elevation: 1,
    child: Container(
      height: height * h,
      width: width * w,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white),
      child: Text(str),
    ),
  );
}

Text requirementText(String txt) {
  return Text(
    txt,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}

Material requirementTextField(
  double height,
  double width,
  double h,
  double w,
  String str,
) {
  return Material(
    elevation: 5,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    child: SizedBox(
      height: height * h,
      width: width * w,
      child: TextFormField(
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
            hintText: str,
            hintStyle: TextStyle(fontSize: 14),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(8)
            //fillColor: Colors.green
            ),
      ),
    ),
  );
}

Material requirementTextFieldCont(
  double height,
  double width,
  double h,
  double w,
  String str,
  TextEditingController txt,
) {
  return Material(
    elevation: 5,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    child: SizedBox(
      height: height * h,
      width: width * w,
      child: TextFormField(
        controller: txt,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
            hintText: str,
            hintStyle: const TextStyle(fontSize: 14),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(8)
            //fillColor: Colors.green
            ),
      ),
    ),
  );
}
