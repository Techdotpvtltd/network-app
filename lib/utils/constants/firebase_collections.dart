// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart' show kReleaseMode;

const String FIREBASE_COLLECTION_USER =
    "${kReleaseMode ? "Rel-" : "Dev-"}Users";
const String FIREBASE_COLLECTION_USER_PROFILES =
    "${kReleaseMode ? "Rel-" : "Dev-"}Avatars";
const FIREBASE_COLLECTION_PLANS = "${kReleaseMode ? "Rel-" : "Dev-"}Plans";
const FIREBASE_COLLECTION_WORKOUTS =
    "${kReleaseMode ? "Rel-" : "Dev-"}Workouts";

const FIREBASE_COLLECTION_COURSE = "${kReleaseMode ? "Rel-" : "Dev-"}Course";
const FIREBASE_COLLECTION_CATEGORIES =
    "${kReleaseMode ? "Rel-" : "Dev-"}Categories";
const FIREBASE_COLLECTION_SERIES = "${kReleaseMode ? "Rel-" : "Dev-"}Series";
