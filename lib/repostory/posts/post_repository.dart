import 'package:category_app/model/category_model.dart';
import 'package:category_app/model/meals_model.dart';

abstract class post_repostory{
  //اللي هيعرف هنا ال method only
  Future<List<Category>> getallcat();
  //Future<List<Meal>> getallitems();

}