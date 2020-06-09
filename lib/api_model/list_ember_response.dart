// To parse this JSON data, do
//
//     final listEmberResponse = listEmberResponseFromJson(jsonString);

import 'dart:convert';

ListEmberResponse listEmberResponseFromJson(String str) => ListEmberResponse.fromJson(json.decode(str));

String listEmberResponseToJson(ListEmberResponse data) => json.encode(data.toJson());

class ListEmberResponse {
  ListEmberResponse({
    this.data,
    this.status,
    this.message,
  });

  List<Ember> data;
  String status;
  String message;

  factory ListEmberResponse.fromJson(Map<String, dynamic> json) => ListEmberResponse(
    data: List<Ember>.from(json["data"].map((x) => Ember.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Ember {
  Ember({
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

  factory Ember.fromJson(Map<String, dynamic> json) => Ember(
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
