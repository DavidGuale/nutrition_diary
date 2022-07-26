import 'dart:convert';

class UserParameters {
  UserParameters({
    this.objective,
    this.activityLevelValue,
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.desiredWeight,
  });

  int? objective;
  int? activityLevelValue;
  int? age;
  int? gender;
  double? height;
  double? weight;
  double? desiredWeight;

  factory UserParameters.fromJson(String str) =>
      UserParameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserParameters.fromMap(Map<String, dynamic> json) => UserParameters(
        objective: json["objective"],
        activityLevelValue: json["activityLevelValue"],
        age: json["age"],
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
        desiredWeight: json["desiredWeight"],
      );

  Map<String, dynamic> toMap() => {
        "objective": objective,
        "activityLevelValue": activityLevelValue,
        "age": age,
        "gender": gender,
        "height": height,
        "weight": weight,
        "desiredWeight": desiredWeight,
      };
}
