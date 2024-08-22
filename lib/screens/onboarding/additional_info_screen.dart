// Project: 	   concierge_networking
// File:    	   additional_info_screen
// Path:    	   lib/screens/onboarding/additional_info_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 16:22:50 -- Monday
// Description:

import 'package:concierge_networking/screens/onboarding/upload_profile_screen.dart';
import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/custom_scaffold.dart';
import '../../components/custom_title_textfield.dart';
import '../../components/text_widget.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/constants.dart';
import '../main/other/agreement_screen.dart';

class AdditionalInfoScreen extends StatefulWidget {
  const AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
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
                  "Add Info",
                  size: 34,
                ),
                gapH14,
                const SubtitleText(
                  "Enter additional info for profile",
                ),
                gapH24,
                const CustomTextField(
                  hintText: "Enter First Name",
                  keyboardType: TextInputType.name,
                ),
                gapH20,
                const CustomTextField(
                  hintText: "Enter Last Name",
                  keyboardType: TextInputType.name,
                ),
                gapH20,
                CustomTextField(
                  hintText: "Select Date of birth",
                  keyboardType: TextInputType.datetime,
                  isReadyOnly: true,
                  onTFTap: () {},
                ),
                gapH20,
                const CustomTextField(
                  hintText: "Enter phone number",
                  keyboardType: TextInputType.phone,
                ),
                gapH30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      title: "Skip",
                      onPressed: () {
                        NavigationService.offAll(const AgreementScreen(
                            isPrivacy: true, isComingFromAuth: true));
                      },
                      isShowForwardArrow: false,
                      foregroundColor: AppTheme.titleColor1,
                      textDecoration: TextDecoration.underline,
                    ),
                    CustomButton(
                      title: "Next",
                      onPressed: () {
                        NavigationService.go(const UploadProfileScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
