// To parse this JSON data, do
//
//     final drugDetails = drugDetailsFromJson(jsonString);

import 'dart:convert';

List<DrugDetails> drugDetailsFromJson(String str) => List<DrugDetails>.from(json.decode(str).map((x) => DrugDetails.fromJson(x)));

String drugDetailsToJson(List<DrugDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DrugDetails {
  String title;
  String subTitle;
  String iconImage;

  DrugDetails({
    required this.title,
    required this.subTitle,
    required this.iconImage,
  });

  factory DrugDetails.fromJson(Map<String, dynamic> json) => DrugDetails(
    title: json["title"],
    subTitle: json["subTitle"],
    iconImage: json["iconImage"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subTitle": subTitle,
    "iconImage": iconImage,
  };
}