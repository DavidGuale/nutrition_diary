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
        id: json["id"] ?? '0',
        name: json["name"] ?? 'producto',
        quantity: json["quantity"] ?? '0',
        imageUrl: json["imageUrl"] ?? '',
        nutriments: json["nutriments"] == null
            ? null
            : Nutriments.fromMap(json["nutriments"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "imageUrl": imageUrl ?? '',
        "nutriments": nutriments == null ? null : nutriments!.toMap(),
      };
}
