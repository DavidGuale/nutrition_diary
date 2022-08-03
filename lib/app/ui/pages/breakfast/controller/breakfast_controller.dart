import 'package:flutter_meedu/flutter_meedu.dart';

import '../../../../domain/models/product_model.dart';
import '../../../../domain/responses/daily_register_model.dart';
import '../../home/home_page.dart';

class BreakfastController extends SimpleNotifier {
  BreakfastController() {
    init();
  }
  //variables

  int _totalCalories = 0;
  int _caloriesGoal = 2100;
  double _caloriesConsumed = 0;
  List<DailyRegisterModel> _productsRegistered = homeProvider
      .read.productsRegistered
      .where((element) => element.comida == 1)
      .toList();

  //Gets
  int get totalCalories => _totalCalories;
  int get caloriesGoal => _caloriesGoal;
  double get caloriesConsumed => _caloriesConsumed;
  List<DailyRegisterModel> get products => _productsRegistered;
  Map<String, dynamic> map = <String, dynamic>{};
  List<Product> _product = [];

// gets
  List<Product> get product => _product;

  set product(List<Product> value) {
    _product = value;
    notify();
  }

  //set's
  set products(List<DailyRegisterModel> value) {
    _productsRegistered = value;
    notify();
  }

  set totalCalories(int value) {
    _totalCalories = value;
    notify();
  }

  set caloriesGoal(int value) {
    _caloriesGoal = value;
    notify();
  }

  set caloriesConsumed(double value) {
    _caloriesConsumed = value;
    notify();
  }

  // methods

  Future<void> init() async {
    // getDailyRegisters();
    homeProvider.read.comida = 1;
  }

  Future<bool> getDailyRegisters() async {
    _productsRegistered = homeProvider.read.productsRegistered
        .where((element) => element.comida == 1)
        .toList();
    notify();
    return true;
  }

  // Future<bool> insertDailyRegister() async {
  //   Registro register = Registro(
  //       idProducto: _productsRegistered[0].id,
  //       idUsuario: 1,
  //       comida: 1,
  //       porcion: 1);
  //   Map<String, dynamic> response = await _dailyRegisterRepository
  //       .insertDailyRegister(dailyRegister: register);
  //   print('response insert: $response');
  //   // _products = imagesResponse.registros!;

  //   if (response['error'] != null) {
  //     map = {"estado": -1, "msg": response["msg"]};
  //     return false;
  //   } else {
  //     notify();
  //     return true;
  //   }
  // }
}
