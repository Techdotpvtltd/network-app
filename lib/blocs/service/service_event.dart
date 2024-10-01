// Project: 	   concierge_admin
// File:    	   service_event
// Path:    	   lib/blocs/service/service_event.dart
// Author:       Ali Akbar
// Date:        10-09-24 14:07:20 -- Tuesday
// Description:

abstract class ServiceEvent {}

/// FetchAllServiceEvent
class ServiceEventFetchAll extends ServiceEvent {
  final String categoryId;

  ServiceEventFetchAll({required this.categoryId});
}
