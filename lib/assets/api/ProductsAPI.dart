import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ProductsAPI {
  Future<List<Product>> loadProducts() async {
    final String jsonString = await rootBundle.loadString("lib/assets/api/mocks/ProductsMocking.json"
    );
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }
}

class Product {
  final String uuid;
  final String name;
  final String productTitle;
  final String producer;
  final String description;
  final int quantity;
  final bool available;
  final String category;
  final String imageUrl;

  Product({
    required this.uuid,
    required this.name,
    required this.productTitle,
    required this.producer,
    required this.description,
    required this.quantity,
    required this.available,
    required this.category,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      uuid: json['uuid'],
      name: json['name'],
      productTitle: json['productTitle'],
      producer: json['producer'],
      description: json['description'],
      quantity: json['quantity'],
      available: json['available'],
      category: json['category'],
      imageUrl: json['imageUrl'],
    );
  }
}
