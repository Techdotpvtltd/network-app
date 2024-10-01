// Project: 	   concierge_networking
// File:    	   data_fetcher_bloc
// Path:    	   lib/blocs/data_fetcher/data_fetcher_bloc.dart
// Author:       Ali Akbar
// Date:        01-10-24 15:49:51 -- Tuesday
// Description:

import 'package:concierge_networking/blocs/data_fetcher/data_fetcher_event.dart';
import 'package:concierge_networking/blocs/data_fetcher/data_fetcher_state.dart';
import 'package:concierge_networking/exceptions/app_exceptions.dart';
import 'package:concierge_networking/repos/category/category_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cache/category_cache.dart';
import '../category/category_state.dart';

class DataFetcherBloc extends Bloc {
  DataFetcherBloc() : super(DataFetcherStateInitial()) {
    // on Fetch All
    on<DataFetcherEventFetch>(
      (event, emit) async {
        try {
          emit(DataFetcherStateFetching());
          await Future.wait(
            [
              CategoryRepo().fetchAll(), // Fetch All Category Data
            ],
          );
          emit(DataFetcherStateFetched());
          emit(CategoryStateFetched(categories: CategoryCache().categories));
        } on AppException catch (e) {
          emit(DataFetcherStateFetchFailure(exception: e));
        }
      },
    );
  }
}
