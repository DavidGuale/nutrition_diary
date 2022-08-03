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
        id: json["id"] == null ? null : json["id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        sex: json["sex"] == null ? null : json["sex"],
        age: json["age"] == null ? null : json["age"],
        state: json["state"] == null ? null : json["state"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "sex": sex == null ? null : sex,
        "age": age == null ? null : age,
        "state": state == null ? null : state,
      };
}
