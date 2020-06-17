// To parse this JSON data, do
//
//     final listSuppliersResponse = listSuppliersResponseFromJson(jsonString);

import 'dart:convert';

ListSuppliersResponse listSuppliersResponseFromJson(String str) => ListSuppliersResponse.fromJson(json.decode(str));

String listSuppliersResponseToJson(ListSuppliersResponse data) => json.encode(data.toJson());

class ListSuppliersResponse {
  ListSuppliersResponse({
    this.data,
    this.status,
    this.message,
  });

  List<Datum> data;
  String status;
  String message;

  factory ListSuppliersResponse.fromJson(Map<String, dynamic> json) => ListSuppliersResponse(
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
    this.address,
    this.phoneNumber,
    this.lat,
    this.long,
    this.tools,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String address;
  String phoneNumber;
  String lat;
  String long;
  String tools;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    phoneNumber: json["phone_number"],
    lat: json["lat"],
    long: json["long"],
    tools: json["tools"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "phone_number": phoneNumber,
    "lat": lat,
    "long": long,
    "tools": tools,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
