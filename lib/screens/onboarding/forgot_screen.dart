// Project: 	   concierge_networking
// File:    	   forgot_screen
// Path:    	   lib/screens/onboarding/forgot_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 16:02:48 -- Monday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../components/custom_title_textfield.dart';
import '../../components/text_widget.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/constants.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                const CustomTextField(
                  hintText: "Enter Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                gapH50,
                gapH20,
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    title: "Send",
                    onPressed: () {},
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
