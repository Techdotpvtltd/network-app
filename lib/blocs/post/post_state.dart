// Project: 	   concierge_networking
// File:    	   post_state
// Path:    	   lib/blocs/post/post_state.dart
// Author:       Ali Akbar
// Date:        02-10-24 15:56:54 -- Wednesday
// Description:

import '../../exceptions/app_exceptions.dart';

abstract class PostState {
  final bool isLoading;

  PostState({this.isLoading = false});
}

/// Initial State
class PostStateInitial extends PostState {}

// ============================Fetch States ===============================

class PostStateFetching extends PostState {
  PostStateFetching({super.isLoading = true});
}

class PostStateFetchFailure extends PostState {
  final AppException exception;

  PostStateFetchFailure({required this.exception});
}

class PostStateFetched extends PostState {}
