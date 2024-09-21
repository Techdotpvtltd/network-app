import '../exceptions/app_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../exceptions/auth_exceptions.dart';
import '../exceptions/exception_parsing.dart';
import '../manager/app_manager.dart';
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

  bool didEmailVerified() {
    return FirebaseAuthService().didEmailVerified();
  }

//  RegisteredAUser ====================================
  Future<void> registeredUser({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      /// Make validation
      await CheckVaidation.onCreateUser(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      // Create user After validation
      final UserCredential userCredential = await FirebaseAuthService()
          .registerUser(email: email, password: password);
      await UserRepo()
          .create(uid: userCredential.user?.uid ?? "", email: email);
      sendEmailVerifcationLink();
    } catch (e) {
      throw throwAppException(e: e);
    }
  }

  /// Return Login user object
  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  /// Perform Logout
  Future<void> performLogout() async {
    FirebaseAuthService().logoutUser();
    UserRepo().clearAll();

    // /// UnSubscribe notifications
    // PushNotificationServices().unsubscribe(
    //     forTopic:
    //         "$PUSH_NOTIFICATION_FRIEND_REQUEST${UserRepo().currentUser.uid}");

    /// Removing Get Instances
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
      await FirebaseAuthService()
          .loginWithCredentials(credential: authCredential);
      await _fetchOrCreateUser();
    } catch (e) {
      throw throwAppException(e: e);
    }
  }

  /// Mostly used for Social Account Authenticatopn
  Future<void> _fetchOrCreateUser() async {
    try {
      await UserRepo().fetch();
      userFetchFailureCount = 0;
    } on AppException catch (e) {
      if (AppManager.currentUser == null || e is AuthExceptionUserNotFound) {
        final User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          if (userFetchFailureCount <= 1) {
            await UserRepo().create(
              uid: user.uid,
              firstName: FirebaseAuth.instance.currentUser?.providerData
                      .firstOrNull?.displayName ??
                  FirebaseAuth.instance.currentUser?.displayName ??
                  "",
              email: user.email ?? "",
              phone: "0",
            );
            _fetchOrCreateUser();
          } else {
            throw throwAppException(e: e);
          }
          userFetchFailureCount += 1;
        }
        return;
      }
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
      await FirebaseAuthService().loginWithCredentials(credential: credential);
      await _fetchOrCreateUser();
    } catch (e) {
      throw throwAppException(e: e);
    }
  }
}
