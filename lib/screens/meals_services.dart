import 'dart:convert';

import 'package:category_app/model/category_model.dart';
import 'package:category_app/model/meals_model.dart';
import 'package:category_app/screens/cat_items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MealService {
  const MealService({

    required this.categoryName,
  });

  final String categoryName;


  Future<List<Meal>> getAllItems() async {

    return await aaaa();
  }

  Future<List<Meal>> aaaa() async {
    try {
    print(categoryName);
      final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=Beef'));

      if (response.statusCode == 200) {
        List<dynamic>? data = json.decode(response.body)['meals'];
        List<Meal> meals = data!.map((json) => Meal.fromJson(json)).toList();
        return meals;
      } else {
        throw Exception('Failed to fetch meals');
      }
    } catch (e) {
      throw Exception('Failed to fetch meals: $e');
    }
  }
}

