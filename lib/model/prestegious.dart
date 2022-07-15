// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
         this.prestigiousImage,
         this.recentProjectImage,
    });

    List<Image>? prestigiousImage;
    List<Image>? recentProjectImage;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        prestigiousImage: List<Image>.from(json["prestigious_image"].map((x) => Image.fromJson(x))),
        recentProjectImage: List<Image>.from(json["recent_project_image"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "prestigious_image": List<dynamic>.from(prestigiousImage!.map((x) => x.toJson())),
        "recent_project_image": List<dynamic>.from(recentProjectImage!.map((x) => x.toJson())),
    };
}

class Image {
    Image({
        required this.id,
        required this.imgType,
        required this.imgTitle,
        required this.imgPath,
    });

    int id;
    String imgType;
    String imgTitle;
    String imgPath;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        imgType: json["img_type"],
        imgTitle: json["img_title"],
        imgPath: json["img_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "img_type": imgType,
        "img_title": imgTitle,
        "img_path": imgPath,
    };
}
