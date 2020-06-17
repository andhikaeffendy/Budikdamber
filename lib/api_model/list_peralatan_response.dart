// To parse this JSON data, do
//
//     final listPeralatanResponse = listPeralatanResponseFromJson(jsonString);

import 'dart:convert';

ListPeralatanResponse listPeralatanResponseFromJson(String str) => ListPeralatanResponse.fromJson(json.decode(str));

String listPeralatanResponseToJson(ListPeralatanResponse data) => json.encode(data.toJson());

class ListPeralatanResponse {
  ListPeralatanResponse({
    this.data,
    this.status,
    this.message,
  });

  List<Datum> data;
  String status;
  String message;

  factory ListPeralatanResponse.fromJson(Map<String, dynamic> json) => ListPeralatanResponse(
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
    this.description,
    this.image,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  String image;
  dynamic createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
