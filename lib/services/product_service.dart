
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entities/item.dart';

class ProductService {
  static Future<List<Item>> fetchItems() async {
    final url = Uri.https(
      'dummyjson.com',
      '/products',
      {'limit': '12'},
    );

    // Send a GET request to the API
    final response = await http.get(url).timeout(
      const Duration(seconds: 10),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load products: ${response.statusCode}',
      );
    }

    // Decode the JSON response
    final data = jsonDecode(response.body)
    as Map<String, dynamic>;

    final products = data['products'] as List<dynamic>;

    // Convert JSON objects into Item objects
    return products.map((product) {
      return Item.fromJson(
        product as Map<String, dynamic>,
      );
    }).toList();
  }
}
