import 'package:bloc/bloc.dart';
import 'package:category_app/model/category_model.dart';
import 'package:category_app/model/meals_model.dart';
import 'package:category_app/screens/meals_services.dart';
import 'package:category_app/screens/meals_services.dart';
import 'package:meta/meta.dart';
import 'package:category_app/screens/meals_services.dart';
part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {

     final  String meals;
      MealsBloc( { required this.meals}) : super(MealsLoading()) {
      on<MealsEvent>((event, emit) async {
      if (event is Getitem) {
      emit(MealsLoading());
      try {
      final mal = await MealService( categoryName: '$meals').getAllItems();
      emit(MealsSuccess(mal:mal));

      } catch (e) {
      print(e);
      emit(MealsFailure(error: "there is an error ${e.toString()}"));
      }
      }
      });
      }

  }
