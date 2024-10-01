// Project: 	   concierge_admin
// File:    	   service_repo_impl
// Path:    	   lib/repos/service/service_repo_impl.dart
// Author:       Ali Akbar
// Date:        10-09-24 12:37:01 -- Tuesday
// Description:

import 'dart:developer';

import '../../exceptions/exception_parsing.dart';
import '../../models/service_model.dart';
import '../../utils/constants/firebase_collections.dart';
import '../../web_services/firestore_services.dart';
import '../../web_services/query_model.dart';
import 'service_repo_interf.dart';

class ServiceRepo implements ServiceRepoInterface {
  @override
  Future<List<ServiceModel>> fetchAll({required String categoryId}) async {
    try {
      final List<Map<String, dynamic>> data =
          await FirestoreService().fetchWithMultipleConditions(
        collection: FIREBASE_COLLECTION_SERIES,
        queries: [
          QueryModel(
              field: 'categoryId', value: categoryId, type: QueryType.isEqual),
          QueryModel(field: "title", value: false, type: QueryType.orderBy),
          QueryModel(field: "", value: 15, type: QueryType.limit),
        ],
      );
      final List<ServiceModel> services =
          data.map((e) => ServiceModel.fromMap(e)).toList();
      return services;
    } catch (e) {
      log("", name: "Service fetchAll", error: e, time: DateTime.now());
      throw throwAppException(e: e);
    }
  }
}
