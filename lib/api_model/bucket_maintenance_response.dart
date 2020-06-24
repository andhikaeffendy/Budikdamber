// To parse this JSON data, do
//
//     final bucketMaintenanceResponse = bucketMaintenanceResponseFromJson(jsonString);

import 'dart:convert';

BucketMaintenanceResponse bucketMaintenanceResponseFromJson(String str) => BucketMaintenanceResponse.fromJson(json.decode(str));

String bucketMaintenanceResponseToJson(BucketMaintenanceResponse data) => json.encode(data.toJson());

class BucketMaintenanceResponse {
  BucketMaintenanceResponse({
    this.data,
    this.status,
    this.message,
  });

  List<Datum> data;
  String status;
  String message;

  factory BucketMaintenanceResponse.fromJson(Map<String, dynamic> json) => BucketMaintenanceResponse(
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
    this.mainDate,
    this.mainStatus,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  DateTime mainDate;
  int mainStatus;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    mainDate: DateTime.parse(json["main_date"]),
    mainStatus: json["main_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "main_date": "${mainDate.year.toString().padLeft(4, '0')}-${mainDate.month.toString().padLeft(2, '0')}-${mainDate.day.toString().padLeft(2, '0')}",
    "main_status": mainStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
