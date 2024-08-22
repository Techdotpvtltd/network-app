// Project: 	   concierge_networking
// File:    	   subscription_screen
// Path:    	   lib/screens/main/other/subscription_screen.dart
// Author:       Ali Akbar
// Date:        20-08-24 23:18:03 -- Tuesday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/screens/main/other/payment_success_screen.dart';
import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Subscription"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SCREEN_HEIGHT * 0.61,
            child: PageView(
              controller: pageController,
              padEnds: false,
              children: const [
                _SubscriptionCell1(),
                _SubscriptionCell2(),
                _SubscriptionCell3(),
              ],
            ),
          ),
          gapH30,
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
              dotColor: Colors.black.withOpacity(0.10),
              activeDotColor: AppTheme.primaryColor1,
              dotWidth: 8,
              dotHeight: 8,
            ),
          )
        ],
      ),
    );
  }
}

class _SubscriptionCell1 extends StatelessWidget {
  const _SubscriptionCell1();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28, right: 28),
      padding: const EdgeInsets.only(top: 30, left: 37, right: 24, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          stops: const [0, 100],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF535252).withOpacity(1),
            const Color(0xFF252525).withOpacity(1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Chip(
            label: PrimaryText(
              "Premium Plan",
              size: 16,
              weight: FontWeight.w500,
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          gapH10,
          const PrimaryText(
            "Perfect for users needing more extensive access and features.",
            color: Color(0xFFE9E9E9),
            size: 13,
          ),
          gapH18,
          const Align(
            child: PrimaryTitleText(
              "\$4.45",
              color: Colors.white,
              size: 31,
            ),
          ),
          gapH10,
          const Divider(thickness: 2),
          gapH6,
          for (final String item in [
            "Access to all basic features",
            "50 requests per month",
            "Priority support",
            "Access to exclusive content"
          ])
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 3,
                    foregroundColor: Colors.white,
                  ),
                  gapW10,
                  PrimaryText(
                    item,
                    color: Colors.white,
                    size: 13,
                    weight: FontWeight.w500,
                  )
                ],
              ),
            ),
          const Spacer(),
          CustomButton(
            title: "Add Plan",
            onPressed: () {
              NavigationService.go(const PaymentSuccessScreen());
            },
            width: SCREEN_WIDTH,
          ),
        ],
      ),
    );
  }
}

class _SubscriptionCell2 extends StatelessWidget {
  const _SubscriptionCell2();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28, right: 28),
      padding: const EdgeInsets.only(top: 30, left: 37, right: 24, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          stops: const [0, 100],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFF44A51).withOpacity(1),
            const Color(0xFFBB0209).withOpacity(1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Chip(
            label: PrimaryText(
              "Premium Plan",
              size: 16,
              weight: FontWeight.w500,
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          gapH10,
          const PrimaryText(
            "Perfect for users needing more extensive access and features.",
            color: Color(0xFFE9E9E9),
            size: 13,
          ),
          gapH18,
          const Align(
            child: PrimaryTitleText(
              "\$4.45",
              color: Colors.white,
              size: 31,
            ),
          ),
          gapH10,
          const Divider(thickness: 2),
          gapH6,
          for (final String item in [
            "Access to all basic features",
            "50 requests per month",
            "Priority support",
            "Access to exclusive content"
          ])
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 3,
                    foregroundColor: Colors.white,
                  ),
                  gapW10,
                  PrimaryText(
                    item,
                    color: Colors.white,
                    size: 13,
                    weight: FontWeight.w500,
                  )
                ],
              ),
            ),
          const Spacer(),
          CustomButton(
            title: "Add Plan",
            onPressed: () {
              NavigationService.go(const PaymentSuccessScreen());
            },
            width: SCREEN_WIDTH,
            backgroundColor: Colors.white,
            textColor: AppTheme.primaryColor1,
          ),
        ],
      ),
    );
  }
}

class _SubscriptionCell3 extends StatelessWidget {
  const _SubscriptionCell3();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28, right: 28),
      padding: const EdgeInsets.only(top: 30, left: 37, right: 24, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: const Color(0xFFEFEFEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Chip(
            color: WidgetStatePropertyAll(Color(0xFF414141)),
            label: PrimaryText(
              "Premium Plan",
              size: 16,
              weight: FontWeight.w500,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          gapH10,
          const PrimaryText(
            "Perfect for users needing more extensive access and features.",
            color: Color(0xFF444444),
            size: 13,
          ),
          gapH18,
          const Align(
            child: PrimaryTitleText(
              "\$4.45",
              color: Color(0xFF444444),
              size: 31,
            ),
          ),
          gapH10,
          const Divider(thickness: 2),
          gapH6,
          for (final String item in [
            "Access to all basic features",
            "50 requests per month",
            "Priority support",
            "Access to exclusive content"
          ])
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 3,
                    foregroundColor: Color(0xFF444444),
                  ),
                  gapW10,
                  PrimaryText(
                    item,
                    color: const Color(0xFF444444),
                    size: 13,
                    weight: FontWeight.w500,
                  )
                ],
              ),
            ),
          const Spacer(),
          CustomButton(
            title: "Add Plan",
            onPressed: () {
              NavigationService.go(const PaymentSuccessScreen());
            },
            width: SCREEN_WIDTH,
          ),
        ],
      ),
    );
  }
}
