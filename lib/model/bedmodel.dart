import 'dart:convert';

BedrooModel bedrooModelFromJson(String str) =>
    BedrooModel.fromJson(json.decode(str));

String bedrooModelToJson(BedrooModel data) => json.encode(data.toJson());

class BedrooModel {
  BedrooModel({
    this.bedtypes,
  });

  Bedtypes? bedtypes;

  factory BedrooModel.fromJson(Map<String, dynamic> json) => BedrooModel(
        bedtypes: Bedtypes.fromJson(json["bedtypes"]),
      );
  Map<String, dynamic> toJson() => {
        "bedtypes": bedtypes!.toJson(),
      };
}

class Bedtypes {
  Bedtypes({
    required this.bedroomLength,
    required this.bedRoomFloor,
    required this.bedRoomWidth,
    required this.bedRoomToiletLength,
    required this.bedRoomToiletWidth,
    required this.bedRoomToiletFacility,
    required this.bedroomDressLength,
    required this.bedroomDressWidth,
    required this.bedroomDressRequirment,
    required this.bedroomDressFacility,
    required this.bedroomImg,
    required this.bedroomFacility,
  });

  String? bedRoomFloor;
  String? bedroomLength;
  String? bedRoomWidth;
  String? bedRoomToiletLength;
  String? bedRoomToiletWidth;
  String? bedRoomToiletFacility;
  String? bedroomDressLength;
  String? bedroomDressWidth;
  String? bedroomDressRequirment;
  String? bedroomDressFacility;
  String? bedroomImg;
  String? bedroomFacility;
  String? bedroomFacilityRequirementText;
  
  factory Bedtypes.fromJson(Map<String, dynamic> json) => Bedtypes(
        bedroomLength: json["bedroomLength"],
        bedRoomFloor: json["bedRoomFloor"],
        bedRoomWidth: json["bedRoomWidth"],
        bedRoomToiletLength: json["bedRoomToiletLength"],
        bedRoomToiletWidth: json["bedRoomToiletWidth"],
        bedroomDressLength: json["bedroomDressLength"],
        bedroomDressWidth: json["bedroomDressWidth"],
        bedroomDressRequirment: json["bedroomDressRequirment"],
        bedroomDressFacility: json["bedroomDressFacility"],
        bedroomImg: json["bedroomImg"],
        bedroomFacility: json["bedroomFacility"], 
        bedRoomToiletFacility: json["bedRoomToiletFacility"],
      );

  Map<String, dynamic> toJson() => {
        "bedroomLength": bedroomLength,
        "bedRoomFloor": bedRoomFloor,
        "bedRoomWidth": bedRoomWidth,
        "bedRoomToiletLength": bedRoomToiletLength,
        "bedRoomToiletWidth": bedRoomToiletWidth,
        "bedroomDressLength": bedroomDressLength,
        "bedroomDressWidth": bedroomDressWidth,
        "bedroomDressRequirment": bedroomDressRequirment,
        "bedroomDressFacility": bedroomDressFacility,
        "bedroomImg": bedroomImg,
        "bedroomFacility": bedroomFacility,
        "bedroomFacilityRequirementText": bedroomFacilityRequirementText,
        "bedRoomToiletFacility" : bedRoomToiletFacility
      };
}



// class Bed {
  
//   String? name;
  
// }

// class BedModel {
//   String?   bedroomLength;
//   String?   bedroom;
//   int?      bedRoomFloor;
//   String?   bedRoomWidth;
//   String?   bedRoomArea;
//   String?   bedRoomToiletLength;
//   String?   bedRoomToiletWidth;
//   String?   bedRoomToiletArea;
//   String?   bedRoomToiletReqText;
//   String?   bedroomDressLength;
//   String?   bedroomDressWidth;
//   String?   bedroomDressArea;
//   String?   bedroomDressRequirment;
//   String?   bedroomDressFacility;
//   String?   bedroomDressRequirmentText;
//   String?   bedroomImg;
//   String?   bedroomFacility;
//   String?   bedroomFacilityRequirementText;
//   int?      index;
//   Function? removeServiceCard;

//   BedModel([
//     this.index,
//     this.removeServiceCard,
//     this.bedroomLength,
//     this.bedroom,
//     this.bedRoomFloor,
//     this.bedRoomWidth,
//     this.bedRoomArea,
//     this.bedRoomToiletLength,
//     this.bedRoomToiletWidth,
//     this.bedRoomToiletArea,
//     this.bedRoomToiletReqText,
//     this.bedroomDressLength,
//     this.bedroomDressWidth,
//     this.bedroomDressArea,
//     this.bedroomDressRequirment,
//     this.bedroomDressFacility,
//     this.bedroomDressRequirmentText,
//     this.bedroomImg,
//     this.bedroomFacility,
//     this.bedroomFacilityRequirementText,
//   ]);

//   Map toJson() => {
//         'bedroomLength':  bedroomLength,
//         'bedroom':  bedroom,
//         'bedRoomFloor':  bedRoomFloor,
//         'bedRoomWidth' :  bedRoomWidth,
//         'bedRoomArea' :  bedRoomArea,
//         'bedRoomToiletLength': bedRoomToiletLength,
//         'bedRoomToiletWidth':  bedRoomToiletWidth,     
//         'bedRoomToiletArea':  bedRoomToiletArea,     
//         'bedRoomToiletReqText' :  bedRoomToiletReqText,    
//         'bedroomDressLength': bedroomDressLength,      
//          "bedroomDressWidth" : bedroomDressWidth,       
//          "bedroomDressArea" : bedroomDressArea,
//          "bedroomDressRequirment" : bedroomDressRequirment,     
//          "bedroomDressFacility" : bedroomDressFacility,
//          "bedroomDressRequirmentText" : bedroomDressRequirmentText,
//          "bedroomImg" :   bedroomImg,
//          "bedroomFacility" :   bedroomFacility,
//          "bedroomFacilityRequirementText" :   bedroomFacilityRequirementText,
//          "index" :   index,
//          "removeServiceCard" :   removeServiceCard,
//       };
// }
