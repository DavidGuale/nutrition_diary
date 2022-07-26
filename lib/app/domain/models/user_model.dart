import 'dart:convert';

class User {
  User({
    this.name,
  });

  String? name;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
      };
}
