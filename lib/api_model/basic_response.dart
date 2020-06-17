// To parse this JSON data, do
//
//     final basicResponse = basicResponseFromJson(jsonString);

import 'dart:convert';

BasicResponse basicResponseFromJson(String str) => BasicResponse.fromJson(json.decode(str));

String basicResponseToJson(BasicResponse data) => json.encode(data.toJson());

class BasicResponse {
  BasicResponse({
    this.status,
    this.message,
  });

  String status;
  String message;

  factory BasicResponse.fromJson(Map<String, dynamic> json) => BasicResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
