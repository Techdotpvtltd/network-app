import '../../exceptions/auth_exceptions.dart';
import '../../utils/utils.dart';

class CheckVaidation {
  static Future<void> loginUser({String? email, String? password}) async {
    if (email == null || email == "") {
      throw AuthExceptionEmailRequired();
    }

    if (!Util.isValidEmail(email: email)) {
      throw AuthExceptionInvalidEmail();
    }

    if (password == null || password == "") {
      throw AuthExceptionPasswordRequired();
    }
  }

  static Future<void> onCreateUser({
    String? name,
    String? password,
    String? confirmPassword,
    String? email,
    String? phone,
  }) async {
    if (name == null || name == "") {
      throw AuthExceptionFullNameRequired();
    }

    if (email == null || email == "") {
      throw AuthExceptionEmailRequired();
    }

    if (!Util.isValidEmail(email: email)) {
      throw AuthExceptionInvalidEmail();
    }

    if (password == null || password == "") {
      throw AuthExceptionPasswordRequired();
    }

    if (password.length < 6) {
      throw AuthExceptionWeekPassword();
    }

    if (confirmPassword == null || confirmPassword == "") {
      throw AuthExceptionConfirmPasswordRequired();
    }

    if (confirmPassword != password) {
      throw AuthExceptionConfirmPasswordDoesntMatching();
    }
    if (phone == "") {
      throw AuthExceptionRequiredPhone();
    }
  }

  static Future<void> updateUser({
    String? name,
    String? email,
    String? gender,
  }) async {
    if (name == null || name == "") {
      throw AuthExceptionFullNameRequired();
    }

    if (email == null) {
      throw AuthExceptionEmailRequired();
    }

    if (!Util.isValidEmail(email: email)) {
      throw AuthExceptionInvalidEmail();
    }

    if (gender == null || gender == "") {
      throw AuthExceptionRequiredGender();
    }
  }
}
