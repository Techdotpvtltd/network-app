// Project: 	   concierge_networking
// File:    	   get_started_screen
// Path:    	   lib/screens/onboarding/get_started_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 12:41:19 -- Monday
// Description:

import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/models/get_started_model.dart';
import 'package:concierge_networking/screens/onboarding/login_screen.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants/app_theme.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController pageController = PageController();

  int currentPage = 0;

  final data = [
    GetStartedModel(
      title: "Welcome to Concierge\nNetwork",
      description:
          "Your gateway to expert consulting services, tailored to meet your unique needs. Let's get started on your journey to success!",
      image: AppAssets.wt1,
    ),
    GetStartedModel(
      title: "Find the Right Consultant",
      description:
          "Easily search and connect with experienced consultants across various fields. Choose the perfect match for your specific requirements.",
      image: AppAssets.wt2,
    ),
    GetStartedModel(
      title: "Book Appointments\nSeamlessly",
      description:
          "Schedule consultations with just a few taps. Our easy-to-use booking system ensures you get the help you need, when you need it.",
      image: AppAssets.wt3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: [
                for (int i = 0; i < data.length; i++)
                  Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        child: Image.asset(
                          data[currentPage].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.9),
                                Colors.white.withOpacity(0.6),
                                const Color(0xFFEC1C24).withOpacity(0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        right: 32,
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PrimaryTitleText(data[currentPage].title),
                            gapH20,
                            PrimaryText(data[currentPage].description),
                            gapH30,
                          ],
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),

          /// Page Dots
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 32, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                  title: 'Skip',
                  onPressed: () {
                    NavigationService.offAll(const LoginScreen());
                  },
                  isShowForwardArrow: false,
                  foregroundColor: AppTheme.titleColor1,
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: data.length,
                  effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: AppTheme.primaryColor1,
                    dotColor: const Color(0xFFA0A0A0).withOpacity(0.2),
                  ),
                ),
                CustomTextButton(
                  title: "Next",
                  onPressed: () {
                    if (currentPage == data.length - 1) {
                      NavigationService.offAll(const LoginScreen());
                      return;
                    }
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.linear,
                    );
                  },
                  textWeight: FontWeight.w400,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
