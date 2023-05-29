// To parse this JSON data, do
//
//     final documentsModel = documentsModelFromJson(jsonString);

import 'dart:convert';

List<DocumentsModel> documentsModelFromJson(String str) => List<DocumentsModel>.from(json.decode(str).map((x) => DocumentsModel.fromJson(x)));

String documentsModelToJson(List<DocumentsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentsModel {
  String fileName;
  String date;

  DocumentsModel({
    required this.fileName,
    required this.date,
  });

  factory DocumentsModel.fromJson(Map<String, dynamic> json) => DocumentsModel(
    fileName: json["fileName"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "fileName": fileName,
    "date": date,
  };
}
