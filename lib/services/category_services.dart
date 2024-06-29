
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:category_app/repostory/posts/posts_api.dart';

import '../model/category_model.dart';

class CategoryService {
  getCategories() async {
   return await PostApi().getallcat();
  }
}