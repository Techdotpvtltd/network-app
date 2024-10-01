// Project: 	   fitness_admin
// File:    	   category_state
// Path:    	   lib/blocs/category/category_state.dart
// Author:       Ali Akbar
// Date:        08-08-24 19:22:19 -- Thursday
// Description:

import 'package:concierge_networking/models/category_model.dart';

import '../../exceptions/app_exceptions.dart';

abstract class CategoryState {
  final bool isLoading;

  CategoryState({this.isLoading = false});
}

/// Initial State
class CategoryStateInitial extends CategoryState {}

// ===========================Fetch All Category States================================
class CategoryStateFetching extends CategoryState {
  CategoryStateFetching({super.isLoading = true});
}

class CategoryStateFetchFailure extends CategoryState {
  final AppException exception;

  CategoryStateFetchFailure({required this.exception});
}

class CategoryStateFetched extends CategoryState {
  final List<CategoryModel> categories;

  CategoryStateFetched({required this.categories});
}
