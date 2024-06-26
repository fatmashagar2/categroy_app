part of 'catergoy_cubit.dart';

@immutable
sealed class CatergoyState {}

final class CatergoyLoading extends CatergoyState {}
final class CatergoySuccess extends CatergoyState {
  final List<Category>cat;

  CatergoySuccess({required this.cat});


}
final class CatergoyFailure extends CatergoyState {
  final String error;

  CatergoyFailure({required this.error});

}
