// Project: 	   concierge_admin
// File:    	   post_repo_implement
// Path:    	   lib/repos/post/post_repo_implement.dart
// Author:       Ali Akbar
// Date:        02-10-24 14:31:07 -- Wednesday
// Description:

import 'dart:developer';

import '../../exceptions/exception_parsing.dart';
import '../../manager/cache/post_cache.dart';
import '../../models/post_model.dart';
import '../../utils/constants/firebase_collections.dart';
import '../../web_services/firestore_services.dart';
import '../../web_services/query_model.dart';
import 'post_repo_interface.dart';

class PostRepo implements PostRepoInterface {
  @override
  Future<void> fetch() async {
    try {
      final List<Map<String, dynamic>> data =
          await FirestoreService().fetchWithMultipleConditions(
        collection: FIREBASE_COLLECTION_POSTS,
        queries: [
          QueryModel(field: "", value: 15, type: QueryType.limit),
          QueryModel(field: "createdAt", value: false, type: QueryType.orderBy),
          if (PostCache().snapshot != null)
            QueryModel(
                field: "",
                value: PostCache().snapshot,
                type: QueryType.startAfterDocument),
        ],
        lastDocSnapshot: (p0) {
          PostCache().snapshot = p0;
        },
      );

      PostCache().posts = data.map((e) => PostModel.fromMap(e)).toList();
    } catch (e) {
      log("", error: e, name: "Post-fetch", time: DateTime.now());
      throw throwAppException(e: e);
    }
  }
}
