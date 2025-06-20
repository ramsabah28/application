import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class CategoryAPI {
  Future<List<Category>> loadCategory({int page = 0, int pageSize = 10}) async {
    final String jsonString = await rootBundle.loadString(
      'lib/assets/api/mocks/CategoryMocks.json',
    );

    final List<dynamic> jsonList = jsonDecode(jsonString);
    final allCategories = jsonList.map((json) => Category.fromJson(json)).toList();

    // Simulate pagination
    final start = page * pageSize;
    final end = start + pageSize;

    if (start >= allCategories.length) return [];

    return allCategories.sublist(
      start,
      end > allCategories.length ? allCategories.length : end,
    );
  }
}

class Category {
  final String uuid;
  final String name;
  final String description;
  final String imageUrl;

  Category({
    required this.uuid,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      uuid: json['uuid'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
