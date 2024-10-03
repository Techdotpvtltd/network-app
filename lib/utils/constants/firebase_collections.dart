// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart' show kReleaseMode;

const String FIREBASE_COLLECTION_USER =
    "${kReleaseMode ? "Rel-" : "Dev-"}Users";
const String FIREBASE_COLLECTION_USER_PROFILES =
    "${kReleaseMode ? "Rel-" : "Dev-"}Avatars";
const FIREBASE_COLLECTION_CATEGORIES =
    "${kReleaseMode ? "Rel-" : "Rel-"}Categories";
const FIREBASE_COLLECTION_SERIES = "${kReleaseMode ? "Rel-" : "Rel-"}Series";
const FIREBASE_COLLECTION_POSTS = "${kReleaseMode ? "Rel-" : "Rel-"}Posts";
