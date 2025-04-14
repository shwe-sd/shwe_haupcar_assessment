import 'dart:convert';
import '../../../models/category_model.dart';
import 'package:http/http.dart' as http;
import '../../models/product_model.dart';

class ApiService {
  final String _baseUrl = 'https://dummyjson.com';

  /// Fetch list of category names
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/products/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }


  /// Fetch list of products by category name
  Future<List<ProductModel>> fetchProducts(String category) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/category/$category'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List products = data['products'];
      return products.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products for $category');
    }
  }
}
