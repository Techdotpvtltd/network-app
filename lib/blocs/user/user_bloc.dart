import '/exceptions/auth_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exceptions/app_exceptions.dart';
import '../../manager/app_manager.dart';
import '../../models/user_model.dart';
import '../../repos/user_repo.dart';
import 'user_event.dart';
import 'user_state.dart';

/// Project: 	   playtogethher
/// File:    	   user_bloc
/// Path:    	   lib/blocs/user/user_bloc.dart
/// Author:       Ali Akbar
/// Date:        13-03-24 15:43:26 -- Wednesday
/// Description:

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserStateInitial()) {
    /// OnUpdateProfile Event
    on<UserEventUpdateProfile>(
      (event, emit) async {
        try {
          if (AppManager.currentUser == null) {
            emit(UserStateProfileUpdatingFailure(
                exception: AuthExceptionUserNotFound()));
            return;
          }
          UserModel user = AppManager.currentUser!;
          String? avatarUrl = event.avatar;

          if (avatarUrl != null &&
              avatarUrl != "" &&
              Uri.parse(avatarUrl).host.isEmpty) {
            emit(UserStateAvatarUploading());
            avatarUrl = await UserRepo().uploadProfile(path: avatarUrl);
            emit(UserStateAvatarUploaded());
            user = user.copyWith(avatar: avatarUrl);
          }

          if (event.firstName != null) {
            user = user.copyWith(firstName: event.firstName);
          }

          if (event.lastName != null) {
            user = user.copyWith(firstName: event.lastName);
          }

          if (event.phone != null) {
            user = user.copyWith(phone: event.phone);
          }

          if (event.dateOfBirth != null) {
            user = user.copyWith(dateOfBirth: event.dateOfBirth);
          }

          emit(UserStateProfileUpdating());
          final UserModel updatedModel = await UserRepo().update(user: user);
          emit(UserStateProfileUpdated(user: updatedModel));
        } on AppException catch (e) {
          emit(UserStateProfileUpdatingFailure(exception: e));
        }
      },
    );

    /// FetchSingleUser
    on<UserEventFetchDetail>(
      (event, emit) async {
        try {
          emit(UserStateFetchingSingle());
          final UserModel? user =
              await UserRepo().fetchUser(profileId: event.uid);
          if (user != null) {
            emit(UserStateFetchedSingle(user: user));
          } else {
            emit(UserStateFetchedSingleEmpty());
          }
        } on AppException catch (e) {
          emit(UserStateFetchSingleFailure(exception: e));
        }
      },
    );
  }
}
