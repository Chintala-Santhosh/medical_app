// To parse this JSON data, do
//
//     final drugDetails = drugDetailsFromJson(jsonString);

import 'dart:convert';

List<DrugDetails> drugDetailsFromJson(String str) => List<DrugDetails>.from(json.decode(str).map((x) => DrugDetails.fromJson(x)));

String drugDetailsToJson(List<DrugDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DrugDetails {
  String title;
  String subTitle;
  String forwardIcon;
  String dropDownIcon;
  bool isSelected;

  DrugDetails({
    required this.title,
    required this.subTitle,
    required this.forwardIcon,
    required this.dropDownIcon,
    required this.isSelected,
  });

  factory DrugDetails.fromJson(Map<String, dynamic> json) => DrugDetails(
    title: json["title"],
    subTitle: json["subTitle"],
    forwardIcon: json["forwardIcon"],
    dropDownIcon: json["dropDownIcon"],
    isSelected: json["isSelected"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subTitle": subTitle,
    "forwardIcon": forwardIcon,
    "dropDownIcon": dropDownIcon,
    "isSelected": isSelected,
  };
}