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
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_button.dart';
import '../../components/custom_scaffold.dart';
import '../../components/custom_title_textfield.dart';
import '../../components/social_icon_button.dart';
import '../../components/text_widget.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_theme.dart';
import '../../utils/constants/constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  "Signup",
                  size: 34,
                ),
                gapH14,
                const SubtitleText(
                  "Enter your credentials  to signup",
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
                gapH20,
                const CustomTextField(
                  hintText: "Enter Password again",
                  keyboardType: TextInputType.visiblePassword,
                ),
                gapH30,
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    title: "Signup",
                    onPressed: () {
                      NavigationService.off(const AdditionalInfoScreen());
                    },
                  ),
                ),
                gapH50,
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SubtitleText(
                        "Signup using",
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
    );
  }
}
