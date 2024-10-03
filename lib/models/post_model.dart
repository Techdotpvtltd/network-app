// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

// Project: 	   concierge_admin
// File:    	   post_model
// Path:    	   lib/models/post_model.dart
// Author:       Ali Akbar
// Date:        02-10-24 12:21:45 -- Wednesday
// Description:

class PostModel {
  final String uuid;
  final String title;
  final String description;
  final String coverUrl;
  final DateTime createdAt;
  final String createdBy;
  final bool isActive;
  PostModel({
    required this.uuid,
    required this.title,
    required this.description,
    required this.coverUrl,
    required this.createdAt,
    required this.createdBy,
    required this.isActive,
  });
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      uuid: map['uuid'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      coverUrl: map['coverUrl'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      createdBy: map['createdBy'] as String,
      isActive: map['isActive'] as bool,
    );
  }
}
