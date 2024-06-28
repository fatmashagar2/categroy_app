
import 'dart:convert';



import 'package:category_app/model/category_model.dart';
import 'package:category_app/repostory/posts/posts_api.dart';
import 'package:http/http.dart'as http;


class CategoryService {
  getCategories() async {
    PostApi().getallcat();
  }
}