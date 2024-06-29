
import 'package:category_app/blocc/category_bloc.dart';
import 'package:category_app/main.dart';
import 'package:category_app/model/category_model.dart';
import 'package:category_app/screens/cat_items.dart';

import 'package:category_app/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Categories'),
        ),
        body: BlocBuilder<CategoryBloc,CategoryState>(
          builder: (context,state){
            if(state is CategoryLoading){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is CategorySuccess){
              return category_items(categories: state.cat);
            }
            else{
              return ErrorWidget("exception");
            }
          },
        ));
  }
}