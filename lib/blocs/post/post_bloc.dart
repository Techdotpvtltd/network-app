// Project: 	   concierge_admin
// File:    	   post_bloc
// Path:    	   lib/blocs/post/post_bloc.dart
// Author:       Ali Akbar
// Date:        02-10-24 16:18:02 -- Wednesday
// Description:

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exceptions/app_exceptions.dart';
import '../../repos/post/post_repo_implement.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostStateInitial()) {
    //OnFetch
    on<PostEventFetch>(
      (event, emit) async {
        try {
          emit(PostStateFetching());
          await PostRepo().fetch();
          emit(PostStateFetched());
        } on AppException catch (e) {
          emit(PostStateFetchFailure(exception: e));
        }
      },
    );
  }
}
