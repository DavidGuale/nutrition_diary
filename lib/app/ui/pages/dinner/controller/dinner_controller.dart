import 'package:flutter_meedu/flutter_meedu.dart';

import '../../../../domain/models/product_register_model.dart';
import '../../home/home_page.dart';

class DinnerController extends SimpleNotifier {
  DinnerController() {
    init();
  }
  //variables

  int _totalCalories = 0;
  int _caloriesGoal = 2100;
  double _caloriesConsumed = 0;
  List<ProductRegister> _productsRegistered = [];

  //Gets
  int get totalCalories => _totalCalories;
  int get caloriesGoal => _caloriesGoal;
  double get caloriesConsumed => _caloriesConsumed;
  List<ProductRegister> get products => _productsRegistered;
  Map<String, dynamic> map = <String, dynamic>{};

  //set's
  set products(List<ProductRegister> value) {
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
    homeProvider.read.comida = 3;
  }
}
