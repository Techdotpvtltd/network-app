// Project: 	   learn_app
// File:    	   user_validation
// Path:    	   lib/repos/validations/user_validation.dart
// Author:       Ali Akbar
// Date:        02-07-24 14:58:16 -- Tuesday
// Description:

import '../../exceptions/data_exceptions.dart';

class UserValidation {
  static Future<void> validate({
    String? religion,
    String? interest,
    required String name,
    required String phone,
    DateTime? dob,
  }) async {
    if (name == "") {
      throw DataExceptionRequiredField(message: "Please provide name.");
    }

    if (religion == null || religion == "") {
      throw DataExceptionRequiredField(message: "Please select religion.");
    }

    if (interest == null || interest == "") {
      throw DataExceptionRequiredField(message: "Please select interest.");
    }

    if (phone == "") {
      throw DataExceptionRequiredField(message: "Please add phone number.");
    }

    if (dob == null) {
      throw DataExceptionRequiredField(message: "Please select date of birth.");
    }
  }

  static Future<void> updateValidation({
    required String name,
    required String phone,
    DateTime? dob,
  }) async {
    if (name == "") {
      throw DataExceptionRequiredField(message: "Please provide name.");
    }

    if (phone == "") {
      throw DataExceptionRequiredField(message: "Please add phone number.");
    }

    if (dob == null) {
      throw DataExceptionRequiredField(message: "Please select date of birth.");
    }
  }

  static Future<void> validateBusiness({
    required String name,
    required String location,
  }) async {
    if (name == "") {
      throw DataExceptionRequiredField(
          message: "Please provide business name.");
    }

    if (location == "") {
      throw DataExceptionRequiredField(message: "Please add location.");
    }
  }
}
