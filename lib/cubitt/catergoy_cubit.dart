import 'package:category_app/blocc/category_bloc.dart';
import 'package:category_app/services/category_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:category_app/model/category_model.dart';
import 'package:meta/meta.dart';

part 'catergoy_state.dart';

class CatergoyCubit extends Cubit<CatergoyState> {
  final CategoryService catss;
  CatergoyCubit({required this.catss}) : super(CatergoyLoading());

  void GetAllCategories()async {

      emit(CatergoyLoading());
      try {
        final cats = await catss.getCategories();
        emit(CatergoySuccess(cat: cats));
      } catch (e) {
        emit(CatergoyFailure(error: "there is an error ${e.toString()}"));
      }
    }
}
