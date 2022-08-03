import 'dart:convert';

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.sex,
    this.age,
    this.state,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? sex;
  String? age;
  String? state;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        sex: json["sex"],
        age: json["age"],
        state: json["state"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "sex": sex,
        "age": age,
        "state": state,
      };
}
