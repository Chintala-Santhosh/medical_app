// To parse this JSON data, do
//
//     final notesModel = notesModelFromJson(jsonString);

import 'dart:convert';

List<NotesModel> notesModelFromJson(String str) => List<NotesModel>.from(json.decode(str).map((x) => NotesModel.fromJson(x)));

String notesModelToJson(List<NotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotesModel {
  String message;

  NotesModel({
    required this.message,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
