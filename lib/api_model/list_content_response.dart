// To parse this JSON data, do
//
//     final listContentResponse = listContentResponseFromJson(jsonString);

import 'dart:convert';

ListContentResponse listContentResponseFromJson(String str) => ListContentResponse.fromJson(json.decode(str));

String listContentResponseToJson(ListContentResponse data) => json.encode(data.toJson());

class ListContentResponse {
  ListContentResponse({
    this.data,
    this.status,
    this.message,
  });

  List<Datum> data;
  String status;
  String message;

  factory ListContentResponse.fromJson(Map<String, dynamic> json) => ListContentResponse(
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
    this.title,
    this.body,
    this.image,
    this.youtubeId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String body;
  String image;
  String youtubeId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    image: json["image"],
    youtubeId: json["youtube_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "image": image,
    "youtube_id": youtubeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
