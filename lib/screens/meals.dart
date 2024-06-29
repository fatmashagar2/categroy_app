import 'package:category_app/model/category_model.dart';
import 'package:category_app/screens/cat_items.dart';
import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
    Meals({super.key,required this.ca});
  final Category ca;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Center(child: Text("${ca.id}")),
    );
  }
}
