// Project: 	   concierge_networking
// File:    	   registration_screen
// Path:    	   lib/screens/onboarding/registration_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 16:18:07 -- Monday
// Description:

import 'package:concierge_networking/screens/onboarding/additional_info_screen.dart';
import 'package:concierge_networking/screens/onboarding/login_screen.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../blocs/user/user_bloc.dart';
import '../../blocs/user/user_event.dart';
import '../../blocs/user/user_state.dart';
import '../../components/custom_button.dart';
import '../../components/custom_scaffold.dart';
import '../../components/custom_title_textfield.dart';
import '../../components/text_widget.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_theme.dart';
import '../../utils/constants/constants.dart';
import '../../utils/dialogs/snack_bar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  bool isLoading = false;
  bool isRegistered = false;

  void triggerRegisterUserEvent() {
    context.read<AuthBloc>().add(
          AuthEventRegistering(
            email: emailController.text,
            password: passwordController.text,
            confirmPassword: confirmController.text,
          ),
        );
  }

  void triggerCreateUserEvent() {
    context.read<UserBloc>().add(UserEventCreate(email: emailController.text));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // AuthBloc
        BlocListener<AuthBloc, AuthState>(
          listener: (ctx, state) {
            if (state is AuthStateRegisterFailure ||
                state is AuthStateRegistered ||
                state is AuthStateRegistering) {
              setState(() {
                isLoading = state.isLoading;
              });

              if (state is AuthStateRegisterFailure) {
                CustomSnack.error('Sign up', state.exception.message);
              }

              if (state is AuthStateRegistered) {
                isRegistered = true;
                triggerCreateUserEvent();
              }
            }
          },
        ),

        BlocListener<UserBloc, UserState>(
          listener: (ctx, state) {
            if (state is UserStateCreating ||
                state is UserStateCreateFailure ||
                state is UserStateCreated) {
              setState(() {
                isLoading = state.isLoading;
              });
              if (state is UserStateCreateFailure) {
                CustomSnack.error('Sign up', state.exception.message);
              }

              if (state is UserStateCreated) {
                NavigationService.off(const AdditionalInfoScreen());
              }
            }
          },
        ),
      ],
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
                  const PrimaryTitleText("Signup", size: 34),
                  gapH14,
                  const SubtitleText("Enter your credentials  to signup"),
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
                  gapH20,
                  CustomTextField(
                    controller: confirmController,
                    hintText: "Enter Password again",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  gapH30,
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      title: "Signup",
                      isLoading: isLoading,
                      onPressed: () {
                        if (isRegistered) {
                          triggerCreateUserEvent();
                          return;
                        }
                        triggerRegisterUserEvent();
                      },
                    ),
                  ),
                  gapH50,
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: "Already have an account? ",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: const Color(0xFF1E1E1E),
                            ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    NavigationService.off(const LoginScreen());
                                  },
                                text: "Login",
                                style: GoogleFonts.montserrat(
                                  color: AppTheme.titleColor1,
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
            ),
          ),
        ),
      ),
    );
  }
}
