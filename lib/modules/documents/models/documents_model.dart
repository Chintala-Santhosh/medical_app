// To parse this JSON data, do
//
//     final documentsModel = documentsModelFromJson(jsonString);

import 'dart:convert';

List<DocumentsModel> documentsModelFromJson(String str) => List<DocumentsModel>.from(json.decode(str).map((x) => DocumentsModel.fromJson(x)));

String documentsModelToJson(List<DocumentsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentsModel {
  String fileName;

  DocumentsModel({
    required this.fileName,
  });

  factory DocumentsModel.fromJson(Map<String, dynamic> json) => DocumentsModel(
    fileName: json["fileName"],
  );

  Map<String, dynamic> toJson() => {
    "fileName": fileName,
  };
}
