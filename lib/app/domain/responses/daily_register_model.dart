// To parse this JSON data, do
//
//     final dailyRegistersResponse = dailyRegistersResponseFromMap(jsonString);

import 'dart:convert';

import '../models/product_micro_model.dart';
import '../models/user_model.dart';

// To parse this JSON data, do
//
//     final dailyRegistersResponse = dailyRegistersResponseFromMap(jsonString);

class DailyRegisterModel {
  DailyRegisterModel({
    this.id,
    this.comida,
    this.name,
    this.porcion,
    this.userId,
    this.productos,
    this.user,
    this.createAt,
  });

  int? id;
  int? comida;
  String? name;
  double? porcion;
  int? userId;
  List<Producto>? productos;
  User? user;
  DateTime? createAt;

  factory DailyRegisterModel.fromJson(String str) =>
      DailyRegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyRegisterModel.fromMap(Map<String, dynamic> json) =>
      DailyRegisterModel(
        id: json["id"],
        comida: json["comida"],
        name: json["name"],
        porcion: json["porcion"] ?? 0.0,
        userId: json["userId"],
        productos: json["productos"] == null
            ? []
            : List<Producto>.from(
                json["productos"].map((x) => Producto.fromMap(x))),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        createAt:
            json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "comida": comida,
        "name": name,
        "porcion": porcion,
        "userId": userId,
        "productos": productos == null
            ? null
            : List<dynamic>.from(productos!.map((x) => x.toMap())),
        "user": user == null ? null : user!.toMap(),
        "createAt": createAt == null
            ? null
            : "${createAt!.year.toString().padLeft(4, '0')}-${createAt!.month.toString().padLeft(2, '0')}-${createAt!.day.toString().padLeft(2, '0')}",
      };
}
