import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product_model.dart';

class ApiService {
  static Future<List<Products>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.in/api/products'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['products'] != null) {
          return (data['products'] as List).map((e) => Products.fromJson(e)).toList();
        } else {
          throw Exception('Failed to load products');
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
