// Project: 	   concierge_networking
// File:    	   agreement_screen
// Path:    	   lib/screens/main/other/agreement_screen.dart
// Author:       Ali Akbar
// Date:        22-08-24 17:47:17 -- Thursday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_scaffold.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/screens/onboarding/login_screen.dart';
import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/dialogs/snack_bar.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen(
      {super.key, required this.isPrivacy, this.isComingFromAuth = false});
  final bool isPrivacy;
  final bool isComingFromAuth;
  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool isCheck = false;
  late bool isPrivacy = widget.isPrivacy;

  late final data = isPrivacy
      ? '''A dwarf who brings a standard along with him to measure his own size, take my word.
      
Lorem Ipsum is simply dummy text of the printing and typesetting industry.
      
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.
      
      
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing.
'''
      : '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries


Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries



Lorem Ipsum is simply dummy text of the printing and typesetting industry.

Lorem Ipsum is simply dummy text of the printing and typesetting industry.

Lorem Ipsum is simply dummy text of the printing and typesetting industry.

Lorem Ipsum is simply dummy text of the printing and typesetting industry.

Lorem Ipsum is simply dummy text of the printing and typesetting industry.

''';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: customAppBar(
          title: isPrivacy ? "Privacy Policy" : "Terms & Conditions",
          showBack: !widget.isComingFromAuth),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 100),
        child: Column(
          children: [
            PrimaryText(
              data,
              size: 12,
              color: Colors.black.withOpacity(0.46),
            ),
            gapH10,
            Row(
              children: [
                SizedBox(
                  width: 15,
                  height: 15,
                  child: Checkbox(
                    value: isCheck,
                    onChanged: (va) {
                      setState(() {
                        isCheck = va ?? false;
                      });
                    },
                    fillColor: WidgetStatePropertyAll(isCheck
                        ? AppTheme.primaryColor1
                        : const Color(0xFFE8E8E8)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
                gapW10,
                Expanded(
                  child: PrimaryText(
                    isPrivacy
                        ? "I have read and agree to the Privacy Policy."
                        : "I have read and agree to the terms and conditions.",
                    size: 12,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            gapH40,
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                isEnabled: isCheck,
                title: "Next",
                onPressed: () {
                  if (widget.isComingFromAuth) {
                    if (isPrivacy) {
                      NavigationService.offAll(AgreementScreen(
                          isPrivacy: false,
                          isComingFromAuth: widget.isComingFromAuth));
                    } else {
                      NavigationService.offAll(const LoginScreen());
                      CustomSnack.warning(
                        "Email Verification",
                        "We've sent you an email verification link to email. Please verify your email by clicking the link before logging in.",
                        durationnInSeconds: 5,
                      );
                    }
                  } else {
                    NavigationService.back();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
