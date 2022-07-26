// To parse this JSON data, do
//
//     final dailyRegistersResponse = dailyRegistersResponseFromMap(jsonString);

import 'dart:convert';

class NaturalLanguageResponse {
  NaturalLanguageResponse({
    this.entities,
    this.language,
  });

  List<Entity>? entities;
  String? language;

  factory NaturalLanguageResponse.fromJson(String str) =>
      NaturalLanguageResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NaturalLanguageResponse.fromMap(Map<String, dynamic> json) =>
      NaturalLanguageResponse(
        entities:
            List<Entity>.from(json["entities"].map((x) => Entity.fromMap(x))),
        language: json["language"],
      );

  Map<String, dynamic> toMap() => {
        "entities": List<dynamic>.from(entities!.map((x) => x.toMap())),
        "language": language,
      };
}

class Entity {
  Entity({
    this.name,
    this.type,
    this.metadata,
    this.salience,
    this.mentions,
  });

  String? name;
  String? type;
  Metadata? metadata;
  double? salience;
  List<Mention>? mentions;

  factory Entity.fromJson(String str) => Entity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Entity.fromMap(Map<String, dynamic> json) => Entity(
        name: json["name"],
        type: json["type"],
        metadata: Metadata.fromMap(json["metadata"]),
        salience: json["salience"].toDouble(),
        mentions:
            List<Mention>.from(json["mentions"].map((x) => Mention.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "type": type,
        "metadata": metadata!.toMap(),
        "salience": salience,
        "mentions": List<dynamic>.from(mentions!.map((x) => x.toMap())),
      };
}

class Mention {
  Mention({
    this.text,
    this.type,
  });

  Text? text;
  String? type;

  factory Mention.fromJson(String str) => Mention.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mention.fromMap(Map<String, dynamic> json) => Mention(
        text: Text.fromMap(json["text"]),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "text": text!.toMap(),
        "type": type,
      };
}

class Text {
  Text({
    this.content,
    this.beginOffset,
  });

  String? content;
  int? beginOffset;

  factory Text.fromJson(String str) => Text.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Text.fromMap(Map<String, dynamic> json) => Text(
        content: json["content"],
        beginOffset: json["beginOffset"],
      );

  Map<String, dynamic> toMap() => {
        "content": content,
        "beginOffset": beginOffset,
      };
}

class Metadata {
  Metadata({
    this.value,
  });

  String? value;

  factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "value": value == null ? null : value,
      };
}
