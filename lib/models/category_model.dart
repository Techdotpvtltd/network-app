// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

// Project: 	   fitness_admin
// File:    	   category_model
// Path:    	   lib/models/category_model.dart
// Author:       Ali Akbar
// Date:        08-08-24 18:30:30 -- Thursday
// Description:

class CategoryModel {
  final String uuid;
  final String title;
  final DateTime createdAt;
  final String cover;
  CategoryModel({
    required this.uuid,
    required this.title,
    required this.createdAt,
    required this.cover,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      uuid: map['uuid'] as String,
      title: map['title'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      cover: map['cover'] as String,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(uuid: $uuid, title: $title, createdAt: $createdAt, cover: $cover)';
  }
}
