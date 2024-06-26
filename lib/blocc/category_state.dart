part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}


final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
  final List<Category>cat;

  CategorySuccess({required this.cat});
}
final class CategoryFailure extends CategoryState {
 final String error;

  CategoryFailure({required this.error});
}
