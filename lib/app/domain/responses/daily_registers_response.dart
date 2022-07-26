// // To parse this JSON data, do
// //
// //     final dailyRegistersResponse = dailyRegistersResponseFromMap(jsonString);

// import 'dart:convert';

// import '../models/product_micro_model.dart';
// import '../models/user_model.dart';

// class DailyRegistersResponse {
//   DailyRegistersResponse({
//     this.id,
//     this.comida,
//     this.name,
//     this.porcion,
//     this.userId,
//     this.productos,
//     this.user,
//     this.createAt,
//   });

//   int? id;
//   int? comida;
//   String? name;
//   int? porcion;
//   int? userId;
//   List<Producto>? productos;
//   User? user;
//   DateTime? createAt;

//   factory DailyRegistersResponse.fromJson(String str) =>
//       DailyRegistersResponse.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory DailyRegistersResponse.fromMap(Map<String, dynamic> json) =>
//       DailyRegistersResponse(
//         id: json["id"] == null ? null : json["id"],
//         comida: json["comida"] == null ? null : json["comida"],
//         name: json["name"] == null ? null : json["name"],
//         porcion: json["porcion"] == null ? null : json["porcion"],
//         userId: json["userId"] == null ? null : json["userId"],
//         productos: json["productos"] == null
//             ? null
//             : List<Producto>.from(
//                 json["productos"].map((x) => Producto.fromMap(x))),
//         user: json["user"] == null ? null : User.fromMap(json["user"]),
//         createAt:
//             json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "comida": comida == null ? null : comida,
//         "name": name == null ? null : name,
//         "porcion": porcion == null ? null : porcion,
//         "userId": userId == null ? null : userId,
//         "productos": productos == null
//             ? null
//             : List<dynamic>.from(productos!.map((x) => x.toMap())),
//         "user": user == null ? null : user!.toMap(),
//         "createAt": createAt == null
//             ? null
//             : "${createAt!.year.toString().padLeft(4, '0')}-${createAt!.month.toString().padLeft(2, '0')}-${createAt!.day.toString().padLeft(2, '0')}",
//       };
// }
