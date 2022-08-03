import 'package:flutter_meedu/flutter_meedu.dart';

import '../../../../domain/models/daily_register_model.dart';
import '../../../../domain/models/product_model.dart';
import '../../../../domain/repository/daily_register_repository.dart';
import '../../home/home_page.dart';

class ProductController extends SimpleNotifier {
  final _dailyRegisterRepository = Get.i.find<DailyRegisterRepository>();

  // final _imagesRepository = Get.i.find<ImagesRepository>();

  ProductController() {
    //verificando inicio de controlador
    // getProducts();
  }

  Product _product = Product();
  Map<String, dynamic> map = <String, dynamic>{};

// gets
  Product get product => _product;

  set product(Product value) {
    _product = value;
    notify();
  }

  Future<bool> insertDailyRegister() async {
    Registro register = Registro(
        idProducto: _product.id,
        idUsuario: 1,
        comida: homeProvider.read.comida,
        porcion: 1);
    Map<String, dynamic> response = await _dailyRegisterRepository
        .insertDailyRegister(dailyRegister: register);
    // print('response insert: $response');
    // _products = imagesResponse.registros!;

    if (response['error'] != null) {
      map = {"estado": -1, "msg": response["msg"]};
      return false;
    } else {
      notify();
      return true;
    }
  }
}
