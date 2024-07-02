import 'package:category_app/blocc/category_bloc.dart';
import 'package:category_app/blocc/meals_bloc.dart';
import 'package:category_app/constant.dart';
import 'package:category_app/screens/MealItems.dart';
import 'package:category_app/screens/cat_screen.dart';

import 'package:category_app/screens/meals_services.dart';
import 'package:category_app/screens/meals_screen.dart';
import 'package:category_app/services/category_services.dart';
import 'package:category_app/screens/meals_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter {

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.categories:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CategoryBloc(categoryService: CategoryService())
              ..add(GetCategory()),
            child: const CategoriesScreen(),
          ),
        );
      case AppRoutes.meals:
          return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MealsBloc(meals: '')..add(Getitem()),
            child: const MealsScreen()),
          );
    }
   
  }
}
