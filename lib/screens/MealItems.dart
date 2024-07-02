import 'package:category_app/model/category_model.dart';
import 'package:category_app/model/meals_model.dart';
import 'package:category_app/screens/meals_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class meal_items extends StatelessWidget {

  final List<Meal> mal;

  const meal_items({super.key, required this.mal});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: mal.length,
      itemBuilder: (context, index) {
        final meall = mal[index];
        return Container(
          child: Card(
            elevation: 4.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    meall.strMealThumb,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  meall.idMeal,
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
                  meall.strMeal,
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