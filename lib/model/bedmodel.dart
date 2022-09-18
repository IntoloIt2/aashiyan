// To parse this JSON data, do
//
//     final modelBedroom = modelBedroomFromJson(jsonString);

import 'dart:convert';

List<ModelBedroom> modelBedroomFromJson(dynamic str) => List<ModelBedroom>.from(
    json.decode(str).map((x) => ModelBedroom.fromJson(x)));

String modelBedroomToJson(List<ModelBedroom> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelBedroom {
  ModelBedroom({
    required this.id,
    required this.projectId,
    required this.bedroom,
    required this.bedroomFloor,
    required this.bedroomLength,
    required this.bedroomWidth,
    required this.bedroomArea,
    required this.bedroomToiletLength,
    required this.bedroomToiletWidth,
    required this.bedroomToiletArea,
    required this.bedroomToiletReqText,
    required this.bedroomDressReq,
    required this.bedroomDressLength,
    required this.bedroomDressWidth,
    required this.bedroomDressArea,
    required this.bedroomDressFacility,
    required this.bedroomDressReqText,
    required this.bedroomImg,
    required this.bedroomFacility,
    required this.bedroomFacilityReqText,
    required this.bedroomLengthFeet,
    required this.bedroomWidthFeet,
    required this.bedroomAreaFeet,
    required this.bedroomToiletLengthFeet,
    required this.bedroomToiletWidthFeet,
    required this.bedroomToiletAreaFeet,
    required this.bedroomDressLengthFeet,
    required this.bedroomDressWidthFeet,
    required this.bedroomDressAreaFeet,
  });

  int id;
  int projectId;
  String bedroom;
  int bedroomFloor;
  String bedroomLength;
  String bedroomWidth;
  String bedroomArea;
  String bedroomToiletLength;
  String bedroomToiletWidth;
  String bedroomToiletArea;
  String bedroomToiletReqText;
  int bedroomDressReq;
  String bedroomDressLength;
  String bedroomDressWidth;
  String bedroomDressArea;
  String bedroomDressFacility;
  String bedroomDressReqText;
  dynamic bedroomImg;
  String bedroomFacility;
  String bedroomFacilityReqText;
  String bedroomLengthFeet;
  String bedroomWidthFeet;
  String bedroomAreaFeet;
  String bedroomToiletLengthFeet;
  String bedroomToiletWidthFeet;
  String bedroomToiletAreaFeet;
  String bedroomDressLengthFeet;
  String bedroomDressWidthFeet;
  String bedroomDressAreaFeet;

  factory ModelBedroom.fromJson(dynamic json) => ModelBedroom(
        id: json["id"],
        projectId: json["project_id"],
        bedroom: json["bedroom"],
        bedroomFloor: json["bedroom_floor"],
        bedroomLength: json["bedroom_length"],
        bedroomWidth: json["bedroom_width"],
        bedroomArea: json["bedroom_area"],
        bedroomToiletLength: json["bedroom_toilet_length"],
        bedroomToiletWidth: json["bedroom_toilet_width"],
        bedroomToiletArea: json["bedroom_toilet_area"],
        bedroomToiletReqText: json["bedroom_toilet_req_text"],
        bedroomDressReq: json["bedroom_dress_req"],
        bedroomDressLength: json["bedroom_dress_length"] == null
            ? null
            : json["bedroom_dress_length"],
        bedroomDressWidth: json["bedroom_dress_width"] == null
            ? null
            : json["bedroom_dress_width"],
        bedroomDressArea: json["bedroom_dress_area"] == null
            ? null
            : json["bedroom_dress_area"],
        bedroomDressFacility: json["bedroom_dress_facility"] == null
            ? null
            : json["bedroom_dress_facility"],
        bedroomDressReqText: json["bedroom_dress_req_text"] == null
            ? null
            : json["bedroom_dress_req_text"],
        bedroomImg: json["bedroom_img"],
        bedroomFacility: json["bedroom_facility"],
        bedroomFacilityReqText: json["bedroom_facility_req_text"],
        bedroomLengthFeet: json["bedroom_length_feet"],
        bedroomWidthFeet: json["bedroom_width_feet"],
        bedroomAreaFeet: json["bedroom_area_feet"],
        bedroomToiletLengthFeet: json["bedroom_toilet_length_feet"],
        bedroomToiletWidthFeet: json["bedroom_toilet_width_feet"],
        bedroomToiletAreaFeet: json["bedroom_toilet_area_feet"],
        bedroomDressLengthFeet: json["bedroom_dress_length_feet"] == null
            ? null
            : json["bedroom_dress_length_feet"],
        bedroomDressWidthFeet: json["bedroom_dress_width_feet"] == null
            ? null
            : json["bedroom_dress_width_feet"],
        bedroomDressAreaFeet: json["bedroom_dress_area_feet"] == null
            ? null
            : json["bedroom_dress_area_feet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "bedroom": bedroom,
        "bedroom_floor": bedroomFloor,
        "bedroom_length": bedroomLength,
        "bedroom_width": bedroomWidth,
        "bedroom_area": bedroomArea,
        "bedroom_toilet_length": bedroomToiletLength,
        "bedroom_toilet_width": bedroomToiletWidth,
        "bedroom_toilet_area": bedroomToiletArea,
        "bedroom_toilet_req_text": bedroomToiletReqText,
        "bedroom_dress_req": bedroomDressReq,
        "bedroom_dress_length":
            bedroomDressLength == null ? null : bedroomDressLength,
        "bedroom_dress_width":
            bedroomDressWidth == null ? null : bedroomDressWidth,
        "bedroom_dress_area":
            bedroomDressArea == null ? null : bedroomDressArea,
        "bedroom_dress_facility":
            bedroomDressFacility == null ? null : bedroomDressFacility,
        "bedroom_dress_req_text":
            bedroomDressReqText == null ? null : bedroomDressReqText,
        "bedroom_img": bedroomImg,
        "bedroom_facility": bedroomFacility,
        "bedroom_facility_req_text": bedroomFacilityReqText,
        "bedroom_length_feet": bedroomLengthFeet,
        "bedroom_width_feet": bedroomWidthFeet,
        "bedroom_area_feet": bedroomAreaFeet,
        "bedroom_toilet_length_feet": bedroomToiletLengthFeet,
        "bedroom_toilet_width_feet": bedroomToiletWidthFeet,
        "bedroom_toilet_area_feet": bedroomToiletAreaFeet,
        "bedroom_dress_length_feet":
            bedroomDressLengthFeet == null ? null : bedroomDressLengthFeet,
        "bedroom_dress_width_feet":
            bedroomDressWidthFeet == null ? null : bedroomDressWidthFeet,
        "bedroom_dress_area_feet":
            bedroomDressAreaFeet == null ? null : bedroomDressAreaFeet,
      };
}
