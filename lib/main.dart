import 'package:category_app/blocc/category_bloc.dart';
import 'package:category_app/model/category_model.dart';
import 'package:category_app/screens/cat_screen.dart';
import 'package:category_app/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(BlocProvider(
    create: (context) =>CategoryBloc(catss: CategoryService())..add(GetCategory()),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategoriesScreen()),
  ));
}


