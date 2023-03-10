import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:products_client/src/models/models.dart';

/// {@template products_client}
/// The repository used to retrieve all the [ProductsClient] methods
/// {@endtemplate}
class ProductsClient {
  /// {@macro products_client}
  ProductsClient();

  final _client = http.Client();

  static const _authority = 'app-products-c6bb8-default-rtdb.firebaseio.com';

  /// A method to make the request to the Database.
  Future<List<Product>?> getProducts() async {
    try {
      final url = Uri.https(_authority, 'products.json');
      final resp = await _client.get(url);
      final body = (jsonDecode(resp.body) as Map<dynamic, dynamic>)
          .cast<String, dynamic>();
      return body
          .map((key, value) {
            final temProduct = Product.fromMap(
              (value as Map).cast<String, dynamic>(),
            )..id = key;
            return MapEntry(key, temProduct);
          })
          .values
          .toList();
    } catch (e) {
      return null;
    }
  }

  /// A method for updating the database product.
  Future<String?> updateProduct(Product product) async {
    try {
      final url = Uri.https(_authority, 'products/${product.id}.json');
      await _client.put(url, body: product.toJson());
      return product.id;
    } catch (e) {
      return null;
    }
  }

  Future<String?> createProduct(Product product) async {
    try {
      final url = Uri.https(_authority, 'products.json');
      final resp = await _client.post(url, body: product.toJson());
      final body = (json.decode(resp.body) as Map).cast<String, dynamic>();
      return product.id = body['name'].toString();
    } catch (e) {
      return null;
    }
  }
}
