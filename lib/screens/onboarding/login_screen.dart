// Project: 	   concierge_networking
// File:    	   login_screen
// Path:    	   lib/screens/onboarding/login_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 14:24:19 -- Monday
// Description:

import 'package:concierge_networking/blocs/auth/auth_state.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_scaffold.dart';
import 'package:concierge_networking/components/custom_title_textfield.dart';
import 'package:concierge_networking/components/social_icon_button.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/screens/onboarding/forgot_screen.dart';
import 'package:concierge_networking/screens/onboarding/registration_screen.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../utils/dialogs/snack_bar.dart';
import '../main/home/drawer_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void triggerLoginEvent() {
    context.read<AuthBloc>().add(AuthEventPerformLogin(
        email: emailController.text, password: passwordController.text));
  }

  void triggeEmailVerificationMail() {
    context.read<AuthBloc>().add(AuthEventSentEmailVerificationLink());
  }

  void triggerAppleLogin() {
    context.read<AuthBloc>().add(AuthEventAppleLogin());
  }

  void triggerGoogleLogin() {
    context.read<AuthBloc>().add(AuthEventGoogleLogin());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateLogging ||
            state is AuthStateLoggedIn ||
            state is AuthStateLoginFailure ||
            state is AuthStateEmailVerificationRequired ||
            state is AuthStateAppleLoggedIn ||
            state is AuthStateGoogleLoggedIn ||
            state is AuthStateGoogleLogging ||
            state is AuthStateSendingMailVerification ||
            state is AuthStateSendingMailVerificationFailure ||
            state is AuthStateAvatarRequired ||
            state is AuthStateSentMailVerification) {
          /// Start Of Logic
          if (state is AuthStateLogging ||
              state is AuthStateLoggedIn ||
              state is AuthStateLoginFailure ||
              state is AuthStateEmailVerificationRequired ||
              state is AuthStateAppleLoggedIn ||
              state is AuthStateGoogleLoggedIn ||
              state is AuthStateAvatarRequired ||
              state is AuthStateGoogleLogging) {
            setState(() {
              isLoading = state.isLoading;
            });

            if (state is AuthStateLoginFailure) {
              CustomSnack.error('Login', state.exception.message);
            }

            if (state is AuthStateLoggedIn) {
              NavigationService.offAll(const DrawerScreen());
              CustomSnack.success("Login", "Welcome Back");
            }

            if (state is AuthStateAvatarRequired) {
              // NavigationService.offAll(const UploadProfileScreen());
              CustomSnack.success("Login", "Welcome Back");
            }

            if (state is AuthStateAppleLoggedIn ||
                state is AuthStateGoogleLoggedIn) {
              NavigationService.offAll(const DrawerScreen());
              CustomSnack.success("Login", "Welcome Back");
            }
          }

          if (state is AuthStateEmailVerificationRequired) {
            CustomSnack.error(
              'Email Verification Required',
              "Please verify your email by clicking on the link provided in the email we've sent you.\nClick here to send link again.",
              durationnInSeconds: 5,
              onTap: (p0) {
                triggeEmailVerificationMail();
              },
            );
          }
          // For Email Verification States
          if (state is AuthStateSendingMailVerification ||
              state is AuthStateSendingMailVerificationFailure ||
              state is AuthStateSentMailVerification) {
            if (state is AuthStateSendingMailVerificationFailure) {
              CustomSnack.error("Email Verification", state.exception.message);
            }

            if (state is AuthStateSentMailVerification) {
              CustomSnack.success(
                "Email Sent",
                "We've sent you an email verification link to ${emailController.text}. Please verify your email by clicking the link before logging in.",
              );
            }
          }
        }
      },
      child: CustomScaffold(
        backgroundImagePath: AppAssets.scaffoldBG1,
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 44, bottom: 40),
            child: SizedBox(
              width: SCREEN_WIDTH,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Image.asset(
                      AppAssets.logoIcon,
                      width: 151,
                    ),
                  ),
                  gapH50,
                  gapH20,
                  const PrimaryTitleText(
                    "Login",
                    size: 34,
                  ),
                  gapH14,
                  const SubtitleText(
                    "Enter your credentials  to log in",
                  ),
                  gapH24,
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  gapH20,
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Enter Password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  gapH10,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          mainAxisAlignment: MainAxisAlignment.end,
                          size: const Size.fromWidth(120),
                          title: "Forgot Password?",
                          onPressed: () {
                            NavigationService.go(const ForgotScreen());
                          },
                          isShowForwardArrow: false,
                          foregroundColor: const Color(0xFF494949),
                          textSize: 11,
                          textWeight: FontWeight.w400,
                        ),
                        gapH20,
                        CustomButton(
                          title: "Login",
                          isLoading: isLoading,
                          onPressed: () {
                            triggerLoginEvent();
                          },
                        ),
                        gapH50,
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const SubtitleText(
                                "Login using",
                                weight: FontWeight.w600,
                                size: 12,
                                color: Color(0xFF262626),
                              ),
                              gapH14,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SocialIconButton(
                                    onPressed: () {},
                                    icon: AppAssets.googleIcon,
                                  ),
                                  gapW16,
                                  SocialIconButton(
                                    onPressed: () {},
                                    icon: AppAssets.appleIcon,
                                  ),
                                  gapH40,
                                ],
                              ),
                              gapH40,
                              Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: const Color(0xFF1E1E1E),
                                  ),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          NavigationService.off(
                                              const RegistrationScreen());
                                        },
                                      text: "Signup",
                                      style: GoogleFonts.montserrat(
                                        color: AppTheme.primaryColor1,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
