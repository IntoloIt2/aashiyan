// To parse this JSON data, do
//
//     final requirementModel = requirementModelFromJson(jsonString);

import 'dart:convert';

RequirementModel requirementModelFromJson(String str) =>
    RequirementModel.fromJson(json.decode(str));

String requirementModelToJson(RequirementModel data) =>
    json.encode(data.toJson());

class RequirementModel {
  RequirementModel({
     this.userId,
     this.prefix,
     this.firstName,
     this.lastName,
     this.phone,
     this.country,
     this.state,
     this.city,
     this.address,
  });

  int? userId;
  String? prefix;
  String? firstName;
  String? lastName;
  String? phone;
  int? country;
  int? state;
  String? city;
  String? address;

  factory RequirementModel.fromJson(Map<String, dynamic> json) =>
      RequirementModel(
        userId: json["user_id"],
        prefix: json["prefix"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "prefix": prefix,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "country": country,
        "state": state,
        "city": city,
        "address": address,
      };
}
