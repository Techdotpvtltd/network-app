// Project: 	   concierge_admin
// File:    	   service_bloc
// Path:    	   lib/blocs/service/service_bloc.dart
// Author:       Ali Akbar
// Date:        10-09-24 14:12:01 -- Tuesday
// Description:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exceptions/app_exceptions.dart';
import '../../repos/service/service_repo_impl.dart';
import 'service_event.dart';
import 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc() : super(ServiceStateInitial()) {
    /// On FetchAll Trigger
    on<ServiceEventFetchAll>(
      (event, emit) async {
        try {
          emit(ServiceStateFetching());
          final services =
              await ServiceRepo().fetchAll(categoryId: event.categoryId);
          emit(ServiceStateFetched(services: services));
        } on AppException catch (e) {
          emit(ServiceStateFetchFailure(exception: e));
        }
      },
    );
  }
}
