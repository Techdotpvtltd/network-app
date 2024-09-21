// ignore: dangling_library_doc_comments
/// Project: 	   playtogethher
/// File:    	   user_event
/// Path:    	   lib/blocs/user/user_event.dart
/// Author:       Ali Akbar
/// Date:        13-03-24 15:41:39 -- Wednesday
/// Description:
///

abstract class UserEvent {}

/// Update Profile Event
class UserEventUpdateProfile extends UserEvent {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? avatar;
  final DateTime? dob;

  UserEventUpdateProfile({
    this.firstName,
    this.lastName,
    this.avatar,
    this.dob,
    this.phone,
  });
}

class UserEventFetchDetail extends UserEvent {
  final String uid;

  UserEventFetchDetail({required this.uid});
}

class UserEventCreate extends UserEvent {
  final String email;

  UserEventCreate({required this.email});
}
