import 'package:category_app/blocc/category_bloc.dart';
import 'package:category_app/blocc/meals_bloc.dart';
import 'package:category_app/screens/MealItems.dart';
import 'package:category_app/screens/cat_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meals'),
      ),
      body: BlocBuilder<MealsBloc, MealsState>(
        builder: (context, state) {
          if (state is MealsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MealsSuccess) {
            return meal_items(mal: state.mal!);
          } else {
            return ErrorWidget("exception");
          }
        },
      ),
    );
  }
}
