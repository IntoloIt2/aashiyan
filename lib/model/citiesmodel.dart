// To parse this JSON data, do
//
//     final cirtyModel = cirtyModelFromJson(jsonString);

import 'dart:convert';

List<CirtyModel> cirtyModelFromJson(String str) => List<CirtyModel>.from(jsonDecode(str).map((x) => CirtyModel.fromJson(x)));

String cirtyModelToJson(CirtyModel data) => json.encode(data.toJson());

class CirtyModel{
    CirtyModel(
      {
        this.cities,
      });

    List<City>? cities;

    factory CirtyModel.fromJson(Map<String, dynamic> json) => CirtyModel(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
    };
}

class City {
    City({
        this.id,
        this.countryId,
        this.stateId,
        this.cityName,
    });

    int? id;
    String? countryId;
    String? stateId;
    String? cityName;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityName: json["city_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "country_id": countryId,
        "state_id": stateId,
        "city_name": cityName,
    };
}
