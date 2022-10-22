// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Container stepsContainer(String text) {
  var container = Container(
    padding: const EdgeInsets.only(top: 3, right: 6, bottom: 4, left: 6),
    // padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(width: 1.0),
      borderRadius: const BorderRadius.all(
          Radius.circular(5) //         <--- border radius here
          ),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 14,
      ),
    ),
  );
  return container;
}

Material houseStepsContainer(String text) {
  var houseContainer = Material(
    elevation: 2.0,
    child: Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(1),
      child: Text(text),
    ),
  );
  return houseContainer;
}
