// Project: 	   concierge_networking
// File:    	   data_fetcher_state
// Path:    	   lib/blocs/data_fetcher/data_fetcher_state.dart
// Author:       Ali Akbar
// Date:        01-10-24 15:45:17 -- Tuesday
// Description:

import 'package:concierge_networking/exceptions/app_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DataFetcherState {
  final bool isLoading;
  final Bloc? bloc;

  DataFetcherState({this.isLoading = false, this.bloc});
}

/// Initial State
class DataFetcherStateInitial extends DataFetcherState {}

/// Fetching Data State
class DataFetcherStateFetching extends DataFetcherState {
  DataFetcherStateFetching({super.isLoading = true, super.bloc});
}

/// Failure
class DataFetcherStateFetchFailure extends DataFetcherState {
  final AppException exception;

  DataFetcherStateFetchFailure({super.bloc, required this.exception});
}

class DataFetcherStateFetched extends DataFetcherState {
  DataFetcherStateFetched({super.bloc});
}
