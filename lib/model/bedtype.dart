import 'dart:convert';

// BedrooModel bedrooModelFromJson(String str) =>
//     BedrooModel.fromJson(json.decode(str));

String bedrooModelToJson(BedrooModel data) => json.encode(data.toJson());


class BedrooModel {
  BedrooModel({
    this.bedtypes,
  });
  Bedtypes? bedtypes;

  // factory BedrooModel.fromJson(Map<String, dynamic> json) => BedrooModel(
  //       bedtypes: Bedtypes.fromJson(json["bedtypes"]),
  //     );
  Map<String, dynamic> toJson() => {
        "bedtypes": bedtypes!.toJson(),
      };
}

class Bedtypes {
  Bedtypes(
      {required this.bedroomLength,
      required this.bedRoomFloor,
      required this.bedRoomWidth,
      required this.bedRoomToiletLength,
      required this.bedRoomToiletWidth,
      required this.bedRoomToiletFacility,
      required this.bedroomDressLength,
      required this.bedroomDressWidth,
      required this.bedroomDressFacility,
      required this.bedroomImg,
      required this.bedroomFacility,
      required this.bedroomName,
      required this.bedroomDressReq,
      required this.bedroomDressText,
      required this.bedroomText});

  int? bedRoomFloor;
  int? bedroomLength;
  int? bedRoomWidth;
  int? bedRoomToiletLength;
  int? bedRoomToiletWidth;
  String? bedRoomToiletFacility;
  int? bedroomDressLength;
  int? bedroomDressWidth;
  List? bedroomDressFacility;
  String? bedroomImg;
  List? bedroomFacility;
  String? bedroomName;
  int? bedroomDressReq;
  String? bedroomDressText;
  String? bedroomText;

  // factory Bedtypes.fromJson(Map<String, dynamic> json) => Bedtypes(
  //     bedroomLength: json["bedroomLength"],
  //     bedRoomFloor: json["bedRoomFloor"],
  //     bedRoomWidth: json["bedRoomWidth"],
  //     bedRoomToiletLength: json["bedRoomToiletLength"],
  //     bedRoomToiletWidth: json["bedRoomToiletWidth"],
  //     bedroomDressLength: json["bedroomDressLength"],
  //     bedroomDressWidth: json["bedroomDressWidth"],
  //     bedroomDressFacility: json["bedroomDressFacility"],
  //     bedroomImg: json["bedroomImg"],
  //     bedroomFacility: json["bedroomFacility"],
  //     bedRoomToiletFacility: json["bedRoomToiletFacility"],
  //     bedroomName: json['bedroomName'],
  //     bedroomDressReq: json['bedroom'],
  //     bedroomDressText: json['bedroomDressText'],
  //     bedroomText: json['bedroomText']);

  Map<String, dynamic> toJson() 
  => {
        "bedroom": bedroomName,
        "bedroom_floor": bedRoomFloor,
        "bedroom_length": bedroomLength,
        "bedroom_width": bedRoomWidth,
        "bedroom_toilet_length": bedRoomToiletLength,
        "bedroom_toilet_width": bedRoomToiletWidth,
        "bedroom_toilet_req_text": bedRoomToiletFacility,
        "bedroom_dress_req": bedroomDressReq,
        "bedroom_dress_length": bedroomDressLength,
        "bedroom_dress_width": bedroomDressWidth,
        "bedroom_dress_facility": bedroomDressFacility,
        "bedroom_dress_req_text": bedroomDressText,
        "bedroom_facility": bedroomFacility,
        "bedroom_facility_req_text": bedroomText

      };
}

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

  Map toJson() => {
        'bedroomLength': bedroomLength,
        'bedroom': bedroom,
        'bedRoomFloor': bedRoomFloor,
        'bedRoomWidth': bedRoomWidth,
        'bedRoomArea': bedRoomArea,
        'bedRoomToiletLength': bedRoomToiletLength,
        'bedRoomToiletWidth': bedRoomToiletWidth,
        'bedRoomToiletArea': bedRoomToiletArea,
        'bedRoomToiletReqText': bedRoomToiletReqText,
        'bedroomDressLength': bedroomDressLength,
        "bedroomDressWidth": bedroomDressWidth,
        "bedroomDressArea": bedroomDressArea,
        "bedroomDressRequirment": bedroomDressRequirment,
        "bedroomDressFacility": bedroomDressFacility,
        "bedroomDressRequirmentText": bedroomDressRequirmentText,
        "bedroomImg": bedroomImg,
        "bedroomFacility": bedroomFacility,
        "bedroomFacilityRequirementText": bedroomFacilityRequirementText,
        "index": index,
        "removeServiceCard": removeServiceCard,
      };
}

class JsonFront {
    JsonFront({
      required this.dimension,
      required  this.projectId,
    });

    int dimension;
    int projectId;

    factory JsonFront.fromJson(Map<String, dynamic> json) => JsonFront(
        dimension: json["dimension"],
        projectId: json["project_id"],
    );

    Map<String, dynamic> toJson() => {
        "dimension": dimension,
        "project_id": projectId,
    };
}
