// To parse this JSON data, do
//
//     final cardItem = cardItemFromJson(jsonString);

import 'dart:convert';

CardItem cardItemFromJson(String str) => CardItem.fromJson(json.decode(str));

String cardItemToJson(CardItem data) => json.encode(data.toJson());

class CardItem {
  CardItem({
    this.title,
    this.imagePath,
    this.id,
  });

  String? title;
  String? imagePath;
  int? id;

  factory CardItem.fromJson(Map<String, dynamic> json) => CardItem(
        title: json["title"],
        imagePath: json["image_path"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image_path": imagePath,
        "id": id,
      };
}
