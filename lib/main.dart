import 'package:category_app/blocc/category_bloc.dart';
import 'package:category_app/model/category_model.dart';
import 'package:category_app/screens/cat_items.dart';
import 'package:category_app/screens/cat_screen.dart';
import 'package:category_app/screens/meals.dart';
import 'package:category_app/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Category categories;
  final int ca;
    return BlocProvider(
      create: (context) => CategoryBloc(catss: CategoryService())..add(GetCategory()),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => CategoriesScreen(),
          '/meals': (context) =>  Meals(ca:ca,),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
