// Project: 	   fitness_admin
// File:    	   category_bloc
// Path:    	   lib/blocs/category/category_bloc.dart
// Author:       Ali Akbar
// Date:        08-08-24 19:29:54 -- Thursday
// Description:
import 'package:concierge_networking/manager/cache/category_cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exceptions/app_exceptions.dart';
import '../../repos/category/category_repo_impl.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryStateInitial()) {
    /// onFetchAll Category Trigger
    on<CategoryEventFetchAll>(
      (event, emit) async {
        try {
          emit(CategoryStateFetching());
          await CategoryRepo().fetchAll();
          emit(CategoryStateFetched(categories: CategoryCache().categories));
        } on AppException catch (e) {
          emit(CategoryStateFetchFailure(exception: e));
        }
      },
    );
  }
}
