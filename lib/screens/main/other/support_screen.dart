// Project: 	   concierge_networking
// File:    	   support_screen
// Path:    	   lib/screens/main/other/support_screen.dart
// Author:       Ali Akbar
// Date:        20-08-24 23:07:10 -- Tuesday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_scaffold.dart';
import 'package:concierge_networking/components/custom_title_textfield.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundImagePath: AppAssets.scaffoldBG2,
      appBar: customAppBar(title: "Support"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 37, right: 28, top: 32),
        child: Column(
          children: [
            Image.asset(AppAssets.logoIcon, width: 122),
            SizedBox(height: SCREEN_HEIGHT * 0.12),
            const PrimaryText(
              "If you need any help please fill form our representative read your queries asap and contact with you.",
              size: 13,
              color: Color(0xFF1E1E1E),
              weight: FontWeight.w600,
            ),
            gapH24,
            const CustomTextField(
              hintText: "Enter First Name",
              keyboardType: TextInputType.name,
            ),
            gapH20,
            const CustomTextField(
              hintText: "Enter Email",
              keyboardType: TextInputType.emailAddress,
            ),
            gapH20,
            const CustomTextField(
              hintText: "Enter Phone number",
              keyboardType: TextInputType.phone,
            ),
            gapH20,
            const CustomTextField(
              hintText: "Enter Message",
              maxLines: 6,
            ),
            gapH20,
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(title: "Send", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
