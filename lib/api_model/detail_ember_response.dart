// To parse this JSON data, do
//
//     final detailEmberResponse = detailEmberResponseFromJson(jsonString);

import 'dart:convert';

DetailEmberResponse detailEmberResponseFromJson(String str) => DetailEmberResponse.fromJson(json.decode(str));

String detailEmberResponseToJson(DetailEmberResponse data) => json.encode(data.toJson());

class DetailEmberResponse {
  DetailEmberResponse({
    this.data,
    this.status,
    this.message,
  });

  Data data;
  String status;
  String message;

  factory DetailEmberResponse.fromJson(Map<String, dynamic> json) => DetailEmberResponse(
    data: Data.fromJson(json["data"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
    "message": message,
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.embedDate,
    this.fishesAge,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  DateTime embedDate;
  int fishesAge;
  int createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    embedDate: DateTime.parse(json["embed_date"]),
    fishesAge: json["fishes_age"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "embed_date": "${embedDate.year.toString().padLeft(4, '0')}-${embedDate.month.toString().padLeft(2, '0')}-${embedDate.day.toString().padLeft(2, '0')}",
    "fishes_age": fishesAge,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
