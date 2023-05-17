// To parse this JSON data, do
//
//     final policyModel = policyModelFromJson(jsonString);

import 'dart:convert';

List<PolicyModel> policyModelFromJson(String str) => List<PolicyModel>.from(json.decode(str).map((x) => PolicyModel.fromJson(x)));

String policyModelToJson(List<PolicyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PolicyModel {
  String policyName;
  String startDate;
  String status;
  String policyNo;
  String plan;

  PolicyModel({
    required this.policyName,
    required this.startDate,
    required this.status,
    required this.policyNo,
    required this.plan,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) => PolicyModel(
    policyName: json["policyName"],
    startDate: json["startDate"],
    status: json["status"],
    policyNo: json["policyNo"],
    plan: json["plan"],
  );

  Map<String, dynamic> toJson() => {
    "policyName": policyName,
    "startDate": startDate,
    "status": status,
    "policyNo": policyNo,
    "plan": plan,
  };
}
