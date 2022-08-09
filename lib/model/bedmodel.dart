import 'package:flutter/material.dart';

class BedModel {
  String? bedroomLength;
  String? bedroom;
  int? bedRoomFloor;
  String? bedRoomWidth;
  String? bedRoomArea;
  String? bedRoomToiletLength;
  String? bedRoomToiletWidth;
  String? bedRoomToiletArea;
  String? bedRoomToiletReqText;
  String? bedroomDressLength;
  String? bedroomDressWidth;
  String? bedroomDressArea;
  String? bedroomDressRequirment;
  String? bedroomDressFacility;
  String? bedroomDressRequirmentText;
  String? bedroomImg;
  String? bedroomFacility;
  String? bedroomFacilityRequirementText;
  int? index;
  Function? removeServiceCard;

  BedModel([
    this.index,
    this.removeServiceCard,
    this.bedroomLength,
    this.bedroom,
    this.bedRoomFloor,
    this.bedRoomWidth,
    this.bedRoomArea,
    this.bedRoomToiletLength,
    this.bedRoomToiletWidth,
    this.bedRoomToiletArea,
    this.bedRoomToiletReqText,
    this.bedroomDressLength,
    this.bedroomDressWidth,
    this.bedroomDressArea,
    this.bedroomDressRequirment,
    this.bedroomDressFacility,
    this.bedroomDressRequirmentText,
    this.bedroomImg,
    this.bedroomFacility,
    this.bedroomFacilityRequirementText,
  ]);
}
