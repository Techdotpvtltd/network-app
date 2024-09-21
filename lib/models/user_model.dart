// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: dangling_library_doc_comments
/// Project: 	   playtogethher
/// File:    	   user_model
/// Path:    	   lib/model/user_model.dart
/// Author:       Ali Akbar
/// Date:        08-03-24 14:13:23 -- Friday
/// Description:

class UserModel {
  final String uid;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final String email;
  final String? phone;
  final DateTime createdAt;
  final bool? isActived;
  final String? avatar;
  UserModel({
    required this.uid,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    required this.email,
    this.phone,
    required this.createdAt,
    this.isActived,
    this.avatar,
  });

  UserModel copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? email,
    String? phone,
    DateTime? createdAt,
    bool? isActived,
    String? avatar,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      isActived: isActived ?? this.isActived,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth':
          dateOfBirth != null ? Timestamp.fromDate(dateOfBirth!) : null,
      'email': email,
      'phone': phone,
      'createdAt': Timestamp.fromDate(createdAt),
      'isActived': isActived,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null
          ? (map['dateOfBirth'] as Timestamp).toDate()
          : null,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      isActived: map['isActived'] != null ? map['isActived'] as bool : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, email: $email, phone: $phone, createdAt: $createdAt, isActived: $isActived, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.dateOfBirth == dateOfBirth &&
        other.email == email &&
        other.phone == phone &&
        other.createdAt == createdAt &&
        other.isActived == isActived &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        dateOfBirth.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        createdAt.hashCode ^
        isActived.hashCode ^
        avatar.hashCode;
  }
}
