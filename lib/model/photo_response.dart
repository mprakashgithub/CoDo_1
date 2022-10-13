// To parse this JSON data, do
//
//     final photoResponse = photoResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PhotoResponse> photoResponseFromJson(String str) =>
    List<PhotoResponse>.from(
        json.decode(str).map((x) => PhotoResponse.fromJson(x)));

String photoResponseToJson(List<PhotoResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoResponse {
  PhotoResponse({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotoResponse.fromJson(Map<String, dynamic> json) => PhotoResponse(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
