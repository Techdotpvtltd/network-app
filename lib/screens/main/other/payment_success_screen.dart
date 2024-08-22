// Project: 	   concierge_networking
// File:    	   payment_success_screen
// Path:    	   lib/screens/main/other/payment_success_screen.dart
// Author:       Ali Akbar
// Date:        22-08-24 17:15:59 -- Thursday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_scaffold.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_container.dart';
import '../../../components/text_widget.dart';
import '../../../utils/constants/constants.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: customAppBar(
        title: "Payment Success",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
        child: Column(
          children: [
            SizedBox(
              width: SCREEN_WIDTH,
              child: CustomContainer(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                color: const Color(0xFFF8F8F8),
                borderRadius: const BorderRadius.all(Radius.circular(28)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.circleTickIcon,
                      width: 138,
                      height: 138,
                    ),
                    gapH30,
                    const PrimaryTitleText(
                      "Thank you!",
                      size: 20,
                      weight: FontWeight.w900,
                      color: AppTheme.primaryColor1,
                    ),
                    gapH6,
                    const PrimaryText(
                      "Your payment done successfully",
                      weight: FontWeight.w500,
                      color: Color(0xFF444444),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
