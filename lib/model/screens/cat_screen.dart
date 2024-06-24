
import 'package:category_app/main.dart';
import 'package:category_app/model/category_model.dart';
import 'package:category_app/model/screens/cat_items.dart';
import 'package:category_app/services/category_services.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late List<Category> categories;
  final _categoryService = CategoryService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  void _fetchCategories() async {
    setState(() {
      _isLoading = true;
    });

    try {
      categories = await _categoryService.getCategories();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Categories'),
        ),
        body: _isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : category_items(categories: categories),
      ),
    );
  }
}