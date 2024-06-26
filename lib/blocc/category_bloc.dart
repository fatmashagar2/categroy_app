import 'package:category_app/model/category_model.dart';
import 'package:category_app/services/category_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
final CategoryService catss;
  CategoryBloc({required this.catss}) : super(CategoryLoading()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetCategory) {
        emit(CategoryLoading());
        try {
          final cats = await catss.getCategories();
          emit(CategorySuccess(cat: cats));
        } catch (e) {
          emit(CategoryFailure(error: "there is an error ${e.toString()}"));
        }
      }
    });
  }
}
