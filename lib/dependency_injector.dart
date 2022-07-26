import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app/data/repository_impl/daily_register_repository_impl.dart';
import 'app/data/repository_impl/product_repository_impl.dart';
import 'app/data/resources/remote/daily_register_api.dart';
import 'app/data/resources/remote/product_api.dart';
import 'app/domain/repository/daily_register_repository.dart';
import 'app/domain/repository/product_repository.dart';

void injectDependencies() {
  //var's
  const _storage = FlutterSecureStorage();
  final _dio = Dio(BaseOptions(
      baseUrl: 'https://microservice-alimentation.herokuapp.com/alimentation'));
  (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  Get.i.put<Dio>(_dio);

  //Injections
  Get.i.lazyPut<FlutterSecureStorage>(() => _storage);

  final ProductRepository _imagesRepository =
      ProductRepositoryImpl(ProductAPI());
  Get.i.lazyPut<ProductRepository>(() => _imagesRepository);

  final DailyRegisterRepository _dailyRegisterRepository =
      DailyRegisterRepositoryImpl(DailyRegisterAPI());
  Get.i.lazyPut<DailyRegisterRepository>(() => _dailyRegisterRepository);
}
