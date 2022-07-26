import 'dart:convert';

import 'daily_register_model.dart';

DailyRegistersResponse productsResponseFromMap(String str) =>
    DailyRegistersResponse.fromMap(json.decode(str));

String productsResponseToMap(DailyRegistersResponse data) =>
    json.encode(data.toMap());

class DailyRegistersResponse {
  DailyRegistersResponse({
    this.registers,
  });

  List<DailyRegisterModel>? registers;

  // factory DailyRegistersResponse.fromMap(Map<String, dynamic> json) =>
  //     DailyRegistersResponse(
  //       registers: List<DailyRegisterModel>.from(
  //           json[0].map((x) => Product.fromMap(x))),
  //     );

  factory DailyRegistersResponse.fromMap(List<dynamic> json) =>
      DailyRegistersResponse(
        registers: List<DailyRegisterModel>.from(
            json.map((x) => DailyRegisterModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "registers": List<dynamic>.from(registers!.map((x) => x.toMap())),
      };
}
