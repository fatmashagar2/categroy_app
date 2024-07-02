part of 'meals_bloc.dart';

@immutable
sealed class MealsState {}

final class MealsLoading extends MealsState {}
final class MealsSuccess extends MealsState {
  final List<Meal>?mal;

  MealsSuccess({required this.mal});

}
final class MealsFailure extends MealsState {
  String error;
  MealsFailure({required this.error});
}
