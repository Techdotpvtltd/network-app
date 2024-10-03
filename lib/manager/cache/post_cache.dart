// Project: 	   concierge_admin
// File:    	   post_cache
// Path:    	   lib/manager/cache/post_cache.dart
// Author:       Ali Akbar
// Date:        02-10-24 14:42:08 -- Wednesday
// Description:

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/post_model.dart';

class PostCache {
  static final PostCache _instance = PostCache._internal();
  PostCache._internal();
  factory PostCache() => _instance;
  final List<PostModel> _posts = [];
  DocumentSnapshot? snapshot;

  List<PostModel> get posts => _posts.toSet().toList();
  set posts(List<PostModel> newPosts) => _posts.addAll(newPosts);

  List<PostModel> postsBy(String title) => title == ""
      ? _posts
      : _posts
          .where((e) => e.title.toLowerCase().contains(title.toLowerCase()))
          .toList();
}
