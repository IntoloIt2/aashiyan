import 'package:aashiyan/controller/api_services.dart';
import 'package:aashiyan/view/commercial_show_off.dart';
import 'package:aashiyan/view/hospitals.dart';
import 'package:aashiyan/view/hotels.dart';
import 'package:aashiyan/view/mixuse.dart';
import 'package:aashiyan/view/multiplexer.dart';
import 'package:aashiyan/view/residential.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/residential/bunglow/interior_design.dart';
import 'contants.dart';
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

            getGalleryAPI(HOSPITALITY);
            Get.to(Hotels());

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

              getGalleryAPI(MALL_MULTIPLESER);
              Get.to(Multiplexer());

            },
            child: stepsContainer("Multiplex/mall")),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              getGalleryAPI(BUNGALOW);
              Get.to(InteriorDesign());

            },
            child: stepsContainer("Interior Design")),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              getGalleryAPI(HOSPITAL);
              Get.to(Hospitals());

            },
            child: stepsContainer("Hospitals")),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              getGalleryAPI(COMMERCIAL_SHOWROOM_OFFICE);
              Get.to(CommercialShowroom());
            },
            child: stepsContainer("Commercial Showroom/Offices")),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              getGalleryAPI(MIX_USE);
              Get.to(MixUse());
            },
            child: stepsContainer("Mix Use Buildings")),
      ],
    ),
  );
  return singleChildScrollView;
}
