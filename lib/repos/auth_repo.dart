import 'dart:developer';

import '../exceptions/app_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../exceptions/auth_exceptions.dart';
import '../exceptions/exception_parsing.dart';
import '../utils/utils.dart';
import '../web_services/firebase_auth_serivces.dart';
import 'user_repo.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'validations/check_validation.dart';

class AuthRepo {
  int userFetchFailureCount = 0;
  //  LoginUser ====================================
  Future<void> loginUser(
      {required String withEmail, required String withPassword}) async {
    try {
      // Make Validation
      await CheckVaidation.loginUser(email: withEmail, password: withPassword);
      final _ = await FirebaseAuthService()
          .login(withEmail: withEmail, withPassword: withPassword);
      await UserRepo().fetch();
    } catch (e) {
      throw throwAppException(e: e);
    }
  }

  Future<void> sendEmailVerifcationLink() async {
    try {
      await FirebaseAuthService().sendEmailVerifcationLink();
    } catch (e) {
      throw throwAppException(e: e);
    }
  }

  bool didEmailVerified() => FirebaseAuthService().didEmailVerified();

  /// Return Login user object
  User? currentUser() => FirebaseAuth.instance.currentUser;
//  RegisteredAUser ====================================
  Future<void> registeredUser({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      /// Make validation
      await CheckVaidation.onCreateUser(
          email: email, password: password, confirmPassword: confirmPassword);

      // Create user After validation
      await FirebaseAuthService()
          .registerUser(email: email, password: password);
    } catch (e) {
      log(e.toString(), name: "Registration", time: DateTime.now());
      throw throwAppException(e: e);
    }
  }

  /// Perform Logout
  Future<void> performLogout() async {
    FirebaseAuthService().logoutUser();
    UserRepo().clearAll();
  }

  /// Perform Logout
  Future<void> sendForgotPasswordEmail({required String atMail}) async {
    if (atMail == "") {
      throw AuthExceptionEmailRequired();
    }

    if (!Util.isValidEmail(email: atMail)) {
      throw AuthExceptionInvalidEmail();
    }
    await FirebaseAuthService().resetPassword(email: atMail);
  }

  /// =========================== Social Auth Methods ================================
  /// Mostly used for Social Account Authenticatopn
  Future<void> _fetchOrCreateUser() async {
    try {
      await UserRepo().fetch();
    } on AppException catch (e) {
      throw throwAppException(e: e);
    }
  }

  //  Login With Apple ====================================
  Future<void> loginWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);

      AuthCredential authCredential = OAuthProvider("apple.com").credential(
          accessToken: credential.authorizationCode,
          idToken: credential.identityToken);
      final methods = await FirebaseAuthService()
          .fetchSignInMethodsForEmail(withEmail: credential.email ?? "");
      if (methods.isEmpty) {
        throw AuthExceptionUserNotFound(
            message:
                "Account not found with this email. Please sign up first and then try to login.");
      }
      await FirebaseAuthService()
          .loginWithCredentials(credential: authCredential);
      await _fetchOrCreateUser();
    } catch (e) {
      throw throwAppException(e: e);
    }
  }

  //  Login With Google ====================================
  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final methods = await FirebaseAuthService()
          .fetchSignInMethodsForEmail(withEmail: googleUser?.email ?? "");
      if (methods.isEmpty) {
        throw AuthExceptionUserNotFound(
            message:
                "Account not found with this email. Please sign up first and then try to login.");
      }

      await FirebaseAuthService().loginWithCredentials(credential: credential);
      await _fetchOrCreateUser();
    } catch (e) {
      throw throwAppException(e: e);
    }
  }
}
