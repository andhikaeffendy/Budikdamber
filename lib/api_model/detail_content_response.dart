// To parse this JSON data, do
//
//     final detailContentResponse = detailContentResponseFromJson(jsonString);

import 'dart:convert';

DetailContentResponse detailContentResponseFromJson(String str) => DetailContentResponse.fromJson(json.decode(str));

String detailContentResponseToJson(DetailContentResponse data) => json.encode(data.toJson());

class DetailContentResponse {
  DetailContentResponse({
    this.data,
    this.status,
    this.message,
  });

  Data data;
  String status;
  String message;

  factory DetailContentResponse.fromJson(Map<String, dynamic> json) => DetailContentResponse(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
