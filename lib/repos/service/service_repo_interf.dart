// Project: 	   concierge_admin
// File:    	   service_repo
// Path:    	   lib/repos/service/service_repo.dart
// Author:       Ali Akbar
// Date:        10-09-24 12:17:08 -- Tuesday
// Description:

import 'package:concierge_networking/models/service_model.dart';

abstract class ServiceRepoInterface {
  Future<List<ServiceModel>> fetchAll({required String categoryId});
}
