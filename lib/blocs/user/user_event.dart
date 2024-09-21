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
  final String? name;
  final String? phone;
  final String? avatar;

  UserEventUpdateProfile({
    this.name,
    this.avatar,
    this.phone,
  });
}

// class UserEventFindBy extends UserEvent {
//   final LatLngBounds? bounds;
//   final String? searchText;

//   UserEventFindBy({this.bounds, this.searchText});
// }

class UserEventFetchDetail extends UserEvent {
  final String uid;

  UserEventFetchDetail({required this.uid});
}
