import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../domain/models/product_model.dart';
import '../../../../domain/repository/daily_register_repository.dart';
import '../../../../domain/repository/product_repository.dart';
import '../../../../domain/responses/daily_register_model.dart';
import '../../../../domain/responses/products_response.dart';

class DashboardController extends SimpleNotifier {
  final _storage = Get.i.find<FlutterSecureStorage>();
  final _dailyRegisterRepository = Get.i.find<DailyRegisterRepository>();
  final _productRepository = Get.i.find<ProductRepository>();

  DashboardController() {
    init();
  }

  //variables

  String? _userId;
  int _totalCalories = 0;
  double _caloriesGoal = 2100.0;
  double _caloriesConsumed = 0.0;
  double _caloriesRemaining = 0.0;
  bool _isLoading = true;
  bool _isActive = false;
  String _currentWidget = '';

  List<DailyRegisterModel> _productsRegistered = [];
  List<DailyRegisterModel> _breakfastRegistered = [];
  List<DailyRegisterModel> _lunchRegistered = [];
  List<DailyRegisterModel> _dinnerRegistered = [];
  List<DailyRegisterModel> _snackRegistered = [];
  int _comida = 2;

  //for search products
  List<Product> _productsSearch = [
    // Product(
    //     nombre: 'Producto 1',
    //     contenidoEnergetico: 100,
    //     codigoBarras: '010',
    //     urlImagen:
    //         'https://tiaecuador.vteximg.com.br/arquivos/ids/179819/250503000.jpg?v=637564391796200000'),
    // Product(
    //     nombre: 'Producto 2',
    //     contenidoEnergetico: 200,
    //     codigoBarras: '020',
    //     urlImagen:
    //         'https://tiaecuador.vteximg.com.br/arquivos/ids/179819/250503000.jpg?v=637564391796200000'),
  ];

  //Gets
  String? get userId => _userId;
  int get totalCalories => _totalCalories;
  double get caloriesGoal => _caloriesGoal;
  double get caloriesConsumed => _caloriesConsumed;
  double get caloriesRemaining => _caloriesRemaining;

  List<DailyRegisterModel> get productsRegistered => _productsRegistered;
  List<DailyRegisterModel> get breakfastRegistered => _breakfastRegistered;
  List<DailyRegisterModel> get lunchRegistered => _lunchRegistered;
  List<DailyRegisterModel> get dinnerRegistered => _dinnerRegistered;
  List<DailyRegisterModel> get snackRegistered => _snackRegistered;
  int get comida => _comida;
  List<Product> get productsSearch => _productsSearch;
  bool get isLoading => _isLoading;

  bool get isActive => _isActive;
  String get currentWidget => _currentWidget;

  Map<String, dynamic> map = <String, dynamic>{};

  //set's
  set productsRegistered(List<DailyRegisterModel> value) {
    _productsRegistered = value;
    notify();
  }

  set totalCalories(int value) {
    _totalCalories = value;
    notify();
  }

  set caloriesGoal(double value) {
    _caloriesGoal = value;
    notify();
  }

  set caloriesConsumed(double value) {
    _caloriesConsumed = value;
    caloriesRemaining = _caloriesGoal - _caloriesConsumed;
    print('caloriesRemaining: $value');
    notify();
  }

  set comida(int value) {
    _comida = value;
    notify();
  }

  set productsSearch(List<Product> value) {
    _productsSearch = value;
    notify();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notify();
  }

  set caloriesRemaining(double value) {
    _caloriesRemaining = value;
    notify();
  }

  set isActive(bool value) {
    _isActive = value;
    notify();
  }

  set currentWidget(String value) {
    _currentWidget = value;
    notify();
  }

  void agregar(DailyRegisterModel product) async {
    _productsRegistered.add(product);
    await _storage.write(
        key: 'dailyRegister', value: _productsRegistered.toString());
    print('products agregar: ${_productsRegistered.toString()}');
    // json.encode(MyUserModel.toMap(model))

    notify();
  }

  // methods
  Future<void> logout() async {
    await _storage.delete(key: 'token');
  }

  Future<void> init() async {
    isLoading = true;
    var bool = await getDailyRegistersByUser();
    caloriesRemaining = _caloriesGoal - _caloriesConsumed;
    isLoading = false;
  }

  Future<bool> getDailyRegistersByUser() async {
    Map<String, dynamic> response =
        await _dailyRegisterRepository.getDailyRegistersByUser(1);
    print('response daily registers: ${response['data']}');
    // _products = imagesResponse.registros!;

    if (response['error'] != null) {
      map = {"estado": -1, "msg": response["msg"]};
      notify();
      return false;
    } else {
      print('entra else');
      // DailyRegistersResponse dailyRegistersResponse =
      // response['data'] as List<DailyRegistersResponse>;
      // DailyRegistersResponse.fromJson(response['data'].toString());
      // _productsRegistered = (response['data'] as List)
      //     .map((e) => e as DailyRegisterModel)
      //     .toList();
      // print('productsRegistered: ${_productsRegistered.toString()}');

      DailyRegistersResponse dailyRegistersResponse =
          DailyRegistersResponse.fromMap(response['data']);
      _productsRegistered = dailyRegistersResponse.registers!;
      _breakfastRegistered =
          _productsRegistered.where((element) => element.comida == 1).toList();
      _lunchRegistered =
          _productsRegistered.where((element) => element.comida == 2).toList();
      _dinnerRegistered =
          _productsRegistered.where((element) => element.comida == 3).toList();
      _snackRegistered =
          _productsRegistered.where((element) => element.comida == 4).toList();

      notify();
      return true;
    }
  }

  // Future<bool> getProductByBarcode(String barcode) async {
  //   Map<String, dynamic> response =
  //       await _productRepository.getProductByBarcode(barcode);
  //   if (response['error'] != null) {
  //     map = {"estado": -1, "msg": response["msg"]};
  //     return false;
  //   } else {
  //     ProductsResponse imagesResponse =
  //         ProductsResponse.fromMap(response['data']);
  //     _productBarcode = imagesResponse.producto!;
  //     return true;
  //   }
  // }

  Future<Map<String, dynamic>> getProductsSearch(String name) async {
    Map<String, dynamic> response =
        await _productRepository.getProductsSearch(name);
    print('response search: ${response['data']}');

    if (response['error'] != null) {
      map = {"estado": -1, "msg": response["msg"]};
      return map;
    } else {
      DailyRegistersResponse imagesResponse =
          DailyRegistersResponse.fromMap(response['data']);
      // _productsSearch = imagesResponse.registers!;
      notify();
      return response;
    }
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
