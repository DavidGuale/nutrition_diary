import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/models/daily_register_model.dart';
import '../local/error_handler.dart';

class DailyRegisterAPI {
  final _dio = Get.i.find<Dio>();
  final _storage = Get.i.find<FlutterSecureStorage>();

  Future<Map<String, dynamic>> getDailyRegistersByUser(id) async {
    Map<String, dynamic> newResponse = {};
    final token = await _storage.read(key: 'token');

    try {
      final response = await _dio.get(
        '/',
        options: Options(
          headers: {
            'x-token': token,
          },
        ),
      );
      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }

  Future<Map<String, dynamic>> insertDailyRegister(
      Registro dailyRegister) async {
    Map<String, dynamic> newResponse = {};
    final token = await _storage.read(key: 'token');

    try {
      final response = await _dio.post(
        'registro_diario',
        data: dailyRegister.toJson(),
        options: Options(
          headers: {
            'x-token': token,
          },
        ),
      );
      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }
}
