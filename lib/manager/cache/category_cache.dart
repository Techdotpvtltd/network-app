// Project: 	   fitness_admin
// File:    	   category_cache
// Path:    	   lib/manager/cache/category_cache.dart
// Author:       Ali Akbar
// Date:        08-08-24 18:52:14 -- Thursday
// Description:

// ignore_for_file: unnecessary_getters_setters

import '../../models/category_model.dart';

class CategoryCache {
  static final CategoryCache _instance = CategoryCache._internal();
  CategoryCache._internal();
  factory CategoryCache() => _instance;

  List<CategoryModel> _categories = [];
  set categories(List<CategoryModel> categories) => _categories = categories;
  List<CategoryModel> get categories => _categories;
}
