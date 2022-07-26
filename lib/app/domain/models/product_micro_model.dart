import 'dart:convert';

import 'nutriments_model.dart';

class Producto {
  Producto({
    this.id,
    this.name,
    this.quantity,
    this.imageUrl,
    this.nutriments,
  });

  String? id;
  String? name;
  String? quantity;
  String? imageUrl;
  Nutriments? nutriments;

  factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        imageUrl: json["imageUrl"] == null ? '' : json["imageUrl"],
        nutriments: json["nutriments"] == null
            ? null
            : Nutriments.fromMap(json["nutriments"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "quantity": quantity == null ? null : quantity,
        "imageUrl": imageUrl == null ? '' : imageUrl,
        "nutriments": nutriments == null ? null : nutriments!.toMap(),
      };
}
