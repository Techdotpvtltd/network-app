// Project: 	   fitness_admin
// File:    	   category_repo_impl
// Path:    	   lib/repos/category/category_repo_impl.dart
// Author:       Ali Akbar
// Date:        08-08-24 18:35:51 -- Thursday
// Description:

import 'dart:developer';

import '../../exceptions/exception_parsing.dart';
import '../../manager/cache/category_cache.dart';
import '../../models/category_model.dart';
import '../../utils/constants/firebase_collections.dart';
import '../../web_services/firestore_services.dart';
import '../../web_services/query_model.dart';
import 'category_repo_interface.dart';

class CategoryRepo implements CategoryRepoInterface {
  @override
  Future<void> fetchAll() async {
    try {
      final List<Map<String, dynamic>> data =
          await FirestoreService().fetchWithMultipleConditions(
        collection: FIREBASE_COLLECTION_CATEGORIES,
        queries: [
          QueryModel(field: "title", value: false, type: QueryType.orderBy),
        ],
      );

      CategoryCache().categories =
          data.map((e) => CategoryModel.fromMap(e)).toList();
    } catch (e) {
      log("", name: "Category fetchAll", error: e, time: DateTime.now());
      throw throwAppException(e: e);
    }
  }
}
