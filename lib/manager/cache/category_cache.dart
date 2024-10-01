// Project: 	   fitness_admin
// File:    	   category_cache
// Path:    	   lib/manager/cache/category_cache.dart
// Author:       Ali Akbar
// Date:        08-08-24 18:52:14 -- Thursday
// Description:

// ignore_for_file: unnecessary_getters_setters

import 'package:concierge_networking/utils/extensions/string_extension.dart';

import '../../models/category_model.dart';

class CategoryCache {
  static final CategoryCache _instance = CategoryCache._internal();
  CategoryCache._internal();
  factory CategoryCache() => _instance;

  List<CategoryModel> _categories = [];
  set categories(List<CategoryModel> categories) => _categories = categories;
  List<CategoryModel> get categories => _categories;

  void insert(CategoryModel category) => _categories.insert(0, category);

  bool doesExistedBy({required String title, String? uuid}) =>
      _categories.indexWhere((e) =>
          e.title.toLowerCase() == title.toLowerCase() && uuid != e.uuid) >
      -1;

  CategoryModel? findBy({required String uuid}) {
    final index = _categories.indexWhere((e) => e.uuid == uuid);
    if (index > -1) {
      return _categories[index];
    }
    return null;
  }

  CategoryModel? findByTitle({required String title}) {
    final index = _categories
        .indexWhere((e) => e.title.toLowerCase() == title.toLowerCase());
    if (index > -1) {
      return _categories[index];
    }
    return null;
  }

  String? findTitleBy({required String uuid}) {
    final index = _categories.indexWhere((e) => e.uuid == uuid);
    if (index > -1) {
      return _categories[index].title.firstCapitalize();
    }
    return null;
  }

  String? getIdBy({required String title}) {
    final index = _categories
        .indexWhere((e) => e.title.toLowerCase() == title.toLowerCase());
    if (index > -1) {
      return _categories[index].uuid;
    }
    return null;
  }

  void update({required CategoryModel category}) {
    final index = _categories.indexWhere((e) => e.uuid == category.uuid);
    if (index > -1) {
      _categories[index] = category;
    }
  }

  void remove({required String uuid}) =>
      _categories.removeWhere((e) => e.uuid == uuid);
}
