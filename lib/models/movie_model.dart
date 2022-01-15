import 'dart:convert';

//  List Album albumFromJson(String str) => Album.fromJson(json.decode(str));

// String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int? albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"] ?? " ",
        thumbnailUrl: json["thumbnailUrl"] ?? '',
      );
}
