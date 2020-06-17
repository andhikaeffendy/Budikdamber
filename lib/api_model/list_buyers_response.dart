// To parse this JSON data, do
//
//     final listBuyersResponse = listBuyersResponseFromJson(jsonString);

import 'dart:convert';

ListBuyersResponse listBuyersResponseFromJson(String str) => ListBuyersResponse.fromJson(json.decode(str));

String listBuyersResponseToJson(ListBuyersResponse data) => json.encode(data.toJson());

class ListBuyersResponse {
  ListBuyersResponse({
    this.data,
    this.status,
    this.message,
  });

  List<Datum> data;
  String status;
  String message;

  factory ListBuyersResponse.fromJson(Map<String, dynamic> json) => ListBuyersResponse(
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
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String address;
  String phoneNumber;
  String lat;
  String long;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    phoneNumber: json["phone_number"],
    lat: json["lat"],
    long: json["long"],
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
