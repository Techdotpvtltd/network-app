// Project: 	   concierge_admin
// File:    	   service_state
// Path:    	   lib/blocs/service/service_state.dart
// Author:       Ali Akbar
// Date:        10-09-24 14:00:24 -- Tuesday
// Description:

import 'package:concierge_networking/models/service_model.dart';

import '../../exceptions/app_exceptions.dart';

abstract class ServiceState {
  final bool isLoading;
  ServiceState({this.isLoading = false});
}

/// Initial State
class ServiceStateInitial extends ServiceState {}
// ===========================Fetch All Service States================================

class ServiceStateFetching extends ServiceState {
  ServiceStateFetching({super.isLoading = true});
}

class ServiceStateFetchFailure extends ServiceState {
  final AppException exception;

  ServiceStateFetchFailure({required this.exception});
}

class ServiceStateFetched extends ServiceState {
  final List<ServiceModel> services;

  ServiceStateFetched({required this.services});
}
