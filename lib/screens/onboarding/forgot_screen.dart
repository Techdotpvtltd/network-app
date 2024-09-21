// Project: 	   concierge_networking
// File:    	   forgot_screen
// Path:    	   lib/screens/onboarding/forgot_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 16:02:48 -- Monday
// Description:

import 'package:concierge_networking/blocs/auth/auth_state.dart';
import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../components/custom_title_textfield.dart';
import '../../components/text_widget.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/constants.dart';
import '../../utils/dialogs/snack_bar.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  void triggerForgotPassword() {
    context
        .read<AuthBloc>()
        .add(AuthEventForgotPassword(email: emailController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        if (state is AuthStateSendingForgotEmail ||
            state is AuthStateSendForgotEmailFailure ||
            state is AuthStateSentForgotEmail) {
          setState(() {
            isLoading = state.isLoading;
          });

          if (state is AuthStateSendForgotEmailFailure) {
            CustomSnack.error('Forgot Password', state.exception.message);
          }

          if (state is AuthStateSentForgotEmail) {
            CustomSnack.success(
              'Forgot Password',
              'We\'ve just sent you an email containing a password reset link.\nPlease check your mail.',
              durationnInSeconds: 4,
            );
          }
        }
      },
      child: CustomScaffold(
        appBar: customAppBar(),
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
                    "Forgot Password",
                    size: 34,
                  ),
                  gapH14,
                  const SubtitleText(
                    "Enter your email for forget your password",
                  ),
                  gapH24,
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  gapH50,
                  gapH20,
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      isLoading: isLoading,
                      title: "Send",
                      onPressed: () {
                        triggerForgotPassword();
                      },
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
