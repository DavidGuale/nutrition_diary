import '../../domain/repository/product_repository.dart';
import '../resources/remote/product_api.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductAPI _api;
  ProductRepositoryImpl(this._api);

  @override
  Future<Map<String, dynamic>> getProductById(int id) =>
      _api.getProductById(id);

  @override
  Future<Map<String, dynamic>> getProducts() => _api.getProducts();

  @override
  Future<Map<String, dynamic>> getProductByBarcode(String barcode) =>
      _api.getProductByBarcode(barcode);

  @override
  Future<Map<String, dynamic>> getProductByName(String name) =>
      _api.getProductByName(name);

  @override
  Future<Map<String, dynamic>> getProductsSearch(String name) =>
      _api.getProductsSearch(name);
}
