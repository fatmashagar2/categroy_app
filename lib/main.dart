
import 'package:category_app/model/category_model.dart';
import 'package:category_app/services/category_services.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(CategoriesScreen());
}

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
            : gridview(categories: categories),
      ),
    );
  }
}

class gridview extends StatelessWidget {
  const gridview({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16.0,
    mainAxisSpacing: 16.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
    final category = categories[index];
    return Container(
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                category.thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              category.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              overflow: TextOverflow.ellipsis,
              //maxLines: 2,
              category.description.substring(0, 50),
              style: const TextStyle(
                fontWeight: FontWeight.bold,

                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
              },
            );
  }
}