import 'dart:convert';

class Ingredient {
  Ingredient({
    this.text,
    this.percentEstimate,
    this.percentMax,
    this.percentMin,
  });

  String? text;
  double? percentEstimate;
  double? percentMax;
  double? percentMin;

  factory Ingredient.fromJson(String str) =>
      Ingredient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        percentEstimate: json["percentEstimate"].toDouble(),
        percentMax: json["percentMax"].toDouble(),
        percentMin: json["percentMin"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "percentEstimate": percentEstimate,
        "percentMax": percentMax,
        "percentMin": percentMin,
      };
}
