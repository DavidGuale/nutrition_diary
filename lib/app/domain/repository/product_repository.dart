abstract class ProductRepository {
  Future<Map<String, dynamic>> getProducts();
  // Future<int> insertBalances({required Map<String, dynamic> jsonBalances});

  Future<Map<String, dynamic>> getProductById(int id);
  Future<Map<String, dynamic>> getProductByBarcode(String barcode);
  Future<Map<String, dynamic>> getProductByName(String name);
  Future<Map<String, dynamic>> getProductsSearch(String name);
}
