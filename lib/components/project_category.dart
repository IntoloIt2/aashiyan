import 'package:aashiyan/view/hospitals.dart';
import 'package:aashiyan/view/hotels.dart';
import 'package:aashiyan/view/multiplexer.dart';
import 'package:aashiyan/view/residential.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/residential/bunglow/interior_design.dart';
import 'steps_container.dart';

SingleChildScrollView projectCategory() {
  var singleChildScrollView = SingleChildScrollView(
    padding: const EdgeInsets.all(10),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        InkWell(
          child: stepsContainer("Hotels"),
          onTap: () {
            Get.to(const Hotels());
          },
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              Get.to(const Residential());
            },
            child: stepsContainer("residental")),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              Get.to(const Multiplexer());
            },
            child: stepsContainer("Multiplex/mall")),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              Get.to(const InteriorDesign());
            },
            child: stepsContainer("Interior Design")),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              Get.to(const Hospitals());
            },
            child: stepsContainer("Hospitals")),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {}, child: stepsContainer("Commercial Showroom/Offices")),
        const SizedBox(
          width: 5,
        ),
        InkWell(onTap: () {}, child: stepsContainer("Mix Use Buildings")),
      ],
    ),
  );
  return singleChildScrollView;
}
