// Project: 	   concierge_networking
// File:    	   login_screen
// Path:    	   lib/screens/onboarding/login_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 14:24:19 -- Monday
// Description:

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
import 'package:google_fonts/google_fonts.dart';

import '../main/home/drawer_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                const CustomTextField(
                  hintText: "Enter Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                gapH20,
                const CustomTextField(
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
                        onPressed: () {
                          NavigationService.offAll(const DrawerScreen());
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
    );
  }
}
