import 'dart:convert';



import 'package:category_app/model/category_model.dart';
import 'package:http/http.dart'as http;


class CategoryService {
  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    if (response.statusCode == 200) {
      List<dynamic>data = json.decode(response.body)['categories'];
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
}