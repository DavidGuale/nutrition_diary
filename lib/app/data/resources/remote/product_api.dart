import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../local/error_handler.dart';

class ProductAPI {
  final _dio = Get.i.find<Dio>();
  final dio = Dio();
  final _storage = Get.i.find<FlutterSecureStorage>();

  // int employeeId = await _userRepository.searchEmployeeId(user: user);

  // Future<Map<String, dynamic>> uploadCOrder(
  //   int user,
  //   Product product,
  // ) async {
  //   Map<String, dynamic> newResponse = {};

  //   try {
  //     final response = await _dio.post('pedidos/insertarLote', data: {
  //       "pedidos": [
  //         {
  //           "uac": {
  //             "usuario": user,
  //           },
  //           "id": product.id,
  //         },
  //       ],
  //     });
  //     newResponse = returnResponse(response);
  //   } on DioError catch (e) {
  //     newResponse = returnResponse(e.response);
  //   }
  //   return newResponse;
  // }

  // Future<Map<String, dynamic>> getProducts() async {
  //   Map<String, dynamic> newResponse = {};
  //   final token = await _storage.read(key: 'token');

  //   try {
  //     final response = await _dio.get(
  //       'productos',
  //       options: Options(
  //         headers: {
  //           'x-token': token,
  //         },
  //       ),
  //     );
  //     newResponse = returnResponse(response);
  //   } on DioError catch (e) {
  //     newResponse = returnResponse(e.response);
  //   }
  //   return newResponse;
  // }

  Future<Map<String, dynamic>> getProducts() async {
    Map<String, dynamic> newResponse = {};

    try {
      final response = await _dio.get(
        'productos',
        options: Options(),
      );
      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    Map<String, dynamic> newResponse = {};
    final token = await _storage.read(key: 'token');

    try {
      final response = await _dio.get(
        'productos/$id',
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

  Future<Map<String, dynamic>> getProductByBarcode(String barcode) async {
    Map<String, dynamic> newResponse = {};
    final token = await _storage.read(key: 'token');

    try {
      final response = await _dio.get(
        'productos/codigo/$barcode',
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

  Future<Map<String, dynamic>> getProductByName(String name) async {
    Map<String, dynamic> newResponse = {};

    try {
      final response =
          await dio.get('https://productosmicroapi.herokuapp.com/api/$name');
      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }

  Future<Map<String, dynamic>> getProductsSearch(String name) async {
    Map<String, dynamic> newResponse = {};
    final token = await _storage.read(key: 'token');

    try {
      final response = await _dio.post(
        'productos/nombre',
        data: {
          "nombre": name,
        },
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
