// To parse this JSON data, do
//
//     final listSetupProcessResponse = listSetupProcessResponseFromJson(jsonString);

import 'dart:convert';

ListSetupProcessResponse listSetupProcessResponseFromJson(String str) => ListSetupProcessResponse.fromJson(json.decode(str));

String listSetupProcessResponseToJson(ListSetupProcessResponse data) => json.encode(data.toJson());

class ListSetupProcessResponse {
  ListSetupProcessResponse({
    this.data,
    this.status,
    this.message,
  });

  List<Datum> data;
  String status;
  String message;

  factory ListSetupProcessResponse.fromJson(Map<String, dynamic> json) => ListSetupProcessResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.daysAfter,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int daysAfter;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    daysAfter: json["days_after"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "days_after": daysAfter,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
