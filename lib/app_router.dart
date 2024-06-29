
import 'package:category_app/blocc/category_bloc.dart';
import 'package:category_app/constant.dart';
import 'package:category_app/model/category_model.dart';
import 'package:category_app/screens/cat_items.dart';
import 'package:category_app/screens/cat_screen.dart';
import 'package:category_app/screens/meals.dart';
import 'package:category_app/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
class AppRouter {

  Route? generateRouter(RouteSettings settings) {
    final Category c;
    switch (settings.name) {
    case AppRoutes.root:
    return MaterialPageRoute(
    builder: (_) => BlocProvider(
    create: (_) => CategoryBloc(catss: catss),
    child: CategoriesScreen(),
    ),
    );
    case AppRoutes.meals:
    return MaterialPageRoute(
    builder: (_) => Meals(ca: ca),
    );

    }}}