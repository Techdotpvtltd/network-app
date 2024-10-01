import 'package:cloud_firestore/cloud_firestore.dart';

// Project: 	   concierge_admin
// File:    	   serivce_model
// Path:    	   lib/models/serivce_model.dart
// Author:       Ali Akbar
// Date:        10-09-24 12:13:22 -- Tuesday
// Description:

class ServiceModel {
  final String uuid;
  final String title;
  final String description;
  final List<String> images;
  final bool isActive;
  final String createdBy;
  final DateTime createdAt;
  final String categoryId;

  ServiceModel({
    required this.uuid,
    required this.title,
    required this.description,
    required this.images,
    required this.isActive,
    required this.categoryId,
    required this.createdBy,
    required this.createdAt,
  });
  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      uuid: map['uuid'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      categoryId: map['categoryId'] as String,
      images:
          (map['images'] as List<dynamic>).map((e) => e.toString()).toList(),
      isActive: map['isActive'] as bool,
      createdBy: map['createdBy'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  @override
  String toString() {
    return 'SerivceModel(uuid: $uuid, title: $title, description: $description, categoryId:$categoryId, images: $images, isActive: $isActive, createdBy: $createdBy, createdAt: $createdAt)';
  }
}
